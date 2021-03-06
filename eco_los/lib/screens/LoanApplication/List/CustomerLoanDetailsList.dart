import 'dart:convert';

import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesList.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetails.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetailsBean.dart';
import 'package:eco_los/screens/LoanApplication/List/CustomerLoanDetailsList.dart';
import 'package:eco_los/screens/LoanApplication/LoanLimitDetails.dart';
import 'package:eco_los/screens/LoanApplication/bean/CustomerLoanDetailsBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/collateral/CollateralList.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/documentCollector/DocumentCollectorBean.dart';
import 'package:eco_los/screens/documentCollector/DocumetCollector.dart';
import 'package:eco_los/syncing/SyncLoanApplicationToLos.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';


List<TimelineModel> listWorkflow = new List<TimelineModel>();

class CustomerLoanDetailsList extends StatefulWidget {

  static int count = 1;
  CustomerLoanDetailsList();
  @override
  _CustomerLoanDetailsList createState() => new _CustomerLoanDetailsList();
}

class _CustomerLoanDetailsList extends State<CustomerLoanDetailsList> {
  static const JsonCodec JSON = const JsonCodec();
  CustomerLoanDetailsBean loanDetObj = new CustomerLoanDetailsBean();
  List<CustomerLoanDetailsBean> items = new List<CustomerLoanDetailsBean>();
  List<CustomerLoanDetailsBean> storedItems = new List<CustomerLoanDetailsBean>();
  Widget appBarTitle = new Text("Loan Application");
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
  int branch = 0;
  CustomerListBean customerListBean;
  bool isSyncedIndex = false;
  bool circInd = false;
  DateTime lastSyncedToServerDaeTime = null;
  //SuperTooltip tooltip;
  int currentStep = 0;
  // int mOneDayGapNeededForGRT = 0;

  static var _focusNode = new FocusNode();
  int cgt1ToCgt2Gap = 0;
  int cgt2ToGrtGap = 0;
  SystemParameterBean sysBean;
  bool collNeeded=true;
  bool isLCS=false;
  String message="";


  Icon actionIcon = new Icon(Icons.search);
  @override
  void initState() {

    appBarTitle = new Text("Loan Applications");

    super.initState();

    clearList();
    CustomerLoanDetailsList.count = 1;
    getSessionVariables();
  }

  void clearList()
  {
    try
    {
      if(items == null)
      {
        items = new List<CustomerLoanDetailsBean>();
      }
      else
      {
        items.clear();
      }

      if(storedItems == null)
      {
        storedItems = new List<CustomerLoanDetailsBean>();
      }
      else
      {
        storedItems.clear();
      }


    }
    catch(e)
    {
      print(e);
    }
  }

  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString(TablesColumnFile.musrcode);
      usrCode = prefs.getString(TablesColumnFile.musrcode).trim();
      usrRole = prefs.getString(TablesColumnFile.musrdesignation);
      branch = prefs.get(TablesColumnFile.musrbrcode);
      usrGrpCode = prefs.getInt(TablesColumnFile.mgrpcd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation = prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
      cgt1ToCgt2Gap = prefs.getInt(TablesColumnFile.CGT1toCGT2Gap);
      cgt2ToGrtGap = prefs.getInt(TablesColumnFile.CGT2toGRTGap);
    });
  }

  DateTime getTruncatedDate(DateTime toBeChangedDate) {
    String newDate = toBeChangedDate.toString();
    DateTime returned =
    DateTime.parse('${newDate.substring(0, 10)} 00:00:00.000');

    print(returned);

    return returned;
  }

  getHomePageBody(BuildContext context, AsyncSnapshot snapshot) async {
    if (snapshot.data != null) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      );
    }
  }

  Widget _getItemUI(BuildContext context, int index) {


    if(items[index].missynctocoresys==0 || items[index].missynctocoresys==3){
      items[index].isEditAllowed =true;
    }else{
      items[index].isEditAllowed =false;
    }

    double c_width = MediaQuery.of(context).size.width * 10;
    String mprdcd = "";
    String custNo = "";
    String tempPrcdAcctId = "";
    int prcdAcctId = 0;
    print(" prcdcd  " + items[index].mprdacctid.toString());
    if(items[index].missecuredloan=='1'){
      collNeeded=false;
    }
    else{
      collNeeded=true;
    }


    if (items[index].mprdacctid != null &&
        items[index].mprdacctid != "null" &&
        items[index].mprdacctid != "") {
      try {
        tempPrcdAcctId = items[index].mprdacctid.substring(16, 24);
      } catch (_) {}
    }

    if (items[index].mprdcd != null &&
        items[index].mprdcd != 'null' &&
        items[index].mprdcd.trim() != "") {
      // print("items[index].mprdcd " + items[index].mprdcd.toString());
      mprdcd = items[index].mprdcd;
    }

    if (items[index].mcustno.toString() != null &&
        items[index].mcustno.toString() != 'null' &&
        items[index].mcustno.toString().trim() != "") {
      //  print("items[index].mprdcd " + items[index].mprdcd.toString());
      custNo = items[index].mcustno.toString();
    }

    if (tempPrcdAcctId != null &&
        tempPrcdAcctId != 'null' &&
        tempPrcdAcctId.trim() != "") {
      //  print("items[index].mprdcd " + items[index].mprdcd.toString());
      prcdAcctId = int.parse(tempPrcdAcctId.trim());
    }
    print(" tempPrcdAcctId  " + tempPrcdAcctId.toString());
    print(" prcdAcctId  " + prcdAcctId.toString());
    String leadId = items[index].mleadsid.toString() != null &&
        items[index].mleadsid.toString() != 'null'
        ? items[index].mleadsid
        : "";
    String prcdCdId = items[index].mprdcd.toString() != null &&
        items[index].mprdcd.toString() != 'null'
        ? items[index].mprdcd
        : "";
    String prcdName = items[index].mprdname.toString() != null &&
        items[index].mprdname.toString() != 'null'
        ? items[index].mprdname
        : "";



    return new GestureDetector(
      onTap: () async {

          _onTapItem(items[index]);

              },
      // child: new Card(

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
                  width: c_width,
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
                        "${items[index].mcustname.toString() != null && items[index].mcustname.toString() != 'null' ? items[index].mcustname : ""}",
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text(
                            "Lead ID:"
                                "${leadId != null && leadId != 'null' ? leadId : ""}",
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                          new Text(
                            "A/C No:   ${prcdAcctId != 0 ? (custNo.toString() + "/" + mprdcd.toString() + "/" + prcdAcctId.toString()) : (0)}" /*+ prcdAcctId!=0?
                                custNo.toString() +
                                "/" +
                                mprdcd.toString() +
                                "/" +
                                prcdAcctId.toString():0*/
                            ,
                            style:
                            TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text(
                            Constant.trefno.toString() +
                                ""
                                    "${items[index].UUID.toString() != null && items[index].UUID.toString() != 'null' ? items[index].UUID : ""}",
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[

                          new GestureDetector(
                            onTap: () async{
                            //  validateAndSync(items[index],index);
                              items[index].isEditAllowed?wantToSyncSingleLoan(context,items[index],index):cannotSync(context);
                            },
                            child: new Container(
                              margin: const EdgeInsets.all(0.0),
                              child:  new Icon(
                                Icons.sync,
                                color:items[index].isEditAllowed?Colors.orange:Colors.grey,
                                size: 30.0,
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
              ),
              new Container(
                child: new Row(
                  children: [
                    new Expanded(
                      child: new Text(
                        items[index].merrormessage != null &&
                            items[index].merrormessage.toString() != "" &&
                            items[index].merrormessage.toString() != "null"
                            ? items[index].merrormessage.toString()
                            : '',
                        style:
                        TextStyle(fontSize: 12.0, color: Colors.red[500]),
                      ),
                    ),
                  ],
                ),
                decoration: new BoxDecoration(
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
                              height: 5.0,
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                  // width: 100.0,
                                  child: new Text(
                                    "Approved amount:".toString() +
                                        "${items[index].mapprvdloanamt} ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40.0,
                                ),
                                new Container(
                                    child: new Row(
                                      children: <Widget>[
                                        new Icon(
                                          FontAwesomeIcons.user,
                                          color: Colors.grey,
                                          size: 18.0,
                                        ),
                                        Text(
                                          items[index].mcustno.toString() != null &&
                                              items[index].mcustno.toString() !=
                                                  'null'
                                              ? items[index].mcustno.toString()
                                              : "",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  // width:  100.0,
                                  child: new Text(
                                    " Repay Freq : "
                                        "${getFrequency(items[index].mfrequency) + ""} ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: new TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            new Row(
                              children: <Widget>[
                                new Icon(
                                  FontAwesomeIcons.productHunt,
                                  color: Colors.green,
                                  size: 18.0,
                                ),
                                Text(
                                  " : " + prcdCdId.toString() + "/" + prcdName,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey[500]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "EMI:".toString() +
                                      " ${items[index].minstamt.toString() != null && items[index].mprdcd.toString() != 'null' ? items[index].minstamt : ""}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey[500]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Approval Remark: ".toString() +
                                      " ${items[index].mapprovaldesc.toString() != null && items[index].mapprovaldesc.toString() != 'null' ? items[index].mapprovaldesc : ""}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: items[index].mleadstatus != null &&
                                          items[index].mleadstatus == 99
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: new Row(
                                textBaseline: TextBaseline.alphabetic,
                                //crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: <Widget>[
                                  new OutlineButton(
                                      borderSide:
                                      BorderSide(color: Colors.cyan[50]),
                                      child:
                                      Text("Guarantor/Co-applicant/Spouse"),
                                      textColor: Colors.blue,
                                      onPressed: () {
                                        _AddGuarantor(
                                            items[index].UUID,
                                            items[index].isEditAllowed,
                                            items[index].mprdcd
                                        );
                                      },
                                      shape: new OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                      )),

                                  collNeeded?
                                  new OutlineButton(
                                      borderSide:
                                      BorderSide(color: Colors.cyan[50]),
                                      child: Text("Collaterals"),
                                      textColor: Colors.blue,
                                      onPressed: () {
                                        _AddCollateral(
                                            items[index].UUID,
                                            items[index].isEditAllowed,
                                            items[index].mprdcd);
                                      },
                                      shape: new OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(30.0),
                                      )): Container()
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                new OutlineButton(
                                    borderSide:
                                    BorderSide(color: Colors.cyan[50]),
                                    child: Text("Add Documents"),
                                    textColor:Colors.blue,
                                    onPressed: () {
                                      _AddDocuments(
                                          items[index].UUID,
                                          items[index].mcustname,
                                          items[index].CUSTUUID,
                                          items[index].mcustno,
                                          items[index].isEditAllowed,
                                          items[index].mprdcd,

                                      );
                                    },
                                    shape: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    new ButtonTheme(
                      padding: new EdgeInsets.all(2.0),
                      child: new ButtonBar(
                        children: <Widget>[
                          new GestureDetector(
                            onTap: () async{
                              //  validateAndSync(items[index],index);
                              items[index].isEditAllowed?wantToSyncSingleLoan(context,items[index],index):cannotSync(context);
                            },
                            child: new Container(
                              margin: const EdgeInsets.all(0.0),
                              child:  new Icon(
                                Icons.sync,
                                color:items[index].isEditAllowed?Colors.orange:Colors.grey,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Text(
                            " ${items[index].mleadstatusdesc.toString() != null && items[index].mleadstatusdesc.toString() != 'null' ? items[index].mleadstatusdesc : ""}",
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 12.0, color: Colors.red),
                          ),

                          Text(
                            " ${items[index].mrouteto.toString() != null && items[index].mrouteto.toString() != 'null' ? items[index].mrouteto : ""}",
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 12.0, color: Colors.blue),
                          ),
                          Text(
                            " ${items[index].mcreatedby != null && items[index].mcreatedby.toString() != null && items[index].mcreatedby.toString() != 'null' ? items[index].mcreatedby : ""}",
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 12.0, color: Colors.blue),
                          ),
                          new IconButton(
                            icon: new Icon(Icons.toc, color: Colors.black),
                            onPressed: () => _onTapWorkFlow(
                                items[index],
                                items[index].UUID,
                                items[index].mprdacctid,
                                items[index].mrouteto,
                                1),
                          ),

                        ],
                      ),
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
    if (CustomerLoanDetailsList.count == 1) {
      CustomerLoanDetailsList.count++;
      try {
        loanDetailsBuilder = new FutureBuilder(
            future: AppdatabaseV2.get()
                .selectLoanList()
                .then(
                    (List<CustomerLoanDetailsBean> loanDetailsList) {
                      items.clear();
                      storedItems.clear();
                      loanDetailsList.forEach((val) async {
                      // await validateMandData(val);
                    await AppdatabaseV2.get().getCustomerByUUID(val.CUSTUUID)
                        .then((CustomerListBean custObj) {
                      val.custBean=custObj;
                      items.add(val);
                      storedItems.add(val);
                    });
                    setState(() {});
                  });
                return storedItems;

                }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return new Text('loading...');

                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return getHomePageBody(context, snapshot);
              }
            });
      } catch (e) {
        loanDetailsBuilder = new Text("Nothing To display");
      }
    } else if (items != null) {

      loanDetailsBuilder = ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      );
    } else
      loanDetailsBuilder = new Text("nothing to display");

    return new Scaffold(
      key: _scaffoldHomeState,
      appBar: new AppBar(
        elevation: 3.0,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: (){ Navigator.of(context).pop();
            collNeeded=true;
            }
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
                } else {
                  this.actionIcon = new Icon(Icons.search);
                  this.appBarTitle = new Text("Loan Application");
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
      floatingActionButton: new FloatingActionButton(
          elevation: 3.0,
          //           mini: true,
          child: new Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
              _addNewLoan();
          }),
      body: new Container(
        color: const Color(0xff07426A),
        child: loanDetailsBuilder,
      ),
    );
  }

  void _AddGuarantor(String UUID, bool isEditAllowed,String mprdCd) {
    print("_AddGuarantor");
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new GuarantorDetails( UUID,"",isEditAllowed,mprdCd)), //When Authorized Navigate to the next screen
    );
  }

  void _AddCollateral(String UUID, bool isEditAllowed,String mprdcd) {
    print("_AddCollateral");
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new CollateralList(UUID,"",isEditAllowed,mprdcd)), //When Authorized Navigate to the next screen
    );
  }

  void _AddDocuments(String UUID,  String custname,String CUSTUUID, int cusno, bool isEditAllowed,String mprdcd) {
    print("DocumetCollector");
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new DocumetCollector(UUID,custname,CUSTUUID,cusno, "",isEditAllowed,mprdcd)), //When Authorized Navigate to the next screen
    );
  }
  void _onTapItem(CustomerLoanDetailsBean item) {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new LoanLimitDetails(
              laonLimitPassedObject: item
          )), //When Authorized Navigate to the next screen
    );
  }

  void filterList(String val) {
    items.clear();
    items = new List<CustomerLoanDetailsBean>();

    storedItems.forEach((obj) {
      if (obj.mcustno.toString().contains(val) |
      obj.UUID.toString().toLowerCase().contains(val) |
      obj.mcenterid.toString().contains(val) |
      obj.mgroupcd.toString().contains(val) |
      obj.mcustname.toString().toUpperCase().contains(val.toUpperCase()) |
      obj.mprdacctid.toString().toUpperCase().contains(val.toUpperCase()) |
      obj.mleadsid.toString().toUpperCase().contains(val.toUpperCase())) {
        items.add(obj);
      }
    });

    setState(() {});
  }

  void _onTap1Item(CustomerLoanDetailsBean item) {
    Navigator.pop(context, item);
  }


  void _addNewLoan() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new LoanLimitDetails(
              laonLimitPassedObject:
              null)), //When Authorized Navigate to the next screen
    );
  }

  getFrequency(String mfrequency) {
    if (mfrequency == "A") {
      return "Day";
    } else if (mfrequency == "B") {
      return "BiMonthly";
    } else if (mfrequency == "D") {
      return "Daily";
    } else if (mfrequency == "F") {
      return "Fortnightly";
    } else if (mfrequency == "M") {
      return "Monthly";
    } else if (mfrequency == "W") {
      return "Weekly";
    }
    return "";
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    try {
      _scaffoldHomeState.currentState.hideCurrentSnackBar();
    } catch (e) {}
    _scaffoldHomeState.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }




  _onTapWorkFlow(
      CustomerLoanDetailsBean bean,
      String UUID,
      String mprcdaccid,
      String loanRotedPending,
      int leadStatus) async {
    await callasyncTimline(
        bean, UUID,mprcdaccid, loanRotedPending, leadStatus);
    Navigator.of(context).push(ShowTranperentWorkflow());
  }

  Future<Null> callasyncTimline(
      CustomerLoanDetailsBean bean,
      String UUID,
      String mprcdaccid,
      String loanRotedPending,
      int leadStatus) async {
    await generateeTimlineList(bean, UUID,  mprcdaccid,
        loanRotedPending, leadStatus)
        .then((onValue) {
      listWorkflow.clear();
      listWorkflow.addAll(onValue);
    });
  }

  Future<List<TimelineModel>> generateeTimlineList(
      CustomerLoanDetailsBean bean,
      String mrefno,
      String mprcdaccid,
      String loanRotedPending,
      int leadStatus) async {
    workflowBean addWorkFLowList = new workflowBean();

    List<TimelineModel> listItems = new List();
    addWorkFLowList.bean = bean;
    TimelineModel model = TimelineModel(
      generaateTimemline(addWorkFLowList.bean, 0),
      position: TimelineItemPosition.right,
    );
    listItems.add(model);
    return listItems;
  }

  Widget generaateTimemline(var addWorkFLowList, int forWhat) {
    return new Container(
      //width: MediaQuery.of(context).size.width,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  addWorkFLowList.mcreatedby != null &&
                      addWorkFLowList.mcreatedby.toString() != "null" &&
                      addWorkFLowList.mcreatedby.toString() != ""
                      ? Text(
                    "CreatedBy :" + addWorkFLowList.mcreatedby.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green[500],
                    ),
                  )
                      : Text(
                    "CreatedBy :" + "",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green[500],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  addWorkFLowList.mcreateddt != null &&
                      addWorkFLowList.mcreateddt.toString() != "null" &&
                      addWorkFLowList.mcreateddt.toString() != ""
                      ? Text(
                    "Created Date :" +
                        addWorkFLowList.mcreateddt.toString(),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green[500],
                    ),
                  )
                      : Text(
                    "Created Date :" + "",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green[500],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: <Widget>[
                      forWhat > 0 &&
                          addWorkFLowList.mremarks != null &&
                          addWorkFLowList.mremarks.toString() != "null" &&
                          addWorkFLowList.mremarks.toString() != ""
                          ? Text(
                        "Remarks :" + addWorkFLowList.mremarks.toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green[500],
                        ),
                      )
                          : Text("")

                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(),
                    child: new Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        forWhat > 0
                            ? Text(
                          "   Tref no: ${addWorkFLowList.loantrefno != null ? addWorkFLowList.loantrefno : ""}",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green[500],
                          ),
                        )
                            : Text(
                          "   Tref no: ${addWorkFLowList.trefno != null ? addWorkFLowList.trefno : ""}",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green[500],
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "LoanMrefno: ${addWorkFLowList.mrefno != null ? addWorkFLowList.mrefno : ""}",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ],
          ),
          //change button later on or remove this button
          new ButtonTheme(
            padding: new EdgeInsets.all(2.0),
            child: new ButtonBar(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    FontAwesomeIcons.streetView,
                    color: Colors.orange[400],
                    size: 25.0,
                  ),
                  onPressed: () async {
                    showMessageWithoutProgress("View Activity coming soon");
                  },
                ),
                //TODO make below dynamic ,
                forWhat == 0
                    ? new Text("New")
                    : forWhat == 1
                    ? new Text("CGT1")
                    : forWhat == 2 ? new Text("CGT2") : new Text("GRT")
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMessageWithoutProgress(String message,
      [MaterialColor color = Colors.red]) {

  }


  ///Single sync starts here
  void validateAndSync(CustomerLoanDetailsBean item,int index) async{
  //  bool isNotValidates = await validateMandData(item);
    //if(isNotValidates){
      if(false){
      //Error
     mandtoryDataMiissing(context);
    }else {
      //Sync To Server
        Utility obj = new Utility();
        bool isNetworkAvailable;
        isNetworkAvailable = await obj.checkIfIsconnectedToNetwork();
        if (isNetworkAvailable) {
          _ShowCircIndSync();
          await SyncSingleApplications(item).then((value) {
            items[index].isEditAllowed = false;
          });
        }else {
          showInSnackBar("Network Not Available", Colors.yellow);
          return null;
        }
    }
  }

  void showInSnackBar(String value, [Color color]) {
    _scaffoldHomeState.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color != null ? color : null,
    ));
  }

  Future<void> _ShowCircIndSync() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Syncing Application'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[CircularProgressIndicator()],
            ),
          ),
        );
      },
    );
  }


  Future<bool> validateMandData(CustomerLoanDetailsBean item) async{
    //Get product master based on loan product
    message="";
    //Get Documents
    try{
    await readDocNoSynced(item);
    }catch(_){}
    //Get Collateras
    try{
    await readCollNoSynced(item);
    }catch(_){}
    //Get Guarantor
    try {
      await readGuarNoSynced(item);
    }catch(_){}

    bool isBreak =false;
    await AppDatabase.get()
        .getProductOnPrdCd(30, branch,item.mprdcd)
        .then((ProductBean response)async{
     /* response.mmancolltype="102";
            response.mmanguartype = "102";*/
      if(response.mmancolltype!=null && response.mmancolltype!="null" && response.mmancolltype!='' ) {
        for (var value in response.mmancolltype.toString().split(",")) {
          if (!item.collTypes.contains(value)) {
            isBreak = true;
            await setMissingCollateralsDesc(value).then((value){
              message =
              "Collaterals :  ${value} records Missing And its Mandatory for Application Sync";
            });
            item.isCollMissing =true;
            break;
          }else{
            item.isCollMissing =false;
          }
          print(value);
        }
      }else{
        item.isCollMissing =false;
      }

      if(response.mmanguartype!=null && response.mmanguartype!="null" && response.mmanguartype!='' ) {
        for (var value in response.mmanguartype.toString().split(",")) {
          if (!item.guarTypes.contains(value)) {
            isBreak = true;
            await setMissingGuarDesc(value).then((value){
              message =
              "Guaranter :  ${value} records Missing And its Mandatory for Application Sync";
            });
            item.isGuarMissing =true;
            break;
          }else{
            item.isGuarMissing =false;
          }
          print(value);
        }
      }else{
        item.isGuarMissing =false;
      }

      if(response.mmandoctype!=null && response.mmandoctype!="null" && response.mmandoctype!='' ) {
        for (var value in response.mmandoctype.toString().split(",")) {
          if (!item.docTypes.contains(value)) {
            isBreak = true;
            await setMissingDocDesc(value).then((value){
              message =
              "Documents :  ${value} records Missing And its Mandatory for Application Sync";
            });
            item.isDocMissing =true;
            break;
          }else{
            item.isDocMissing =false;
          }
          print(value);
        }
      }else{
        item.isDocMissing =false;
      }

    });

    return isBreak;
  }

  readDocNoSynced(CustomerLoanDetailsBean loanDetailsBean) async{

  }

  readCollNoSynced(CustomerLoanDetailsBean loanDetailsBean) async{

  }

  readGuarNoSynced(CustomerLoanDetailsBean loanDetailsBean) async{

  }


  Future<void> SyncSingleApplications(CustomerLoanDetailsBean item) async{
    //get Loan
    var mapData = new Map();
      //Create Json To Los format
    //TODO INTERFACING CODES TO BE IMPLEMENTED INCLUDING KEYS CHANGES AS PER LOS SERVICE


    var mapGuar;
    var mapGuarList = List();

    var mapColl;
    List mapCollList =  List();

    var mapDoc;
    var mapDocList = new List();


      try {

         //Primary Customer Objct
         await AppdatabaseV2.get().getCustomerByUUID(item.CUSTUUID).then((CustomerListBean custObj) async{
           //await setInterfacingCode(custObj.addressDetails);
           mapData = await CustomerListBean.toCustomerJson(custObj);
         });
         mapData['customerLoanDetails'] = await CustomerLoanDetailsBean.toLoanJson(item);



         try{
         await AppdatabaseV2.get().selectGuarList('SELECT * FROM ${TablesList.GUARANTERMASTER} WHERE ${TablesColumnFile.LOANUUID} = "${item.UUID}"')
             .then((List<GuarantorDetailsBean> beanList) async{
                //guaranter Customer Objct
                try{
                  for(int i=0;i<beanList.length;i++){
                    await AppdatabaseV2.get().getCustomerByUUID(beanList[i].CUSTUUID).then((CustomerListBean custObj) async{
                      beanList[i].customerListBean=custObj;
                    });
                    mapGuar=GuarantorDetailsBean.toGuaranterJson(beanList[i]);
                    mapGuarList.add(mapGuar);
                  }

                }catch(_){
                  print(_);
                }


         });
      }catch(_){
           print(_);
         }




           await AppdatabaseV2.get().selectCollOnQuery(
               'SELECT * FROM ${TablesList
                   .COLLATERALSMASTER} WHERE ${TablesColumnFile
                   .LOANUUID} = "${item.UUID}"')
               .then((List<CollateralBasicSelectionBean> beanList) async {
             for (int i = 0; i < beanList.length; i++) {
               //mapColl = new Map();
               await CollateralBasicSelectionBean.toCollaateralsJson(beanList[i]).then((value){
                 mapCollList.add(value);

               }).catchError((onError){
                 print(onError);
               });

             }
           });




         try{
         await AppdatabaseV2.get().selectDocumentsList('SELECT * FROM ${TablesList.DOCUMENTSMASTER} WHERE  ${TablesColumnFile.LOANUUID} = "${item.UUID}"')
             .then((List<DocumentCollectorBean> data) async{
           for(int i=0;i<data.length;i++){
             mapDoc=DocumentCollectorBean.toDocumentJson(data[i]);
             mapDocList.add(mapDoc);
           }

         });
      }catch(_){}


      }catch(_){
        print(_);
      }

    mapData['customerAsGuaranter'] = mapGuarList;
    mapData['collateralLosHolder'] = mapCollList;
    mapData['documentCollectorEntity'] = mapDocList;

    String losData = JSON.encode(mapData).toString();
         Constant.printBigString(losData,'Final Json to Los');
         Constant.getAppPath(losData.toString(),"FinalLosServiceCall");
        SyncLoanApplicationToLos loanSync  = new SyncLoanApplicationToLos();
        loanSync.tryFind(losData);

       //Navigator.of(context).pop();
       //Navigator.of(context).pop();
  }


  Future<void> mandtoryDataMiissing(BuildContext context) async {
    return animated_dialog_box.showInOutDailog(
        title: Center(child: Text("Alert")), // IF YOU WANT TO ADD
        context: context,
        firstButton: MaterialButton(
          // FIRST BUTTON IS REQUIRED
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white,
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
        yourWidget: Container(
          child: Text(message),
        ));
  }


  Future<void> wantToSyncSingleLoan(BuildContext context,CustomerLoanDetailsBean item,int index) async {
    return animated_dialog_box.showInOutDailog(
        title: Center(child: Text("Alert")), // IF YOU WANT TO ADD
        context: context,
        firstButton: MaterialButton(
          // FIRST BUTTON IS REQUIRED
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white,
          child: Text('Ok'),
          onPressed: () {
            validateAndSync(item,index);
            Navigator.of(context).pop();
          },
        ),
        secondButton: MaterialButton(
              // OPTIONAL BUTTON
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.white,
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
        yourWidget: Container(
          child: Text("Are You sure you want to sync this Application?  This will not allow edit after synced to the server"),
        ));
  }

  Future<void> cannotSync(BuildContext context) async {
    return animated_dialog_box.showInOutDailog(
        title: Center(child: Text("Alert")), // IF YOU WANT TO ADD
        context: context,
        firstButton: MaterialButton(
          // FIRST BUTTON IS REQUIRED
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white,
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        icon: Icon(Icons.info_outline,color: Colors.red,), // IF YOU WANT TO ADD ICON
        yourWidget: Container(
          child: Text("You cannot sync this lead"),
        ));
  }



  Future<String> setMissingCollateralsDesc(String match) async{

    String retValue="";
    bool isBreak = false;
    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralsInfo[1].length;k++) {
      if (globals.dropdownCaptionsValuesCollateralsInfo[1][k].mcode == match ) {
        retValue = globals.dropdownCaptionsValuesCollateralsInfo[1][k].mcodedesc;
        isBreak=true;
        break;
      }
      if(isBreak){
        break;
      }
    }

    return retValue;
  }

  Future<String> setMissingGuarDesc(String match) async{

    String retValue="";
    bool isBreak = false;
    for (int k = 0;
    k < globals.dropdownCaptionsValuesGuarantorInfo[1].length;k++) {
      if (globals.dropdownCaptionsValuesGuarantorInfo[1][k].mcode == match ) {
        retValue = globals.dropdownCaptionsValuesGuarantorInfo[1][k].mcodedesc;
        isBreak=true;
        break;
      }
      if(isBreak){
        break;
      }
    }

    return retValue;
  }

  Future<String> setMissingDocDesc(String match) async{

    String retValue="";
    bool isBreak = false;
    for (int k = 0;
    k < globals.dropDownCaptionDocumentCollecter[0].length;k++) {
      if (globals.dropDownCaptionDocumentCollecter[0][k].mcode == match ) {
        retValue = globals.dropDownCaptionDocumentCollecter[0][k].mcodedesc;
        isBreak=true;
        break;
      }
      if(isBreak){
        break;
      }
    }

    return retValue;
  }


}

class ShowTranperentWorkflow extends ModalRoute<void> {
  ShowTranperentWorkflow();

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _LoanStepper(context),
      ),
    );
  }

  Widget _LoanStepper(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 3.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff07426A),
        brightness: Brightness.light,
        title: Text("Loan Workflow"),
        actions: <Widget>[],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'WorkFlow of Loan Approval',
            style: TextStyle(color: Colors.white, fontSize: 24.0),
          ),
          IconButton(
            icon: Icon(
              (Icons.clear),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Timeline(children: listWorkflow, position: TimelinePosition.Left),
    );
  }
}

class workflowBean {
  CustomerLoanDetailsBean bean;
  workflowBean({ this.bean});
}


class animated_dialog_box {

  static Future showInOutDailog({
    @required BuildContext context,
    @required Widget yourWidget,
    Widget icon,
    Widget title,
    @required Widget firstButton,
    Widget secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.fastOutSlowIn.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: title,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon,
                    Container(
                      height: 10,
                    ),
                    yourWidget
                  ],
                ),
                actions: <Widget>[firstButton, secondButton],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }



}