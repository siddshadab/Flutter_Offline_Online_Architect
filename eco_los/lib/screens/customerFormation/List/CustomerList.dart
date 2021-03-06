import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BorrowingDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BusinessExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ESMSBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FamilyDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/HouseholdExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:eco_los/screens/customerFormation/bean/RiskRatingsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eco_los/helpers/globals.dart' as globals;

class CustomerList extends StatefulWidget {
  final firstParms;
  final String type;
  CustomerList(this.firstParms, this.type);

  @override
  _CustomerList createState() => new _CustomerList();
}

class _CustomerList extends State<CustomerList> {
  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();
  DateTime lastSyncedToServerDaeTime = null;

  Future<bool> callDialog() {
    globals.Dialog.onPop(context, 'Are you sure?',
        'Do you want to Go To DashBoard', "CustomerList");
  }

  List<int> indicesList = new List<int>();
  List<CustomerListBean> customerBeanList = new List<CustomerListBean>();
  Widget appBarTitle = new Text("Customer List");
  Icon actionIcon = new Icon(Icons.search);
  Icon actionIconMic = new Icon(Icons.mic);
  int count = 1;
  int highmarkValidity = 0;
  int mIsProspectRepeatNeeded = 0;
  final String nidPaddingSpaces = "                              ";
  bool circInd = false;
  String resultText = "";
  String resultTextSearch = "";

  List<CustomerListBean> items = new List<CustomerListBean>();
  List<CustomerListBean> storedItems = new List<CustomerListBean>();

  @override
  void initState() {
    super.initState();

    clearList();
    getsharedPreferences();
  }

  getsharedPreferences() async {

  }


  void clearList()
  {
    try
    {
      if(items == null)
      {
        items = new List<CustomerListBean>();
      }
      else
        {
          items.clear();
        }

      if(storedItems == null)
      {
        storedItems = new List<CustomerListBean>();
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


  void filterList(String val) async {
    items.clear();
    items = new List<CustomerListBean>();

    storedItems.forEach((obj) {
      if (obj.mmobno.toString().contains(val) |
          obj.mlongname.toString().toUpperCase().contains(val.toUpperCase()) |
          obj.mpannodesc.toString().toUpperCase().contains(val.toUpperCase()) |
          obj.mIdDesc.toString().toUpperCase().contains(val.toUpperCase()) |
          obj.mcustno.toString().contains(
              val)) {
        items.add(obj);
      }
    });

    setState(() {});
  }

  getHomePageBody2(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI2,
        padding: EdgeInsets.all(0.0),
      );
    }
  }

  Widget _getItemUI2(BuildContext context, int index) {
    //print(items);
    double c_width = MediaQuery.of(context).size.width * 10;
    String longName = items[index].mlongname.toString() != null &&
            items[index].mlongname.toString() != 'null'
        ? items[index].mlongname.toString()
        : "";
     String firstName = items[index].mfname.toString() != null &&
            items[index].mfname.toString() != 'null'
        ? items[index].mfname.toString()
        : "";
    String middleName = items[index].mmname.toString() != null &&
            items[index].mmname.toString() != 'null'
        ? items[index].mmname.toString()
        : "";
    String lastName = items[index].mlname.toString() != null &&
            items[index].mlname.toString() != 'null'
        ? items[index].mlname.toString()
        : "";


    //TODO applicant DOB hai bhai created dt nahi
    DateTime applicantDob =
        items[index].mcreateddt != null && items[index].mcreateddt != 'null'
            ? items[index].mcreateddt
            : DateTime.now();

    String errorMsg = items[index].merrormessage.toString() != null &&
            items[index].merrormessage.toString() != 'null'
        ? items[index].merrormessage.toString()
        : "";
    bool showErrMsg = true;
    if (errorMsg == "null" || errorMsg == "" || errorMsg == null) {
      showErrMsg = false;
    }

    return new GestureDetector(
      onTap: () {
        _onTapItem(context, items[index]);
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
                        longName==null || longName=='null' ||  longName==''?firstName+" "+middleName+" "+lastName:longName,
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
//mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[

                            Flexible(
                            flex :7,
                              child:  FittedBox(
                                fit: BoxFit.scaleDown,
                                child:Text(
                                  "UUID:" +
                                      items[index].UUID.toString() +
                                      "   ",
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.white),
                                ),)


                            ),

                              Flexible(
                                flex : 3,
                                child:Padding(
                                  padding: new EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      new Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),

                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child:Text(
                                      items[index].mcustno.toString() != null &&
                                          items[index].mcustno.toString() !=
                                              'null'
                                          ? items[index].mcustno.toString()
                                          : "",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ))

                                    ],
                                  ),
                                ),
                              )

                            ],
                          )),
                    ],
                  ),
                ),
              ),
              new Container(
                child: new Row(
                  children: [
                    new Expanded(
                      child: new Text(
                        items[index].merrormessage.toString() != null &&
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
                            SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              children: <Widget>[
                                items[index].mpannodesc.toString() != null ||
                                        items[index].mpannodesc.toString() != ""
                                    ? Text(
                                        "NID :" +
                                            items[index].mpannodesc.toString(),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[500],
                                        ),
                                      )
                                    : Text(
                                        "NID :" + nidPaddingSpaces.toString(),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                Padding(
                                  padding: new EdgeInsets.only(
                                      left: 10.0, right: 8.0),
                                  child: new Text(
                                    DateFormat("yyyy, MM, dd")
                                        .format(applicantDob),
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            new Padding(
                              padding: new EdgeInsets.only(
                                  /*   top: 1.0,
                                  bottom: 1.0,*/
                                  ),
                              child: new Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: <Widget>[

                                  items[index].mtier != null &&
                                          items[index].mtier != 'null'
                                      ? Text(
                                          "    Cycle:" +
                                              items[index].mtier.toString() +
                                              "   ",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[500]),
                                        )
                                      : Text(
                                          "    Cycle:" + "1" + "   ",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[500]),
                                        ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            new Padding(
                              padding: new EdgeInsets.only(

                                  ),
                              child: new Row(
                                textBaseline: TextBaseline.alphabetic,
                                //crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: <Widget>[
                                  new Icon(Icons.phone,
                                      color: Colors.green, size: 18.0),
                                  new Text(
                                    items[index].mmobno.toString(),
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    new ButtonTheme(
                      padding: new EdgeInsets.all(2.0),
                      child: new ButtonBar(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          widget.type == "Loan Application" ||
                                  widget.type == "Loan collection" ||
                              widget.type == "Credit Card" ||
                                  mIsProspectRepeatNeeded == 0
                              ? null
                              : new IconButton(
                                  icon: new Icon(
                                    FontAwesomeIcons.clipboardCheck,
                                    color: (items[index].misCbCheckDone == 1 ||
                                                items[index].misCbCheckDone ==
                                                    2) &&
                                            DateTime.now().difference(
                                                    items[index]
                                                        .mcbcheckrprtdt) <=
                                                Duration(days: highmarkValidity)
                                        ? Colors.grey
                                        : Colors.green,
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    if ((items[index].misCbCheckDone == 1 ||
                                            items[index].misCbCheckDone == 2) &&
                                        DateTime.now().difference(
                                                items[index].mcbcheckrprtdt) <
                                            Duration(days: highmarkValidity)) {
                                      showMessageWithoutProgress(
                                          "Highmark Result is "
                                          "${items[index].misCbCheckDone == 1 ? 'Pass' : 'Fail'}");
                                    } else {

                                    }
                                  },
                                ),
                          widget.type == "Loan Application" ||
                                  widget.type == "Loan collection"
                              ||
                              widget.type == "Credit Card"
                              ? null
                              : new Container()
                          /*IconButton(
                                  icon: new Icon(
                                    FontAwesomeIcons.chartPie,
                                    color: Colors.orange[400],
                                    size: 25.0,
                                  ),
                                  onPressed: () async {
                                    showMessageWithoutProgress(
                                        "Customer 360 will be devloped lateron");
                                  },
                                ),*/
                          /* widget.type == "Loan Application" ||
                                  widget.type == "Loan collection"
                              ? null
                              : isSyncedIndex
                                  ? new IconButton(
                                      icon: new Icon(
                                        FontAwesomeIcons.sync,
                                        color: Colors.orange[400],
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        _syncCustomerToMiddleware(items[index]);
                                      },
                                    )
                                  : new IconButton(
                                      icon: new Icon(
                                        FontAwesomeIcons.sync,
                                        color: Colors.grey,
                                        size: 25.0,
                                      ),
                                      onPressed: () async {
                                        showMessageWithoutProgress(
                                            "Customer Already Synced");
                                      },
                                    ),*/
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

  Widget build(BuildContext context) {
    var futureBuilderNotSynced;
    if (count == 1) {
      count++;
      try {
        print(CustomerListBean);
        futureBuilderNotSynced = new FutureBuilder(
            future: AppdatabaseV2.get()
                .selectCustomerList()
                .then((List<CustomerListBean> customerData) async{
              items.clear();
              storedItems.clear();
              customerData.forEach((f) async{
                print("f.mfname");
                print(f.mfname);
                  items.add(f);
                  storedItems.add(f);
              });
              return storedItems;

            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return new Text('Press button to start');
                case ConnectionState.waiting:
                  return new Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16.0),
                      child:
                          new CircularProgressIndicator()); // new Text('Awaiting result...');
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return getHomePageBody2(context, snapshot);
              }
            });
      } catch (e) {
        futureBuilderNotSynced = new Text("Nothing To display");
      }
    } else if (items != null) {
      futureBuilderNotSynced = ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI2,
        padding: EdgeInsets.all(0.0),
      );
    } else
    futureBuilderNotSynced = new Text("nothing to display");
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
        },
        child: new Scaffold(
          key: _scaffoldHomeState,
          appBar: new AppBar(
              elevation: 3.0,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
                              prefixIcon:
                                  new Icon(Icons.search, color: Colors.white),
                              hintText: "Search...",
                              hintStyle: new TextStyle(color: Colors.white)),
                          onChanged: (val) {
                            filterList(val.toLowerCase());
                          },
                        );
                      } else {
                        String custListLeng = storedItems != null &&
                                storedItems.length != null &&
                                storedItems.length > 0
                            ? "/" + storedItems.length.toString()
                            : "";
                        this.actionIcon = new Icon(Icons.search);
                        this.appBarTitle =
                            new Text("Customer List" + custListLeng);
                        items = new List<CustomerListBean>();
                        items.clear();
                        storedItems.forEach((val) {
                          items.add(val);
                        });
                      }
                    });
                  },
                ),
              ]),
          floatingActionButton: widget.type == "Loan Application"
              ? null
              : new FloatingActionButton(
                  child: new Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  //backgroundColor: Color(0xff07426A),
                  backgroundColor: Colors.green,
                  onPressed: //_insertDummies
                      loadNewCustomerRequestPage),
          body: new Container(
              color: const Color(0xff07426A), child: futureBuilderNotSynced),
        ));
  }

  void loadNewCustomerRequestPage() async {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new CustomerFormationMasterTabs(
              widget.firstParms,
              null)), //When Authorized Navigate to the next screen
    );
  }

  IconData getIcon(bool isNegative) {
    IconData icon;
    isNegative ? icon = Icons.arrow_drop_down : icon = Icons.arrow_drop_up;
    return icon;
  }

  void printIt(String ab) {
    // print(ab);
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    try {
      _scaffoldHomeState.currentState.hideCurrentSnackBar();
    } catch (e) {}
    _scaffoldHomeState.currentState.showSnackBar(new SnackBar(
      backgroundColor: color,
      content: new Row(
        children: <Widget>[
          const CircularProgressIndicator(),
          new Text(message)
        ],
      ),
      duration: Duration(seconds: 20),
    ));
  }

  void showMessageWithoutProgress(String message,
      [MaterialColor color = Colors.red]) {
    try {
      _scaffoldHomeState.currentState.hideCurrentSnackBar();
    } catch (e) {}
    _scaffoldHomeState.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _onTapItem(BuildContext context, CustomerListBean bean) async {
    isCustFoundInDedup=false;
    isDedupDone=true;
    if (widget.type == "Loan Application" || widget.type == "Loan collection" || widget.type == "Credit Card") {
      Navigator.of(context).pop(bean);
    } else {
      if(bean.addressDetails==null){
        bean.addressDetails = new List<AddressDetailsBean>();
      }
      if(bean.familyDetailsList==null){
        bean.familyDetailsList = new List<FamilyDetailsBean>();
      }
      if(bean.customerBusinessDetailsBean==null){
        bean.customerBusinessDetailsBean =  new List<CustomerBusinessDetailsBean>();
      }
      if(bean.borrowingDetailsBean==null){
        bean.borrowingDetailsBean = new List<BorrowingDetailsBean>();
      }
      if(bean.socialFinancialList==null){
        bean.socialFinancialList = new List<SocialFinancialDetailsBean>();
      }

      if(bean.esmsentity==null){
        bean.esmsentity = new ESMSBean();
      }
      if(bean.riskratingsentity==null){
        bean.riskratingsentity = new RiskRatingsBean();
      }

      // for (int i = 0; i < 23; i++) {
      //   bean.imageMaster.add(new ImageBean());
      // }
      await routeToCustomerScreenForModificationOfData(bean);
    }
  }

  routeToCustomerScreenForModificationOfData(CustomerListBean bean) {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              new CustomerFormationMasterTabs(widget.firstParms, bean),
        ));
  }


  String ifNullCheck(String value) {
    if (value == null || value == 'null') {
      value = "";
    }
    return value;
  }


}
