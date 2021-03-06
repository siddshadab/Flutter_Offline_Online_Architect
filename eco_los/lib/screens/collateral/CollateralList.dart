import 'dart:async';
import 'dart:convert';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/LoanApplication/bean/DeleteTableBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/collateral/AddCollaterals.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/collateral/collateralT24/bean/CollateralT24Bean.dart';
import 'package:eco_los/screens/collateral/collateralT24/collateralT24Screens/CollateralT24Master.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForSubOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralREM/CollateralsREMMaster.dart';
import 'package:eco_los/screens/collateral/collateralREM/bean/CollateralREMlandandhouseBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/address/FullScreenDialogForAreaSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForCountrySelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForDistrictSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForStateSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForSubDistrictSelection.dart';
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class CollateralList extends StatefulWidget {

  final String LOANUUID;
  final String CUSTUUID;
  final bool isEditAllowed;
  final String mprdCd;

  CollateralList(this.LOANUUID,this.CUSTUUID, this.isEditAllowed,this.mprdCd);

  @override
  _CollateralList createState() => new _CollateralList();
}

class _CollateralList extends State<CollateralList> {
  CollateralBasicSelectionBean gauDetObj = new CollateralBasicSelectionBean();
  List<CollateralBasicSelectionBean> items = new List<CollateralBasicSelectionBean>();
  List<CollateralBasicSelectionBean> storedItems =
  new List<CollateralBasicSelectionBean>();
  Widget appBarTitle = new Text("Collateral Details");
  List<bool> questionCheck;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrCode;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String branch = "";
  CustomerListBean customerListBean;
  int count=1;

  Icon actionIcon = new Icon(Icons.search);

  @override
  void initState() {

    if(widget.LOANUUID!=null) {
      if (widget.LOANUUID != null) {
        gauDetObj.LOANUUID = widget.LOANUUID;
      }
    }

    items.clear();
    super.initState();
    getSessionVariables();
  }

  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString(TablesColumnFile.usrCode);
      usrCode = prefs.getString(TablesColumnFile.usrCode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      branch = prefs.get(TablesColumnFile.musrbrcode).toString();
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation = prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
    });
  }

  getHomePageBody(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      );
    }
  }

  Widget _getItemUI(BuildContext context, int index) {
    double c_width = MediaQuery.of(context).size.width * 10;
    int mcustNoInt = 0;
    int mprcdAcctIdInt = 0;
    String mprdcd = "";
    String custNo = "";
    String prcdAcctId = "";

    print("inside get item ui");




    if (custNo == null || custNo == 'null' || custNo.trim() == "") {
      //  print("items[index].mprdcd " + items[index].mprdcd.toString());
      custNo = items[index].mcustno.toString();
    }
    try {
      if (custNo != null && custNo != 'null') {
        mcustNoInt = int.parse(custNo);
      }
      if (prcdAcctId != null && prcdAcctId != 'null') {
        mprcdAcctIdInt = int.parse(prcdAcctId);
      }
    } catch (_) {
      //    print("Exception Here in catch future builder");
    }
    return new GestureDetector(
      onTap: () {
        _onTapItem(items[index],widget.LOANUUID,widget.CUSTUUID);
      },
      child: new Card(
        //color Color(0xff2f1f4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 25.0,
        child: new Padding(
          padding: new EdgeInsets.only(
            left: 3.0,
            right: 3.0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 3.0),

                // width: c_width,
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          ThemeDesign.loginGradientEnd,
                          ThemeDesign.loginGradientStart,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  //color: color,
                  child: Column(
                    children: <Widget>[
                      new Text(
                        " ${items[index].collatrlTyp=="33" ? "Vehicle" : items[index].collatrlTyp=="34" ?
                        "Land and property" : items[index].collatrlTyp=="45" ?
                        "Collateral T24": "Plant and Machinary"}",
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      new Container(
                          padding: EdgeInsets.only(left: 5.0),
                          //color: Colors.green,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "UUID  :   " +
                                    items[index].UUID.toString() +
                                    "   ",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.white),
                              ),
                              Padding(
                                padding: new EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    new Text(
                                      mcustNoInt.toString() +
                                          "/" +
                                          mprdcd.toString() +
                                          "/" +
                                          mprcdAcctIdInt.toString(),
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          )),
                      new Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                  padding: new EdgeInsets.only(
                                      left: 1.0, right: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                    ],
                                  )
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              new Container (
                child: new Row (
                  children: [
                    new Expanded(
                      child: new Text (items[index].merrormessage!=null&&items[index].merrormessage.toString()!=""&&items[index].merrormessage.toString()!="null"?items[index].merrormessage.toString():'',
                        style: TextStyle(
                            fontSize: 12.0, color: Colors.red[500]),
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration (
                ),
                width: 400.0,
              ),
              new Container(
                width: c_width,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8.0,
                            ),
                            new Padding(
                              padding: new EdgeInsets.only(
                                top: 1.0,
                                bottom: 1.0,
                              ),
                              child: new Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: <Widget>[

                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  new OutlineButton(
                                      borderSide:
                                      BorderSide(color: Colors.cyan[50]),
                                      child: Text("Edit/View Type data"),
                                      textColor: Colors.blue,
                                      onPressed: () async{

                                        _AddCollateraBasedOnTyp(
                                            items[index]);


                                      },
                                      shape: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      )),
                                  new OutlineButton(
                                      borderSide: BorderSide(color: Colors.cyan[50]),
                                      onPressed: () {},
                                      child: new IconButton(
                                        icon: new Icon(Icons.delete_forever, color: Colors.red),
                                        onPressed: ((){
                                          callDialog(items[index]);

                                          /* await deleteCollateralDetails(items[index]).then((onValue){
                                            Navigator.of(context).pop();
                                          });*/

                                        }),
                                      ),
                                      shape: new OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      )),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var loanDetailsBuilder;

    if ((count == 1 || count == 2) ) {
      count++;
      loanDetailsBuilder = new FutureBuilder(
          future: AppdatabaseV2.get()
              .selectCollList()
              .then((List<CollateralBasicSelectionBean> beanList) async{
            items.clear();
            storedItems.clear();
            beanList.forEach((f) async{
              items.add(f);
              storedItems.add(f);
            });
            return storedItems;
          }),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Center(child:new Text('Please wait while list gets load'));
              case ConnectionState.waiting:
                return new Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16.0),
                    child:
                    new CircularProgressIndicator()); // new Text('Awaiting result...');
              default:
                if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return new Center(
                    child: new Text("Nothing to display on your filter"),
                  );
                }      else {
                  return getHomePageBody(context, snapshot);
                }
            }
          });
    } else if (storedItems != null) {
      loanDetailsBuilder = ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      );
    }


    return new Scaffold(
      key: _scaffoldHomeState,
      appBar: new AppBar(
        elevation: 3.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff07426A),
        brightness: Brightness.light,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = new Icon(Icons.close);
                  this.appBarTitle = new TextField(
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)),
                    onChanged: (val) {
                      filterList(val.toLowerCase());
                    },
                  );
                }
                else {
                  String svngListLeng = storedItems != null &&
                      storedItems.length != null &&
                      storedItems.length > 0
                      ? "/" + storedItems.length.toString()
                      : "";
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle =
                  new Text("Savings List" + svngListLeng);
                  items = new List<CollateralBasicSelectionBean>();
                  items.clear();
                  storedItems.forEach((val) {
                    items.add(val);
                  });
                }
              });
            },
          ),
          new IconButton(
            icon: new Icon(Icons.cloud_download, color: Colors.white),
            onPressed: () async{
             // await _fetchData(widget.mleadsId, widget.mrefno, widget.trefno,  widget.mcardmrefno,widget.mcardtrefno,widget.mcustmrefno,widget.mcusttrefno);
            },          ),
        ],
      ),
      floatingActionButton:widget.isEditAllowed?new FloatingActionButton(
          child: new Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            _addNewCollateral();
          }):new Container(),
      body: loanDetailsBuilder,
    );
  }
  void _addNewCollateral() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new AddCollaterals(
              LOANUUID:widget.LOANUUID,
              CUSTUUID:widget.CUSTUUID,
            isEditAllowed: widget.isEditAllowed,

          )), //When Authorized Navigate to the next screen
    );
  }

  void _onTapItem(CollateralBasicSelectionBean item,String LOANUUID,String CUSTUUID) {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
            new AddCollaterals(
              LOANUUID: LOANUUID,
              CUSTUUID: CUSTUUID,
              collateralsDetailsPassedObject:item ,
              isEditAllowed: widget.isEditAllowed,
            )), //When Authorized Navigate to the next screen
      );

  }

  void filterList(String val) async {
    items.clear();

    storedItems.forEach((obj) {
      if (obj.mfname.toString().contains(val) ||
          obj.colltrltitle.toString().contains(val) ||
          obj.collatrlTyp.toString().contains(val) ||
          obj.mcustno.toString().contains(
              val) ) {

        items.add(obj);

      }
      if (val.toUpperCase() == "FRIEND") {
        if (obj.mrelationwithcust == "1") {
          items.add(obj);
          //   print(items);
        }
      }
      else if (val.toUpperCase() == "FATHER") {
        if (obj.mrelationwithcust == "2") {
          items.add(obj);
          //   print(items);
        }
      }
      else  if (val.toUpperCase() == "SISTER") {
        if (obj.mrelationwithcust == "3") {
          items.add(obj);
          //   print(items);
        }
      }
      else  if (val.toUpperCase() == "SELF") {
        if (obj.mrelationwithcust =="4" ) {
          items.add(obj);
          //  print(items);
        }
      }
      else  if (val.toUpperCase() == "SPOUSE") {
        if (obj.mrelationwithcust == "5") {
          items.add(obj);
          //  print(items);
        }
      }
      else  if (val.toUpperCase() == "MOTHER") {
        if (obj.mrelationwithcust == "6") {
          items.add(obj);
          //  print(items);
        }
      }
      else  if (val.toUpperCase() == "FATHER") {
        if (obj.mrelationwithcust == "7") {
          items.add(obj);
          //  print(items);
        }
      }
      else  if (val.toUpperCase() == "DAUGHTER") {
        if (obj.mrelationwithcust == "8") {
          items.add(obj);
          //  print(items);
        }
      }
      else  {
        if (obj.mrelationwithcust == "9") {
          items.add(obj);
          //   print(items);
        }
      }
    });

    setState(() {
      count = 4;
    });
  }

  Future<Null> _AddCollateraBasedOnTyp(CollateralBasicSelectionBean collateralBasicSelectionBean) async{
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
          new AddCollaterals(
            LOANUUID: collateralBasicSelectionBean.LOANUUID,
            CUSTUUID: collateralBasicSelectionBean.CUSTUUID,
            collateralsDetailsPassedObject:collateralBasicSelectionBean ,
            isEditAllowed: widget.isEditAllowed,
          )), //When Authorized Navigate to the next screen
    );

  }

  Future deleteCollateralDetails(CollateralBasicSelectionBean item) async{
  //TODO ask Palak what logic we have implemented on previous design
  }

  Future<bool> callDialog(CollateralBasicSelectionBean BEAN) {
    onPop(
        context,
        'Are you sure?',
        'Do you want to Go Delete this record',BEAN);
  }
  Future<bool> onPop(BuildContext context, String agrs1, String args2,CollateralBasicSelectionBean bean) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(agrs1),
        content: new Text(args2),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: ()async {

              await deleteCollateralDetails(bean).then((onValue){
                Navigator.of(context).pop();
                Navigator.of(context).pop();

              });
            },
            child: new Text('Yes'),
          ),
        ],
      ),) ??
        false;
  }

  _fetchData(String mleadsId, int mrefno, int trefno, int mcardmrefno, int mcardtrefno, int mcustmrefno, int mcusttrefno) {
    print("dekho isee");
    print(mleadsId);
    print(mcustmrefno);
    print(mcusttrefno);
    print(mrefno);
    print(trefno);
    /*Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new ExistingCollateralList(mleadsId, mrefno,
              trefno,mcardmrefno,mcardtrefno, "datafetching", mcusttrefno,mcustmrefno)), //When Authorized Navigate to the next screen
    );*/
  }

}





