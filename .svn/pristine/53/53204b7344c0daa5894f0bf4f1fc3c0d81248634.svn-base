import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:io';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/changePass/ChangePassword.dart';
import 'package:eco_los/screens/home/Home_Dashboard.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/syncing/LoginServices.dart';
import 'package:eco_los/screens/login/application.dart';
import 'package:eco_los/screens/login/translations.dart';

import 'package:eco_los/systems/settings/Settings.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class LoginServices {

static final _headers = {'Content-Type': 'application/json'};
static const JsonCodec JSON = const JsonCodec();




Future<LoginBean> login(LoginBean login) async {
  LoginBean loginBean = new LoginBean();
  // try {
  String json =  await _toJson(login);
  print(json);
  final bodyValue = await NetworkUtil.callPostService(json,Constant.apiURL+"userDetailsMaster/loginValidation",_headers);
  print(bodyValue);
  if(bodyValue == 'error'){
    return null;
  }
  loginBean = await _fromLoginJson(bodyValue);
  print("onvalue "+loginBean.merrormessage );
  print("onvalue "+loginBean.merror.toString() );
  return loginBean;
  /* } catch (e) {
      print('Server Exception!!!');
      if (loginBean.errorMessage == null) {
        loginBean.error = 1002;
        loginBean.errorMessage =
            'Error in Connectivity with middleware found?or some system issue found';
      } else {}

      return loginBean;
    }*/
}

Future<String> _toJson(LoginBean loginBean) async{
  var mapData = new Map();
  mapData[TablesColumnFile.apkversion] = globals.version.toString();

  mapData[TablesColumnFile.musrcode] = loginBean.musrcode;
  mapData[TablesColumnFile.musrpass] = loginBean.musrpass;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  mapData[TablesColumnFile.mregdevicemacid] = androidInfo.androidId;//"abc";
  String json = JSON.encode(mapData);
  print(json);
  return json;
}

Future<LoginBean> _fromLoginJson(String json) async{
  Map<String, dynamic> map = JSON.decode(json);
  print(json + " form jso obj response" + "here is" + map.toString());
  var bean = LoginBean.fromMap(map);
  return bean;
}
}