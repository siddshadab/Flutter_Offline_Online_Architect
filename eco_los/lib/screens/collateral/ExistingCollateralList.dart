import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
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

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';

import 'package:shared_preferences/shared_preferences.dart';



class ExistingCollateralList extends StatefulWidget {

  final String LOANUUID;
  final String CUSTUUID;
  final String routeType;
  final int isEditAllowed;
  final int mprdCd;

  ExistingCollateralList(this.LOANUUID,this.CUSTUUID,this.routeType, this.isEditAllowed,this.mprdCd);

  @override
  _ExistingCollateralList createState() => new _ExistingCollateralList();
}

class _ExistingCollateralList extends State<ExistingCollateralList> {
  CollateralBasicSelectionBean collDetobj = new CollateralBasicSelectionBean();
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
        collDetobj.LOANUUID = widget.LOANUUID;
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


    print("inside get item ui");






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

                              new Text(

                                " ${items[index].mcollstatus=="2" ? "Deposited" : items[index].mcollstatus=="3" ?
                                "Pending" : ""}",
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),

                            /*  Padding(
                                padding: new EdgeInsets.only(
                                    left: 30.0, right: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      items[index].mrelationwithcust == "1"
                                          ? "Friend"
                                          : items[index].mrelationwithcust.trim() =="2"
                                          ? "Brother"
                                          : items[index].mrelationwithcust =="3"
                                          ? "Sister"
                                          : items[index].mrelationwithcust == "4"
                                          ? "Self"
                                          : items[index].mrelationwithcust == "5"
                                          ? "Spouse"
                                          : items[index].mrelationwithcust == "6"
                                          ? "Mother"
                                          : items[index].mrelationwithcust == "7"
                                          ? "Father"
                                          : items[index].mrelationwithcust == "8"
                                          ? "Daughter"
                                          : "Son",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellowAccent),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          )),
                      new Container(
                          padding: EdgeInsets.only(left: 5.0),
                          //color: Colors.green,
                          child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[

                              Padding(
                                  padding: new EdgeInsets.only(
                                      left: 1.0, right: 10.0),
                                  child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceAround,

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
                  // backgroundColor: Colors.grey[300],
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
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                    children: <Widget>[

                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      new Container(
                                                          padding: EdgeInsets.only(left: 5.0),
                                                          //color: Colors.green,
                                                          child: Row(
                                                            children: <Widget>[
                                                              Text(
                                                                "Collateral Cat  :   " +
                                                                    items[index].msubocolltrlcatdesc.toString() +
                                                                    "   ",
                                                                style: TextStyle(
                                                                    fontSize: 12.0, color: Colors.black87),
                                                              ),

                                                              Text(
                                                                "Sub Type  :   " +
                                                                    items[index].msubocolltrldesc.toString() +
                                                                    "   ",
                                                                style: TextStyle(
                                                                    fontSize: 12.0, color: Colors.black87),
                                                              ),


                                                            ],
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
                                  new Container(
                                      padding: EdgeInsets.only(left: 5.0),
                                      //color: Colors.green,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "Book No  :   " +
                                                items[index].mcollbookno.toString() +
                                                "   ",
                                            style: TextStyle(
                                                fontSize: 12.0, color: Colors.black87),
                                          ),
                                        /*  Text(
                                            "Collateral title  :   " +
                                                items[index].colltrltitledesc.toString() +
                                                "   ",
                                            style: TextStyle(
                                                fontSize: 12.0, color: Colors.black87),
                                          ),*/


                                        ],
                                      )),
                           /*       new OutlineButton(
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
                                      )),*/

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

    if ((count == 1 || count == 2) && widget.routeType=="datafetching") {
      count++;
      loanDetailsBuilder = new FutureBuilder(

          future:/*getExistingCollateralFromMiddleware.tryFind(widget.mcustmrefno,widget.mcusttrefno).then((
          List<CollateralBasicSelectionBean> collList) async {
            items.clear();
            storedItems.clear();
            collList.forEach((f) async{
              items.add(f);
              storedItems.add(f);

            });
            setState(() {});

            return items;

          }).then((onValue){setState(() {

          });}),*/null,


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
    }else   if ((count == 1 || count == 2) && widget.routeType=="cc") {
      count++;
      loanDetailsBuilder = new FutureBuilder(

          future: /*AppDatabase.get().getCCCollatrlDetailsList(widget.mcardtrefno,widget.mcardmrefno).then(
                  (List<CollateralBasicSelectionBean> gaurantorData){
                items.clear();
                storedItems.clear();
                gaurantorData.forEach((f){
                  print(f);
                  items.add(f);
                  storedItems.add(f);
                });
                return items;
              }),*/null,



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
    }
    else   if ((count == 1 || count == 2) && widget.routeType=="") {
      count++;
      loanDetailsBuilder = new FutureBuilder(

          future: /*AppDatabase.get().getCollatrlDetailsList(widget.trefno,widget.mrefno).then(
                  (List<CollateralBasicSelectionBean> gaurantorData){
                items.clear();
                storedItems.clear();
                gaurantorData.forEach((f){
                  print(f);
                  items.add(f);
                  storedItems.add(f);
                });
                return items;
              }),*/null,


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
      print("hdfvdskgfvdsfhfvdsiugdsffdgxbvlobcgfkds");
      loanDetailsBuilder = ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) {
            double c_width = MediaQuery.of(context).size.width * 10;
            int mcustNoInt = 0;
            int mprcdAcctIdInt = 0;
            String mprdcd = "";





            return new GestureDetector(

              onTap: () {
                  _onTapItem(items[position],widget.LOANUUID,widget.CUSTUUID);

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
                                " ${items[position].collatrlTyp=="33" ? "Vehicle" : items[position].collatrlTyp=="34" ?
                                "Land and property" : items[position].collatrlTyp=="45" ?
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
                                            items[position].UUID.toString() +
                                            "   ",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white),
                                      ),


                                      new Text(

                                        " ${items[position].mcollstatus=="2" ? "Deposited" : items[position].mcollstatus=="3" ?
                                        "Pending" : ""}",
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                 /*     Padding(
                                        padding: new EdgeInsets.only(
                                            left: 30.0, right: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              items[position].mrelationwithcust == "1"
                                                  ? "Friend"
                                                  : items[position].mrelationwithcust.trim() =="2"
                                                  ? "Brother"
                                                  : items[position].mrelationwithcust =="3"
                                                  ? "Sister"
                                                  : items[position].mrelationwithcust == "4"
                                                  ? "Self"
                                                  : items[position].mrelationwithcust == "5"
                                                  ? "Spouse"
                                                  : items[position].mrelationwithcust == "6"
                                                  ? "Mother"
                                                  : items[position].mrelationwithcust == "7"
                                                  ? "Father"
                                                  : items[position].mrelationwithcust == "8"
                                                  ? "Daughter"
                                                  : "Son",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellowAccent),
                                            ),
                                          ],
                                        ),
                                      ),*/
                                    ],
                                  )),
                              new Container(
                                  padding: EdgeInsets.only(left: 5.0),
                                  //color: Colors.green,
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
                              child: new Text (items[position].merrormessage!=null&&items[position].merrormessage.toString()!=""&&items[position].merrormessage.toString()!="null"?items[position].merrormessage.toString():'',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.red[500]),
                              ),
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration (
                          // backgroundColor: Colors.grey[300],
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
                                        crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                        children: <Widget>[

                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          new Container(
                                              padding: EdgeInsets.only(left: 5.0),
                                              //color: Colors.green,
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Collateral Cat  :   " +
                                                        items[position].msubocolltrlcatdesc.toString() +
                                                        "   ",
                                                    style: TextStyle(
                                                        fontSize: 12.0, color: Colors.black87),
                                                  ),

                                                  Text(
                                                    "Sub Type  :   " +
                                                        items[position].msubocolltrldesc.toString() +
                                                        "   ",
                                                    style: TextStyle(
                                                        fontSize: 12.0, color: Colors.black87),
                                                  ),


                                                ],
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
                      new Container(
                          padding: EdgeInsets.only(left: 5.0),
                          //color: Colors.green,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Book No  :   " +
                                    items[position].mcollbookno.toString() +
                                    "   ",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              ),

                            /*  Text(
                                "Collateral title  :   " +
                                    items[position].colltrltitledesc.toString() +
                                    "   ",
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.black87),
                              ),*/

                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          });
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
        
        ],
      ),
    
      body: loanDetailsBuilder,
    );
  }
  void _addNewCollateral(CollateralBasicSelectionBean item,String LOANUUID,String CUSTUUID) {

      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new AddCollaterals(
              LOANUUID: LOANUUID,
              CUSTUUID: CUSTUUID,
              //isEditAllowed: widget.isEditAllowed,
              collateralsDetailsPassedObject:item ,
            )), //When Authorized Navigate to the next screen
      );
  }

  void _onTapItem(CollateralBasicSelectionBean item,String LOANUUID,String CUSTUUID) {

    if(widget.routeType=="datafetching"){
      /*Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new AddExistingCollateralsAgain(mleadsId:mleadsId,mrefno:mrefno,trefno:trefno,collateralsDetailsPassedObject: item, mcusttrefno:cuttref,mcustmrefno:custmref, mcardtrefno:caredtref,mcardmrefno:cardmref
            )), //When Authorized Navigate to the next screen
      );*/
    }else {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
            new AddCollaterals(
              LOANUUID: LOANUUID,
              CUSTUUID: CUSTUUID,
              collateralsDetailsPassedObject:item ,
            )), //When Authorized Navigate to the next screen
      );
    }
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

  /* Future<Null> _AddCollateraBasedOnTyp(CollateralBasicSelectionBean collateralBasicSelectionBean) async{
    print("collateralBasicSelectionBean.collatrlTyp"+collateralBasicSelectionBean.collatrlTyp);

    if(collateralBasicSelectionBean.collatrlTyp =='33') {
       if(widget.routeType=="datafetching"){
      GetCollateralVehicle getCollateralVehicle = new GetCollateralVehicle();
      getCollateralVehicle.tryFind(collateralBasicSelectionBean.mrefno).then((
          onValue)  {

        print("onValue"+ onValue.toString());
        Navigator.push(
          context,
          new MaterialPageRoute(

              builder: (context) =>
              new CollateralVehicleMaster(collateralBasicSelectionBean,
                  onValue,"datafetching")), //When Authorized Navigate to the next screen
        );
      });
    }
    else {
         await AppDatabase.get()
             .selectCollateralVehicleBeanOnCollateralMTrefAndTrefno(
             collateralBasicSelectionBean.trefno,
             collateralBasicSelectionBean.mrefno,
             collateralBasicSelectionBean.mcreatedby)
             .then((onValue) {
           Navigator.push(
             context,
             new MaterialPageRoute(

                 builder: (context) =>
                 new CollateralVehicleMaster(collateralBasicSelectionBean,
                     onValue,"datafetching")), //When Authorized Navigate to the next screen
           );
         }

         );
       }

    }else if(collateralBasicSelectionBean.collatrlTyp =='34'){
print(collateralBasicSelectionBean);
      if(widget.routeType=="datafetching"){
        GetCollateralREM getCollateralREM =  new GetCollateralREM();
        getCollateralREM.tryFind(collateralBasicSelectionBean.mrefno).then((
            onValue)  {
          Navigator.push(
            context,
            new MaterialPageRoute(

                builder: (context) =>
                new CollateralsREMMaster(collateralBasicSelectionBean,
                    onValue,"datafetching")), //When Authorized Navigate to the next screen
          );
        });
      }
      await AppDatabase.get().selectCollateralREMBeanOnCollateralMTrefAndTrefno(collateralBasicSelectionBean.trefno,collateralBasicSelectionBean.mrefno,collateralBasicSelectionBean.mcreatedby).then((onValue){
        Navigator.push(
          context,
          new MaterialPageRoute(

              builder: (context) =>
              new CollateralsREMMaster(collateralBasicSelectionBean,onValue,"datafetching")), //When Authorized Navigate to the next screen
        );
      });
        }
  }*/

  Future deleteCollateralDetails(CollateralBasicSelectionBean item) async{
//    String delBasicTableColl = "Collaterals_Master where mrefno = ${item.mrefno}  And Trefno = ${item.trefno}" ;
//    String delRemTableColl ="Collateral_REM_land_and_house_Master where colleteralmrefno = ${item.mrefno}  And colleteraltrefno = ${item.trefno}";
//    String delVehTableColl ="Collateral_Vehicle_Master where colleteralmrefno = ${item.mrefno}  And colleteraltrefno = ${item.trefno}";
//
//    await AppDatabase.get().deleCollateral(delBasicTableColl);
//    await AppDatabase.get().deleCollateral(delRemTableColl);
//    await AppDatabase.get().deleCollateral(delVehTableColl);

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
      ),
    ) ??
        false;
  }




}





