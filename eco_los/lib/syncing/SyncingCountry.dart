import 'dart:convert';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/login/LoginBean.dart';
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';


class SyncingCountry{

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  static Utility obj = new Utility();
  static final _headers = {'Content-Type': 'application/json'};
  var urlGetCountryInfo =
      "countries/getlistOfData/";
  var urlGetStateInfo ="states/getlistOfData/";
  var urlGetDistrictInfo ="districts/getlistOfData/";
  var urlGetSubDistrictInfo ="subdistricts/getlistOfData/";
  var urlGetAreaInfo = "area/getlistOfData/";
  static const JsonCodec JSON = const JsonCodec();


  Future<Null> trySave() async {
    bool isNetworkAvailable = false;
    print("Isside try nsave");

    //isNetworkAvailable = await obj.checkIfIsconnectedToNetwork();
    isNetworkAvailable = await Utility.checkIntCon();
    if (isNetworkAvailable) {
      print("Network Available");
      await getCountryData();
      await getStateData();
      await getDistrictData();
      await getSubDistrictData();
      await getAreaData();
    }
  }

  Future<List<CountryDropDownBean>> getCountryData() async {
    List<CountryDropDownBean> countryMaster = new List<CountryDropDownBean>();
    print("Data after Country Master  1");
    try {

      var bodyValue = await NetworkUtil.callGetService(Constant.apiURL+urlGetCountryInfo);
      if(bodyValue!=null){
        bodyValue = bodyValue.toString().replaceAll("'" , "" );
      }
      final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
      await AppDatabase.get().deletSomeSyncingActivityFromOmni('Country');
      print("data of loan sync " + parsed.toString());
      List<CountryDropDownBean> obj = parsed
          .map<CountryDropDownBean>(
              (json) => CountryDropDownBean.mapFromMiddleware(json))
          .toList();
      for(var elements in obj){
        AppDatabase.get().updatecountryMaster(elements);
      }

      if(bodyValue == "404" ){
        return null;
      }
      print("Data after Country service  " + bodyValue);

      return countryMaster;
    } catch (e) {
      print('Server Exception!!!');
      return countryMaster;
    }
  }

  Future<List<StateDropDownList>> getStateData() async {
    List<StateDropDownList> stateMaster = new List<StateDropDownList>();
    print("Data after State Master  1");
    try {

      var bodyValue = await NetworkUtil.callGetService(Constant.apiURL+urlGetStateInfo);
      if(bodyValue!=null){
        bodyValue = bodyValue.toString().replaceAll("'" , "" );
      }

      final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
      await AppDatabase.get().deletSomeSyncingActivityFromOmni('State');
      print("data of loan sync " + parsed.toString());
      List<StateDropDownList> obj = parsed
          .map<StateDropDownList>(
              (json) => StateDropDownList.mapFromMiddleware(json))
          .toList();
      for(var elements in obj){
        AppDatabase.get().updateStateMaster(elements);
      }

      if(bodyValue == "404" ){
        return null;
      }
      print("Data after State service  " + bodyValue);

      return stateMaster;
    } catch (e) {
      print('Server Exception!!!');
      return stateMaster;
    }
  }

  Future<List<DistrictDropDownList>> getDistrictData() async {
    List<DistrictDropDownList> districtMaster = new List<DistrictDropDownList>();
    print("Data after District Master  1");
    try {

      var bodyValue = await NetworkUtil.callGetService(Constant.apiURL+urlGetDistrictInfo);

      if(bodyValue!=null){
        bodyValue = bodyValue.toString().replaceAll("'" , "" );
      }

      final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
      await AppDatabase.get().deletSomeSyncingActivityFromOmni('District');
      print("data of loan sync " + parsed.toString());
      List<DistrictDropDownList> obj = parsed
          .map<DistrictDropDownList>(
              (json) => DistrictDropDownList.mapFromMiddleware(json))
          .toList();
      for(var elements in obj){
        AppDatabase.get().updateDistrictMaster(elements);
      }

      if(bodyValue == "404" ){
        return null;
      }
      print("Data after District service  " + bodyValue);

      return districtMaster;
    } catch (e) {
      print('Server Exception!!!');
      return districtMaster;
    }
  }

  Future<List<SubDistrictDropDownList>> getSubDistrictData() async {
    List<SubDistrictDropDownList> subdistrictMaster = new List<SubDistrictDropDownList>();
    print("Data after SubDistrict Master  1");
    try {

      var bodyValue = await NetworkUtil.callGetService(Constant.apiURL+urlGetSubDistrictInfo);

      if(bodyValue!=null){
        bodyValue = bodyValue.toString().replaceAll("'" , "" );
      }

      final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
      await AppDatabase.get().deletSomeSyncingActivityFromOmni('SubDistrict');
      print("data of loan sync " + parsed.toString());
      List<SubDistrictDropDownList> obj = parsed
          .map<SubDistrictDropDownList>(
              (json) => SubDistrictDropDownList.mapFromMiddleware(json))
          .toList();
      for(var elements in obj){
        AppDatabase.get().updateSubDistrictMaster(elements);
      }

      if(bodyValue == "404" ){
        return null;
      }
      print("Data after SubDistrict service  " + bodyValue);

      return subdistrictMaster;
    } catch (e) {
      print('Server Exception!!!');
      return subdistrictMaster;
    }
  }

  Future<List<AreaDropDownList>> getAreaData() async {
    List<AreaDropDownList> areaMaster = new List<AreaDropDownList>();
    print("Data after Area Master  1");
    try {

      var bodyValue = await NetworkUtil.callGetService(Constant.apiURL+urlGetAreaInfo);

      if(bodyValue!=null){
        bodyValue = bodyValue.toString().replaceAll("'" , "" );
      }

      final parsed = json.decode(bodyValue).cast<Map<String, dynamic>>();
      await AppDatabase.get().deletSomeSyncingActivityFromOmni('Area');
      print("data of loan sync " + parsed.toString());
      List<AreaDropDownList> obj = parsed
          .map<AreaDropDownList>(
              (json) => AreaDropDownList.mapFromMiddleware(json))
          .toList();


      for (int i = 0; i < obj.length; i++) {
        await AppDatabase.get().updateAreaMaster(obj[i], obj[i].compositeAreaId.areaCd , obj[i].compositeAreaId.placeCd);
      }

      if(bodyValue == "404" ){
        return null;
      }
      print("Data after Area service  " + bodyValue);

      return areaMaster;
    } catch (e) {
      print('Server Exception!!!');
      return areaMaster;
    }
  }

}