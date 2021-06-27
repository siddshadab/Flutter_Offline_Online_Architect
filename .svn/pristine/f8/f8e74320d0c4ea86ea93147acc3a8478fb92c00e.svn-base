import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/login/LoginBean.dart';


class GetHbsUSers{


  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  static Utility obj = new Utility();
  static final _headers = {'Content-Type': 'application/json'};
  var urlPostHbsUsers=
      "userDetailsMaster/getHbsUsers/";
  static const JsonCodec JSON = const JsonCodec();


  Future<Null> trySave(int lbrCode) async {
    bool isNetworkAvailable;

    isNetworkAvailable = await Utility.checkIntCon();
    if (isNetworkAvailable) {
      await getMiddleWareData(lbrCode, urlPostHbsUsers);
    }
  }

  Future<Null> getMiddleWareData(
      int lbrCode, String url) async {

    try {
      String json2 = _toJsonOfAgentUserName(lbrCode);
      String bodyValue  = await NetworkUtil.callPostService(json2,Constant.apiURL.toString()+url.toString(),_headers);
      print("body val "+bodyValue.toString());
      if(bodyValue == "404" ){
        return null;
      }else if(bodyValue!=null && bodyValue.toString() !='null') {
        final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
        await AppDatabase.get().deletSomeSyncingActivityFromOmni('Get_Hbs_Users');
        List<LoginBean> obj =
        parsed.map<LoginBean>((json) => LoginBean.fromMap(json)).toList();
        for (LoginBean items in obj) {
          await AppDatabase.get().updateGetHbsUsers(items);
        }


      }
    } catch (e) {}
  }


  String _toJsonOfAgentUserName(int lbrCode) {
    print(lbrCode.toString());
    var mapData = new Map();
    mapData[TablesColumnFile.musrbrcode] = lbrCode;
    String json = JSON.encode(mapData);
    print(json.toString());
    return json;
  }
}