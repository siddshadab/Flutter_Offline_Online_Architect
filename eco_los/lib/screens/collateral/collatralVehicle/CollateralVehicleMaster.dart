import 'dart:convert';

import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleAcceptanceCriteriaTab.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleBuyingCarTab.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleCarPricingTab.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleOrignalOwnerTab.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleValuationTab.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleValuationTab2.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleValuationTab3.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleValuationTab4.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralsGold/bean/CollateralsGoldMasterBean.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollateralVehicleMaster extends StatefulWidget {
  final collateralPassedObject;
  final collateralVehiclePassedObject;
  final routeType;
  CollateralVehicleMaster({this.collateralPassedObject,this.collateralVehiclePassedObject,this.routeType});

  @override
  CollateralVehicleMasterState createState() => new CollateralVehicleMasterState();
}

class CollateralVehicleMasterState extends State<CollateralVehicleMaster>
    with SingleTickerProviderStateMixin {
  static const JsonCodec JSON = const JsonCodec();
  TabController _tabController;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String branch = "";
  DateTime startTime = DateTime.now();
  final dateFormat = DateFormat("yyyy, mm, dd");
  DateTime date;
  TimeOfDay time;
  String approvalAmtLimit="0.0";
  String mreportinguser= "";
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;

  static CollateralVehicleBean  collateralVehicleBean ;
  static List<int> carAcceptanceRadio= new List<int>(1);

  int tabState = 8;
  static const List<String> tabNames = const <String>[
    'Buying Car From',
    'Buying Car',
    'Car Pricing',
    'Acceptance Criteria',
    'Vehicle Valuation 1',
    'Vehicle Valuation 2',
    'Vehicle Valuation 3',
    'Vehicle Valuation 4'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 8);




    if (widget.collateralVehiclePassedObject != null) {
      collateralVehicleBean = widget.collateralVehiclePassedObject;
    } else {
      collateralVehicleBean = new CollateralVehicleBean();
      if(widget.collateralPassedObject!=null && widget.collateralPassedObject.collateralVehicleBean!=null && widget.collateralPassedObject.isFethMode){
        collateralVehicleBean=widget.collateralPassedObject.collateralVehicleBean;
      }

    }

    getSessionVariables();




    if(widget.collateralVehiclePassedObject!=null){
      collateralVehicleBean  = widget.collateralVehiclePassedObject;
      CollateralVehicleMasterState.collateralVehicleBean.msrno =
          widget.collateralVehiclePassedObject.msrno;
      CollateralVehicleMasterState.collateralVehicleBean.mprdacctid =
          widget.collateralVehiclePassedObject.mprdacctid;
      CollateralVehicleMasterState.collateralVehicleBean.mlbrcode =
          widget.collateralVehiclePassedObject.mlbrcode;
      CollateralVehicleMasterState.collateralVehicleBean.msectype =
          widget.collateralVehiclePassedObject.msectype;



    }
    else{

      CollateralVehicleMasterState.collateralVehicleBean.msrno =
      0;
      CollateralVehicleMasterState.collateralVehicleBean.mprdacctid =
      "0";
      CollateralVehicleMasterState.collateralVehicleBean.mlbrcode =
      0;
      CollateralVehicleMasterState.collateralVehicleBean.msectype =
      "0";



    }


  }




  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();

    if(widget.routeType=="datafetching"){

    }
    else
    if(widget.collateralVehiclePassedObject==null){

    }
    // }
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
      if(widget.collateralVehiclePassedObject==null){
        CollateralVehicleMasterState.collateralVehicleBean.mcreatedby = username;
        CollateralVehicleMasterState.collateralVehicleBean.mcreateddt = DateTime.now();
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        //callDialog();

        callBackDialog(context);

      },
      child: new Scaffold(
        //key: _scaffoldKeyMaster,
        appBar: new AppBar(
          title: new Text(
            "Vehicle Collateral",
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
            CollateralVehicleOrignalOwner(),
            CollateralVehicleBuying(),
            CollateralVehicleCarPricing(),
            CollateralVehicleAcceptanceCriteria(),
            CollateralVehicleValuation(),
            CollateralVehicleValuation2(),
            CollateralVehicleValuation3(),
            CollateralVehicleValuation4()
          ],
        ),
      ),
    );
  }

  Future<Null> _submitData() async {

    bool isValidated = await validateTabs();

    if(CollateralVehicleMasterState.collateralVehicleBean!=null) {

      if (CollateralVehicleMasterState.collateralVehicleBean.mcreateddt == null) {
        CollateralVehicleMasterState.collateralVehicleBean.mcreateddt = DateTime.now();
      }

      if (CollateralVehicleMasterState.collateralVehicleBean.mcreatedby == null ||
          CollateralVehicleMasterState.collateralVehicleBean.mcreatedby == '' ||
          CollateralVehicleMasterState.collateralVehicleBean.mcreatedby == 'null') {
        CollateralVehicleMasterState.collateralVehicleBean.mcreatedby = username;
      }

      CollateralVehicleMasterState.collateralVehicleBean.mlastupdatedt = DateTime.now();
      CollateralVehicleMasterState.collateralVehicleBean.mgeolocation = geoLocation;
      CollateralVehicleMasterState.collateralVehicleBean.mgeologd = geoLongitude;
      CollateralVehicleMasterState.collateralVehicleBean.mgeolatd = geoLatitude;

      CollateralVehicleMasterState.collateralVehicleBean.missynctocoresys = 0;

      CollateralVehicleMasterState.collateralVehicleBean.mlastupdateby = username;
      CollateralVehicleMasterState.collateralVehicleBean.mlastsynsdate = null;


      if(widget.collateralPassedObject.UUID!=null){
        CollateralBasicSelectionBean bean = new CollateralBasicSelectionBean();
        bean=widget.collateralPassedObject;
        bean.collateralVehicleBean = CollateralVehicleMasterState.collateralVehicleBean;
        bean.UUID= widget.collateralPassedObject.UUID;
        Map collJsonData =  await CollateralBasicSelectionBean.toCollaateralsJson(bean);
        String collData = JSON.encode(collJsonData).toString();
        await AppdatabaseV2.get().updateCollaterals(bean,collData,bean.UUID)
            .then((onValue) {
        });
      }



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
                  Text('Vehicle Collatral Submitted Successfully'),
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
              collateralVehicleBean =  new  CollateralVehicleBean();
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
    if(widget.routeType=="datafetching") {
      Navigator.of(context).pop(true);
      Navigator.of(context).pop(true);
    }
//                CustomerFormationMasterTabsState.applicantDob ="__-__-____";

            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }


  Future<bool> validateTabs() async {
    return true;

    /*  if (CollateralVehicleMasterState.collateralVehicleBean.mid == "" ||
        custListBean.imageMaster[0].imgString == null) {
      _showAlert("Customer Picture", "It is Mandatory");
      _tabController.animateTo(0);
      return false;
    }*/
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
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool validateSubmit() {
    String error = "";
    print("inside validate");



    if (CollateralVehicleMasterState.collateralVehicleBean.mbusinessname == "" ||CollateralVehicleMasterState.collateralVehicleBean.mbusinessname== null) {
      _showAlert("Company Name Or Bussiness", "It is Mandatory");
      _tabController.animateTo(0);
      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mownername == "" ||CollateralVehicleMasterState.collateralVehicleBean.mownername== null) {
      _showAlert("Owner NAme", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mtel == "" ||CollateralVehicleMasterState.collateralVehicleBean.mtel== null) {
      _showAlert("Mobile Number", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.maddress1 == "" ||CollateralVehicleMasterState.collateralVehicleBean.maddress1== null) {
      _showAlert("House No", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mcountry == "" ||CollateralVehicleMasterState.collateralVehicleBean.mcountry== null) {
      _showAlert("Country", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mstate == "" ||CollateralVehicleMasterState.collateralVehicleBean.mstate== null) {
      _showAlert("Province", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mdist == "" ||CollateralVehicleMasterState.collateralVehicleBean.mdist== null) {
      _showAlert("District", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.msubdist == "" ||CollateralVehicleMasterState.collateralVehicleBean.msubdist== null) {
      _showAlert("Communce", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }

    if (CollateralVehicleMasterState.collateralVehicleBean.mtype == "" ||CollateralVehicleMasterState.collateralVehicleBean.mtype== null) {
      _showAlert("Type", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }

    if (CollateralVehicleMasterState.collateralVehicleBean.mcolor == "" ||CollateralVehicleMasterState.collateralVehicleBean.mcolor== null) {
      _showAlert("Color", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }




    if (CollateralVehicleMasterState.collateralVehicleBean.mbodyno == "" ||CollateralVehicleMasterState.collateralVehicleBean.mbodyno== null) {
      _showAlert("Body Number", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mengineno == "" ||CollateralVehicleMasterState.collateralVehicleBean.mengineno== null) {
      _showAlert("Engine Number", "It is Mandatory");
      _tabController.animateTo(1);

      _tabController.animateTo(1);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mchassisno == "" ||CollateralVehicleMasterState.collateralVehicleBean.mchassisno== null) {
      _showAlert("Chassis No", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mmadeby == "" ||CollateralVehicleMasterState.collateralVehicleBean.mmadeby== null) {
      _showAlert("Made by", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.midentitycarno == "" ||CollateralVehicleMasterState.collateralVehicleBean.midentitycarno== null) {
      _showAlert("Car No", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }


    if (CollateralVehicleMasterState.collateralVehicleBean.mcarpricing == "" ||CollateralVehicleMasterState.collateralVehicleBean.mcarpricing== null) {
      _showAlert("Car Pricing", "It is Mandatory");
      _tabController.animateTo(2);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mstdpricing == "" ||CollateralVehicleMasterState.collateralVehicleBean.mstdpricing== null) {
      _showAlert("Standard Pricing", "It is Mandatory");
      _tabController.animateTo(2);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.minsurancepricing == "" ||CollateralVehicleMasterState.collateralVehicleBean.minsurancepricing== null) {
      _showAlert("Insurance pricing", "It is Mandatory");
      _tabController.animateTo(2);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mpriceafterevaluation == "" ||CollateralVehicleMasterState.collateralVehicleBean.mpriceafterevaluation== null) {
      _showAlert("Pricing After Evaluated By Branch", "It is Mandatory");
      _tabController.animateTo(2);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mltv == "" ||CollateralVehicleMasterState.collateralVehicleBean.mltv== null) {
      _showAlert("LTV(%)", "It is Mandatory");
      _tabController.animateTo(2);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mcartype == "" ||CollateralVehicleMasterState.collateralVehicleBean.mcartype== null) {
      _showAlert("Car Type", "It is Mandatory");
      _tabController.animateTo(3);

      return false;
    }
    if (CollateralVehicleMasterState.collateralVehicleBean.mltvdd == "" ||CollateralVehicleMasterState.collateralVehicleBean.mltvdd== null) {
      _showAlert("Loan to Value LTV", "It is Mandatory");
      _tabController.animateTo(3);

      return false;
    }

    return true;

  }  }
