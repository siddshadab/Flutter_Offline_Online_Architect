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
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


class GetLoanFromLos {
  static String urlGetLosRouting = "routeRequestController/routeGetMirrorRequest";
  static final _headers = {'Content-Type': 'application/json'};
  static const JsonCodec JSON = const JsonCodec();
  String baseUrl = "http://172.25.1.185:8080/omniNGLCS/ws/rest/";

  Future<List<CustomerLoanDetailsBean>> getAndSaveLoanData(String userName,String lastUpdatedDate) async {
    List<CustomerLoanDetailsBean> bean = new List<CustomerLoanDetailsBean>();
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
     // baseUrl = prefs.getString(TablesColumnFile.LOSBASEURL);
    }catch(_){}
    try {
      final bodyValue = await NetworkUtil.callGetService(Constant.apiURL.toString() + urlGetLosRouting.toString()+"?URI="+baseUrl+"getLoanData?userName=${userName}&lastUpdatedDate=${lastUpdatedDate}");
      if(bodyValue == "404" ){
        return null;
      }
      print(bodyValue);
      await _fromJson(bodyValue);
    } catch (e) {
      print('Server Exception!!!');

    }
  }

  Future<List<CustomerLoanDetailsBean>> _fromJson(String json) async{
    List list = JSON.decode(json);
    for (int i = 0; i < list.length; i++) {
      print(list);
      //TODO first search if loan already present in local database if not then inser otherwise update
      //TODO check if loan customer no (CIF) is already present in database which should be attached in loan
      var uuid = Uuid();
      CustomerLoanDetailsBean loanListBean = new CustomerLoanDetailsBean();
      loanListBean.UUID=uuid.v4();
      //TODO Add below var later on
      //loanListBean.UUID = CUSTUUID;
      //loanListBean.UUID = mcreateddt;
      //loanListBean.UUID =mcreatedby;
      //loanListBean.UUID =mlastupdatedt;
      //loanListBean.UUID =mlastupdateby;
      //loanListBean.UUID =mgeolocation;
      //loanListBean.UUID =mgeolatd;
      //loanListBean.UUID =mgeologd;
      //loanListBean.UUID =missynctocoresys;
      await AppdatabaseV2.get().insertLoanMaster(loanListBean,list[i])
          .then((onValue) {
      });
    }
  }

}

