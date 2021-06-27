import 'dart:typed_data';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/Helper.dart';
import 'package:eco_los/helpers/SignaturePainter.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationSocialFinancialDetails.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationAddressDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBussinessDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'dart:convert';


class CustomerFormationDeclarationForm extends StatefulWidget {
  CustomerFormationDeclarationForm({Key key}) : super(key: key);

  @override
  _CustomerFormationDeclarationFormState createState() =>
      new _CustomerFormationDeclarationFormState();
}

class _CustomerFormationDeclarationFormState
    extends State<CustomerFormationDeclarationForm> {
  List<CustomModel> customModelsDeclarations = [];

      bool isCalled = false;
      SharedPreferences prefs;
      String usercd;
      String username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSessionVariables();
  }

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      usercd = prefs.getString(TablesColumnFile.musrcode);
      username = prefs.getString(TablesColumnFile.musrname);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ListView(
        children: <Widget>[
          new Text(
            "\n\nDate :  " + DateTime.now().toIso8601String(),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          new Text(
            "\n\Agent Name : ${username}  " ,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          new Text(
            "\n\nAgent Id :  ${usercd}"  ,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
            ),
          ),
          new CheckboxListTile(
            title: new Text(
              "\n\nI Declare that, I have checked and Verify the details, Documents and facts based on the companies rules and the regulations and the procedure",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 10.0,
              ),
            ),
            onChanged: changedDropDownItem,
            activeColor: Color(0xff07426A),
            value: globals.accepted,
          ),
          new Container(
            height: 20.0,
          ),
          new Container(
            height: 20.0,
          )
        ],
      ),
    );
  }

  void changedDropDownItem(bool id) {
    print("Selected Id  $id, we are going to refresh the UI");
    setState(() {
      globals.accepted = id;
      isCalled=true;
    });
  }
























}





