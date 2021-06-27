import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/collateral/collateralREM/CollateralREMlandandbuilding.dart';
import 'package:eco_los/screens/collateral/collateralREM/CollateralREMlandandhouse.dart';
import 'package:eco_los/screens/collateral/collateralREM/bean/CollateralREMlandandhouseBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CollateralsREMMaster extends StatefulWidget {
  final collateralPassedObject;
  final collateralREMPassedObject;
  final routeType;
  //CollateralsREMMaster({Key key, this.collateralPassedObject}) : super(key: key);

  CollateralsREMMaster({this.collateralPassedObject,this.collateralREMPassedObject,this.routeType});
  @override
  CollateralsREMMasterState createState() => new CollateralsREMMasterState();
}

class CollateralsREMMasterState extends State<CollateralsREMMaster>
    with SingleTickerProviderStateMixin {
  static const JsonCodec JSON = const JsonCodec();
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

  static CollateralREMlandandhouseBean  collateralREMlandandhouseBean =  CollateralREMlandandhouseBean();

  int tabState = 2;
  static const List<String> tabNames = const <String>[
    'REM Land And House',
    'REM Land And Building'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.collateralREMPassedObject.toString());
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 2);



    if (widget.collateralREMPassedObject != null) {
      collateralREMlandandhouseBean = widget.collateralREMPassedObject;
    } else {
      collateralREMlandandhouseBean = new CollateralREMlandandhouseBean();
      if(widget.collateralPassedObject!=null && widget.collateralPassedObject.collateralREMlandandhouseBean!=null && widget.collateralPassedObject.isFethMode){
        collateralREMlandandhouseBean=widget.collateralPassedObject.collateralREMlandandhouseBean;
      }

      collateralREMlandandhouseBean.mfname=widget.collateralPassedObject.mfname;
      collateralREMlandandhouseBean.mmname=widget.collateralPassedObject.mmname;
      collateralREMlandandhouseBean.mlname=widget.collateralPassedObject.mlname;
      collateralREMlandandhouseBean.mtitle=widget.collateralPassedObject.nametitle;
    }

    getSessionVariables();




    if(widget.collateralREMPassedObject!=null){
      if (widget.collateralREMPassedObject.mlissuedt != null &&
          widget.collateralREMPassedObject.mlissuedt != 'null' &&
          widget.collateralREMPassedObject.mlissuedt != '') {
        String tempDay;
        String tempMonth;
        if (widget.collateralREMPassedObject.mlissuedt.day.toString().length == 1)
          tempDay = "0" + widget.collateralREMPassedObject.mlissuedt.day.toString();
        else
          tempDay = widget.collateralREMPassedObject.mlissuedt.day.toString();

        if (widget.collateralREMPassedObject.mlissuedt.month.toString().length == 1)
          tempMonth = "0" + widget.collateralREMPassedObject.mlissuedt.month.toString();
        else
          tempMonth = widget.collateralREMPassedObject.mlissuedt.month.toString();

        CollateralsREMMasterState.landIssue =
            CollateralsREMMasterState.landIssue
                .replaceRange(0, 2, tempDay);

        CollateralsREMMasterState.landIssue =
            CollateralsREMMasterState.landIssue
                .replaceRange(3, 5, tempMonth);

        CollateralsREMMasterState.landIssue =
            CollateralsREMMasterState.landIssue.replaceRange(
                6, 10, widget.collateralREMPassedObject.mlissuedt.year.toString());
      }
      if (widget.collateralREMPassedObject.mhissuedt != null &&
          widget.collateralREMPassedObject.mhissuedt != 'null' &&
          widget.collateralREMPassedObject.mhissuedt != '') {
        String tempDay;
        String tempMonth;
        if (widget.collateralREMPassedObject.mhissuedt.day.toString().length == 1)
          tempDay = "0" + widget.collateralREMPassedObject.mhissuedt.day.toString();
        else
          tempDay = widget.collateralREMPassedObject.mhissuedt.day.toString();

        if (widget.collateralREMPassedObject.mhissuedt.month.toString().length == 1)
          tempMonth = "0" + widget.collateralREMPassedObject.mhissuedt.month.toString();
        else
          tempMonth = widget.collateralREMPassedObject.mhissuedt.month.toString();

        CollateralsREMMasterState.houseIssue =
            CollateralsREMMasterState.houseIssue
                .replaceRange(0, 2, tempDay);

        CollateralsREMMasterState.houseIssue =
            CollateralsREMMasterState.houseIssue
                .replaceRange(3, 5, tempMonth);

        CollateralsREMMasterState.houseIssue =
            CollateralsREMMasterState.houseIssue.replaceRange(
                6, 10, widget.collateralREMPassedObject.mhissuedt.year.toString());
      }
      collateralREMlandandhouseBean  = widget.collateralREMPassedObject;
      CollateralsREMMasterState.collateralREMlandandhouseBean.msrno =
          widget.collateralREMPassedObject.msrno;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mprdacctid =
          widget.collateralREMPassedObject.mprdacctid;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mlbrcode =
          widget.collateralREMPassedObject.mlbrcode;



    }
    else{

      CollateralsREMMasterState.collateralREMlandandhouseBean.msrno  = 0;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mprdacctid = "00";
      CollateralsREMMasterState.collateralREMlandandhouseBean.mlbrcode = 0;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby= username;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mcreateddt = DateTime.now();
    }


  }




  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    if(widget.routeType=="datafetching"){

    }
    else if(widget.collateralREMPassedObject==null){

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
      if(widget.collateralREMPassedObject==null){
        CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby = username;
        CollateralsREMMasterState.collateralREMlandandhouseBean.mcreateddt = DateTime.now();
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
            "Collateral Land And Property",
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
            CollateralREMlandandhouse(),
            CollateralREMLandAndBuilding()
          ],
        ),
      ),
    );
  }

  Future<Null> _submitData() async {

    if(CollateralsREMMasterState.collateralREMlandandhouseBean!=null) {


      if (CollateralsREMMasterState.collateralREMlandandhouseBean.mcreateddt == null) {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mcreateddt = DateTime.now();
      }

      if (CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby == null ||
          CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby == '' ||
          CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby == 'null') {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mcreatedby = username;
      }

      CollateralsREMMasterState.collateralREMlandandhouseBean.mlastupdatedt = DateTime.now();
      CollateralsREMMasterState.collateralREMlandandhouseBean.mgeolocation = geoLocation;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mgeologd = geoLongitude;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mgeolatd = geoLatitude;

      CollateralsREMMasterState.collateralREMlandandhouseBean.missynctocoresys = 0;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mlastupdateby = username;
      CollateralsREMMasterState.collateralREMlandandhouseBean.mlastsynsdate = null;

      try {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mhissuedt = DateTime.parse(houseIssue.substring(6) +
            "-" +
            houseIssue.substring(3, 5) +
            "-" +
            houseIssue.substring(0, 2));
      } catch (e) {
        print("date Exception");
      }
      try {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mlissuedt = DateTime.parse(landIssue.substring(6) +
            "-" +
            landIssue.substring(3, 5) +
            "-" +
            landIssue.substring(0, 2));
      } catch (e) {
        print("date Exception");
      }

      if(widget.collateralPassedObject.UUID!=null){
        CollateralBasicSelectionBean bean = new CollateralBasicSelectionBean();
        bean=widget.collateralPassedObject;
        bean.collateralREMlandandhouseBean = collateralREMlandandhouseBean;
       // widget.collateralPassedObject.collateralREMlandandhouseBean=collateralREMlandandhouseBean;
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
                  Text('REM Collatral Submitted Successfully'),
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
              collateralREMlandandhouseBean =  new  CollateralREMlandandhouseBean();
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
    if(widget.routeType=="datafetching"){
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);}

//                CCollateralsREMMasterState.houseIssue ="__-__-____";

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


    if (CollateralsREMMasterState.collateralREMlandandhouseBean.maddress1 == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.maddress1== null) {
      _showAlert("House No", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mcountry == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mcountry== null) {
      _showAlert("Country", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mstate == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mstate== null) {
      _showAlert("Province", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }/*
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mdist == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mdist== null) {
      _showAlert("District", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.msubdist == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.msubdist== null) {
      _showAlert("Commune", "It is Mandatory");
      return false;
    }
*/    if (CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofproperty == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofproperty== null) {
      _showAlert("Size of Property", "It is Mandatory");
      _tabController.animateTo(0);

      return false;
    }
 /*   if (CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyl == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyl== null) {
      _showAlert("Size of Property For Land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*//*
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mltitleowener == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mltitleowener== null) {
      _showAlert("Title Owner For Land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mhtitleowener == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mhtitleowener== null) {
      _showAlert("Title Owner For House", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/
  /*  if (CollateralsREMMasterState.collateralREMlandandhouseBean.mlsizeprop == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mlsizeprop== null) {
      _showAlert("Size Property For LAnd", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }*/
/*
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mlsumonvalprop == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mlsumonvalprop== null) {
      _showAlert("Summary on value property for land", "It is Mandatory");
      _tabController.animateTo(1);

      return false;
    }
    if (CollateralsREMMasterState.collateralREMlandandhouseBean.mhsumonvalprop == "" ||CollateralsREMMasterState.collateralREMlandandhouseBean.mhsumonvalprop== null) {
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
