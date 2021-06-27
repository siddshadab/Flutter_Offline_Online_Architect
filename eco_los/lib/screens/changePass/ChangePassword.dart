import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info/device_info.dart';
import 'dart:async';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/app_constant.dart' as constant;
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;



class ChangePassword extends StatefulWidget {

  String routedFrom;
  ChangePassword(this.routedFrom);
  @override
  _ChangePasswordState createState() => new _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {



  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LoginBean beanObj = new LoginBean();
  static const JsonCodec JSON = const JsonCodec();
  static String _serviceUrl = "/userDetailsMaster/changePassword/";
  static final _headers = {'Content-Type': 'application/json'};



  String newPass;
  String newCnfrmPass;
  bool autovalidateVar  = false;
  @override
  void initState() {
    getSessionVariables();
  }
  void getSessionVariables() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      beanObj.musrcode = prefs.get(TablesColumnFile.musrcode);
    });

  }


  callDialog(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(onWillPop: () {
          callDialog();
    },
        child: new Scaffold(

            key: _scaffoldKey,
            appBar: new AppBar(
              elevation: 1.0,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  callDialog();
                },
              ),
              backgroundColor: Color(0xff01579b),
              brightness: Brightness.light,
              title: new Text(
                'Change Password',
                //textDirection: TextDirection,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
            ),

            body: new SafeArea(top: false,
              bottom: false,
              child: new Form(
                key: _formKey,
                onWillPop: () {
                  Navigator.of(context).pop();
                },
                onChanged: () {
                  final FormState _form2 = _formKey.currentState;
                  _form2.save();
                },
                autovalidate:  autovalidateVar,
                child: SingleChildScrollView(
                    child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),


                          Container(
                              child: new TextFormField(
                                decoration: const InputDecoration(
                                  hintText: constant.userCode,
                                  labelText: constant.userCode,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  enabled: false,
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  contentPadding: EdgeInsets.all(20.0),
                                ),
                                enabled: false,
                                controller: new TextEditingController(text: beanObj.musrcode),

                              )),



                          Container(
                              decoration:
                              BoxDecoration(color: Constant.mandatoryColor),
                              child: new TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Enter Current Password",
                                  labelText: "Current Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      decorationColor: Colors.red),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  contentPadding: EdgeInsets.all(20.0),
                                ),
                                obscureText: true,

                                validator: (String arg) {
                                  if (arg==null)
                                  return 'Current password must not be blank';
                                  else if (arg.length < 3)
                                    return 'Current password must be more than 2 charater';
                                  else
                                    return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                controller: beanObj.musrpass == null
                                    ? TextEditingController(text: null)
                                    : TextEditingController(
                                    text: beanObj.musrpass),
                                onSaved: (val) {
                                  if(val!=null) beanObj.musrpass  = val;
                                },
                              )),

                          Container(
                              decoration:
                              BoxDecoration(color: Constant.mandatoryColor),
                              child: new TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Enter New Password",
                                  labelText: "New Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      decorationColor: Colors.red),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  contentPadding: EdgeInsets.all(20.0),
                                ),
                                obscureText: true,

                                validator: (String arg) {
                                  if (arg==null )
                                    return 'new Password should not be null';
                                  else if (arg.length < 8)
                                    return 'Password must be more than 8 charater';
                                  else if (!RegExp(
                                      r'[!@#$%<>?":_`~;[\]\\|=+)(*&^%]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Special Character Req";
                                  }  else if (arg!= null&&beanObj.musrpass==arg) {
                                    return "New Password must not same as current";
                                  }
                                  else if (!RegExp(
                                      r'[A-Z]')
                                      .hasMatch(arg)) {
                                    return "Atleast One UpperCase Character Req";
                                  }else if (!RegExp(
                                      r'[a-z]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Lower Case Character Req";
                                  }
                                  else if (!RegExp(
                                      r'[0-9]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Numeric Required";
                                  }else
                                    return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                onSaved: (val) {

                                  if(val!=null) newPass = val;
                                },
                              )),





                          Container(
                              decoration:
                              BoxDecoration(color: Constant.mandatoryColor),
                              child: new TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Confirm Password",
                                  labelText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      decorationColor: Colors.red),
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      )),
                                  contentPadding: EdgeInsets.all(20.0),
                                ),
                                obscureText: true,

                                validator: (String arg) {
                                  if (arg==null )
                                    return 'new Password should not be null';
                                  else if (arg.length < 8)
                                    return 'Password must be more than 8 charater';
                                  else if (!RegExp(
                                      r'[!@#$%<>?":_`~;[\]\\|=+)(*&^%-]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Special Character Req";
                                  }
                                  else if (!RegExp(
                                      r'[A-Z]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Upper Case Character Req";
                                  }else if (!RegExp(
                                      r'[a-z]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Lower Case Character Req";
                                  }else if (arg!= null&&beanObj.musrpass==arg) {
                                    return "New Password must not same as current";
                                  }
                                  else if (!RegExp(
                                      r'[0-9]')
                                      .hasMatch(arg)) {
                                    return "Atleast One Numeric Required";
                                  }else if (newPass != newCnfrmPass) {
                                    return "New Pass  and confirm Must Match";
                                  } else
                                    return null;
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(30),
                                ],
                                onSaved: (val) {
                                  newCnfrmPass= val;
                                },
                              )),



                          SizedBox(height:40.0),


                          Center(
                            child:  new Container(

                                child: new RaisedButton(
                                    child: const Text(
                                      'Change Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {

                                       tryChangePassword();
                                    })),

                          )




                          ]
                    )
                ),

              ),

            )
        )
    );
  }


  Future<Null> tryChangePassword() async {

    final FormState form = _formKey.currentState;

    bool netAvail = false;
    Utility obj = new Utility();
    netAvail = await obj.checkIfIsconnectedToNetwork();
    if (netAvail == false) {
      showInSnackBar("Network Not available");
      return;
    }


    if (form.validate()) {
      form.save();
      _performChangePassword();
    } else {
      setState(() => autovalidateVar = true);
      showInSnackBar('Please fix the errors in red before submitting.');
    }

  }


  Future _performChangePassword() async {

    LoginBean loginBean = new LoginBean();
    loginBean.musrcode = beanObj.musrcode;

    //try {

      String json =  await _toJson(beanObj);
        String bodyValue = await NetworkUtil.callPostService(json.toString(),
            Constant.apiURL.toString() + _serviceUrl.toString(), _headers);
        print("url " + Constant.apiURL.toString() + _serviceUrl.toString());
        print("returned value is "+bodyValue.toString());
        if (bodyValue == "404"|| bodyValue ==null) {
          return null;
        } else {
          print("trying to parse");
          LoginBean obj = await _fromLoginJson(bodyValue);


              print("error is ${obj.merror}");
          if(obj.merror==0){

            await AppDatabase.get().getLoginPass(loginBean).then((returnBean) async{
              if (returnBean == null) {

              }else if(returnBean.musrpass == loginBean.musrpass){
                loginBean.musrpass = beanObj.musrpass;
                await AppDatabase.get().updateUserPassword(loginBean);

              }
            });
            success("Password Changed", context);

          }
          else{
            showErrorDialog(obj.merror, obj.merrormessage);
          }

        }


    /*} catch(error){
    }*/





  }

  Future<LoginBean> _fromLoginJson(String json) async{
    Map<String, dynamic> map = JSON.decode(json);
    print(json + " form jso obj response" + "here is" + map.toString());
    var bean = LoginBean.fromMap(map);
    return bean;
  }


  void showInSnackBar(String value, [Color color]) {
    try {
      _scaffoldKey.currentState.hideCurrentSnackBar();
    } catch (e) {}
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      backgroundColor: color != null ? color : null,
    ));
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
                child: Text('Ok'),
                onPressed: () {

                  if(widget.routedFrom=="login"){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();



                    /*Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomeDashboard()), //When Authorized Navigate to the next screen
                    );*/

                  }else{
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }

                },
              ),
            ],
          );
        });
  }
  showErrorDialog(int errorCode, String message) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.cancel,
              color: Colors.red,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        });
  }


  Future<String> _toJson(LoginBean loginBean) async{
    var mapData = new Map();
    mapData[TablesColumnFile.musrcode] = loginBean.musrcode;
    mapData[TablesColumnFile.musrpass] = loginBean.musrpass+"~"+newPass;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    mapData[TablesColumnFile.mregdevicemacid] = androidInfo.androidId;
    mapData[TablesColumnFile.mlastupdatedt] = DateTime.now().toIso8601String();


    String json = JSON.encode(mapData);
    print(json.toString());
    return json;
  }

}