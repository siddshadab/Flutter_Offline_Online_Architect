import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class GetCustomersFromLos {
  static String urlGetLosRouting = "routeRequestController/routeGetMirrorRequest";
  static final _headers = {'Content-Type': 'application/json'};
  static const JsonCodec JSON = const JsonCodec();
  String baseUrl = "http://172.25.1.185:8080/omniNGLCS/ws/rest/";

  Future<List<CustomerListBean>> getAndSaveCustomerData(String userName,String lastUpdatedDate) async {
    List<CustomerListBean> bean = new List<CustomerListBean>();
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
     // baseUrl = prefs.getString(TablesColumnFile.LOSBASEURL);
    }catch(_){}
    try {
      String str = Constant.apiURL.toString() + urlGetLosRouting.toString()+"?URI="+baseUrl+"getCustomerData?userName="+userName+"&lastUpdatedDate="+lastUpdatedDate;
      print(str);
      final bodyValue = await NetworkUtil.callGetService(Constant.apiURL.toString() + urlGetLosRouting.toString()+"?URI="+baseUrl+"getCustomerData?userName=${userName}&lastUpdatedDate=${lastUpdatedDate}");
      if(bodyValue == "404" ){
        return null;
      }
      print(bodyValue);
      await _fromLookupJson(bodyValue);
    } catch (e) {
      print('Server Exception!!!');

    }
  }

  Future<List<CustomerListBean>> _fromLookupJson(String json) async{
    List list = JSON.decode(json);
    for (int i = 0; i < list.length; i++) {
      print(list);
      //TODO first search if custs already present in local database if not then inser otherwise update
      var uuid = Uuid();
      CustomerListBean custListBean = new CustomerListBean();
      custListBean.UUID=uuid.v4();
      //TODO Add below var later on
      //custListBean.UUID = mcreateddt;
      //custListBean.UUID =mcreatedby;
      //custListBean.UUID =mlastupdatedt;
      //custListBean.UUID =mlastupdateby;
      //custListBean.UUID =mgeolocation;
      //custListBean.UUID =mgeolatd;
      //custListBean.UUID =mgeologd;
      //custListBean.UUID =missynctocoresys;
      await AppdatabaseV2.get().insertCustomerMaster(custListBean,list[i])
          .then((onValue) {
      });
    }
  }

}

