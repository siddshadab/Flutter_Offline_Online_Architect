import 'package:eco_los/screens/LoanApplication/List/CustomerLoanDetailsList.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
import 'package:eco_los/syncing/SyncingActivityMenuList.dart';
import 'package:eco_los/systems/branchMaster/bean/BranchMasterBean.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/home/Menu_Dashboard.dart';
import 'package:eco_los/screens/home/side_drawer.dart';
import 'package:eco_los/screens/login/Login.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu_Dashboard extends StatefulWidget {

  Menu_Dashboard();

  @override
  _Menu_Dashboard createState() {
    return new _Menu_Dashboard();
  }
}

class _Menu_Dashboard extends State<Menu_Dashboard> {


  int mIsProspectNeeded = 0;
  int isCGT2Needed = 0;
  int BMGrpCode = 0;
  int grpCode = 0;
  String centerCaption = "Center";
  int branch;
  BranchMasterBean branchMasterBean= null;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;
  String companyName = "";
  String formattedLastLogin ="";
  String formattedCurrLogin="";

  @override
  void initState() {
    super.initState();

    getsharedPreferences();
  }


  getsharedPreferences()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode);
      reportingUser = prefs.getString(TablesColumnFile.mreportinguser);
      username = prefs.getString(TablesColumnFile.musrname);
      usrRole = prefs.getString(TablesColumnFile.musrdesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.mgrpcd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation = prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();


      if (prefs.getString(TablesColumnFile.mCompanyName) != null &&
          prefs.getString(TablesColumnFile.mCompanyName).trim() != "")
        companyName = prefs.getString(TablesColumnFile.mCompanyName);

      if(prefs.getString(TablesColumnFile.isCGT2Needed)!=null&&prefs.getString(TablesColumnFile.isCGT2Needed).trim()!="")
        isCGT2Needed = int.parse(prefs.getString(TablesColumnFile.isCGT2Needed));
    });

    if(loginTime!=null && loginTime.trim()!='null' && loginTime !='') {
      formattedLastLogin =
          DateFormat('yyyy-MM-dd  kk:mm').format(DateTime.parse(loginTime));
      formattedCurrLogin =
          DateFormat('yyyy-MM-dd  kk:mm').format(DateTime.parse(loginTime));
    }

    if(prefs.getInt(TablesColumnFile.grpCd)!=null&&prefs.getInt(TablesColumnFile.grpCd)!=0)
      grpCode = prefs.getInt(TablesColumnFile.grpCd);


    AppDatabase.get().getBranchNameOnPbrCd(branch).then((onValue){
      branchMasterBean = onValue;
    });

  }

  GestureDetector gestureDetector(name, image) {
    return new GestureDetector(
      child: new RaisedButton(
          elevation: 2.0,
          highlightColor: Colors.black,
          splashColor: Colors.orange,
          colorBrightness: Brightness.dark,
          color: Colors.white,
          onPressed: () {
            if (name == "Customers") {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                    //new CustomerFormationMasterTabs(widget.cameras)), //When Authorized Navigate to the next screen
                    new CustomerList(null, name)),
              );
            } else if (name == "Loans") {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>

                    new CustomerLoanDetailsList()),
              );
            }
          },
          child: new FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.none,
            child: new Column(
              children: <Widget>[
                new Image(
                  image: new AssetImage(image),
                ),
                SizedBox.fromSize(),
                new Center(
                  child: new Text(
                    name,
                    style:
                    new TextStyle(color: Color(0xff07426A), fontSize: 11.0,),
                  ),
                  heightFactor: 2.0,
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {

    return
      new Column(
        children: <Widget>[
          new Flexible (
            flex: 1,
            child:Card(
              child: Column(

                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Row(
                              children: <Widget>[

                                new Text("Welcome ",style:
                                new TextStyle(color: Color(0xff07426A), fontSize: 18.0,fontStyle: FontStyle.normal),),
                              ]),
                          Row(
                            children: <Widget>[

                              new Text(username.toString() ,style:
                              new TextStyle(color: Colors.deepOrange[400], fontSize: 14.0,),),
                              new Text(" Reporting To : ",style:
                              new TextStyle(color: Color(0xff07426A), fontSize: 14.0,),),
                              new Text(reportingUser.toString() ,style:
                              new TextStyle(color: Colors.deepOrange[400], fontSize: 14.0,),),

                            ],
                          ),

                          Row(
                            children: <Widget>[
                              new Text("Branch : ",style:
                              new TextStyle(color: Color(0xff07426A), fontSize: 14.0,),),
                              new Text('${branch.toString()} / ${branchMasterBean!=null?branchMasterBean.mname:""}',style:
                              new TextStyle(color: Colors.deepOrange[400], fontSize: 14.0,),),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[

                          new GestureDetector(
                            child: new RaisedButton(
                                elevation: 1.0,
                                highlightColor: Colors.black,
                                splashColor: Colors.orange,
                                colorBrightness: Brightness.dark,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                        new SyncingActivity()), //When Authorized Navigate to the next screen
                                  );
                                },
                                child: new FittedBox(
                                  alignment: Alignment.center,
                                  fit: BoxFit.none,
                                  child: new Column(
                                    children: <Widget>[
                                      new Image(
                                        image: new AssetImage("assets/Syncing.png"),height: 25.0,width: 25.0,
                                      ),
                                      SizedBox.fromSize(),
                                      new Center(
                                        child: new Text(
                                          "Syncing Activity",
                                          style:
                                          new TextStyle(color: Color(0xff07426A), fontSize: 10.0,),
                                        ),
                                        heightFactor: 2.0,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          //gestureDetector("Syncing Activity", "assets/Syncing.png"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

          ),
          new Flexible (
            flex: 7,
            child:new GridView.count(
              primary: true,
              padding: const EdgeInsets.all(1.0),
              crossAxisCount: 3,
              //childAspectRatio: 0.80,
              mainAxisSpacing: 0.3,
              crossAxisSpacing: 0.3,
              children: <Widget>[
                gestureDetector("Customers", "assets/CIF_COLORFUL.png"),
                gestureDetector("Loans", "assets/Loan.png"),
                ],
            ),
          )
        ],
      );
  }


}
