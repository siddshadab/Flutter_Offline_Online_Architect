import 'dart:async';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesList.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/Guarantor/AddGuarantor.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetailsBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
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
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class GuarantorDetails extends StatefulWidget {
  final String LOANUUID;
  final String routeType;
  final bool isEditAllowed;
  final String mprdCd;


  GuarantorDetails(this.LOANUUID, this.routeType,this.isEditAllowed,this.mprdCd);
  @override
  _GuarantorDetails createState() => new _GuarantorDetails();
}

class _GuarantorDetails extends State<GuarantorDetails> {
  GuarantorDetailsBean gauDetObj = new GuarantorDetailsBean();
  List<GuarantorDetailsBean> items = new List<GuarantorDetailsBean>();
  List<GuarantorDetailsBean> storedItems =
  new List<GuarantorDetailsBean>();
  Widget appBarTitle = new Text("Guarantor/Co-applicant/Spouse - Details");
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
    if(widget.LOANUUID!=null){
      if(widget.LOANUUID!=null){
        gauDetObj.LOANUUID =widget.LOANUUID;

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


    if (items[index].mprdacctid != null &&
        items[index].mprdacctid != "null" &&
        items[index].mprdacctid != "") {
      mprdcd = items[index].mprdacctid.substring(0, 8).trim();
      custNo = items[index].mprdacctid.substring(8, 16);
      prcdAcctId = items[index].mprdacctid.substring(16, 24);
    }


    if (custNo == null || custNo == 'null' || custNo.trim() == "") {
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
        _onTapItem(items[index],widget.LOANUUID);
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
                        "  ${items[index].mnameofguar.toUpperCase()}",
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
                                "UUID :   " +
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
                                    new IconButton(
                                      icon: new Icon(Icons.delete_forever, color: Colors.red),
                                      onPressed: () => {_deleteIt(items[index].UUID)},
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
                                  new Text(
                                    " Customer No Of Tab: ${items[index].mcustno}",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  new Text(
                                    " CUSTUUID: ${items[index].CUSTUUID}",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[500],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10.0,
                                  ),

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
    var guarDetailsBuilder;
    if (count == 1) {
      count++;
      guarDetailsBuilder = new FutureBuilder(
          future:AppdatabaseV2.get()
              .selectGuarList('SELECT * FROM ${TablesList.GUARANTERMASTER} Order by ${TablesColumnFile.mlastupdatedt} DESC')
              .then((List<GuarantorDetailsBean> guarantorDetailsBean) async{
            items.clear();
            storedItems.clear();
            guarantorDetailsBean.forEach((f) async{
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
                else {
                  //  print("trying to run homepage");
                  return getHomePageBody(context, snapshot);
                }
            }
          });
    }else if(storedItems != null){
      guarDetailsBuilder = ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.all(0.0),
      );
    }
    else {
      guarDetailsBuilder = new Text("nothing to display");
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
                  items = new List<GuarantorDetailsBean>();
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
      floatingActionButton:widget.isEditAllowed?new FloatingActionButton(
          child: new Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            _addNewGuarantor();

          }):new Container(),
      body: guarDetailsBuilder,
    );
  }
  void _addNewGuarantor() {
    print(" Inside _addNewGuarantor");
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new AddGuarantor(LOANUUID:null,isEditAllowed: widget.isEditAllowed,mprdCd: widget.mprdCd,
          )), //When Authorized Navigate to the next screen
    );
  }

  void _onTapItem(GuarantorDetailsBean item,String LOANUUID) {
    print("inside on tap gau det");
    for (var itemss in items.toString().split(",")) {
      print(itemss);
    }
    print(item);
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new AddGuarantor(LOANUUID: LOANUUID,gaurantorDetailsPassedObject: item,isEditAllowed:widget.isEditAllowed,mprdCd: widget.mprdCd,
          )), //When Authorized Navigate to the next screen
    );
  }

  void filterList(String val) async {
    items.clear();

    storedItems.forEach((obj) {
      if (obj.mnameofguar.toString().contains(val) ||
          obj.UUID.toString().toLowerCase().contains(val) ||
          obj.mmobile.toString().contains(val) ||
          obj.mnationaliddesc.toString().contains(val) ||
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

  _deleteIt(String UUID) async{

  }

}

