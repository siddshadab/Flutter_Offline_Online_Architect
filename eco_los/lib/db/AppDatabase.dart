import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/screens/LoanApplication/bean/HbsUserBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/syncing/SyncingLookupDataServices.dart';
import 'package:eco_los/syncing/SyncingSubLookupDataServices.dart';
import 'package:eco_los/systems/InterestOffsetMaster/InterestOffsetBean.dart';
import 'package:eco_los/systems/InterestOffsetMaster/InterestOffsetServices.dart';
import 'package:eco_los/systems/InterestSlabMaster/InterestSlabBean.dart';
import 'package:eco_los/systems/InterestSlabMaster/InterestSlabServices.dart';
import 'package:eco_los/systems/LoanApprovalLimit/LoanApprovalLimitBean.dart';
import 'package:eco_los/systems/LoanApprovalLimit/LoanApprovalLimitServices.dart';
import 'package:eco_los/systems/LoanCycleParameterPrimaryTable/LoanCycleParameterPrimaryBean.dart';
import 'package:eco_los/systems/LoanCycleParameterPrimaryTable/LoanCycleParameterPrimaryServices.dart';
import 'package:eco_los/systems/LoanCycleParameterSecondaryTable/LoanCycleParameterSecondaryBean.dart';
import 'package:eco_los/systems/LoanCycleParameterSecondaryTable/LoanCycleParameterSecondaryServices.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterServices.dart';
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';
import 'package:eco_los/systems/branchMaster/bean/BranchMasterBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:eco_los/systems/settings/bean/SettingsBean.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'TablesList.dart';
import 'package:eco_los/helpers/globals.dart' as globals;

/// This is the singleton database class which handlers all database transactions
/// All the task raw queries is handle here and return a Future<T> with result
class AppDatabase {
  String timestamp() =>  DateTime.now().millisecondsSinceEpoch.toString();
  static final AppDatabase _appDatabase = new AppDatabase._internal();

  //TODO Take ALL Below const from TableList file afterwords
  static final userMasterTable = "User_Master";
  static final LookupMaster = "Lookup_Master";
  static final SystemParameterMaster = "System_Parameter_Master";
  static final InterestSlabMaster = "Interest_Slab_Master";
  static final InterestOffsetMaster = "Interest_Offset_Master";
  static final LoanCycleParameterPrimaryMaster =  "Loan_Cycle_Parameter_Primary_Master";
  static final LoanCycleParameterSecondaryMaster = "Loan_Cycle_Parameter_Secondary_Master";
  static final SubLookupMaster = "Sub_Lookup_Master";
  static final productMaster = "Product_Master";
  static final purposeMaster = "Purpose_Master";
  static final transactionModeMaster = "Transaction_Mode_Master";
  static final repaymentFrequencyMaster = "repayment_Frequency_Master";
  static final settingsMaster = "settings_Master";
  static final countryMaster = "Country_Master";
  static final stateMaster = "State_Master";
  static final districtMaster = "District_Master";
  static final subDistrictMaster = "SubDistrict_Master";
  static final areaMaster = "Area_Master";
  static final branchMaster = "Branch_Master";
  static final loanApprovalLimitMaster = "Loan_Approval_limit_Master";
  static final GETHBSUSERS = "Get_Hbs_Users";



  bool chk = false;
  //private internal constructor to make it singleton
  AppDatabase._internal();
  Database _database;
  static AppDatabase get() {
    return _appDatabase;
  }

  bool didInit = false;

  /// Use this method to access the database which will provide you future of [Database],
  /// because initialization of the database (it has to go through the method channel)
  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "microfinance.db");
    _database = await openDatabase(path, version: 8,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          //Data Set Started
          await _createCustomerMaster(db);
          await _createLoanMaster(db);
          await _createGuarMaster(db);
          await _createCollMaster(db);
          await _createDocumentMaster(db);
          //Data Set Ends
          await _createUserMasterTable(db);
          await _createProductMaster(db);
          await _createPurposeMaster(db);
          await _createTransactionModeMaster(db);
          await _createRepaymentFrequencyMaster(db);
          await _createLookupMasterTable(db);
          await _createInterestSlabMasterTable(db);
          await _createSystemParameterMasterTable(db);
          await _createLoanCycleParameterPrimaryMasterTable(db);
          await _createLoanCycleParameterSecondaryMasterTable(db);
          await _createInterestOffsetMasterTable(db);
          await _createSubLookupMasterTable(db);
          await _createSettingsMaster(db);
          await _createCountryMaster(db);
          await _createStateMaster(db);
          await _createDistrictMaster(db);
          await _createSubDistrictMaster(db);
          await _createAreaMaster(db);
          await _createLoanApprovalLimitMasterTable(db);
          await _createBranchMasterTable(db);
          await _createHbsUSersMaster(db);



       }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
        //TODO On Database version upgrade pleasa create tables alters method here
        });
    didInit = true;
  }



  //Create Table CustomerMasterBasicsDetails
  Future _createCustomerMaster(Database db) {
    String tableCreationQuery =
        "CREATE TABLE ${TablesList.CUSTOMERMASTER} ("
        "${TablesColumnFile.UUID} TEXT, "
        "${TablesColumnFile.CUSTDATA} TEXT, "
        "${TablesColumnFile.mcreateddt} DATETIME, "
        "${TablesColumnFile.mcreatedby} TEXT, "
        "${TablesColumnFile.mlastupdatedt} DATETIME, "
        "${TablesColumnFile.mlastupdateby} TEXT, "
        "${TablesColumnFile.mgeolocation} TEXT, "
        "${TablesColumnFile.mgeolatd} TEXT, "
        "${TablesColumnFile.mgeologd} TEXT, "
        "${TablesColumnFile.missynctocoresys} INTEGER "
        ");";
    print(tableCreationQuery);
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return db.transaction((Transaction txn) async {
      txn.execute(tableCreationQuery);
    });
  }


  //Create Table CustomerLOANMasterBasicsDetails
  Future _createLoanMaster(Database db) {
    String tableCreationQuery =
        "CREATE TABLE ${TablesList.LOANMASTER} ("
        "${TablesColumnFile.UUID} TEXT, "
        "${TablesColumnFile.CUSTUUID} TEXT, "
        "${TablesColumnFile.LOANDATA} TEXT, "
        "${TablesColumnFile.mcreateddt} DATETIME, "
        "${TablesColumnFile.mcreatedby} TEXT, "
        "${TablesColumnFile.mlastupdatedt} DATETIME, "
        "${TablesColumnFile.mlastupdateby} TEXT, "
        "${TablesColumnFile.mgeolocation} TEXT, "
        "${TablesColumnFile.mgeolatd} TEXT, "
        "${TablesColumnFile.mgeologd} TEXT, "
        "${TablesColumnFile.missynctocoresys} INTEGER "
        ");";
       print(tableCreationQuery);
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return db.transaction((Transaction txn) async {
      txn.execute(tableCreationQuery);
    });
  }

  //Create Table GUARMasterBasicsDetails
  Future _createGuarMaster(Database db) {
    String tableCreationQuery =
        "CREATE TABLE ${TablesList.GUARANTERMASTER} ("
        "${TablesColumnFile.UUID} TEXT, "
        "${TablesColumnFile.CUSTUUID} TEXT, "
        "${TablesColumnFile.LOANUUID} TEXT, "
        "${TablesColumnFile.GUARDATA} TEXT, "
        "${TablesColumnFile.mcreateddt} DATETIME, "
        "${TablesColumnFile.mcreatedby} TEXT, "
        "${TablesColumnFile.mlastupdatedt} DATETIME, "
        "${TablesColumnFile.mlastupdateby} TEXT, "
        "${TablesColumnFile.mgeolocation} TEXT, "
        "${TablesColumnFile.mgeolatd} TEXT, "
        "${TablesColumnFile.mgeologd} TEXT, "
        "${TablesColumnFile.missynctocoresys} INTEGER "
        ");";
    print(tableCreationQuery);
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return db.transaction((Transaction txn) async {
      txn.execute(tableCreationQuery);
    });
  }

  //Create Table COLLMasterBasicsDetails
  Future _createCollMaster(Database db) {
    String tableCreationQuery =
        "CREATE TABLE ${TablesList.COLLATERALSMASTER} ("
        "${TablesColumnFile.UUID} TEXT, "
        "${TablesColumnFile.CUSTUUID} TEXT, "
        "${TablesColumnFile.LOANUUID} TEXT, "
        "${TablesColumnFile.COLLDATA} TEXT, "
        "${TablesColumnFile.mcreateddt} DATETIME, "
        "${TablesColumnFile.mcreatedby} TEXT, "
        "${TablesColumnFile.mlastupdatedt} DATETIME, "
        "${TablesColumnFile.mlastupdateby} TEXT, "
        "${TablesColumnFile.mgeolocation} TEXT, "
        "${TablesColumnFile.mgeolatd} TEXT, "
        "${TablesColumnFile.mgeologd} TEXT, "
        "${TablesColumnFile.missynctocoresys} INTEGER "
        ");";
    print(tableCreationQuery);
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return db.transaction((Transaction txn) async {
      txn.execute(tableCreationQuery);
    });
  }


  //Create Table _createDocumentMaster
  Future _createDocumentMaster(Database db) {
    String tableCreationQuery =
        "CREATE TABLE ${TablesList.DOCUMENTSMASTER} ("
        "${TablesColumnFile.UUID} TEXT, "
        "${TablesColumnFile.CUSTUUID} TEXT, "
        "${TablesColumnFile.LOANUUID} TEXT, "
        "${TablesColumnFile.DOCDATA} TEXT, "
        "${TablesColumnFile.mcreateddt} DATETIME, "
        "${TablesColumnFile.mcreatedby} TEXT, "
        "${TablesColumnFile.mlastupdatedt} DATETIME, "
        "${TablesColumnFile.mlastupdateby} TEXT, "
        "${TablesColumnFile.mgeolocation} TEXT, "
        "${TablesColumnFile.mgeolatd} TEXT, "
        "${TablesColumnFile.mgeologd} TEXT, "
        "${TablesColumnFile.missynctocoresys} INTEGER "
        ");";
    print(tableCreationQuery);
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    return db.transaction((Transaction txn) async {
      txn.execute(tableCreationQuery);
    });
  }


  Future _createUserMasterTable(Database db) {
    print("shadab's  table xxxxxxxxxxxxx");
    String query = "CREATE TABLE ${TablesList.USERMASTER} ("
        "${TablesColumnFile.musrcode} TEXT PRIMARY KEY,"
        "${TablesColumnFile.mcustaccesslvl} INTEGER,"
        "${TablesColumnFile.mextnno} INTEGER,"
        "${TablesColumnFile.mactiveinstn} TEXT,"
        "${TablesColumnFile.mautologoutperiod} INTEGER,"
        "${TablesColumnFile.mautologoutyn} TEXT,"
        "${TablesColumnFile.mbadloginsdt} DATETIME,"
        "${TablesColumnFile.memailid} TEXT,"
        "${TablesColumnFile.merror} INTEGER,"
        "${TablesColumnFile.merrormessage} TEXT,"
        "${TablesColumnFile.mgrpcd} INTEGER,"
        "${TablesColumnFile.misloggedinyn} INTEGER,"
        "${TablesColumnFile.mlastpwdchgdt} DATETIME,"
        "${TablesColumnFile.mlastsyslidt} DATETIME,"
        "${TablesColumnFile.mmaxbadlginperday} INTEGER,"
        "${TablesColumnFile.mmaxbadlginperinst} INTEGER,"
        "${TablesColumnFile.mmobile} TEXT,"
        "${TablesColumnFile.mnextpwdchgdt} DATETIME,"
        "${TablesColumnFile.mnextsyslgindt} DATETIME,"
        "${TablesColumnFile.mnoofbadlogins} INTEGER,"
        "${TablesColumnFile.mpwdchgforcedyn} TEXT,"
        "${TablesColumnFile.mpwdchgperioddays} INTEGER,"
        "${TablesColumnFile.mregdevicemacid} TEXT,"
        "${TablesColumnFile.mreportinguser} TEXT,"
        "${TablesColumnFile.mstatus} INTEGER,"
        "${TablesColumnFile.musrbrcode} INTEGER,"
        "${TablesColumnFile.musrdesignation} TEXT,"
        "${TablesColumnFile.musrname} TEXT,"
        "${TablesColumnFile.musrpass} TEXT,"
        "${TablesColumnFile.musrshortname} TEXT,"
        "${TablesColumnFile.mReason} TEXT,"
        "${TablesColumnFile.mSusDate} DATETIME,"
        "${TablesColumnFile.mJoinDate} DATETIME,"
        "${TablesColumnFile.mgender} TEXT,"
        "${TablesColumnFile.mcreateddt} DATETIME,"
        "${TablesColumnFile.mcreatedby} TEXT,"
        "${TablesColumnFile.mlastupdatedt} DATETIME,"
        "${TablesColumnFile.mlastupdateby} TEXT,"
        "${TablesColumnFile.mgeolocation} TEXT,"
        "${TablesColumnFile.mgeolatd} TEXT,"
        "${TablesColumnFile.mgeologd} TEXT,"
        "${TablesColumnFile.mlastsynsdate} DATETIME"
        ");";
    print("table Query Here is : " + query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }


  Future _createBranchMasterTable(Database db) {
    print("shadab's  table xxxxxxxxxxxxx");
    String query = "CREATE TABLE ${branchMaster} ("
        "${TablesColumnFile.mpbrcode} INTEGER PRIMARY KEY,"
        "${TablesColumnFile.mname} TEXT,"
        "${TablesColumnFile.mshortname} TEXT,"
        "${TablesColumnFile.madd1} TEXT,"
        "${TablesColumnFile.madd2} TEXT,"
        "${TablesColumnFile.madd3} TEXT,"
        "${TablesColumnFile.mcitycd} TEXT,"
        "${TablesColumnFile.mpincode} INTEGER,"
        "${TablesColumnFile.mcountrycd} TEXT,"
        "${TablesColumnFile.mbranchtype} INTEGER,"
        "${TablesColumnFile.mtele1} TEXT,"
        "${TablesColumnFile.mtele2} TEXT,"
        "${TablesColumnFile.mfaxno1} TEXT,"
        "${TablesColumnFile.mswiftaddr} TEXT,"
        "${TablesColumnFile.mpostcode} TEXT,"
        "${TablesColumnFile.mweekoff1} INTEGER,"
        "${TablesColumnFile.mweekoff2} INTEGER,"
        "${TablesColumnFile.mparentbrcode} INTEGER,"
        "${TablesColumnFile.mbranchtype1} INTEGER,"
        "${TablesColumnFile.mbranchcat} INTEGER,"
        "${TablesColumnFile.mformatndt} DATETIME,"
        "${TablesColumnFile.mdistrict} TEXT,"
        "${TablesColumnFile.mbrnmanager} TEXT,"
        "${TablesColumnFile.mstate} TEXT,"
        "${TablesColumnFile.mmingroupmembers} INTEGER,"
        "${TablesColumnFile.mmaxgroupmembers} INTEGER,"
        "${TablesColumnFile.msector} INTEGER,"
        "${TablesColumnFile.mbranchemailid} TEXT,"
        "${TablesColumnFile.mbiccode} TEXT,"
        "${TablesColumnFile.mlegacybrncd} TEXT,"
        "${TablesColumnFile.mlatitude} REAL,"
        "${TablesColumnFile.mlongitude} REAL,"
        "${TablesColumnFile.mlastopendate} DATETIME"
        ");";
    print("table Query Here is : " + query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }


  Future _createProductMaster(Database db) {
    String query = "CREATE TABLE ${productMaster} ("
        "${TablesColumnFile.trefno} INTEGER PRIMARY KEY ,"
        "${TablesColumnFile.mrefno} INTEGER  ,"
        "${TablesColumnFile.mlbrcode} INTEGER  ,"
        "${TablesColumnFile.mprdCd} TEXT,"
        "${TablesColumnFile.mname} TEXT,"
        "${TablesColumnFile.mintrate} REAL,"
        "${TablesColumnFile.mmoduletype} INTEGER,"
        "${TablesColumnFile.mcurCd} TEXT,"
        "${TablesColumnFile.mmancolltype} TEXT,"
        "${TablesColumnFile.mmanguartype} TEXT,"
        "${TablesColumnFile.mmandoctype} TEXT,"
        "${TablesColumnFile.mdivisiontype} TEXT,"
        "${TablesColumnFile.mnoofguaranter} INTEGER,"
        "${TablesColumnFile.mlastsynsdate} DATETIME);";

    print(
        "xxxxxxxxxxxxxxxxxxx ${productMaster} table Query Here is : " + query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }

  Future _createPurposeMaster(Database db) {
    String query = "CREATE TABLE ${purposeMaster} ("
        "${TablesColumnFile.purposeId} INTEGER PRIMARY KEY ,"
        "${TablesColumnFile.purposeName} TEXT,"
        "${TablesColumnFile.purposeDescription} TEXT);";
    print(
        "xxxxxxxxxxxxxxxxxxx ${purposeMaster} table Query Here is : " + query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }

  Future _createTransactionModeMaster(Database db) {
    String query = "CREATE TABLE ${transactionModeMaster} ("
        "${TablesColumnFile.transactionModeId} INTEGER PRIMARY KEY ,"
        "${TablesColumnFile.transactionMode} TEXT,"
        "${TablesColumnFile.transactionModeDescription} TEXT);";
    print(
        "xxxxxxxxxxxxxxxxxxx ${transactionModeMaster} table Query Here is : " +
            query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }

  Future _createRepaymentFrequencyMaster(Database db) {
    String query = "CREATE TABLE ${repaymentFrequencyMaster} ("
        "${TablesColumnFile.repaymentFrequencyId} INTEGER PRIMARY KEY ,"
        "${TablesColumnFile.repaymentFrequency} TEXT,"
        "${TablesColumnFile.repaymentFrequencyDescription} TEXT);";
    print(
        "xxxxxxxxxxxxxxxxxxx ${repaymentFrequencyMaster} table Query Here is : " +
            query);
    return db.transaction((Transaction txn) async {
      txn.execute(query);
    });
  }


  Future _createSettingsMaster(Database db) {
    String query = "CREATE TABLE ${settingsMaster} ("
        "${TablesColumnFile.trefno} INTEGER PRIMARY KEY,"
        "${TablesColumnFile.musrcode} TEXT,"
        "${TablesColumnFile.musrpass} TEXT,"
        "${TablesColumnFile.mipaddress} TEXT,"
        "${TablesColumnFile.mportno} TEXT,"
        "${TablesColumnFile.isHttps} INTEGER DEFAULT 0,"
        "${TablesColumnFile.isPortRequired} INTEGER DEFAULT 0,"
        "${TablesColumnFile.yesno} INTEGER)";
    print("primary of settings table");
    print(query.toString());

    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }


  Future _createCountryMaster(Database db) {
    return db.transaction((Transaction txn) {
      txn.execute("CREATE TABLE ${countryMaster} ("
          "${TablesColumnFile.cntryCd} TEXT PRIMARY KEY ,"
          "${TablesColumnFile.countryName} TEXT,"
          "${TablesColumnFile.createdAt} DATETIME);");
    });
  }

  Future _createStateMaster(Database db) {
    return db.transaction((Transaction txn) {
      txn.execute("CREATE TABLE ${stateMaster} ("
          "${TablesColumnFile.stateCd} TEXT PRIMARY KEY ,"
          "${TablesColumnFile.stateDesc} TEXT,"
          "${TablesColumnFile.cntryCd} TEXT,"
          "${TablesColumnFile.createdAt} DATETIME);");
    });
  }

  Future _createDistrictMaster(Database db) {
    return db.transaction((Transaction txn) {
      txn.execute("CREATE TABLE ${districtMaster} ("
          "${TablesColumnFile.distCd} INTEGER PRIMARY KEY ,"
          "${TablesColumnFile.distDesc} TEXT,"
          "${TablesColumnFile.stateCd} TEXT,"
          "${TablesColumnFile.createdAt} DATETIME);");
    });
  }

  Future _createSubDistrictMaster(Database db) {
    return db.transaction((Transaction txn) {
      txn.execute("CREATE TABLE ${subDistrictMaster} ("
          "${TablesColumnFile.placeCd} TEXT PRIMARY KEY ,"
          "${TablesColumnFile.placeCdDesc} TEXT,"
          "${TablesColumnFile.distCd} INTEGER,"
          "${TablesColumnFile.createdAt} DATETIME);");
    });
  }

  Future _createAreaMaster(Database db) {
    return db.transaction((Transaction txn) {
      txn.execute("CREATE TABLE ${areaMaster} ("
          "${TablesColumnFile.areaCd} INTEGER,"
          "${TablesColumnFile.placeCd} TEXT,"
          "${TablesColumnFile.areaDesc} TEXT,"
          "${TablesColumnFile.createdAt} DATETIME,"
          "PRIMARY KEY(${TablesColumnFile.areaCd},${TablesColumnFile
          .placeCd}));");
    });
  }


  //HBSUSERS
  _createHbsUSersMaster(Database db) {
    String query = "CREATE TABLE ${GETHBSUSERS} ("
        "${TablesColumnFile.mgrpcd} INTEGER,"
        "${TablesColumnFile.musrcode} TEXT,"
        "${TablesColumnFile.musrname} TEXT,"
        "${TablesColumnFile.musrbrcode} INTEGER,"
        "PRIMARY KEY (${TablesColumnFile.musrcode})"
        ");";
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }


  Future updateGetHbsUsers(LoginBean loginBean) async {
    print("trying to insert or replace ${GETHBSUSERS}");
    String insertQuery = "INSERT OR REPLACE INTO ${GETHBSUSERS}  ("
        "${TablesColumnFile.mgrpcd} ,"
        "${TablesColumnFile.musrcode} ,"
        "${TablesColumnFile.musrname} ,"
        "${TablesColumnFile.musrbrcode}  ) "
        "VALUES "
        "(${loginBean.mgrpcd} ,"
        "'${loginBean.musrcode}' ,"
        "'${loginBean.musrname}' ,"
        "'${loginBean.musrbrcode}'); ";
    print("insert query is" + insertQuery);

    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      print(id.toString() + " id after insert in ${GETHBSUSERS}");
    });
  }



  Future updatecountryMaster(CountryDropDownBean bean) async {
    print("trying to insert or replace ${countryMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${countryMaster}( "
        "${TablesColumnFile.cntryCd},"
        "${TablesColumnFile.countryName},"
        "${TablesColumnFile.createdAt}"
        ")"
        "VALUES("
        "'${bean.cntryCd}',"
        "'${bean.countryName}',"
        "'${bean.createdAt}'"
        ");";
    print("insert query is" + insertQuery);

    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      //print(id.toString() + " id after insert in ${countryMaster}");
    });
  }

  Future updateStateMaster(StateDropDownList bean) async {
    print("trying to insert or replace ${stateMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${stateMaster}( "
        "${TablesColumnFile.stateCd},"
        "${TablesColumnFile.stateDesc},"
        "${TablesColumnFile.cntryCd},"
        "${TablesColumnFile.createdAt}"
        ")"
        "VALUES("
        "'${bean.stateCd}',"
        "'${bean.stateDesc}',"
        "'${bean.cntryCd}',"
        "'${bean.createdAt}'"
        ");";
    print("insert query is" + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      //print(id.toString() + " id after insert in ${stateMaster}");
    });
  }

  Future updateDistrictMaster(DistrictDropDownList bean) async {
    print("trying to insert or replace ${districtMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${districtMaster}( "
        "${TablesColumnFile.distCd},"
        "${TablesColumnFile.distDesc},"
        "${TablesColumnFile.stateCd},"
        "${TablesColumnFile.createdAt}"
        ")"
        "VALUES("
        "${bean.distCd},"
        "'${bean.distDesc}',"
        "'${bean.stateCd}',"
        "'${bean.createdAt}'"
        ");";
    print("insert query is" + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      //print(id.toString() + " id after insert in ${districtMaster}");
    });
  }

  Future updateSubDistrictMaster(SubDistrictDropDownList bean) async {
    print("trying to insert or replace ${subDistrictMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${subDistrictMaster}( "
        "${TablesColumnFile.placeCd},"
        "${TablesColumnFile.placeCdDesc},"
        "${TablesColumnFile.distCd},"
        "${TablesColumnFile.createdAt}"
        ")"
        "VALUES("
        "'${bean.placeCd}',"
        "'${bean.placeCdDesc}',"
        "${bean.distCd},"
        "'${bean.createdAt}'"
        ");";
    print("insert query is" + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      //print(id.toString() + " id after insert in ${subDistrictMaster}");
    });
  }

  Future updateAreaMaster(AreaDropDownList bean, areaCode, placeCode) async {
    //print("trying to insert or replace ${areaMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${areaMaster}( "
        "${TablesColumnFile.areaCd},"
        "${TablesColumnFile.placeCd},"
        "${TablesColumnFile.areaDesc},"
        "${TablesColumnFile.createdAt}"
        ")"
        "VALUES("
        "${areaCode},"
        "'${placeCode}',"
        "'${bean.areaDesc}',"
        "'${bean.createdAt}'"
        ");";
    print("insert query is" + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
    });
  }


  Future updateLoginColumn(LoginBean loginBean, String usrCode) async {
    String insertQuery = 'INSERT OR REPLACE INTO '
        '${TablesList.USERMASTER}'
        '( ${TablesColumnFile.musrcode}  ,'
        '${TablesColumnFile.mcustaccesslvl} ,'
        '${TablesColumnFile.mextnno} ,'
        '${TablesColumnFile.mactiveinstn} ,'
        '${TablesColumnFile.mautologoutperiod} ,'
        '${TablesColumnFile.mautologoutyn} ,'
        '${TablesColumnFile.mbadloginsdt} ,'
        '${TablesColumnFile.memailid} ,'
        '${TablesColumnFile.merror} ,'
        '${TablesColumnFile.merrormessage} ,'
        '${TablesColumnFile.mgrpcd} ,'
        '${TablesColumnFile.misloggedinyn} ,'
        '${TablesColumnFile.mlastpwdchgdt} ,'
        '${TablesColumnFile.mlastsyslidt} ,'
        '${TablesColumnFile.mmaxbadlginperday} ,'
        '${TablesColumnFile.mmaxbadlginperinst} ,'
        '${TablesColumnFile.mmobile} ,'
        '${TablesColumnFile.mnextpwdchgdt} ,'
        '${TablesColumnFile.mnextsyslgindt} ,'
        '${TablesColumnFile.mnoofbadlogins} ,'
        '${TablesColumnFile.mpwdchgforcedyn} ,'
        '${TablesColumnFile.mpwdchgperioddays} ,'
        '${TablesColumnFile.mregdevicemacid} ,'
        '${TablesColumnFile.mreportinguser} ,'
        '${TablesColumnFile.mstatus} ,'
        '${TablesColumnFile.musrbrcode} ,'
        '${TablesColumnFile.musrdesignation} ,'
        '${TablesColumnFile.musrname} ,'
        '${TablesColumnFile.musrpass} ,'
        '${TablesColumnFile.musrshortname} ,'
        '${TablesColumnFile.mReason} ,'
        '${TablesColumnFile.mSusDate} ,'
        '${TablesColumnFile.mJoinDate} ,'
        '${TablesColumnFile.mgender} ,'
        '${TablesColumnFile.mcreateddt} ,'
        '${TablesColumnFile.mcreatedby} ,'
        '${TablesColumnFile.mlastupdatedt} ,'
        '${TablesColumnFile.mlastupdateby} ,'
        '${TablesColumnFile.mgeolocation} ,'
        '${TablesColumnFile.mgeolatd} ,'
        '${TablesColumnFile.mgeologd} ,'
        '${TablesColumnFile.mlastsynsdate})'
        ' VALUES('
        '"${loginBean.musrcode.trim()}",'
        '${loginBean.mcustaccesslvl} ,'
        '${loginBean.mextnno} ,'
        '"${loginBean.mactiveinstn}",'
        '${loginBean.mautologoutperiod} ,'
        '"${loginBean.mautologoutyn}",'
        '"${loginBean.mbadloginsdt}" ,'
        '"${loginBean.memailid}",'
        '${loginBean.merror} ,'
        '"${loginBean.merrormessage}",'
        '${loginBean.mgrpcd} ,'
        '${loginBean.misloggedinyn} ,'
        '"${loginBean.mlastpwdchgdt}" ,'
        '"${loginBean.mlastsyslidt}" ,'
        '${loginBean.mmaxbadlginperday} ,'
        '${loginBean.mmaxbadlginperinst} ,'
        '"${loginBean.mmobile}",'
        '"${loginBean.mnextpwdchgdt}" ,'
        '"${loginBean.mnextsyslgindt}" ,'
        '${loginBean.mnoofbadlogins} ,'
        '"${loginBean.mpwdchgforcedyn}",'
        '${loginBean.mpwdchgperioddays} ,'
        '"${loginBean.mregdevicemacid}",'
        '"${loginBean.mreportinguser}",'
        '${loginBean.mstatus} ,'
        '${loginBean.musrbrcode} ,'
        '"${loginBean.musrdesignation}",'
        '"${loginBean.musrname}",'
        '"${loginBean.musrpass.trim()}",'
        '"${loginBean.musrshortname}",'
        '"${loginBean.mReason}",'
        '"${loginBean.mSusDate}" ,'
        '"${loginBean.mJoinDate}" ,'
        '"${loginBean.mgender}",'
        '"${loginBean.mcreateddt}" ,'
        '"${loginBean.mcreatedby}",'
        '"${loginBean.mlastupdatedt}" ,'
        '"${loginBean.mlastupdateby}",'
        '"${loginBean.mgeolocation}",'
        '"${loginBean.mgeolatd}",'
        '"${loginBean.mgeologd}",'
        '"${loginBean.mlastsynsdate}")';
    print("insert query of login here it is " + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      print(id.toString() + "idafterinsert");
    });
  }

  Future<LoginBean> getLoginData(LoginBean loginBean) async {
    var db = await _getDb();
    var userPass =
        "${TablesColumnFile.musrpass} = '${loginBean.musrpass.trim()}'";
    var userCode =
        "UPPER(${TablesColumnFile.musrcode}) = '${loginBean.musrcode.trim().toUpperCase()}'";
    LoginBean retBean = new LoginBean();

    print('query is here : ' +
        'SELECT *  FROM $userMasterTable  WHERE $userPass AND $userCode');
    var result = await db.rawQuery(
        'SELECT *  FROM $userMasterTable  WHERE $userPass AND $userCode');
    if (result[0] != null) {
      print(" yes login ofline " + result[0].toString());
      retBean = bindDataLoginBEan(result);
      //  retBean = bindDataLoginBEan(result);
    }
    return retBean;
  }

  LoginBean bindDataLoginBEan(List<Map<String, dynamic>> result) {
    return LoginBean.fromMap(result[0]);
  }
  //create LookupMasterTable
  Future _createLoanCycleParameterSecondaryMasterTable(Database db) {
    String query = "CREATE TABLE ${LoanCycleParameterSecondaryMaster} ("
        "${TablesColumnFile.mlbrcode} INTEGER,"
        "${TablesColumnFile.mprdcd} TEXT,"
        "${TablesColumnFile.mloancycle} INTEGER,"
        "${TablesColumnFile.mcusttype} INTEGER,"
        "${TablesColumnFile.mgrtype} INTEGER,"
        "${TablesColumnFile.meffdate} DATETIME,"
        "${TablesColumnFile.mfrequency} TEXT,"
        "${TablesColumnFile.mruletype} INTEGER,"
        "${TablesColumnFile.msrno} INTEGER,"
        "${TablesColumnFile.muptoamount} REAL,"
        "${TablesColumnFile.mminamount} REAL,"
        "${TablesColumnFile.mmaxamount} REAL,"
        "${TablesColumnFile.mlastsynsdate} DATETIME,"
        "PRIMARY KEY (${TablesColumnFile.mlbrcode},${TablesColumnFile
        .mprdcd},${TablesColumnFile.mloancycle},${TablesColumnFile
        .mcusttype},${TablesColumnFile.mgrtype},${TablesColumnFile
        .meffdate},${TablesColumnFile.mfrequency},${TablesColumnFile
        .mruletype},${TablesColumnFile.msrno}))";
    print("primary of Insert Loan Cycle Parameter Secondary Master table");
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future _createLoanCycleParameterPrimaryMasterTable(Database db) {
    String query = "CREATE TABLE ${LoanCycleParameterPrimaryMaster} ("
        "${TablesColumnFile.mlbrcode} INTEGER,"
        "${TablesColumnFile.mprdcd} TEXT,"
        "${TablesColumnFile.mloancycle} INTEGER,"
        "${TablesColumnFile.mcusttype} INTEGER,"
        "${TablesColumnFile.mgrtype} INTEGER,"
        "${TablesColumnFile.meffdate} DATETIME,"
        "${TablesColumnFile.mminamount} REAL,"
        "${TablesColumnFile.mmaxamount} REAL,"
        "${TablesColumnFile.mminperiod} INTEGER,"
        "${TablesColumnFile.mmaxperiod} INTEGER,"
        "${TablesColumnFile.mminnoofgrpmems} INTEGER,"
        "${TablesColumnFile.mmaxnoofgrpmems} INTEGER,"
        "${TablesColumnFile.mgender} TEXT,"
        "${TablesColumnFile.mminage} INTEGER,"
        "${TablesColumnFile.mmaxage} INTEGER,"
        "${TablesColumnFile.mgrpcycyn} INTEGER,"
        "${TablesColumnFile.mlogic} INTEGER,"
        "${TablesColumnFile.mtenor} INTEGER,"
        "${TablesColumnFile.mfrequency} TEXT,"
        "${TablesColumnFile.mincramount} REAL,"
        "${TablesColumnFile.mnoofinstlclosure} INTEGER,"
        "${TablesColumnFile.mmultiplefactor} INTEGER,"
        "${TablesColumnFile.mlastsynsdate} DATETIME,"
        "PRIMARY KEY (${TablesColumnFile.mlbrcode}, ${TablesColumnFile
        .mprdcd}, ${TablesColumnFile.meffdate}))";
    print("primary of Insert Loan Cycle Parameter Primary Master table");
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future _createInterestOffsetMasterTable(Database db) {
    String query = "CREATE TABLE ${InterestOffsetMaster} ("
        "${TablesColumnFile.mlbrcode} TEXT,"
        "${TablesColumnFile.mprdcd} INTEGER,"
        "${TablesColumnFile.mloantype} INTEGER,"
        "${TablesColumnFile.mloancycle} INTEGER,"
        "${TablesColumnFile.meffdate} DATETIME,"
        "${TablesColumnFile.msrno} INTEGER,"
        "${TablesColumnFile.mmonths} INTEGER,"
        "${TablesColumnFile.mamount} REAL,"
        "${TablesColumnFile.mintrestrate} REAL,"
        "${TablesColumnFile.mlastsynsdate} DATETIME,"
        "PRIMARY KEY (${TablesColumnFile.mlbrcode}, ${TablesColumnFile
        .mprdcd}, ${TablesColumnFile.mloantype}, ${TablesColumnFile
        .mloancycle}, ${TablesColumnFile.meffdate}, ${TablesColumnFile
        .msrno}))";
    print("primary of Insert Slab table");
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }



  Future _createSystemParameterMasterTable(Database db) {
    String query = "CREATE TABLE ${SystemParameterMaster} ("
        "${TablesColumnFile.mlbrcode} INTEGER ,"
        "${TablesColumnFile.mcode} TEXT,"
        "${TablesColumnFile.mcodedesc} TEXT ,"
        "${TablesColumnFile.mcodevalue} TEXT ,"
        "${TablesColumnFile.mcreateddt} DATETIME ,"
        "PRIMARY KEY (${TablesColumnFile.mlbrcode}, ${TablesColumnFile.mcode}))";
    print("system parameter table--" + query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future _createInterestSlabMasterTable(Database db) {
    String query = "CREATE TABLE ${InterestSlabMaster} ("
        "${TablesColumnFile.mprdcd} TEXT,"
        "${TablesColumnFile.mcurcd} TEXT,"
        "${TablesColumnFile.minteffdt} DATETIME,"
        "${TablesColumnFile.msrno} INTEGER,"
        "${TablesColumnFile.mmonths} INTEGER,"
        "${TablesColumnFile.mtoamt} REAL,"
        "${TablesColumnFile.mintrate} REAL,"
        "${TablesColumnFile.mmlastsynsdate} DATETIME,"
        "PRIMARY KEY (${TablesColumnFile.mprdcd}, ${TablesColumnFile
        .mcurcd}, ${TablesColumnFile.minteffdt}, ${TablesColumnFile.msrno}))";
    print("primary of Insert Slab table");
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future _createLookupMasterTable(Database db) {
    String query = "CREATE TABLE ${LookupMaster} ("
        "${TablesColumnFile.mcode} TEXT,"
        "${TablesColumnFile.mcodetype} INTEGER,"
        "${TablesColumnFile.mcodedesc} TEXT,"
        "${TablesColumnFile.mfield1value} TEXT,"
        "${TablesColumnFile.mcodedatatype} INTEGER,"
        "${TablesColumnFile.mcodedatalen} INTEGER,"
        "${TablesColumnFile.mlastsynsdate} DATETIME,"
        "PRIMARY KEY (${TablesColumnFile.mcode}, ${TablesColumnFile
        .mcodetype}))";
    print("primary of lookup table");
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  //Create Sub LookupMaster table

  Future _createSubLookupMasterTable(Database db) {
    String query = "CREATE TABLE ${SubLookupMaster} ("
        "${TablesColumnFile.mcode} TEXT,"
        "${TablesColumnFile.mcodetype} INTEGER,"
        "${TablesColumnFile.mcodedesc} TEXT,"
        "${TablesColumnFile.mfield1value} TEXT,"
        "PRIMARY KEY (${TablesColumnFile.mcode}, ${TablesColumnFile
        .mcodetype}))";
    print("primary of lookup table");
    print(query.toString());

    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future createLoanCycleParameterSecondaryInsert(int lbrCode) async {
    //deletSomeUtil();
    var loanCycleParameterSecondaryServices =
    new LoanCycleParameterSecondaryServices();
    var db = await _getDb();
    List<LoanCycleParameterSecondaryBean> LoanCycleParameterSecondaryList =
    new List<LoanCycleParameterSecondaryBean>();
    await loanCycleParameterSecondaryServices
        .getLoanCycleParameterSecondaryData(lbrCode)
        .then((onValue) {
      print(onValue.length);
      LoanCycleParameterSecondaryList = onValue;
    });
    await AppDatabase.get().deletSomeSyncingActivityFromOmni(
        'Loan_Cycle_Parameter_Secondary_Master');
    for (int i = 0; i < LoanCycleParameterSecondaryList.length; i++) {
      print(LoanCycleParameterSecondaryList.length.toString() +
          " LoanCycleParameterSecondaryMaster");
      String insertQuery =
          "INSERT OR REPLACE INTO ${LoanCycleParameterSecondaryMaster} "
          "(${TablesColumnFile.mlbrcode} ,"
          "${TablesColumnFile.mprdcd} ,"
          "${TablesColumnFile.mloancycle} ,"
          "${TablesColumnFile.mcusttype} ,"
          "${TablesColumnFile.mgrtype} ,"
          "${TablesColumnFile.meffdate} ,"
          "${TablesColumnFile.mfrequency} ,"
          "${TablesColumnFile.mruletype} ,"
          "${TablesColumnFile.msrno} ,"
          "${TablesColumnFile.muptoamount} ,"
          "${TablesColumnFile.mminamount} ,"
          "${TablesColumnFile.mmaxamount} ,"
          "${TablesColumnFile.mlastsynsdate}  )"
          "VALUES"
          "(${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mlbrcode},"
          "'${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mprdcd.trim()}',"
          "${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mloancycle},"
          "${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mcusttype},"
          "${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mgrtype},"
          "'${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.meffdate}',"
          "'${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mfrequency}',"
          "${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.mruletype},"
          "${LoanCycleParameterSecondaryList[i]
          .loanCycleParameterSecondaryComposite.msrno},"
          "${LoanCycleParameterSecondaryList[i].muptoamount},"
          "${LoanCycleParameterSecondaryList[i].mminamount},"
          "${LoanCycleParameterSecondaryList[i].mmaxamount},"
          "'${LoanCycleParameterSecondaryList[i].mlastsynsdate}');";
      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() +
            " id after insert in ${LoanCycleParameterSecondaryMaster}");
      });
    }
  }

  Future createLoanCycleParameterPrimaryInsert(int lbrCode) async {
    //deletSomeUtil();
    var loanCycleParameterPrimaryServices =   new LoanCycleParameterPrimaryServices();
    var db = await _getDb();
    List<LoanCycleParameterPrimaryBean> LoanCycleParameterPrimaryList =
    new List<LoanCycleParameterPrimaryBean>();
    await loanCycleParameterPrimaryServices
        .getLoanCycleParameterPrimaryData(lbrCode)
        .then((onValue) {
      print(onValue.length);
      LoanCycleParameterPrimaryList = onValue;
    });
    await AppDatabase.get().deletSomeSyncingActivityFromOmni(
        'Loan_Cycle_Parameter_Primary_Master');
    for (int i = 0; i < LoanCycleParameterPrimaryList.length; i++) {
      print(LoanCycleParameterPrimaryList.length.toString() +
          " LoanCycleParameterPrimaryMaster");
      String insertQuery =
          "INSERT OR REPLACE INTO ${LoanCycleParameterPrimaryMaster} "
          "(${TablesColumnFile.mlbrcode} ,"
          "${TablesColumnFile.mprdcd} ,"
          "${TablesColumnFile.mloancycle} ,"
          "${TablesColumnFile.mcusttype} ,"
          "${TablesColumnFile.mgrtype} ,"
          "${TablesColumnFile.meffdate} ,"
          "${TablesColumnFile.mminamount} ,"
          "${TablesColumnFile.mmaxamount} ,"
          "${TablesColumnFile.mminperiod} ,"
          "${TablesColumnFile.mmaxperiod} ,"
          "${TablesColumnFile.mminnoofgrpmems} ,"
          "${TablesColumnFile.mmaxnoofgrpmems} ,"
          "${TablesColumnFile.mgender} ,"
          "${TablesColumnFile.mminage} ,"
          "${TablesColumnFile.mmaxage} ,"
          "${TablesColumnFile.mgrpcycyn} ,"
          "${TablesColumnFile.mlogic} ,"
          "${TablesColumnFile.mtenor} ,"
          "${TablesColumnFile.mfrequency} ,"
          "${TablesColumnFile.mincramount} ,"
          "${TablesColumnFile.mnoofinstlclosure} ,"
          "${TablesColumnFile.mmultiplefactor} ,"
          "${TablesColumnFile.mlastsynsdate}   )"
          "VALUES"
          "(${LoanCycleParameterPrimaryList[i]
          .loanCycleParameterPrimaryComposite.mlbrcode},"
          "'${LoanCycleParameterPrimaryList[i]
          .loanCycleParameterPrimaryComposite.mprdcd}',"
          "${LoanCycleParameterPrimaryList[i].mloancycle},"
          "${LoanCycleParameterPrimaryList[i].mcusttype},"
          "${LoanCycleParameterPrimaryList[i].mgrtype},"
          "'${LoanCycleParameterPrimaryList[i]
          .loanCycleParameterPrimaryComposite.meffdate}',"
          "${LoanCycleParameterPrimaryList[i].mminamount},"
          "${LoanCycleParameterPrimaryList[i].mmaxamount},"
          "${LoanCycleParameterPrimaryList[i].mminperiod},"
          "${LoanCycleParameterPrimaryList[i].mmaxperiod},"
          "${LoanCycleParameterPrimaryList[i].mminnoofgrpmems},"
          "${LoanCycleParameterPrimaryList[i].mmaxnoofgrpmems},"
          "'${LoanCycleParameterPrimaryList[i].mgender}',"
          "${LoanCycleParameterPrimaryList[i].mminage},"
          "${LoanCycleParameterPrimaryList[i].mmaxage},"
          "'${LoanCycleParameterPrimaryList[i].mgrpcycyn}',"
          "${LoanCycleParameterPrimaryList[i].mlogic},"
          "${LoanCycleParameterPrimaryList[i].mtenor},"
          "'${LoanCycleParameterPrimaryList[i].mfrequency}',"
          "${LoanCycleParameterPrimaryList[i].mincramount},"
          "${LoanCycleParameterPrimaryList[i].mnoofinstlclosure},"
          "${LoanCycleParameterPrimaryList[i].mmultiplefactor},"
          "'${LoanCycleParameterPrimaryList[i].mlastsynsdate}');";
      try {
        await db.transaction((Transaction txn) async {
          var id = await txn.rawInsert(insertQuery);
          print(id.toString() +
              " id after insert in ${LoanCycleParameterPrimaryMaster}");
        });
      } catch (_) {
        print("exception here ");
      }
    }
  }

  Future createInterestOffsetInsert() async {
    //deletSomeUtil();
    var interestOffsetServices = new InterestOffsetServices();
    var db = await _getDb();
    List<InterestOffsetBean> InterestOffsetList =
    new List<InterestOffsetBean>();
    await interestOffsetServices.getInterestOffset().then((onValue) {
      print(onValue.length);
      InterestOffsetList = onValue;
    });
    await AppDatabase.get()
        .deletSomeSyncingActivityFromOmni('Interest_Offset_Master');
    for (int i = 0; i < InterestOffsetList.length; i++) {
      print(InterestOffsetList.length.toString() + " InterestOffsetMaster");
      String insertQuery = "INSERT OR REPLACE INTO ${InterestOffsetMaster} "
          "(${TablesColumnFile.mprdcd} ,"
          "${TablesColumnFile.mlbrcode} ,"
          "${TablesColumnFile.mloantype} ,"
          "${TablesColumnFile.mloancycle} ,"
          "${TablesColumnFile.meffdate} ,"
          "${TablesColumnFile.msrno} ,"
          "${TablesColumnFile.mmonths} ,"
          "${TablesColumnFile.mamount} ,"
          "${TablesColumnFile.mintrestrate} ,"
          "${TablesColumnFile.mlastsynsdate}  )"
          "VALUES"
          "('${InterestOffsetList[i].interestOffsetComposite.mprdcd}' ,"
          "${InterestOffsetList[i].interestOffsetComposite.mlbrcode},"
          "${InterestOffsetList[i].interestOffsetComposite.mloantype},"
          "${InterestOffsetList[i].interestOffsetComposite.mloancycle} ,"
          "'${InterestOffsetList[i].interestOffsetComposite.meffdate}',"
          "${InterestOffsetList[i].interestOffsetComposite.msrno},"
          "${InterestOffsetList[i].mmonths},"
          "${InterestOffsetList[i].mamount},"
          "${InterestOffsetList[i].mintrestrate},"
          "'${InterestOffsetList[i].mlastsynsdate}');";
      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() + " id after insert in ${InterestOffsetMaster}");
      });
    }
  }

  Future createSystemParameterInsert() async {
    //deletSomeUtil();
    var systemParameterServices = new SystemParameterServices();
    var db = await _getDb();
    List<SystemParameterBean> SystemParameterList =
    new List<SystemParameterBean>();
    await systemParameterServices.getSystemParameterData().then((onValue) {
      print(onValue.length);
      SystemParameterList = onValue;
    });
    await AppDatabase.get()
        .deletSomeSyncingActivityFromOmni('SystemParameterMaster');

    for (int i = 0; i < SystemParameterList.length; i++) {
      print(SystemParameterList.length.toString() + " SystemParameterMaster");
      String insertQuery = "INSERT OR REPLACE INTO ${SystemParameterMaster} "
          "(${TablesColumnFile.mlbrcode} ,"
          "${TablesColumnFile.mcode} ,"
          "${TablesColumnFile.mcodedesc} ,"
          "${TablesColumnFile.mcodevalue} ,"
          "${TablesColumnFile.mcreateddt})"
          "VALUES"
          "(${SystemParameterList[i].systemParameterCompositeEntity.mlbrcode} ,"
          "'${SystemParameterList[i].systemParameterCompositeEntity.mcode}' ,"
          "'${SystemParameterList[i].mcodedesc} ',"
          "'${SystemParameterList[i].mcodevalue}',"
          "'${SystemParameterList[i].mcreateddt} ');";
      print(insertQuery);
      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() + " id after insert in ${SystemParameterMaster}");
      });
    }
  }

  Future<SystemParameterBean> getSystemParameter(String codeType,
      int lbrCode) async {
    var db = await _getDb();
    SystemParameterBean retBean = new SystemParameterBean();
    var result;

    result = await db.rawQuery("select * FROM ${SystemParameterMaster} where ${TablesColumnFile.mcode} = '$codeType'  AND ${TablesColumnFile.mlbrcode} = $lbrCode ;");

    try { print("result here is "+result.toString());
    if (result[0] != null) {

      retBean = SystemParameterBean.fromMap(result[0]);
    }

    return retBean;
    } catch (_) {
      print("not matched");
    }
    return retBean;
  }

  Future createInterestSlabInsert() async {
    //deletSomeUtil();
    var interestSlabServices = new InterestSlabServices();
    var db = await _getDb();
    List<InterestSlabBean> InterestSlabList = new List<InterestSlabBean>();
    await interestSlabServices.getInterestSlab().then((onValue) {
      print(onValue.length);
      InterestSlabList = onValue;
    });
    await AppDatabase.get()
        .deletSomeSyncingActivityFromOmni('Interest_Slab_Master');
    for (int i = 0; i < InterestSlabList.length; i++) {
      print(InterestSlabList.length.toString() + " InsertSlabMaster");
      String insertQuery = "INSERT OR REPLACE INTO ${InterestSlabMaster} "
          "(${TablesColumnFile.mprdcd} ,"
          "${TablesColumnFile.mcurcd} ,"
          "${TablesColumnFile.minteffdt} ,"
          "${TablesColumnFile.msrno} ,"
          "${TablesColumnFile.mtoamt} ,"
          "${TablesColumnFile.mintrate} ,"
          "${TablesColumnFile.mmonths} ,"
          "${TablesColumnFile.mmlastsynsdate} )"
          "VALUES"
          "('${InterestSlabList[i].intrestSlabComposite.mprdcd != null
          ? InterestSlabList[i].intrestSlabComposite.mprdcd.trim()
          : ""}' ,"
          "'${InterestSlabList[i].intrestSlabComposite.mcurcd}' ,"
          "'${InterestSlabList[i].intrestSlabComposite.minteffdt}' ,"
          "${InterestSlabList[i].intrestSlabComposite.msrno} ,"
          "${InterestSlabList[i].mtoamt},"
          "${InterestSlabList[i].mintrate},"
          "${InterestSlabList[i].mmonths},"
          "'${InterestSlabList[i].mmlastsynsdate}');";
      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() + " id after insert in ${InterestSlabMaster}");
      });
    }
  }

  Future createLookupInsert() async {
    //deletSomeUtil();
    var lookupDataServices = new LookupDataServices();
    var db = await _getDb();
    List<LookupMasterBean> lookupMasterList = new List<LookupMasterBean>();
    await AppDatabase.get().deletSomeSyncingActivityFromOmni('Lookup');
    await lookupDataServices.getLookupData().then((onValue) {
      print(onValue.length);
      lookupMasterList = onValue;
    });

    for (int i = 0; i < lookupMasterList.length; i++) {
      print(lookupMasterList.length.toString() + " lookupMaster");
      print(lookupMasterList[i].mcodedesc.toString() + " mcodedesc");
      print(lookupMasterList[i].lookUpComposite.mcode.toString() + " mcode");
      print(lookupMasterList[i].lookUpComposite.mcodetype.toString() +
          " mcodetype");
      String insertQuery = "INSERT OR REPLACE INTO ${LookupMaster} "
          "(${TablesColumnFile.mcodedesc} ,"
          "${TablesColumnFile.mfield1value} ,"
          "${TablesColumnFile.mcode} ,"
          "${TablesColumnFile.mcodetype} )"
          "VALUES"
          "('${lookupMasterList[i].mcodedesc != null &&
          lookupMasterList[i].mcodedesc != 'null' ? lookupMasterList[i]
          .mcodedesc.trim()
          .replaceAll('\'', "") : ""}' ,"
          "'${lookupMasterList[i].mfield1value != null &&
          lookupMasterList[i].mfield1value != 'null' ? lookupMasterList[i]
          .mfield1value.trim() : ""}' ,"
          "'${lookupMasterList[i].lookUpComposite != null &&
          lookupMasterList[i].lookUpComposite.mcode != null &&
          lookupMasterList[i].lookUpComposite.mcode != 'null'
          ? lookupMasterList[i].lookUpComposite.mcode.trim()
          : ""}' ,"
          "${lookupMasterList[i].lookUpComposite.mcodetype});";

      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() + " id after insert in ${LookupMaster}");
      });
    }
  }

  Future createSubLookupInsert() async {
    var syncingSubLookupDataServices = new SyncingSubLookupDataServices();
    var db = await _getDb();
    List<LookupMasterBean> lookupMasterList = new List<LookupMasterBean>();
    await AppDatabase.get().deletSomeSyncingActivityFromOmni('SubLookup');
    await syncingSubLookupDataServices.getSubLookupData().then((onValue) {
      print(onValue.length);
      lookupMasterList = onValue;
    });

    for (int i = 0; i < lookupMasterList.length; i++) {
      print(lookupMasterList.length.toString() + " SublookupMaster");
      String insertQuery = "INSERT OR REPLACE INTO ${SubLookupMaster} "
          "(${TablesColumnFile.mcodedesc} ,"
          "${TablesColumnFile.mfield1value} ,"
          "${TablesColumnFile.mcode} ,"
          "${TablesColumnFile.mcodetype} )"
          "VALUES"
          "('${lookupMasterList[i].mcodedesc != null &&
          lookupMasterList[i].mcodedesc != 'null' ? lookupMasterList[i]
          .mcodedesc.trim()
          .replaceAll('\'', "") : ""}' ,"
          "'${lookupMasterList[i].mfield1value != null &&
          lookupMasterList[i].mfield1value != null &&
          lookupMasterList[i].mfield1value != 'null' ? lookupMasterList[i]
          .mfield1value : "0"}' ,"
          "'${lookupMasterList[i].lookUpComposite != null &&
          lookupMasterList[i].lookUpComposite.mcode != null &&
          lookupMasterList[i].lookUpComposite.mcode != 'null'
          ? lookupMasterList[i].lookUpComposite.mcode.trim()
          : ""}' ,"
          "${lookupMasterList[i].lookUpComposite.mcodetype});";

      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
        print(id.toString() + " id after insert in ${SubLookupMaster}");
      });
    }
  }

  Future<List<ProductBean>> getProductList(int moduleType,
      int branchCode,int isInd,String mdivtype ) async {
    var db = await _getDb();
    ProductBean retBean = new ProductBean();
    List<ProductBean> n = new List<ProductBean>();

    var result;
    //if(future!=null) {
    print("query is" +
        "SELECT *  FROM $productMaster WHERE ${TablesColumnFile
            .mmoduletype} = $moduleType AND ${TablesColumnFile
            .mlbrcode} = $branchCode");
    result = await db.rawQuery(
        'SELECT *  FROM $productMaster WHERE ${TablesColumnFile
            .mmoduletype} = $moduleType AND ${TablesColumnFile
            .mlbrcode} = $branchCode;');

    if(mdivtype!=""){
      result = await db.rawQuery(
          'SELECT *  FROM $productMaster WHERE ${TablesColumnFile
              .mmoduletype} = $moduleType AND ${TablesColumnFile
              .mlbrcode} = $branchCode AND ${TablesColumnFile
              .mdivisiontype} = "$mdivtype";');

    }

    if(moduleType==30){

        result = await db.rawQuery(
            'SELECT *  FROM $productMaster WHERE ${TablesColumnFile
                .mmoduletype} = $moduleType AND ${TablesColumnFile
                .mlbrcode} = $branchCode;');

    }
    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindProduct(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  ProductBean bindProduct(Map<String, dynamic> result) {
    return ProductBean.fromJson(result);
  }

//fo getting id type which is there in sublookup table (MIS D001107 )
  Future<List<LookupBeanData>> getFromSubLookupDataFromLocalDb(
      int codeType) async {
    var db = await _getDb();
    LookupBeanData retBean = new LookupBeanData();
    List<LookupBeanData> n = new List<LookupBeanData>();
    var result;

    // print("query is" + "SELECT *  FROM $SubLookupMaster ");
    result = await db.rawQuery(
        'select DISTINCT ${TablesColumnFile.mcodedesc},${TablesColumnFile
            .mcodetype},${TablesColumnFile.mcode},${TablesColumnFile
            .mfield1value} from ${SubLookupMaster} where ${TablesColumnFile
            .mcodetype} = $codeType ;');
    try {
      for (int i = 0; i < result.length; i++) {
        /*      print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }*/
        print(result[i].runtimeType);
        retBean = LookupBeanData.fromJson(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  Future<List<SubLookupForSubPurposeOfLoan>>
  getSunPurposeOfLoanListFromSubLookpTable(int hardcodedValue,
      int position) async {
    var db = await _getDb();

    SubLookupForSubPurposeOfLoan retBean = new SubLookupForSubPurposeOfLoan();
    List<SubLookupForSubPurposeOfLoan> n =
    new List<SubLookupForSubPurposeOfLoan>();
    var result;
    // print("SELECT *  FROM $SubLookupMaster where ${TablesColumnFile.mcodetype}  = ${hardcodedValue + position}");

    result = await db.rawQuery(
        'SELECT *  FROM $SubLookupMaster where ${TablesColumnFile
            .mcodetype}  = ${hardcodedValue + position} Order by ${TablesColumnFile
            .mcode} DESC ;');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = bindPurposeOfLoan(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  SubLookupForSubPurposeOfLoan bindPurposeOfLoan(Map<String, dynamic> result) {
    return SubLookupForSubPurposeOfLoan.fromMap(result);
  }

  Future updateProductMaster(ProductBean prodObj) async {
    print("trying to insert or replace ${productMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${productMaster} ("
        "${TablesColumnFile.mlbrcode},"
        "${TablesColumnFile.mprdCd},"
        "${TablesColumnFile.mname},"
        "${TablesColumnFile.mintrate},"
        "${TablesColumnFile.mmoduletype},"
        "${TablesColumnFile.mcurCd},"
        "${TablesColumnFile.mmancolltype},"
        "${TablesColumnFile.mmanguartype},"
        "${TablesColumnFile.mmandoctype},"
        "${TablesColumnFile.mnoofguaranter},"
        "${TablesColumnFile.mdivisiontype},"
        "${TablesColumnFile.mlastsynsdate})"
        "VALUES"
        "(${prodObj.productComposieEntity.mlbrcode},"
        "'${prodObj.productComposieEntity.mprdcd}',"
        "'${prodObj.mname}',"
        "${prodObj.mintrate},"
        "${prodObj.mmoduletype},"
        "'${prodObj.mcurCd}',"
        "'${prodObj.mmancolltype}',"
        "'${prodObj.mmanguartype}',"
        "'${prodObj.mmandoctype}',"
        "${prodObj.mnoofguaranter},"
        "'${prodObj.mdivisiontype}',"
        "'${prodObj.mlastsynsdate}'"
        ");";

    print(insertQuery);

    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      print(id.toString() + " id after insert in ${productMaster}");
    });
  }

  Future<List<SettingsBean>> getApiUrl() async {
    var db = await _getDb();
    SettingsBean retBean = new SettingsBean();
    List<SettingsBean> n = new List<SettingsBean>();
    var result;

    print("query is jasja" + "SELECT *  FROM $settingsMaster ");
    result = await db.rawQuery('select * from ${settingsMaster} ');
      try {
    print("print data settings" + result.toString());
    for (int i = 0; i < result.length; i++) {
      print("appdatabase " + result[i].toString());
      for (var items in result[i].toString().split(",")) {
        print(items);
      }

      print(result[i].runtimeType);
      retBean = SettingsBean.fromJson(result[i]);
      n.add(retBean);
    }
    } catch (e) {
      print(e.toString());
    }

    return n;
  }

  Future<List<LookupBeanData>> getLookupDataFromLocalDb(int codeType) async {
    var db = await _getDb();
    LookupBeanData retBean = new LookupBeanData();
    List<LookupBeanData> n = new List<LookupBeanData>();
    var result;
    result = await db.rawQuery(
        'select DISTINCT ${TablesColumnFile.mcodedesc},${TablesColumnFile
            .mcodetype},${TablesColumnFile.mcode},${TablesColumnFile
            .mfield1value} from lookup_master where ${TablesColumnFile
            .mcodetype} = $codeType ORDER BY ${TablesColumnFile.mcodedesc} ;');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = LookupBeanData.fromJson(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }



  Future deletSomeSyncingActivityFromOmni(String forWhat) async {
    var db = await _getDb();
    String deleteQueryFor = "";
   if (forWhat == 'Lookup') {
      deleteQueryFor = "Delete FROM ${LookupMaster}";
    } else if (forWhat == 'SubLookup') {
      deleteQueryFor = "Delete FROM ${SubLookupMaster}";
    } else if (forWhat == 'Product') {
      deleteQueryFor = "Delete FROM ${productMaster}";
    }  else if (forWhat == 'Loan_Cycle_Parameter_Secondary_Master') {
      deleteQueryFor = "Delete FROM ${LoanCycleParameterSecondaryMaster}";
    } else if (forWhat == 'Loan_Cycle_Parameter_Primary_Master') {
      deleteQueryFor = "Delete FROM ${LoanCycleParameterPrimaryMaster}";
    } else if (forWhat == 'Interest_Offset_Master') {
      deleteQueryFor = "Delete FROM ${InterestOffsetMaster}";
    } else if (forWhat == 'Interest_Slab_Master') {
      deleteQueryFor = "Delete FROM ${InterestSlabMaster}";
    } else if (forWhat == 'SystemParameterMaster') {
      deleteQueryFor = "Delete FROM ${SystemParameterMaster}";
    } else if (forWhat == 'Loan_Approval_limit_Master') {
      deleteQueryFor = "Delete FROM ${loanApprovalLimitMaster}";
    }else if (forWhat == 'Branch_Master') {
      deleteQueryFor = "Delete FROM ${branchMaster}";
    }else if (forWhat == 'Get_Hbs_Users') {
      deleteQueryFor = "Delete FROM ${GETHBSUSERS}";
    }else if (forWhat == 'Country') {
      deleteQueryFor = "Delete FROM ${countryMaster}";
    }else if (forWhat == 'State') {
      deleteQueryFor = "Delete FROM ${stateMaster}";
    }else if (forWhat == 'District') {
      deleteQueryFor = "Delete FROM ${districtMaster}";
    }else if (forWhat == 'SubDistrict') {
      deleteQueryFor = "Delete FROM ${subDistrictMaster}";
    }else if (forWhat == 'Area') {
      deleteQueryFor = "Delete FROM ${areaMaster}";
    }

    await db.transaction((Transaction txn) async {
      await txn.rawDelete(deleteQueryFor);
    });
  }

  Future<double> selectSlabIntRate(String prdCode, String mcurcd,
      double appliedAmout, int mlbrCd, int installment, int loanCycle) async {
    String selectSlabRoiQuery =
        'SELECT   ${TablesColumnFile.mintrate} FROM ${InterestSlabMaster} WHERE '
        '${TablesColumnFile.mprdcd} = "${prdCode}"  AND ${TablesColumnFile.mcurcd} = "${mcurcd}" '
        'AND ${TablesColumnFile.minteffdt} = (SELECT max(${TablesColumnFile.minteffdt}) FROM '
        '${InterestSlabMaster} WHERE ${TablesColumnFile.mprdcd} = "${prdCode}" AND ${TablesColumnFile.mcurcd}'
        ' = "${mcurcd}") AND  ${TablesColumnFile.mmonths} >= $installment AND ${TablesColumnFile.mtoamt} >= $appliedAmout  ORDER BY ${TablesColumnFile.msrno} LIMIT 1';
    print(selectSlabRoiQuery);
    try {
      double salbInt = 0.0;
      var db = await _getDb();
      var result = await db.rawQuery(selectSlabRoiQuery);
      if (result.length > 0 && result[0] != null) {
        salbInt = result[0][TablesColumnFile.mintrate];
      }

      String selectOffsetRoiQuery =
          'SELECT  ${TablesColumnFile.mintrestrate} FROM ${InterestOffsetMaster} WHERE '
          '${TablesColumnFile.mlbrcode} = "${mlbrCd}" AND ${TablesColumnFile.mprdCd} = $prdCode AND '
          '${TablesColumnFile.mloantype} = 1 AND ${TablesColumnFile.mloancycle} = $loanCycle   AND '
          '${TablesColumnFile.meffdate} = (SELECT max(${TablesColumnFile.meffdate}) FROM '
          '${InterestOffsetMaster} WHERE ${TablesColumnFile.mlbrcode} = ${mlbrCd} AND '
          '${TablesColumnFile.mprdcd} = "$prdCode" AND ${TablesColumnFile.mloantype} = 1 AND '
          '${TablesColumnFile.mloancycle} = $loanCycle)   AND ${TablesColumnFile.mmonths} >= $installment AND '
          '${TablesColumnFile.mamount} >= $appliedAmout  ORDER BY ${TablesColumnFile.msrno} LIMIT 1';

      print("selectSlabRoiQuery " + selectSlabRoiQuery.toString());
      print("selectOffsetRoiQuery " + selectOffsetRoiQuery.toString());

      double offsetInt = 0.0;
      result = await db.rawQuery(selectOffsetRoiQuery);
      print("print data " + result.toString());
      if (result.length > 0 && result[0] != null) {
        offsetInt = result[0][TablesColumnFile.mintrestrate];
      } else {
        selectOffsetRoiQuery =
        'SELECT  ${TablesColumnFile.mintrestrate} FROM ${InterestOffsetMaster} WHERE '
            '${TablesColumnFile.mlbrcode} = "${mlbrCd}" AND ${TablesColumnFile.mprdCd} = $prdCode AND '
            '${TablesColumnFile.mloantype} = 1 AND ${TablesColumnFile.mloancycle} = 99   AND '
            '${TablesColumnFile.meffdate} = (SELECT max(${TablesColumnFile.meffdate}) FROM '
            '${InterestOffsetMaster} WHERE ${TablesColumnFile.mlbrcode} = ${mlbrCd} AND '
            '${TablesColumnFile.mprdcd} = "$prdCode" AND ${TablesColumnFile.mloantype} = 1 AND '
            '${TablesColumnFile.mloancycle} = 99)   AND ${TablesColumnFile.mmonths} >= $installment AND '
            '${TablesColumnFile.mamount} >= $appliedAmout  ORDER BY ${TablesColumnFile.msrno} LIMIT 1';

        result = await db.rawQuery(selectOffsetRoiQuery);

        print("selectOffsetRoiQuery99 " + selectOffsetRoiQuery.toString());

        if (result.length > 0 && result[0] != null) {
          offsetInt = result[0][TablesColumnFile.mintrestrate];
        }
      }

      return salbInt + (offsetInt);
    } catch (_) {
      print("exception here ");
    }
  }


  Future<StateDropDownList> getState(stateCd) async {
    var db = await _getDb();
    StateDropDownList bean;
    var str = "${TablesColumnFile.stateCd} = '${stateCd}' ";
    String query = "SELECT * FROM ${stateMaster}  where $str ";

    print("xxxxxxxxxxxxxxquery is here : " + query);
    var result = await db.rawQuery(query);
    try {
      print(result[0].runtimeType);
      bean = bindStateDropDownBean(result[0]);
    } catch (e) {
      print(e.toString());
    }
    return bean;
  }

  StateDropDownList bindStateDropDownBean(Map<String, dynamic> result) {
    return StateDropDownList.fromMap(result);
  }


  Future<DistrictDropDownList> getdist(distCd) async {
    var db = await _getDb();
    DistrictDropDownList bean;
    var str = "${TablesColumnFile.distCd} = '${distCd}' ";
    String query = "SELECT * FROM ${districtMaster}  where $str ";

    print("xxxxxxxxxxxxxxquery is here : " + query);
    var result = await db.rawQuery(query);
    try {
      print(result[0].runtimeType);
      bean = bindDistrictDropDownBean(result[0]);
    } catch (e) {
      print(e.toString());
    }
    return bean;
  }

  DistrictDropDownList bindDistrictDropDownBean(Map<String, dynamic> result) {
    return DistrictDropDownList.fromMap(result);
  }

  Future<List<LoanCycleParameterSecondaryBean>> selectMaxLoanAmtCanApply(
      String prdCode, int loanCycle, int mlbrcd, String mfrequ) async {
    String selectMaxLoanAmtCanApply =
        'SELECT   * FROM ${LoanCycleParameterSecondaryMaster} WHERE '
        '${TablesColumnFile.mlbrcode} = ${mlbrcd}  AND ${TablesColumnFile
        .mloancycle} = ${loanCycle} '
        'AND ${TablesColumnFile.mprdcd} = "${prdCode
        .trim()}" AND ${TablesColumnFile
        .mfrequency} = "${mfrequ}" order by ${TablesColumnFile
        .meffdate} desc limit 2';

    try {
      List<LoanCycleParameterSecondaryBean>
      listLoanCycleParameterSecondaryBean =
      new List<LoanCycleParameterSecondaryBean>();
      var db = await _getDb();
      var result = await db.rawQuery(selectMaxLoanAmtCanApply);
      print("cycle amt " + selectMaxLoanAmtCanApply);

      if (result.length > 0 && result[0] != null) {
        for (int i = 0; i < result.length; i++) {
          var bean = LoanCycleParameterSecondaryBean.fromLocalDb(result[i]);
          listLoanCycleParameterSecondaryBean.add(bean);
        }
      } else {
        selectMaxLoanAmtCanApply =
        'SELECT   * FROM ${LoanCycleParameterSecondaryMaster} WHERE '
            '${TablesColumnFile.mlbrcode} = ${mlbrcd}  AND ${TablesColumnFile
            .mloancycle} = 99 '
            'AND ${TablesColumnFile.mprdcd} = "${prdCode
            .trim()}" AND ${TablesColumnFile
            .mfrequency} = "${mfrequ}" order by ${TablesColumnFile
            .meffdate} desc limit 2';


        result = await db.rawQuery(selectMaxLoanAmtCanApply);


        if (result.length > 0 && result[0] != null) {
          for (int i = 0; i < result.length; i++) {
            var bean = LoanCycleParameterSecondaryBean.fromLocalDb(result[i]);
            listLoanCycleParameterSecondaryBean.add(bean);
          }
        }
      }
      print("cycle amt " + selectMaxLoanAmtCanApply);
      return listLoanCycleParameterSecondaryBean;
    } catch (_) {
      print("exception here ");
    }
  }


  Future<LoginBean> getLoginPass(LoginBean loginBean) async {
    var db = await _getDb();
    var userCode = "${TablesColumnFile.musrcode} = '${loginBean.musrcode}'";
    LoginBean retBean = new LoginBean();

    print('query is here : ' +
        'SELECT * FROM $userMasterTable  WHERE  $userCode');
    var result =
    await db.rawQuery('SELECT * FROM $userMasterTable  WHERE  $userCode');
    try{
      if (result[0] != null) {
        print(result[0]);
        retBean = bindDataLoginBEan(result);
      }
    }catch(_){
      print("Exception Occured");
    }
    return retBean;
  }

  Future updateUserPassword(LoginBean loginBean) async {
    var db = await _getDb();
    String query =
        "Update ${userMasterTable} set ${TablesColumnFile.musrpass} = '${loginBean.musrpass}' "
        " Where  ${TablesColumnFile.musrcode} = '${loginBean.musrcode}' ";

    print("xxxxxxxxxxxxxxquery is here : " + query);
    var result = await db.rawQuery(query);
    print(result);
  }




  Future _createLoanApprovalLimitMasterTable(Database db) {
    String query = "CREATE TABLE ${loanApprovalLimitMaster} ("
        "${TablesColumnFile.mlbrcode} INTEGER,"
        "${TablesColumnFile.mgrpcd} INTEGER,"
        "${TablesColumnFile.musercode} TEXT,"
        "${TablesColumnFile.msrno} INTEGER,"
        "${TablesColumnFile.mprdcd} TEXT,"
        "${TablesColumnFile.mlimitamt} REAL,"
        "${TablesColumnFile.moverduedays} INTEGER,"
        "${TablesColumnFile.mloanacmindrbal} REAL,"
        "${TablesColumnFile.mloanacmincrbal} REAL,"
        "${TablesColumnFile.mwriteoffamat} REAL,"
        "${TablesColumnFile.mcheqlimitamt} REAL,"
        "${TablesColumnFile.mminintrate} REAL,"
        "${TablesColumnFile.mmaxintrate} REAL,"
        "${TablesColumnFile.mremarks} TEXT,"
        "PRIMARY KEY (${TablesColumnFile.mlbrcode},${TablesColumnFile
        .mgrpcd},${TablesColumnFile.musercode},${TablesColumnFile.msrno}))";
    print(query.toString());
    return db.transaction((Transaction txn) {
      txn.execute(query);
    });
  }

  Future createLoanApprovalLimitInsert(int lbrCode, String musercode,
      int mgrpcd) async {
    //deletSomeUtil();
    var loanApprovalLimitService = new LoanApprovalLimitService();
    var db = await _getDb();
    List<LoanApprovalLimitBean> loanApprovalLimitList = new List<
        LoanApprovalLimitBean>();
    await loanApprovalLimitService.getLoanApprovalLimitData(
        lbrCode, musercode, mgrpcd)
        .then((onValue) {
      print(onValue.length);
      loanApprovalLimitList = onValue;
    });
    await AppDatabase.get().deletSomeSyncingActivityFromOmni(
        'Loan_Approval_limit_Master');
    for (int i = 0; i < loanApprovalLimitList.length; i++) {
      String insertQuery =
          "INSERT OR REPLACE INTO ${loanApprovalLimitMaster} "
          "(${TablesColumnFile.mlbrcode} ,"
          "${TablesColumnFile.mgrpcd} ,"
          "${TablesColumnFile.musercode} ,"
          "${TablesColumnFile.msrno} ,"
          "${TablesColumnFile.mprdcd} ,"
          "${TablesColumnFile.mlimitamt} ,"
          "${TablesColumnFile.moverduedays} ,"
          "${TablesColumnFile.mloanacmindrbal} ,"
          "${TablesColumnFile.mloanacmincrbal} ,"
          "${TablesColumnFile.mwriteoffamat} ,"
          "${TablesColumnFile.mcheqlimitamt} ,"
          "${TablesColumnFile.mminintrate} ,"
          "${TablesColumnFile.mmaxintrate} ,"
          "${TablesColumnFile.mremarks}  )"
          "VALUES"
          "(${loanApprovalLimitList[i].loanApprovalLimitComposite.mlbrcode},"
          "${loanApprovalLimitList[i].loanApprovalLimitComposite.mgrpcd},"
          "'${loanApprovalLimitList[i].loanApprovalLimitComposite.musercode}',"
          "${loanApprovalLimitList[i].loanApprovalLimitComposite.msrno},"
          "'${loanApprovalLimitList[i].mprdcd}',"
          "${loanApprovalLimitList[i].mlimitamt},"
          "${loanApprovalLimitList[i].moverduedays},"
          "${loanApprovalLimitList[i].mloanacmindrbal},"
          "${loanApprovalLimitList[i].mloanacmincrbal},"
          "${loanApprovalLimitList[i].mwriteoffamat},"
          "${loanApprovalLimitList[i].mcheqlimitamt},"
          "${loanApprovalLimitList[i].mminintrate},"
          "${loanApprovalLimitList[i].mmaxintrate},"
          "'${loanApprovalLimitList[i].mremarks}');";

      print("insert query is" + insertQuery);
      await db.transaction((Transaction txn) async {
        var id = await txn.rawInsert(insertQuery);
      });
    }
  }


  Future<double> getLoanApprovalLimit(String mprdcd, String musercode) async {
    var db = await _getDb();
    LoanApprovalLimitBean loanApprovalLimitBean;
    try {
      String query = 'SELECT * FROM ${loanApprovalLimitMaster}  WHERE ${TablesColumnFile
          .mprdcd}  = "${mprdcd.trim()}"  AND ${TablesColumnFile
          .musercode}  = "${musercode.trim()}" ;';
      print(query);
      var result = await db.rawQuery(query);

      if (result.isNotEmpty)
        loanApprovalLimitBean = bindDataLoanApprovalLimitBean(result[0]);
      else {
        String query = 'SELECT * FROM ${loanApprovalLimitMaster}  WHERE ${TablesColumnFile
            .mprdcd}  = "${mprdcd.trim()}"  ;';
        print(query);
        var result = await db.rawQuery(query);
        loanApprovalLimitBean = bindDataLoanApprovalLimitBean(result[0]);
      }
    }
    catch (error, stackTrace) {
      print(error.toString());
      print(stackTrace);
    }
    if (loanApprovalLimitBean != null &&
        loanApprovalLimitBean.mlimitamt != null) {
      return loanApprovalLimitBean.mlimitamt;
    } else {
      return 0.0;
    }
  }

  LoanApprovalLimitBean bindDataLoanApprovalLimitBean(
      Map<String, dynamic> result) {
    return LoanApprovalLimitBean.fromLocalDb(result);
  }


  Future<LookupBeanData> getLookupDataPurposeOfLoanFromLocalDb(int codeType,
      String code) async {
    var db = await _getDb();
    LookupBeanData retBean = new LookupBeanData();
    List<LookupBeanData> n = new List<LookupBeanData>();
    var result;

    print("query is" + "SELECT *  FROM $LookupMaster ");
    result = await db.rawQuery(
        'select DISTINCT ${TablesColumnFile.mcodedesc},${TablesColumnFile
            .mcodetype},${TablesColumnFile.mcode},${TablesColumnFile
            .mfield1value} from lookup_master where ${TablesColumnFile
            .mcodetype} = $codeType  AND ${TablesColumnFile
            .mcode} = "$code" ORDER BY ${TablesColumnFile.mcodedesc} ;');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = LookupBeanData.fromJson(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future<CountryDropDownBean> getCountryNameViaCountryCode(
      String cntryCd) async {
    var db = await _getDb();
    CountryDropDownBean retBean = new CountryDropDownBean();
    List<CountryDropDownBean> n = new List<CountryDropDownBean>();
    var result;

    print("query is" + "SELECT *  FROM $countryMaster ");
    result = await db.rawQuery(
        'select  ${TablesColumnFile
            .countryName} from Country_Master where ${TablesColumnFile
            .cntryCd} = "$cntryCd";');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = CountryDropDownBean.fromMap(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }


  Future<StateDropDownList> getStateNameViaStateCode(String stateCd) async {
    var db = await _getDb();
    StateDropDownList retBean = new StateDropDownList();
    List<StateDropDownList> n = new List<StateDropDownList>();
    var result;

    print("query is" + "SELECT *  FROM $stateMaster ");
    result = await db.rawQuery(
        'select  ${TablesColumnFile
            .stateDesc} from State_Master where ${TablesColumnFile
            .stateCd} = "$stateCd";');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = StateDropDownList.fromMap(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future<DistrictDropDownList> getDistrictNameViaDistrictCode(
      String distCd) async {
    var db = await _getDb();
    DistrictDropDownList retBean = new DistrictDropDownList();
    List<DistrictDropDownList> n = new List<DistrictDropDownList>();
    var result;

    print("query is" + "SELECT *  FROM $districtMaster ");
    result = await db.rawQuery(
        'select  ${TablesColumnFile
            .distDesc} from District_Master where ${TablesColumnFile
            .distCd} = "$distCd";');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = DistrictDropDownList.fromMap(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future<SubDistrictDropDownList> getPlaceNameViaPlaceCode(
      String placeCd) async {
    var db = await _getDb();
    SubDistrictDropDownList retBean = new SubDistrictDropDownList();
    List<SubDistrictDropDownList> n = new List<SubDistrictDropDownList>();
    var result;

    print("query is" + "SELECT *  FROM $subDistrictMaster ");
    result = await db.rawQuery(
        'select  ${TablesColumnFile
            .placeCdDesc} from SubDistrict_Master where ${TablesColumnFile
            .placeCd} = "$placeCd";');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = SubDistrictDropDownList.fromMap(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future<AreaDropDownList> getAreaNameViaAreaCode(String areaCd) async {
    var db = await _getDb();
    AreaDropDownList retBean = new AreaDropDownList();
    List<AreaDropDownList> n = new List<AreaDropDownList>();
    var result;

    print("query is" + "SELECT *  FROM $areaMaster ");
    result = await db.rawQuery(
        'select  ${TablesColumnFile
            .areaDesc} from Area_Master where ${TablesColumnFile
            .areaCd} = "$areaCd";');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = AreaDropDownList.fromMap(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future<ProductBean> getProductOnPrdCd(int moduleType, int branchCode,
      String mprdcd) async {
    var db = await _getDb();
    ProductBean retBean = new ProductBean();


    var result;

    result = await db.rawQuery(
        "SELECT *  FROM $productMaster WHERE ${TablesColumnFile
            .mmoduletype} = $moduleType AND ${TablesColumnFile
            .mlbrcode} = $branchCode AND ${TablesColumnFile
            .mprdcd} = '${mprdcd}' ;");
    print("SELECT *  FROM $productMaster WHERE ${TablesColumnFile
        .mmoduletype} = $moduleType AND ${TablesColumnFile
        .mlbrcode} = $branchCode AND ${TablesColumnFile
        .mprdcd} = '${mprdcd}' ;");
    try {
      print("result result "+result.toString());
      for (int i = 0; i < result.length; i++) {
        retBean = bindProduct(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }

  Future updateBranchMaster(BranchMasterBean brnchObj) async {
    print("trying to insert or replace ${branchMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${branchMaster} ("
        "${TablesColumnFile.mpbrcode}  ,"
        "${TablesColumnFile.mname} ,"
        "${TablesColumnFile.mshortname} ,"
        "${TablesColumnFile.madd1} ,"
        "${TablesColumnFile.madd2} ,"
        "${TablesColumnFile.madd3} ,"
        "${TablesColumnFile.mcitycd} ,"
        "${TablesColumnFile.mpincode} ,"
        "${TablesColumnFile.mcountrycd} ,"
        "${TablesColumnFile.mbranchtype} ,"
        "${TablesColumnFile.mtele1} ,"
        "${TablesColumnFile.mtele2} ,"
        "${TablesColumnFile.mfaxno1} ,"
        "${TablesColumnFile.mswiftaddr} ,"
        "${TablesColumnFile.mpostcode} ,"
        "${TablesColumnFile.mweekoff1} ,"
        "${TablesColumnFile.mweekoff2} ,"
        "${TablesColumnFile.mparentbrcode} ,"
        "${TablesColumnFile.mbranchtype1} ,"
        "${TablesColumnFile.mbranchcat} ,"
        "${TablesColumnFile.mformatndt} ,"
        "${TablesColumnFile.mdistrict} ,"
        "${TablesColumnFile.mbrnmanager} ,"
        "${TablesColumnFile.mstate} ,"
        "${TablesColumnFile.mmingroupmembers} ,"
        "${TablesColumnFile.mmaxgroupmembers} ,"
        "${TablesColumnFile.msector} ,"
        "${TablesColumnFile.mbranchemailid} ,"
        "${TablesColumnFile.mbiccode} ,"
        "${TablesColumnFile.mlegacybrncd} ,"
        "${TablesColumnFile.mlatitude} ,"
        "${TablesColumnFile.mlongitude} ,"
        "${TablesColumnFile.mlastopendate}  )"
        "VALUES"
        "(${brnchObj.mpbrcode},"
        "'${brnchObj.mname}',"
        "'${brnchObj.mshortname}',"
        "'${brnchObj.madd1}',"
        "'${brnchObj.madd2}',"
        "'${brnchObj.madd3}',"
        "'${brnchObj.mcitycd}',"
        "${brnchObj.mpincode},"
        "'${brnchObj.mcountrycd}',"
        "${brnchObj.mbranchtype},"
        "'${brnchObj.mtele1}',"
        "'${brnchObj.mtele2}',"
        "'${brnchObj.mfaxno1}',"
        "'${brnchObj.mswiftaddr}',"
        "'${brnchObj.mpostcode}',"
        "${brnchObj.mweekoff1},"
        "${brnchObj.mweekoff2},"
        "${brnchObj.mparentbrcode},"
        "${brnchObj.mbranchtype1},"
        "${brnchObj.mbranchcat},"
        "'${brnchObj.mformatndt}',"
        "'${brnchObj.mdistrict}',"
        "'${brnchObj.mbrnmanager}',"
        "'${brnchObj.mstate}',"
        "${brnchObj.mmaxgroupmembers},"
        "${brnchObj.mmingroupmembers},"
        "${brnchObj.msector},"
        "'${brnchObj.mbranchemailid}',"
        "'${brnchObj.mbiccode}',"
        "'${brnchObj.mlegacybrncd}',"
        "${brnchObj.mlatitude},"
        "${brnchObj.mlongitude},"
        "'${brnchObj.mlastopendate}'"
        ");";

    print(insertQuery);

    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      print(id.toString() + " id after insert in ${productMaster}");
    });
  }


  Future<BranchMasterBean> getBranchNameOnPbrCd(int branchCd) async {
    var db = await _getDb();
    BranchMasterBean retBean = new BranchMasterBean();
    var result;

    result = await db.rawQuery(
        "SELECT *  FROM $branchMaster WHERE ${TablesColumnFile
            .mpbrcode} = $branchCd ;");
    print("SELECT *  FROM $branchMaster WHERE ${TablesColumnFile
        .mpbrcode} = $branchCd ;" + result.toString() + result.length.toString() );
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = bindBranch(result[i]);
      }
    } catch (e) {
      print(e.toString());
    }
    return retBean;
  }



  BranchMasterBean bindBranch(Map<String, dynamic> result) {
    return BranchMasterBean.fromMiddleware(result);
  }

  Future<List<AreaDropDownList>> getAreaList() async {
    var db = await _getDb();
    AreaDropDownList retBean = new AreaDropDownList();
    List<AreaDropDownList> n = new List<AreaDropDownList>();
    var result;

    print(
        "query is" + "SELECT *  FROM $areaMaster where placeCd = '${globals.placeCd}' ");
    result = await db
        .rawQuery("SELECT *  FROM $areaMaster where placeCd = '${globals.placeCd}';");

    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindAreaDropDownBean(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  AreaDropDownList bindAreaDropDownBean(Map<String, dynamic> result) {
    return AreaDropDownList.fromMap(result);
  }

  Future<List<CountryDropDownBean>> getCountryList() async {
    var db = await _getDb();
    CountryDropDownBean retBean = new CountryDropDownBean();
    List<CountryDropDownBean> n = new List<CountryDropDownBean>();
    var result;
    print("query is" + "SELECT *  FROM $countryMaster ");
    result = await db.rawQuery('SELECT *  FROM $countryMaster ;');
    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindCountryDropDownBean(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  CountryDropDownBean bindCountryDropDownBean(Map<String, dynamic> result) {
    return CountryDropDownBean.fromMap(result);
  }

  Future<List<DistrictDropDownList>> getDistrictList() async {
    var db = await _getDb();
    DistrictDropDownList retBean = new DistrictDropDownList();
    List<DistrictDropDownList> n = new List<DistrictDropDownList>();
    var result;
    print("query is" + "SELECT *  FROM $districtMaster ");
    result = await db
        .rawQuery("SELECT *  FROM $districtMaster where stateCd = '${globals.stateCd}';");
    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindDistrictDropDownBean(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }


  Future<List<StateDropDownList>> getStateList() async {
    var db = await _getDb();
    StateDropDownList retBean = new StateDropDownList();
    List<StateDropDownList> n = new List<StateDropDownList>();
    var result;
    print("query is" + "SELECT *  FROM $stateMaster ");
    result = await db
        .rawQuery("SELECT *  FROM $stateMaster where countryId = '${globals.cntryCd}';");
    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindStateDropDownBean(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }



  Future<List<SubDistrictDropDownList>> getSubDistrictList() async {
    var db = await _getDb();
    SubDistrictDropDownList retBean = new SubDistrictDropDownList();
    List<SubDistrictDropDownList> n = new List<SubDistrictDropDownList>();
    var result;
    print("query is" + "SELECT *  FROM $subDistrictMaster ");
    result = await db.rawQuery(
        "SELECT *  FROM $subDistrictMaster where distCd = ${globals.distCd};");
    try {
      for (int i = 0; i < result.length; i++) {
        print(result[i]);
        for (var items in result[i].toString().split(",")) {
          print(items);
        }
        print(result[i].runtimeType);
        retBean = bindSubDistrictDropDownBean(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  SubDistrictDropDownList bindSubDistrictDropDownBean(
      Map<String, dynamic> result) {
    return SubDistrictDropDownList.fromMap(result);
  }

  Future updateSettingsMaster(SettingsBean settingbean) async {
    print("trying to insert or replace ${settingsMaster}");
    String insertQuery = "INSERT OR REPLACE INTO ${settingsMaster}( "
        "${TablesColumnFile.trefno},"
        "${TablesColumnFile.musrcode},"
        "${TablesColumnFile.musrpass} ,"
        "${TablesColumnFile.mipaddress} ,"
        "${TablesColumnFile.mportno} ,"
        "${TablesColumnFile.isHttps} ,"
        "${TablesColumnFile.isPortRequired} ,"
        "${TablesColumnFile.yesno})"
        "VALUES("
        "${settingbean.trefno},"
        "'${settingbean.musrcode}',"
        "'${settingbean.musrpass}' ,"
        "'${settingbean.mipaddress}' ,"
        "'${settingbean.mportno}' ,"
        "${settingbean.isHttps},"
        "${settingbean.isPortRequired},"
        "${0});";
    print("insert query is sasasasasasas" + insertQuery);
    var db = await _getDb();
    await db.transaction((Transaction txn) async {
      int id = await txn.rawInsert(insertQuery);
      print(id.toString() + " id after insert in ${settingsMaster}");
    });
  }

  Future  deleCollateral(String query) async{
    var db = await _getDb();
    print("query"+query);
    await db.transaction((Transaction txn) async {
      await txn
          .rawDelete("Delete FROM ${query}");
    });


  }


  Future deleteQuery(List<String> rawQuery) async {
    var db = await _getDb();
    for (String query in rawQuery) {
      try {
        await db.transaction((Transaction txn) async {
          await txn.rawDelete(query);
        });
      } catch (_) {}
    }
  }

  Future<List<HbsUserBean>> getHbsUsers() async {
    var db = await _getDb();

    HbsUserBean retBean = new HbsUserBean();
    List<HbsUserBean> n =
    new List<HbsUserBean>();
    var result;
    // print("SELECT *  FROM $SubLookupMaster where ${TablesColumnFile.mcodetype}  = ${hardcodedValue + position}");

    result = await db.rawQuery(
        'SELECT *  FROM $GETHBSUSERS ;');
    try {
      for (int i = 0; i < result.length; i++) {
        retBean = bindHbsUser(result[i]);
        n.add(retBean);
      }
    } catch (e) {
      print(e.toString());
    }
    return n;
  }

  HbsUserBean bindHbsUser(result) {
    return HbsUserBean.fromMap(result);
  }

}

