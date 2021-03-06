import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/syncing/SyncingCountry.dart';
import 'package:eco_los/syncing/SyncingProducts.dart';
import 'package:eco_los/syncing/getServices/GetCustomersFromLos.dart';
import 'package:eco_los/syncing/getServices/GetDocumentsFromLos.dart';
import 'package:eco_los/syncing/getServices/GetLoanFromLos.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:eco_los/systems/branchMaster/BranchMasterService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'GetHbsUsers.dart';


class SyncingActivity extends StatefulWidget {
  @override
  SyncingActivityState createState() {
    return new SyncingActivityState();
  }
}

class SyncingActivityState extends State<SyncingActivity> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isDataSynced = false;
  bool circIndicatorIsDatSynced = false;

  static final _headers = {'Content-Type': 'application/json'};

  static const JsonCodec JSON = const JsonCodec();
  static Utility obj = new Utility();

  var urlUpdateCustomerLoanMaster = "customerLoanData/add/";
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  int branch = 0;
  String usrRole;

  bool showAdvance = false;
  bool showAdvanceToServer = false;
  bool showAdvanceFromServer = false;
  String getAllCustomerOnId = "0";

  @override
  void initState() {
    super.initState();
    getSessionVariables();
  }

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode);
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      globals.branchCode = branch;
      globals.agentUserName = username;
    });

    SystemParameterBean sysBean = new SystemParameterBean();
    sysBean = await AppDatabase.get().getSystemParameter('6', 0);
    getAllCustomerOnId =
    sysBean.mcodevalue != null ? sysBean.mcodevalue.trim() : "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Syncing activity'),
        backgroundColor: Color(0xff07426A),
      ),
      body: ModalProgressHUD(
        //  color: Colors.grey,
        inAsyncCall: circIndicatorIsDatSynced,
        //opacity: 10.5,
        color: Colors.white,
        //offset: ,
        // progressIndicator: FadingText('Loading...'),
        progressIndicator: LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 10,
          animation: true,
          lineHeight: 50.0,
          animationDuration: 2500,
          //percent: 0.8,
          center: FadingText('Loading...'),
          linearStrokeCap: LinearStrokeCap.butt,
          progressColor: Colors.grey,
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (showAdvance == false) {
                      setState(() {
                        showAdvance = true;
                      });
                    } else if (showAdvance == true) {
                      setState(() {
                        showAdvance = false;
                      });
                    }
                  },
                  child: new Card(
                    child: new ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.sync),
                          onPressed: null,
                          iconSize: 30.0,
                          color: Colors.blueGrey,
                        ),
                        title: new Text(
                          "Sync ",
                          style: TextStyle(fontSize: 30.0),
                        ),
                        subtitle: showAdvance == true
                            ? new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title:
                                new Text(Constant.syncedLookupsLab),
                                onTap: () async {
                                  syncLookupData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.syncedInterestSlabLab),
                                onTap: () async {
                                  syncInterestSlabData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.syncedInterestOffsetLab),
                                onTap: () async {
                                  syncInterestOffsetData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title:
                                new Text(Constant.syncSubLookupLab),
                                onTap: () async {
                                  _performSyncingSubLookup();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title: new Text(Constant.syncProductLab),
                                onTap: () async {
                                  _performSyncingProduct();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title: new Text(Constant.syncBranchLab),
                                onTap: () async {
                                  _performSyncingBranch();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title: new Text(Constant.syncAddress),
                                onTap: () async {
                                  _performSyncingAddress();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(Constant
                                    .syncedLoanCycleParameterPrimaryLab),
                                onTap: () async {
                                  syncLoanCycleParameterPrimaryData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(Constant
                                    .syncedLoanCycleSecondaryPrimaryLab),
                                onTap: () async {
                                  syncLoanCycleParameterSecondaryData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.syncingLoanApprovalLimit),
                                onTap: () async {
                                  syncsyncingLoanApprovalLimitData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.syncedSystemParameterLab),
                                onTap: () async {
                                  syncSystemParameterData();
                                }),

                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title: new Text(Constant.syncHbsUsers),
                                onTap: () async {
                                  _performSyncingGetHbsUser();
                                }),
                          ],
                        )
                            : null,
                        trailing: IconButton(
                            icon: Icon(Icons.refresh),
                            iconSize: 50.0,
                            onPressed: () {
                              syncFactory();
                            })),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (showAdvanceFromServer == false) {
                      setState(() {
                        showAdvanceFromServer = true;
                      });
                    } else if (showAdvanceFromServer == true) {
                      setState(() {
                        showAdvanceFromServer = false;
                      });
                    }
                  },
                  child: new Card(
                    child: new ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.file_download),
                          onPressed: null,
                          iconSize: 30.0,
                          color: Colors.blueGrey,
                        ),
                        title: new Text(
                          Constant.syncFromServerLab,
                          style: TextStyle(fontSize: 30.0),
                        ),
                        subtitle: showAdvanceFromServer == false
                            ? null
                            : Column(
                          children: <Widget>[
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.getWorkingCustomersLab),
                                onTap: () async {
                                  getSyncedCustomerData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title:
                                new Text(Constant.getWorkingLoanLab),
                                onTap: () async {
                                  getSyncedLoanData();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff01579b),
                                ),
                                title:
                                new Text('Get Documennts'),
                                onTap: () async {
                                  getSyncedDocumentsData();
                                }),

                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.getAllCollateralDetails),
                                onTap: () async {
                                  //getAllCollateralDetails();
                                }),

                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.getAllDocumentDetails),
                                onTap: () async {
                                  //getAllDocumentDetails();
                                }),
                            new ListTile(
                                leading: new Icon(
                                  Icons.sync,
                                  color: Color(0xff07426A),
                                ),
                                title: new Text(
                                    Constant.getAllGuarantorDetails),
                                onTap: () async {
                                 // getAllGuarantorDetails();
                                }),
                          ],
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.refresh),
                            iconSize: 50.0,
                            onPressed: () {
                              syncFromServer();
                            })),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> syncFactory() async {
       //TODO IMPLEMENT Circular indicator before sync system level
    // setState(() {
    //   isDataSynced = true;
    //   circIndicatorIsDatSynced = true;
    // });
    await Constant.setSystemVariables();

    SystemParameterBean sysBean =
    await AppDatabase.get().getSystemParameter('11', 0);
    if (sysBean.mcodevalue != null &&
        sysBean.mcodevalue.trim().toUpperCase() == 'N') {
    } else {

    }

    await syncLookupData();
    await syncSystemParameterData();
    await syncInterestSlabData();
    await syncInterestOffsetData();
    await _performSyncingSubLookup();
    await _performSyncingProduct();
    await _performSyncingBranch();
    await _performSyncingAddress();
    await syncLoanCycleParameterPrimaryData();
    await syncLoanCycleParameterSecondaryData();
    // generate dropdownrelated canges here
    await syncsyncingLoanApprovalLimitData();
    await Constant.getDropDownInitialize();
    await Constant.setSystemVariables();
    await syncsyncingLoanApprovalLimitData();
    await _performSyncingGetHbsUser();

    try {
      _scaffoldKey.currentState.hideCurrentSnackBar();
    } catch (e) {}

    setState(() {
      circIndicatorIsDatSynced = false;
    });
  }

  Future<void> syncFromServer() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });


    setState(() {
      circIndicatorIsDatSynced = false;
    });
  }


  Future<void> syncInterestSlabData() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingInterestSlab);
    await AppDatabase.get().createInterestSlabInsert();
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> syncInterestOffsetData() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingInterestOffset);
    await AppDatabase.get().createInterestOffsetInsert();
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> syncLoanCycleParameterPrimaryData() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingLoanCycleParameterPrimary);
    await AppDatabase.get().createLoanCycleParameterPrimaryInsert(branch);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> syncLoanCycleParameterSecondaryData() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingLoanCycleParameterSecondary);
    await AppDatabase.get().createLoanCycleParameterSecondaryInsert(branch);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> syncsyncingLoanApprovalLimitData() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingLoanApprovalLimit);
    await AppDatabase.get()
        .createLoanApprovalLimitInsert(branch, username, usrGrpCode);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> syncLookupData() async {
    //if (Constant.syncLookups.contains(usrGrpCode)) {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingLookups);
    await AppDatabase.get().createLookupInsert();
    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }
  Future<void> _performSyncingProduct() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    SyncingProducts syncingProducts = new SyncingProducts();
    showMessage(Constant.syncingProduct);
    await syncingProducts.trySave(branch);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> _performSyncingBranch() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    BranchMasterServices branchMasterServices = new BranchMasterServices();
    showMessage(Constant.syncingBranch);
    await branchMasterServices.trySave(branch);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> _performSyncingAddress() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    SyncingCountry syncingCountry = new SyncingCountry();
    await syncingCountry.trySave();
    showMessage(Constant.syncingAddress);
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }
  Future<void> _performSyncingGetHbsUser() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    GetHbsUSers getHbsUSers = new GetHbsUSers();
    showMessage(Constant.syncHbsUsers);
    await getHbsUSers.trySave(branch);
    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }
  Future<void> _performSyncingSubLookup() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingSubLookup);
    await AppDatabase.get().createSubLookupInsert();
    setState(() {
      circIndicatorIsDatSynced = false;
    });

  }


  void showInSnackBar(String value, [Color color]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color != null ? color : null,
    ));
  }


  void showMessage(String message, [MaterialColor color = Colors.grey]) {
    try {
      _scaffoldKey.currentState.hideCurrentSnackBar();
    } catch (e) {
      print(e);
    }
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color != null ? color : null,
        content: new Text(message),
        duration: Duration(seconds: 45)));
  }

  void showMessageShortDuration(String message,
      [MaterialColor color = Colors.grey]) {
    try {
      _scaffoldKey.currentState.hideCurrentSnackBar();
    } catch (e) {
      print(e);
    }
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: color != null ? color : null,
        content: new Text("${message}"),
        duration: Duration(seconds: 6)));
  }

  Future<void> syncSystemParameterData() async {
    //if(Constant.syncSystemParameter.contains(22)){
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.syncingSystemParameter);
    await AppDatabase.get().createSystemParameterInsert();
    await Constant.setSystemVariables();
    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }


  Future<void> getSyncedCustomerData() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.getWorkingCustomersLab);
    GetCustomersFromLos getCustomersFromLos = new GetCustomersFromLos();
    await getCustomersFromLos.getAndSaveCustomerData(username,'');

    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }

  Future<void> getSyncedLoanData() async {
    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage(Constant.getWorkingLoanLab);
    GetLoanFromLos getLoanFromLos = new GetLoanFromLos();
    await getLoanFromLos.getAndSaveLoanData(username,'');

    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }

  Future<void> getSyncedDocumentsData() async {

    setState(() {
      isDataSynced = true;
      circIndicatorIsDatSynced = true;
    });
    showMessage('Get Documents');
    GetDocumentsFromLos getDocumentsFromLos = new GetDocumentsFromLos();
    await getDocumentsFromLos.getAndSaveDocumentsData(username,'');

    setState(() {
      circIndicatorIsDatSynced = false;
    });
    //}
  }

}

