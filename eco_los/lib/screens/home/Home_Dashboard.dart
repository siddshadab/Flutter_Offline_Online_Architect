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

class HomeDashboard extends StatefulWidget {


  HomeDashboard();

  @override
  HomeDashboardState createState() => new HomeDashboardState();
}

class HomeDashboardState extends State<HomeDashboard>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();

  Utility obj = new Utility();
  bool isNetworkAvailable = false;
  String companyName = "";
  bool circInd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   checkIfNetwrkAval();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: 1);
    getsharedPreferences();
  }


getsharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
  if (prefs.getString(TablesColumnFile.mCompanyName) != null &&
      prefs.getString(TablesColumnFile.mCompanyName).trim() != "")
    companyName = prefs.getString(TablesColumnFile.mCompanyName);
  });

}

  checkIfNetwrkAval()async{
    isNetworkAvailable = await Utility.checkIntCon();
    print("isNetworkAvailable "+isNetworkAvailable.toString());
    setState(() {

    });
  }



  Future<bool> callDialog() {
    globals.Dialog.onWillPop(
        context, 'Are you sure?', 'Do you want to exit an App', 'Login');
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: callDialog,
      child: new Scaffold(
        key: _scaffoldHomeState,
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.view_headline, color: Colors.white),
            onPressed: () => _scaffoldHomeState.currentState.openDrawer(),
          ),
          title: new Text(
            companyName,
            //'Saija Finance',
            style: new TextStyle(color: Colors.white,fontSize: 22.0),
          ),
          backgroundColor:  Color(0xff07426A),
          brightness: Brightness.light,
          elevation: 1.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30.0),
            child: new Container(
              //color: Colors.white,
              child: new TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                tabs: <Widget>[
                  new Tab(
                      icon: new Icon(
                    Icons.work,
                    color: Colors.white,
                    size: 22.0,
                  ))
                ],
              ),
            ),
          ),
          actions: <Widget>[
            isNetworkAvailable?new Icon(
              Icons.network_cell,
              color: Colors.green,
            ):new Icon(
              Icons.network_locked,
              color: Colors.red,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
            ),
            new Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
            ),
             IconButton(icon: Icon(
               Icons.delete,
              color: Colors.white,),
               onPressed: () async{
                 await _FlushDataBase();

             },),
             new Padding(
               padding: const EdgeInsets.symmetric(horizontal: 6.0),
             )
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new Menu_Dashboard(),
          ],
        ),
        backgroundColor: Color(0xffeeeeee),
        drawer: new SideDrawer(),
      ),
    );
  }


  _deleteAllRecordsInTables() async {
    circInd = true;
    _ShowProgressInd(context);
    List<String> deleteQuery = new List<String>();
    deleteQuery.add('DELETE FROM ${AppDatabase.LookupMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.SystemParameterMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.InterestSlabMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.InterestOffsetMaster};');
    deleteQuery.add(
        'DELETE FROM ${AppDatabase.LoanCycleParameterPrimaryMaster};');
    deleteQuery.add(
        'DELETE FROM ${AppDatabase.LoanCycleParameterSecondaryMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.SubLookupMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.productMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.purposeMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.transactionModeMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.repaymentFrequencyMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.countryMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.stateMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.districtMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.subDistrictMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.areaMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.loanApprovalLimitMaster};');
    deleteQuery.add('DELETE FROM ${AppDatabase.branchMaster};');
    await AppDatabase.get().deleteQuery(deleteQuery);
  }

  Future<void> _FlushDataBase() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete all tablet Items')
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                await _deleteAllRecordsInTables();
                success(
                    'All Records have been deleted',
                    context);
              },
            ),
            FlatButton(
              child: Text(
                'Cancel',
              ),
              onPressed: () {
                //    globals.sessionTimeOut = new SessionTimeOut(context: context);
                //    globals.sessionTimeOut.SessionTimedOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> _ShowProgressInd(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Translations.of(context).text('Please_Wait')),
          content: SingleChildScrollView(
              child: SpinKitCircle(color: Colors.teal)
          ),
        );
      },
    );
  }

  success(String message, BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.offline_pin,
              color: Colors.green,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(message)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(Translations.of(context).text('Ok')),
                onPressed: () {
                  //globals.sessionTimeOut=new SessionTimeOut(context: context);
                  //globals.sessionTimeOut.SessionTimedOut();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            LoginPage(
                                null)), //When Authorized Navigate to the next screen
                  );
                },
              ),
            ],
          );
        });
  }
}
