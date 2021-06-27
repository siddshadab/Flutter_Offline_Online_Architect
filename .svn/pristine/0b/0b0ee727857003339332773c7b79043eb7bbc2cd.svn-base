library globals;

import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BorrowingDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FamilyDetailsBean.dart';
import 'package:eco_los/screens/home/Home_Dashboard.dart';
import 'package:eco_los/screens/login/Login.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';


int branchCode;
bool accepted = false;
bool isDedupDone= false;
bool isCustFoundInDedup= false;
DateTime applicationDate;
String agentUserName;
double income = 0.0;
bool circleIndicator=false;
String version;
//Variables
bool isLoggedIn = false;
String token = "";
String domain = "";
String apiURL = "http://Localhost:8090/countries/get/india/";
String error = "";
String cntryCd = "";
String countryName = "";
String stateCd = "";
String stateDesc = "";
int distCd = 0;
String distDesc = "";
String placeCd ;
String placeCdDesc = "";
int areaCd = 0;
String areaDesc = "";
bool imageVisibilityDeclarationFormTagCustomer = false;
int  branchId ;
String reportingUser;


List<String> dropdownCaptionsFamilyDetails = [
  'Education',
  'Relation',
  'Occupation',
  'Maratial Status',
  'Title',
  'Reverse Relationship',
  'Designation'
];


List<List<LookupBeanData>>dropDownCaptionValuesCollateralT24Details=[[], []];
List<List<LookupBeanData>>dropDownCaptionValuesCollateralT24Address=[[],[],[], [], []];
List<List<LookupBeanData>>dropdownCaptionsValuesGuarantorInfo=[ [], [], [], [], [], [], []];
List<List<LookupBeanData>>dropdownCaptionsValuesCollateralsInfo=[ [], [], [], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>>dropdownCaptionsValuesVehicleAcceptanceInfo=[[]];
List<List<LookupBeanData>> dropdownCaptionsValuesPersonalInfo = [ [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>> dropdownCaptionsValuesCollateralVehicleValuation1 = [ [], [], [], [], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>> dropdownCaptionsValuesCollateralVehicleValuation2 = [ [], [], [], [], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>> dropdownCaptionsValuesCollateralVehicleValuation3 = [[], [], [], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>> dropdownCaptionsValuesCollateralVehicleValuation4 = [ [], [], [], [],[], [], [], [], [], [], [], [], [], [], []];
List<List<LookupBeanData>> dropDownCaptionValuesCollateralREMlandandhouse = [[], [], [], [], []];
List<List<LookupBeanData>> dropDownCaptionValuesCollateralREMlandandbuilding= [[], []];
List<List<LookupBeanData>> dropdownCaptionsValuesFamilyDetails = [[], [], [], [], [], [], [] ];
List<List<LookupBeanData>> dropdownCaptionsValuesSocialFinDetails = [[]];
List<List<LookupBeanData>> dropdownCaptionsValuesLoanFromOthrFinanclDetails = [[], [], [],  []  ];
List<List<LookupBeanData>> dropdownCaptionsValuesExpenseDetails = [ [],  []];
List<List<LookupBeanData>> dropdownCaptionsValuesSupplimantaryCardDetails = [  [],  [],  [],  [],  []];
List<List<LookupBeanData>> dropdownCaptionsValuesModeOfPayout = [[]];
List<List<LookupBeanData>> dropdownCaptionsValuesESMS = [[],[],[],[],[],[],[],[],[],[]];
List<List<LookupBeanData>> dropdownCaptionsValuesRiskRatings = [[],[],[],[],[],[],[],[],[],[],[]];
List<List<LookupBeanData>> dropdownCaptionsValuesESMS2 = [[],[]];
List<List<LookupBeanData>> dropdownCaptionsValuesKyc = [[], [],[]];
List<List<LookupBeanData>> dropdownCaptionsValuesKycDetails2 = [[],[]];
List<List<LookupBeanData>> dropDownCaptionValuesCOdeKeysSocialFinancial = [  [],  [],  [],  []];
List<List<LookupBeanData>> dropdownCaptionsValuesProfileDetails = [[],[],[]];
List<List<LookupBeanData>> dropDownCaptionValuesBusinessDetails = [[],[],[],[],[],[],[],[],[],[],[]];

BlacklistingTextInputFormatter onlyIntNumber = BlacklistingTextInputFormatter(RegExp(r'[!@#<>?":_`~;[\]\\//, .|=+)(*&^%a-zA-Z-]'));
BlacklistingTextInputFormatter onlyDoubleNumber = BlacklistingTextInputFormatter(RegExp(r'[!@#<>?":_`~;[\]\\//, |=+)(*&^%a-zA-Z-]'));
BlacklistingTextInputFormatter onlyCharacter = BlacklistingTextInputFormatter(RegExp(r'[!@#<>?":_`~;[\]\\//|$=+)(*&^%0-9-]'));
BlacklistingTextInputFormatter onlyAphaNumeric = BlacklistingTextInputFormatter(RegExp(r'[!@#<>?":_`~;[\]\\//|=+)(*&^%-]'));
BlacklistingTextInputFormatter onlydate = BlacklistingTextInputFormatter(RegExp(r'[!@#<>?":_`~;[\]\\//, .|=+)(*&^%a-zA-Z]'));
WhitelistingTextInputFormatter onlyDate = WhitelistingTextInputFormatter(RegExp(r'0-9'));



//Loan Details
List<List<LookupBeanData>> dropdownCaptionsValuesCustLoanDetailsInfo = [[],[],[],[],[],[],[],[],[],[],[], [], []];
List<List<LookupBeanData>> dropDownCaptionDocumentCollecter = [  [],[]];
List<List<LookupBeanData>> dropdownCaptionsValuesCollalteralGold = [[], [],];




class Utility {
  static Future<Null> showAlertPopup(
      BuildContext context, String title, String detail) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (context) => new AlertDialog(
        title: new Text(title),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(detail),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),// user must tap button!

    );
  }

  String validateOnlyCharacterField(String arg) {
    if (arg == null)
      return 'Field cannot be null';
    else if (arg.length < 1)
      return 'Field must have atlest 1 charater';
    else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(arg)) {
      return "no special character allowed";
    } else
      return null;
  }


  String validateOnlyCharacterFieldKhmer(String arg) {

    if (arg == null)
      return 'Field cannot be null';
    else if (arg.length < 1)
      return 'Field must have atlest 1 charater';
    else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(arg)) {
      return "no special character allowed";
    } else
      return null;

  }





  static String validateOnlyCharacterFieldNotMandat(String arg) {
    if (arg != null && arg != "" && arg.length < 3)
      return 'Field must have more than 2 charater';
    else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(arg)) {
      return "no special character allowed";
    } else
      return null;
  }

  static String validateCharacterAndNumberField(String arg) {
    if (arg.length < 1)
      return 'City must Not be Empty';
    else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(arg)) {
      return "no special character allowed";
    } else
      return null;
  }

  static String validateOnlyNumberField(String arg) {
    if (arg.length < 3)
      return 'City must be more than 2 charater';
    else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(arg)) {
      return "no special character allowed";
    } else if (RegExp(r'[a-zA-Z-]').hasMatch(arg)) {
      return "Characters not allowed";
    } else
      return null;
  }

  static Future mockService([dynamic error]) {
    print("Waiting");
    return new Future.delayed(const Duration(seconds: 6), () {
      if (error != null) {
        throw error;
      }
    });
  }



  static Future makeRequest() async {
    var request = await new HttpClient().postUrl(Uri.parse(apiURL));
    request.persistentConnection = false; // Use non-persistent connection.
    var response = await request.close();
  }

  static Future<String> getData(String params) async {
    makeRequest();
    return "";
  }

  static Widget newTextButton(String title, VoidCallback onPressed) {
    return new FlatButton(
      child: new Text(title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold)),
      onPressed: onPressed,
    );
  }

  static Future<bool> checkIntCon() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile){
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi){
      return true;
    }
    return false;
  }

  Future<bool> checkIfIsconnectedToNetwork() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}

class Dialog {
  static Future<bool> onWillPop(
      BuildContext context, String agrs1, String args2, String pageRoute) {
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
            onPressed: () => routePage(context, pageRoute),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  static Future<bool> onPop(BuildContext context, String agrs1, String args2,String pageRoutedFrom) {
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
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              if(pageRoutedFrom=="CustomerFormationMaster"){
                Navigator.of(context).pop();
                CustomerFormationMasterTabsState.custListBean =  new  CustomerListBean();
                CustomerFormationMasterTabsState.addressBean = new AddressDetailsBean();
                CustomerFormationMasterTabsState.fdb = new FamilyDetailsBean();
                CustomerFormationMasterTabsState.cbdb= new CustomerBusinessDetailsBean();
                CustomerFormationMasterTabsState.borrowingDetailsBean = new BorrowingDetailsBean();
                CustomerFormationMasterTabsState.applicantDob ="__-__-____";
                CustomerFormationMasterTabsState.loanDate ="__-__-____";
                CustomerFormationMasterTabsState.famDob = "__-__-____";
                CustomerFormationMasterTabsState.repaymentDate ="__-__-____";
                CustomerFormationMasterTabsState.husDob ="__-__-____";
                CustomerFormationMasterTabsState.EmpFromDate = "__-__-____";
                CustomerFormationMasterTabsState.EmpDateOfImcorp= "__-__-____";
                CustomerFormationMasterTabsState.EmpToDate = "__-__-____";
                CustomerFormationMasterTabsState.id1IssueDate ="__-__-____";
                CustomerFormationMasterTabsState.id1ExpDate ="__-__-____";
                CustomerFormationMasterTabsState.id2IssueDate ="__-__-____";
                CustomerFormationMasterTabsState.id2ExpDate ="__-__-____";
                CustomerFormationMasterTabsState.id3IssueDate ="__-__-____";
                CustomerFormationMasterTabsState.id3ExpDate ="__-__-____";
              }
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }



  static Future<bool> alertPopup(
      BuildContext context, String agrs1, String args2, String pageRoute) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(agrs1),
        content: new Text(args2),
        actions: <Widget>[
          Center(
            child: new FlatButton(
              onPressed: () => alertPopupRoute(context, pageRoute),
              child: new Text('Ok'),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  static alertPopupRoute(BuildContext context, String pageRoute) {
    if (pageRoute == 'Dashboard') {
      Navigator.of(context).pop(true);
    } else if (pageRoute == 'Family') {
      Navigator.of(context).pop(true);
    } else if (pageRoute == 'Same') {
      Navigator.of(context).pop(true);
    } else if(pageRoute == 'LoginPage'){
      Navigator.of(context).pop(true);
    } else if(pageRoute == 'HouseholdExpenditure'){
      Navigator.of(context).pop(true);
    } else if(pageRoute == 'BusinessExpenditure'){
      Navigator.of(context).pop(true);
    } else if(pageRoute == 'AssetDetail'){
      Navigator.of(context).pop(true);
    } else if(pageRoute == 'BusinessExpenditureAlert'){
      Navigator.of(context).pop(true);
    }else if (pageRoute == 'Exit') {
      exit(0);
    }
  }

  static routePage(BuildContext context, String pageRoute) {
    if (pageRoute == 'Login') {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new LoginPage(
                null)), //When Authorized Navigate to the next screen
      );
    } else if (pageRoute == 'CustomerList') {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new CustomerList(null,null)), //When Authorized Navigate to the next screen
      );
    } else if (pageRoute == 'Dashboard') {
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new HomeDashboard()), //When Authorized Navigate to the next screen
      );
    } else if (pageRoute == 'Exit') {
      exit(0);
    }
  }

  static success(String message, BuildContext context, String routeTo) {
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
                  Text(message)
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  routePage(context, routeTo);
                },
              ),
            ],
          );
        }
    );}
}
