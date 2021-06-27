import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';


class LookupDataServices {
  static String apiURL =
      "lookupMasterController/getAllLookup/";
  static final _headers = {'Content-Type': 'application/json'};
  static const JsonCodec JSON = const JsonCodec();

  Future<List<LookupMasterBean>> getLookupData() async {
    List<LookupMasterBean> lookupMaster = new List<LookupMasterBean>();
  try {
    final bodyValue = await NetworkUtil.callGetService(Constant.apiURL+"lookupMasterController/getAllLookup/");
    if(bodyValue == "404" ){
      return null;
    }
    print(bodyValue);
      lookupMaster = await _fromLookupJson(bodyValue);
  //  AppDatabase.get().updateStaticTablesLastSyncedMasterGetFromServer(9,DateTime.now());
      return lookupMaster;
   } catch (e) {
      print('Server Exception!!!');
      return lookupMaster;
    }
  }

  Future<List<LookupMasterBean>> _fromLookupJson(String json) async{
    List<LookupMasterBean> listLookupBean = new List<LookupMasterBean>();
    List list = JSON.decode(json);
    for (int i = 0; i < list.length; i++) {
      print(list);
      var bean = LookupMasterBean.fromJson(list[i]);
      listLookupBean.add(bean);
    }
    return listLookupBean;
  }


}

