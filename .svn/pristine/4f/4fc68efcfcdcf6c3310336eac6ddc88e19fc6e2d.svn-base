import 'dart:async';
import 'dart:convert';
import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/LoanApplication/bean/CustomerLoanDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/documentCollector/DocumentCollectorBean.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class GetDocumentsFromLos {
  static String urlGetLosRouting = "routeRequestController/routeGetMirrorRequest";
  static final _headers = {'Content-Type': 'application/json'};
  static const JsonCodec JSON = const JsonCodec();
  String baseUrl = "http://172.25.1.185:8080/omniNGLCS/ws/rest/";

  Future<List<DocumentCollectorBean>> getAndSaveDocumentsData(String userName,String lastUpdatedDate) async {
    List<DocumentCollectorBean> bean = new List<DocumentCollectorBean>();
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //baseUrl = prefs.getString(TablesColumnFile.LOSBASEURL);
    }catch(_){}
    try {
      final bodyValue = await NetworkUtil.callGetService(Constant.apiURL.toString() + urlGetLosRouting.toString()+"?URI="+baseUrl+"getDocumentsData?userName=${userName}&lastUpdatedDate=${lastUpdatedDate}");
      if(bodyValue == "404" ){
        return null;
      }
      print(bodyValue);
      await _fromJson(bodyValue);
    } catch (e) {
      print('Server Exception!!!');

    }
  }

  Future<List<DocumentCollectorBean>> _fromJson(String json) async{
    List list = JSON.decode(json);
    for (int i = 0; i < list.length; i++) {
      print(list);
      //TODO first search if loan already present in local database if not then inser otherwise update
      //TODO check if loan  no (Loan number) is already present in database which should be attached in in document
      //TODO check if loan customer no (CIF) is already present in database which should be attached in Document
      var uuid = Uuid();
      DocumentCollectorBean documentsListBean = new DocumentCollectorBean();
      documentsListBean.UUID=uuid.v4();
      //TODO Add below var later on
      //documentsListBean.UUID = CUSTUUID;
      //documentsListBean.UUID = LOANUUID;
      //documentsListBean.UUID = mcreateddt;
      //documentsListBean.UUID =mcreatedby;
      //documentsListBean.UUID =mlastupdatedt;
      //documentsListBean.UUID =mlastupdateby;
      //documentsListBean.UUID =mgeolocation;
      //documentsListBean.UUID =mgeolatd;
      //documentsListBean.UUID =mgeologd;
      //documentsListBean.UUID =missynctocoresys;
      await AppdatabaseV2.get().insertDocumentsMaster(documentsListBean,list[i])
          .then((onValue) {
      });
    }
  }

}

