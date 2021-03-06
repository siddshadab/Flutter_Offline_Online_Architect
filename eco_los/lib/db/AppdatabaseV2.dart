import 'dart:io';
import 'dart:convert';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetailsBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/CustomerLoanDetailsBean.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/documentCollector/DocumentCollectorBean.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'TablesColumnFile.dart';
import 'TablesList.dart';

class AppdatabaseV2 {
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  static const JsonCodec JSON = const JsonCodec();

  static final AppdatabaseV2 appDatabaseV2 =
  new AppdatabaseV2._internal();


  AppdatabaseV2._internal();

  Database _database;

  static AppdatabaseV2 get() {
    return appDatabaseV2;
  }

  bool didInit = false;

  Future<Database> _getDb() async {
    if (!didInit) await init();
    return _database;
  }

  Future init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "microfinance.db");
    _database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          // await _createCustomerMaster(db);
        }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
          //await _createCustomerMaster(db);

        });
    didInit = true;
  }

  //Insert Customer Basics details
  Future<int> insertCustomerMaster(CustomerListBean bean,String custObjJson) async {

    Constant.getAppPath("This one submitted "+custObjJson.toString(),"BeforeSaveCustomer");

    String insertQuery =
        "INSERT OR REPLACE INTO ${TablesList.CUSTOMERMASTER}  ("
        "${TablesColumnFile.UUID} ,"
        "${TablesColumnFile.CUSTDATA} ,"
        "${TablesColumnFile.mcreateddt} ,"
        "${TablesColumnFile.mcreatedby} ,"
        "${TablesColumnFile.mlastupdatedt} ,"
        "${TablesColumnFile.mlastupdateby} ,"
        "${TablesColumnFile.mgeolocation} ,"
        "${TablesColumnFile.mgeolatd} ,"
        "${TablesColumnFile.mgeologd} ,"
        "${TablesColumnFile.missynctocoresys})"
        "VALUES"
        "('${bean.UUID}' ,"
        "'${custObjJson}',"
        "'${bean.mcreateddt}',"
        "'${bean.mcreatedby}',"
        "'${bean.mlastupdatedt}',"
        "'${bean.mlastupdateby}',"
        "'${bean.mgeolocation}',"
        "'${bean.mgeolatd}',"
        "'${bean.mgeologd}',"
        "'${bean.missynctocoresys}');";
    print("insert query Customer Formation" + insertQuery);
    int id;
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.CUSTOMERMASTER}");
    });

    var value =await db.transaction((Transaction txn) async {
      insertQuery = "SELECT last_insert_rowid();";
    return   await txn.rawQuery(insertQuery);
    });
    print("XXXXXXXX");
    print(value);
    //return value;
  }

  Future<int> updateCustomer(CustomerListBean custBean, String jsonData,String UUID) async {
    var db = await _getDb();
    Constant.getAppPath("This one submitted "+jsonData.toString(),"UpdateCustSave");
    Map<String, dynamic> row = {
      TablesColumnFile.UUID:custBean.UUID,
      TablesColumnFile.CUSTDATA:jsonData.toString(),
      TablesColumnFile.mcreateddt:custBean.mcreateddt.toIso8601String(),
      TablesColumnFile.mcreatedby:custBean.mcreatedby,
      TablesColumnFile.mlastupdatedt:custBean.mlastupdatedt.toIso8601String(),
      TablesColumnFile.mlastupdateby:custBean.mlastupdateby,
      TablesColumnFile.mgeolocation:custBean.mgeolocation,
      TablesColumnFile.mgeolatd:custBean.mgeolatd,
      TablesColumnFile.mgeologd:custBean.mgeologd,
      TablesColumnFile.missynctocoresys:custBean.missynctocoresys,
     };

    int id = 1;

    int updateCount = await db.update(
        TablesList.CUSTOMERMASTER,
        row,
        where: '${TablesColumnFile.UUID} = ?',
        whereArgs: [UUID]);
    return updateCount;

    print(await db.query(TablesList.CUSTOMERMASTER));
  }

  //Select CustomerList
  Future<List<CustomerListBean>> selectCustomerList() async {
    var db = await _getDb();

/*    await db.transaction((Transaction txn) async {
      await txn
          .rawDelete("Delete FROM ${TablesList.CUSTOMERMASTER}");
    });*/
    var result = await db.rawQuery(
        'SELECT * FROM ${TablesList.CUSTOMERMASTER} Order by ${TablesColumnFile
            .mlastupdatedt} DESC');
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.CUSTOMERMASTER}');
    print("customer count");
    print(result1);
    List<CustomerListBean> listbean = new List<CustomerListBean>();
    CustomerListBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new CustomerListBean();
        bean = bindDataCustomerListBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }
  //Select Customer BindData
  CustomerListBean bindDataCustomerListBean(Map<String, dynamic> result) {
    return CustomerListBean.fromMapV2(result);
  }
  Future<CustomerListBean>  getCustomerByUUID(String UUID) async {
    var db = await _getDb();

    String query = 'SELECT * FROM ${TablesList.CUSTOMERMASTER}  WHERE ${TablesColumnFile.UUID}  = "${UUID}";';
    print(query);
    var result = await db.rawQuery(query);
    print("result result "+result.toString());

    CustomerListBean bean;
    try {
      if (result.isNotEmpty)
        bean = bindDataCustomerListBean(result[0]);
      else {
        print("result is ${result}");
      }
    }
    catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return bean;

  }


  //Insert Loan Basics details
  Future<int> insertLoanMaster(CustomerLoanDetailsBean bean,String laonObjJson) async {
    print("XXXXXXXXXXXXXXXXXXXXXXXX");
    for (var items in bean.toString().split(",")) {
      print(items);
    }

    Constant.getAppPath("This one submitted "+laonObjJson.toString(),"BeforeSaveLoan");

    List<int> retValue;
    String insertQuery =
        "INSERT OR REPLACE INTO ${TablesList.LOANMASTER}  ("
        "${TablesColumnFile.UUID} ,"
        "${TablesColumnFile.CUSTUUID} ,"
        "${TablesColumnFile.LOANDATA} ,"
        "${TablesColumnFile.mcreateddt} ,"
        "${TablesColumnFile.mcreatedby} ,"
        "${TablesColumnFile.mlastupdatedt} ,"
        "${TablesColumnFile.mlastupdateby} ,"
        "${TablesColumnFile.mgeolocation} ,"
        "${TablesColumnFile.mgeolatd} ,"
        "${TablesColumnFile.mgeologd} ,"
        "${TablesColumnFile.missynctocoresys})"
        "VALUES"
        "('${bean.UUID}' ,"
        "'${bean.CUSTUUID}',"
        "'${laonObjJson}',"
        "'${bean.mcreateddt}',"
        "'${bean.mcreatedby}',"
        "'${bean.mlastupdatedt}',"
        "'${bean.mlastupdateby}',"
        "'${bean.mgeolocation}',"
        "'${bean.mgeolatd}',"
        "'${bean.mgeologd}',"
        "'${bean.missynctocoresys}');";
    print("insert query Customer Formation" + insertQuery);
    int id;
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.LOANMASTER}");
    });

    await db.transaction((Transaction txn) async {
      insertQuery = "SELECT last_insert_rowid();";
      var result = await txn.rawQuery(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.LOANMASTER}");
      print("value of toooooooo1" + result.toString());

    });
    return 0;//retValue[0];
  }

  Future<int> updateLoan(CustomerLoanDetailsBean loanObj, String jsonData,String UUID) async {
    var db = await _getDb();
    Constant.getAppPath("This one submitted "+jsonData.toString(),"UpdateLoanSave");
    Map<String, dynamic> row = {
      TablesColumnFile.UUID:loanObj.UUID,
      TablesColumnFile.CUSTUUID:loanObj.CUSTUUID,
      TablesColumnFile.LOANDATA:jsonData.toString(),
      TablesColumnFile.mcreateddt:'',
      TablesColumnFile.mcreatedby:loanObj.mcreatedby,
      TablesColumnFile.mlastupdatedt:'',
      TablesColumnFile.mlastupdateby:loanObj.mlastupdateby,
      TablesColumnFile.mgeolocation:loanObj.mgeolocation,
      TablesColumnFile.mgeolatd:loanObj.mgeolatd,
      TablesColumnFile.mgeologd:loanObj.mgeologd,
      TablesColumnFile.missynctocoresys:loanObj.missynctocoresys,
    };

    int id = 1;

    int updateCount = await db.update(
        TablesList.LOANMASTER,
        row,
        where: '${TablesColumnFile.UUID} = ?',
        whereArgs: [UUID]);
    return updateCount;

    print(await db.query(TablesList.CUSTOMERMASTER));
  }
  //Select Loan
  Future<List<CustomerLoanDetailsBean>> selectLoanList() async {
    var db = await _getDb();
    var result = await db.rawQuery(
        'SELECT * FROM ${TablesList.LOANMASTER} Order by ${TablesColumnFile
            .mlastupdatedt} DESC');
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.LOANMASTER}');
    print("Loan count");
    print(result1);
    List<CustomerLoanDetailsBean> listbean = new List<CustomerLoanDetailsBean>();
    CustomerLoanDetailsBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new CustomerLoanDetailsBean();
        bean = bindDataLoanBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }

  //Select Loan on passed query
  Future<CustomerLoanDetailsBean> selectLoanOnQueryBased(String query) async {
    var db = await _getDb();
    var result = await db.rawQuery(query);
    CustomerLoanDetailsBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new CustomerLoanDetailsBean();
        bean = bindDataLoanBean(result[i]);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return bean;
  }


  //Select Loan BindData
  CustomerLoanDetailsBean bindDataLoanBean(Map<String, dynamic> result) {
    return CustomerLoanDetailsBean.fromMapV2(result);
  }


  //Insert Guaranter Basics details
  Future<int> insertGuaranterMaster(GuarantorDetailsBean bean,String guarObjJson) async {

    Constant.getAppPath("This one submitted "+guarObjJson.toString(),"BeforeSaveGuaranter");

    String insertQuery =
        "INSERT OR REPLACE INTO ${TablesList.GUARANTERMASTER}  ("
        "${TablesColumnFile.UUID} ,"
        "${TablesColumnFile.LOANUUID} ,"
        "${TablesColumnFile.CUSTUUID} ,"
        "${TablesColumnFile.GUARDATA} ,"
        "${TablesColumnFile.mcreateddt} ,"
        "${TablesColumnFile.mcreatedby} ,"
        "${TablesColumnFile.mlastupdatedt} ,"
        "${TablesColumnFile.mlastupdateby} ,"
        "${TablesColumnFile.mgeolocation} ,"
        "${TablesColumnFile.mgeolatd} ,"
        "${TablesColumnFile.mgeologd} ,"
        "${TablesColumnFile.missynctocoresys})"
        "VALUES"
        "('${bean.UUID}' ,"
        "'${bean.LOANUUID}',"
        "'${bean.CUSTUUID}',"
        "'${guarObjJson}',"
        "'${bean.mcreateddt}',"
        "'${bean.mcreatedby}',"
        "'${bean.mlastupdatedt}',"
        "'${bean.mlastupdateby}',"
        "'${bean.mgeolocation}',"
        "'${bean.mgeolatd}',"
        "'${bean.mgeologd}',"
        "'${0}');";
    print("insert query Guaranter" + insertQuery);
    int id;
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.GUARANTERMASTER}");
    });

    var value =await db.transaction((Transaction txn) async {
      insertQuery = "SELECT last_insert_rowid();";
      return   await txn.rawQuery(insertQuery);
    });
    print("XXXXXXXX");
    print(value);
    //return value;
  }
  //Select GuarantorDetailsBean
  Future<List<GuarantorDetailsBean>> selectGuarList(String query) async {
    var db = await _getDb();

    var result = await db.rawQuery(query);
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.GUARANTERMASTER}');
    print("customer count");
    print(result1);
    List<GuarantorDetailsBean> listbean = new List<GuarantorDetailsBean>();
    GuarantorDetailsBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new GuarantorDetailsBean();
        bean = bindDataGuarBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }
  //Select GuarantorDetailsBean BindData
  GuarantorDetailsBean bindDataGuarBean(Map<String, dynamic> result) {
    return GuarantorDetailsBean.fromMapV2(result);
  }


  //Insert COllaterals Basics details
  Future<int> insertCollateralsMaster(CollateralBasicSelectionBean bean,String collObjJson) async {

    Constant.getAppPath("This one submitted "+collObjJson.toString(),"BreforeSaveCollateral");

    String insertQuery =
        "INSERT OR REPLACE INTO ${TablesList.COLLATERALSMASTER}  ("
        "${TablesColumnFile.UUID} ,"
        "${TablesColumnFile.LOANUUID} ,"
        "${TablesColumnFile.CUSTUUID} ,"
        "${TablesColumnFile.COLLDATA} ,"
        "${TablesColumnFile.mcreateddt} ,"
        "${TablesColumnFile.mcreatedby} ,"
        "${TablesColumnFile.mlastupdatedt} ,"
        "${TablesColumnFile.mlastupdateby} ,"
        "${TablesColumnFile.mgeolocation} ,"
        "${TablesColumnFile.mgeolatd} ,"
        "${TablesColumnFile.mgeologd} ,"
        "${TablesColumnFile.missynctocoresys})"
        "VALUES"
        "('${bean.UUID}' ,"
        "'${bean.LOANUUID}',"
        "'${bean.CUSTUUID}',"
        "'${collObjJson}',"
        "'${bean.mcreateddt}',"
        "'${bean.mcreatedby}',"
        "'${bean.mlastupdatedt}',"
        "'${bean.mlastupdateby}',"
        "'${bean.mgeolocation}',"
        "'${bean.mgeolatd}',"
        "'${bean.mgeologd}',"
        "'${0}');";
    print("insert query COLLDATA Formation" + insertQuery);
    int id;
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.COLLATERALSMASTER}");
    });

    var value =await db.transaction((Transaction txn) async {
      insertQuery = "SELECT last_insert_rowid();";
      return   await txn.rawQuery(insertQuery);
    });
    print("XXXXXXXX");
    print(value);
    //return value;
  }
  //Select GuarantorDetailsBean
  Future<List<CollateralBasicSelectionBean>> selectCollList() async {
    var db = await _getDb();

    var result = await db.rawQuery(
        'SELECT * FROM ${TablesList.COLLATERALSMASTER} Order by ${TablesColumnFile
            .mlastupdatedt} DESC');
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.COLLATERALSMASTER}');
    print("COLLATERALSMASTER count");
    print(result1);
    List<CollateralBasicSelectionBean> listbean = new List<CollateralBasicSelectionBean>();
    CollateralBasicSelectionBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new CollateralBasicSelectionBean();
        bean = bindDataCollBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }
  //Select GuarantorDetailsBean BindData
  CollateralBasicSelectionBean bindDataCollBean(Map<String, dynamic> result) {
    return CollateralBasicSelectionBean.fromMapV2(result);
  }

  //Select CollateralBasicSelectionBean
  Future<List<CollateralBasicSelectionBean>> selectCollOnQuery(String query) async {
    var db = await _getDb();

    var result = await db.rawQuery(query);
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.COLLATERALSMASTER}');
    print("COLLATERALSMASTER count");
    print(result1);
    List<CollateralBasicSelectionBean> listbean = new List<CollateralBasicSelectionBean>();
    CollateralBasicSelectionBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new CollateralBasicSelectionBean();
        bean = bindDataCollBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }

  Future<int> updateCollaterals(CollateralBasicSelectionBean bean, String jsonData,String UUID) async {
    var db = await _getDb();
    Constant.getAppPath("This one submitted "+jsonData.toString(),"UpdateCollSave");
    Map<String, dynamic> row = {
      TablesColumnFile.UUID:bean.UUID,
      TablesColumnFile.COLLDATA:jsonData.toString(),
      TablesColumnFile.mcreateddt:bean.mcreateddt.toIso8601String(),
      TablesColumnFile.mcreatedby:bean.mcreatedby,
      TablesColumnFile.mlastupdatedt:bean.mlastupdatedt.toIso8601String(),
      TablesColumnFile.mlastupdateby:bean.mlastupdateby,
      TablesColumnFile.mgeolocation:bean.mgeolocation,
      TablesColumnFile.mgeolatd:bean.mgeolatd,
      TablesColumnFile.mgeologd:bean.mgeologd,
      TablesColumnFile.missynctocoresys:bean.missynctocoresys,
    };

    int id = 1;

    int updateCount = await db.update(
        TablesList.COLLATERALSMASTER,
        row,
        where: '${TablesColumnFile.UUID} = ?',
        whereArgs: [UUID]);
    return updateCount;

    print(await db.query(TablesList.CUSTOMERMASTER));
  }



//Documents

  //Insert Documents
  Future<int> insertDocumentsMaster(DocumentCollectorBean bean,String documents) async {
    print("XXXXXXXXXXXXXXXXXXXXXXXX");
    for (var items in bean.toString().split(",")) {
      print(items);
    }

    Constant.getAppPath("This one submitted "+documents.toString(),"BeforeSaveDoc");
    String insertQuery =
        "INSERT OR REPLACE INTO ${TablesList.DOCUMENTSMASTER}  ("
        "${TablesColumnFile.UUID} ,"
        "${TablesColumnFile.CUSTUUID} ,"
        "${TablesColumnFile.LOANUUID} ,"
        "${TablesColumnFile.DOCDATA} ,"
        "${TablesColumnFile.mcreateddt} ,"
        "${TablesColumnFile.mcreatedby} ,"
        "${TablesColumnFile.mlastupdatedt} ,"
        "${TablesColumnFile.mlastupdateby} ,"
        "${TablesColumnFile.mgeolocation} ,"
        "${TablesColumnFile.mgeolatd} ,"
        "${TablesColumnFile.mgeologd} ,"
        "${TablesColumnFile.missynctocoresys})"
        "VALUES"
        "('${bean.UUID}' ,"
        "'${bean.CUSTUUID}',"
        "'${bean.LOANUUID}',"
        "'${documents}',"
        "'${bean.mcreateddt}',"
        "'${bean.mcreatedby}',"
        "'${bean.mlastupdatedt}',"
        "'${bean.mlastupdateby}',"
        "'${bean.mgeolocation}',"
        "'${bean.mgeolatd}',"
        "'${bean.mgeologd}');";
    print("insert query Documents Formation" + insertQuery);
    int id;
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      id = await txn.rawInsert(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.DOCUMENTSMASTER}");
    });

    await db.transaction((Transaction txn) async {
      insertQuery = "SELECT last_insert_rowid();";
      var result = await txn.rawQuery(insertQuery);
      print(id.toString() +
          " id after insert in ${TablesList.DOCUMENTSMASTER}");
      print("value of toooooooo1" + result.toString());

    });
    return 0;//retValue[0];
  }

  Future<int> updateDocuments(DocumentCollectorBean documentsObj, String jsonData,String UUID) async {
    var db = await _getDb();
    Constant.getAppPath("This one submitted "+jsonData.toString(),"UpdateDocSave");
    Map<String, dynamic> row = {
      TablesColumnFile.UUID:documentsObj.UUID,
      TablesColumnFile.LOANUUID:documentsObj.LOANUUID,
      TablesColumnFile.CUSTUUID:documentsObj.CUSTUUID,
      TablesColumnFile.DOCDATA:jsonData.toString(),
      TablesColumnFile.mcreateddt:'',
      TablesColumnFile.mcreatedby:documentsObj.mcreatedby,
      TablesColumnFile.mlastupdatedt:'',
      TablesColumnFile.mlastupdateby:documentsObj.mlastupdateby,
      TablesColumnFile.mgeolocation:documentsObj.mgeolocation,
      TablesColumnFile.mgeolatd:documentsObj.mgeolatd,
      TablesColumnFile.mgeologd:documentsObj.mgeologd,
    };

    int id = 1;

    int updateCount = await db.update(
        TablesList.DOCUMENTSMASTER,
        row,
        where: '${TablesColumnFile.UUID} = ?',
        whereArgs: [UUID]);
    return updateCount;
  }


  //Select DOCUMENTS
  Future<List<DocumentCollectorBean>> selectDocumentsList(String query) async {
    var db = await _getDb();
    var result = await db.rawQuery(query);
    var result1 = await db
        .rawQuery('SELECT COUNT(*) FROM ${TablesList.DOCUMENTSMASTER}');
    print("Documents count");
    print(result1);
    List<DocumentCollectorBean> listbean = new List<DocumentCollectorBean>();
    DocumentCollectorBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new DocumentCollectorBean();
        bean = bindDataDocumentsBean(result[i]);
        listbean.add(bean);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return listbean;
  }

  //Select Document on passed query
  Future<DocumentCollectorBean> selectDocumentsOnQueryBased(String query) async {
    var db = await _getDb();
    var result = await db.rawQuery(query);
    DocumentCollectorBean bean;
    try {
      for (int i = 0; i < result.length; i++) {
        bean = new DocumentCollectorBean();
        bean = bindDataDocumentsBean(result[i]);
      }
    } catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    return bean;
  }


  //Select Document BindData
  DocumentCollectorBean bindDataDocumentsBean(Map<String, dynamic> result) {
    return DocumentCollectorBean.fromMapV2(result);
  }


}