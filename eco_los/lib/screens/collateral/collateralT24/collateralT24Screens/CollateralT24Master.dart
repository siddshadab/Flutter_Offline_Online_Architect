import 'package:eco_los/screens/collateral/collateralT24/collateralT24Screens/CollateralT24Address.dart';
import 'package:eco_los/screens/collateral/collateralT24/collateralT24Screens/CollateralT24Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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


class CollateralT24Master extends StatefulWidget {
  final collateralPassedObject;
  final collateralT24PassedObject;
  final routeType;
  //CollateralT24Master({Key key, this.collateralPassedObject}) : super(key: key);

  CollateralT24Master(this.collateralPassedObject,this.collateralT24PassedObject,this.routeType);
  @override
  CollateralT24MasterState createState() => new CollateralT24MasterState();
}

class CollateralT24MasterState extends State<CollateralT24Master>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String branch = "";

  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;
  static String houseIssue = "__-__-____";
  static String landIssue = "__-__-____";

  DateTime startTime = DateTime.now();
  final dateFormat = DateFormat("yyyy, mm, dd");
  DateTime date;
  TimeOfDay time;
  String approvalAmtLimit="0.0";
  String mreportinguser= "";

  static CollateralT24Bean  collateralT24Bean =  CollateralT24Bean();

  int tabState = 2;
  static const List<String> tabNames = const <String>[
    'Collateral T24',
    'Collateral T24 Details'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);



    if (widget.collateralT24PassedObject != null) {
      collateralT24Bean = widget.collateralT24PassedObject;
    } else {
      collateralT24Bean = new CollateralT24Bean();
      if(widget.collateralPassedObject!=null && widget.collateralPassedObject.collateralT24Bean!=null && widget.collateralPassedObject.isFethMode){
        collateralT24Bean=widget.collateralPassedObject.collateralT24Bean;
      }

      print(widget.collateralPassedObject.trefno);



      collateralT24Bean.mfname=widget.collateralPassedObject.mfname;
      collateralT24Bean.mmname=widget.collateralPassedObject.mmname;
      collateralT24Bean.mlname=widget.collateralPassedObject.mlname;
      collateralT24Bean.mtitle=widget.collateralPassedObject.nametitle;
    }

    getSessionVariables();




    if(widget.collateralT24PassedObject!=null){
      if (widget.collateralT24PassedObject.missuedt != null &&
          widget.collateralT24PassedObject.missuedt != 'null' &&
          widget.collateralT24PassedObject.missuedt != '') {
        String tempDay;
        String tempMonth;
        if (widget.collateralT24PassedObject.missuedt.day.toString().length == 1)
          tempDay = "0" + widget.collateralT24PassedObject.missuedt.day.toString();
        else
          tempDay = widget.collateralT24PassedObject.missuedt.day.toString();

        if (widget.collateralT24PassedObject.missuedt.month.toString().length == 1)
          tempMonth = "0" + widget.collateralT24PassedObject.missuedt.month.toString();
        else
          tempMonth = widget.collateralT24PassedObject.missuedt.month.toString();

        CollateralT24MasterState.landIssue =
            CollateralT24MasterState.landIssue
                .replaceRange(0, 2, tempDay);

        CollateralT24MasterState.landIssue =
            CollateralT24MasterState.landIssue
                .replaceRange(3, 5, tempMonth);

        CollateralT24MasterState.landIssue =
            CollateralT24MasterState.landIssue.replaceRange(
                6, 10, widget.collateralT24PassedObject.missuedt.year.toString());
      }
      if (widget.collateralT24PassedObject.mmtrtydt != null &&
          widget.collateralT24PassedObject.mmtrtydt != 'null' &&
          widget.collateralT24PassedObject.mmtrtydt != '') {
        String tempDay;
        String tempMonth;
        if (widget.collateralT24PassedObject.mmtrtydt.day.toString().length == 1)
          tempDay = "0" + widget.collateralT24PassedObject.mmtrtydt.day.toString();
        else
          tempDay = widget.collateralT24PassedObject.mmtrtydt.day.toString();

        if (widget.collateralT24PassedObject.mmtrtydt.month.toString().length == 1)
          tempMonth = "0" + widget.collateralT24PassedObject.mmtrtydt.month.toString();
        else
          tempMonth = widget.collateralT24PassedObject.mmtrtydt.month.toString();

        CollateralT24MasterState.houseIssue =
            CollateralT24MasterState.houseIssue
                .replaceRange(0, 2, tempDay);

        CollateralT24MasterState.houseIssue =
            CollateralT24MasterState.houseIssue
                .replaceRange(3, 5, tempMonth);

        CollateralT24MasterState.houseIssue =
            CollateralT24MasterState.houseIssue.replaceRange(
                6, 10, widget.collateralT24PassedObject.mmtrtydt.year.toString());
      }
      collateralT24Bean  = widget.collateralT24PassedObject;
      CollateralT24MasterState.collateralT24Bean.msrno =
          widget.collateralT24PassedObject.msrno;
      CollateralT24MasterState.collateralT24Bean.mprdacctid =
          widget.collateralT24PassedObject.mprdacctid;
      CollateralT24MasterState.collateralT24Bean.mlbrcode =
          widget.collateralT24PassedObject.mlbrcode;



    }
    else{

      CollateralT24MasterState.collateralT24Bean.msrno  = 0;
      CollateralT24MasterState.collateralT24Bean.mprdacctid = "00";
      CollateralT24MasterState.collateralT24Bean.mlbrcode = 0;
      CollateralT24MasterState.collateralT24Bean.mcreatedby= username;
      CollateralT24MasterState.collateralT24Bean.mcreateddt = DateTime.now();
    }


  }




  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    if(widget.routeType=="datafetching"){
      print("Jalebi");
     /* await AppDatabase.get().getMaxCollateralT24TrefNo().then((val){
        CollateralT24MasterState.collateralT24Bean.trefno =val;
        // print("trefno"+CollateralT24MasterState.collateralT24Bean.trefno.toString());
      });*/
    }
    else if(widget.collateralT24PassedObject==null){
      //if(widget.collateralT24PassedObject.trefno==null||widget.collateralT24PassedObject.trefno=="null"||widget.collateralT24PassedObject.trefno==0){
     /* await AppDatabase.get().getMaxCollateralT24TrefNo().then((val){
        CollateralT24MasterState.collateralT24Bean.trefno =val;
        // print("trefno"+CollateralT24MasterState.collateralT24Bean.trefno.toString());
      });*/
      //    }
    }


    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode).toString();
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation=  prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude  = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
      reportingUser= prefs.getString(TablesColumnFile.reportingUser);
      if(widget.collateralT24PassedObject==null){
        CollateralT24MasterState.collateralT24Bean.mcreatedby = username;
        CollateralT24MasterState.collateralT24Bean.mcreateddt = DateTime.now();
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        callBackDialog(context);
      },
      child: new Scaffold(
        //key: _scaffoldKeyMaster,
        appBar: new AppBar(
          title: new Text(
            "Collateral T24",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 3.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              callBackDialog(context);
            },
          ),
          backgroundColor: Color(0xff07426A),
          brightness: Brightness.light,
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: new List.generate(tabNames.length, (index) {
              return new Tab(text: tabNames[index].toUpperCase());
            }),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.save,
                color: Colors.white,
                size: 40.0,
              ),
              onPressed: () {
                if (!validateSubmit()) {
                  return;
                }
                _submitData();
              },
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ],

        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            CollateralT24Address(),
            CollateralT24Details()
          ],
        ),
      ),
    );
  }

  Future<Null> _submitData() async {

    if(CollateralT24MasterState.collateralT24Bean!=null) {


      print("Yahan");
      if (CollateralT24MasterState.collateralT24Bean.mcreateddt == null) {
        CollateralT24MasterState.collateralT24Bean.mcreateddt = DateTime.now();
      }

      if (CollateralT24MasterState.collateralT24Bean.mcreatedby == null ||
          CollateralT24MasterState.collateralT24Bean.mcreatedby == '' ||
          CollateralT24MasterState.collateralT24Bean.mcreatedby == 'null') {
        CollateralT24MasterState.collateralT24Bean.mcreatedby = username;
      }

      CollateralT24MasterState.collateralT24Bean.mlastupdatedt = DateTime.now();
      CollateralT24MasterState.collateralT24Bean.mgeolocation = geoLocation;
      CollateralT24MasterState.collateralT24Bean.mgeologd = geoLongitude;
      CollateralT24MasterState.collateralT24Bean.mgeolatd = geoLatitude;

      CollateralT24MasterState.collateralT24Bean.missynctocoresys = 0;
      CollateralT24MasterState.collateralT24Bean.mlastupdateby = username;
      CollateralT24MasterState.collateralT24Bean.mlastsynsdate = null;

      try {
        CollateralT24MasterState.collateralT24Bean.mmtrtydt = DateTime.parse(houseIssue.substring(6) +
            "-" +
            houseIssue.substring(3, 5) +
            "-" +
            houseIssue.substring(0, 2));
      } catch (e) {
        print("date Exception");
      }
      try {
        CollateralT24MasterState.collateralT24Bean.missuedt = DateTime.parse(landIssue.substring(6) +
            "-" +
            landIssue.substring(3, 5) +
            "-" +
            landIssue.substring(0, 2));
      } catch (e) {
        print("date Exception");
      }
      /*await AppDatabase.get().updateCollateralT24Master(
          CollateralT24MasterState.collateralT24Bean);
*/
      _successfulSubmit();
    }




  }

  Future<void> _successfulSubmit() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.offline_pin,
              color: Colors.green,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('T24 Collatral Submitted Successfully'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
          if(widget.routeType=="datafetching") {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
                },
              ),
            ],
          );
        });
  }





  Future<bool> onPop(BuildContext context, String agrs1, String args2) async{
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
            onPressed: () {
              _submitData();
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }


  Future<bool> callBackDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to Go To Loan List without saving data'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              collateralT24Bean =  new  CollateralT24Bean();
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
    if(widget.routeType=="datafetching"){
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);}

//                CCollateralT24MasterState.houseIssue ="__-__-____";

            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  bool validateSubmit() {
    String error = "";
    print("inside validate");

    if (CollateralT24MasterState.collateralT24Bean.maddress1 == "" ||CollateralT24MasterState.collateralT24Bean.maddress1== null) {
      _showAlert("House No", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.mcountry == "" ||CollateralT24MasterState.collateralT24Bean.mcountry== null) {
      _showAlert("Country", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.mstate == "" ||CollateralT24MasterState.collateralT24Bean.mstate== null) {
      _showAlert("Province", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.mdist == "" ||CollateralT24MasterState.collateralT24Bean.mdist== null) {
      _showAlert("District", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.msubdist == "" ||CollateralT24MasterState.collateralT24Bean.msubdist== null) {
      _showAlert("Commune", "It is Mandatory");
      return false;
    }


 /*   if (CollateralT24MasterState.collateralT24Bean.msizeofpropertyl == "" ||CollateralT24MasterState.collateralT24Bean.msizeofpropertyl== null) {
      _showAlert("Size of Property For Land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/
   /* if (CollateralT24MasterState.collateralT24Bean.mltitleowener == "" ||CollateralT24MasterState.collateralT24Bean.mltitleowener== null) {
      _showAlert("Title Owner For Land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.mhtitleowener == "" ||CollateralT24MasterState.collateralT24Bean.mhtitleowener== null) {
      _showAlert("Title Owner For House", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/
  /*  if (CollateralT24MasterState.collateralT24Bean.mlsizeprop == "" ||CollateralT24MasterState.collateralT24Bean.mlsizeprop== null) {
      _showAlert("Size Property For LAnd", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/

    /*if (CollateralT24MasterState.collateralT24Bean.mlsumonvalprop == "" ||CollateralT24MasterState.collateralT24Bean.mlsumonvalprop== null) {
      _showAlert("Summary on value property for land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralT24MasterState.collateralT24Bean.mhsumonvalprop == "" ||CollateralT24MasterState.collateralT24Bean.mhsumonvalprop== null) {
      _showAlert("Summary on value property for house", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/
    return true;

  }

  Future<void> _showAlert(arg, error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$arg error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(Translations.of(context).text('ok')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
