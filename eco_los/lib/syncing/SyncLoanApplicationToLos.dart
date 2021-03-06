import 'dart:async';
import 'dart:convert';

import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/syncing/bean/LosResponseBean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SyncLoanApplicationToLos{

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  static Utility obj = new Utility();
  static final _headers = {'Content-Type': 'application/json'};
  var urlGetLosRouting =  "routeRequestController/routeMirrorRequest/";
  static const JsonCodec JSON = const JsonCodec();
  //String baseUrl = "http://172.25.1.185:8080/omniNGLCS/ws/rest";
  String baseUrl = "http://172.25.2.202:8080/LoanOriginationSystem/rest/ws/generateLead";


  Future<LosResponseBean> tryFind(String jsonObj) async {
    bool isNetworkAvailable;
    isNetworkAvailable = await obj.checkIfIsconnectedToNetwork();
    if (isNetworkAvailable) {
      return await getMiddleWareData(jsonObj);
    }
  }

  Future<LosResponseBean> getMiddleWareData(String jsonObj) async{
    LosResponseBean losResponseBean = new LosResponseBean();
    String json;
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
       baseUrl = prefs.getString(TablesColumnFile.LOSBASEURL);
    }catch(_){}
    json = await getJson(jsonObj);
    String bodyValue = await NetworkUtil.callPostService(json.toString(),
        Constant.apiURL.toString() + urlGetLosRouting.toString(), _headers);

    if (bodyValue == "404" || bodyValue == null) {
      print("404");
      return null;
    } else {

      losResponseBean = await _fromLosResponseBean(bodyValue);
      return losResponseBean;

    }
  }

  Future<LosResponseBean> _fromLosResponseBean(String json) async{
    Map<String, dynamic> map = JSON.decode(json);
    var bean = LosResponseBean.fromMap(map);
    return bean;
  }

  Future<String> getJson(String jsonobj) async {
    var mapData = new Map();
    mapData["iptorouteservice"] =  baseUrl;
    mapData["jsonObj"] = jsonobj;
    String json = JSON.encode(mapData);
    return json;
  }

  String ifNullCheck(String param) {
    if (param == null)
      return "";
    else
      return param;
  }
}