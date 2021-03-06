import 'dart:io';
import 'dart:ui';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:eco_los/main.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:eco_los/systems/settings/bean/SettingsBean.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get_version/get_version.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';




const String  userCode = "userCode";
final extFolderName="eCO_LOS_LOGS";

class Constant{

  static String trefno="Trefno : ";
  static String loanDate = "Loan Date";
  static String repaymentDate = "Repayment Date";
  static String loandisbdt = "Tentitive Disbursement Date";
  static String loaninstStrtDt = "Tentitive Installment Start Date";
  //labels
  static String syncedLookupsLab = "Synced Lookups";
  static String syncedInterestSlabLab = "Sync Interest Slab";
  static String syncedInterestOffsetLab = "Sync Interest Offset ";
  static String syncedLoanCycleParameterPrimaryLab="Sync Loan Cycle Parameter Primary";
  static String syncedLoanCycleSecondaryPrimaryLab="Sync Loan Cycle Secondary Primary";
  static String syncingSystemParameter="Syncing System Parameter";
  static String syncSubLookupLab = "Sync Sub Lookup";
  static String syncProductLab = "Sync Product";
  static String syncToServerLab = "Sync To Server";
  static String syncCustomerLoanAsLeadLab = "Sync Lead";

  static String syncGuarantorLab = "Sync Guarantor";
  static String syncBranchLab = "Sync Branch";
  static String getWorkingLoanLab = "Sync to Get Your working  Loan";
  static String getWorkingCustomersLab = "Sync To get your working customers";
  static String syncFromServerLab = "Sync From server";
  static String syncAddress = "Sync Address";
  static String syncedSystemParameterLab = 'sync System Parameter';
  static String getAllCollateralDetails = "get All Collateral Details";
  static String getAllDocumentDetails = "get All Document Details";
  static String getAllGuarantorDetails = "get All Guarantor Details";
  static String gettingWorkingCollateral = "Getting Working Collateral";
  static String gettingWorkingDocument = "Getting Working Document";
  static String gettingWorkingGuarantor = "Getting Working Guarantor";
  static String syncingLoanApprovalLimit="Syncing Loan Approval Limit";
  static String syncHbsUsers = "Syncing Hbs Users";
  static String gettingWorkingCustomer = "Getting Working Customer";
  static String syncingInterestSlab= "Syncing Interest Slab";
  static String syncingInterestOffset= "Syncing Interest Offset";
  static String syncingLoanCycleParameterPrimary= "Syncing Loan Cycle Parameter Primary ";
  static String syncingLoanCycleParameterSecondary= "Syncing Loan Cycle Parameter Secondary ";
  static String syncingLookups= "Syncing Lookups";
  static String syncingProduct = "Syncing Product";
  static String syncingBranch = "Syncing BranchMaster";
  static String syncingAddress = "Syncing Address";
  static String syncingSubLookup = "Syncing Sub Lookup";




  static String apiURL = "https://103.239.53.162";
  static String myPublicURL = "https://103.239.53.162";
  static bool isHttpsCallNeeded =false;
  static int mngrGrpCode = 33;
  static int foGrpCode = 22;
  static Color mandatoryColor  = Colors.grey[300];
  static Color calculatedColor  = Colors.orange[100];
  static Color readonlyColor  = Colors.black12;
  static Color semiMandatoryColor  = Colors.grey[300];



  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String branch = "";





  Future<Null>  getSessionVariables() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    branch = prefs.get(TablesColumnFile.musrbrcode).toString();
    username = prefs.getString(TablesColumnFile.usrCode);
    usrRole = prefs.getString(TablesColumnFile.usrDesignation);
    usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
    loginTime = prefs.getString(TablesColumnFile.LoginTime);
    geoLocation = prefs.getString(TablesColumnFile.geoLocation);
    geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
    geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();


  }

  static Future<Null> setVer()async{
    try {
      globals.version = await GetVersion.projectVersion;
    } on PlatformException {
      globals.version = 'Failed to get project version.';
    }
  }





  static generateUrl()async{
    print("data of on value Api Url");
    await  AppDatabase.get().getApiUrl().then((onValue){
      print(onValue.length.toString());
      for(int settingsList = 0;settingsList<onValue.length;settingsList++){
        print("data of on value Api Url" + onValue[settingsList].mipaddress);
        settingsBean = new SettingsBean();
        settingsBean.musrcode = onValue[settingsList].musrcode;
        settingsBean.musrpass = onValue[settingsList].musrpass ;
        settingsBean.mipaddress = onValue[settingsList].mipaddress ;
        settingsBean.mportno = onValue[settingsList].mportno ;
        settingsBean.isHttps = onValue[settingsList].isHttps ;
        settingsBean.isPortRequired = onValue[settingsList].isPortRequired ;
        //TODO take request type from system params table eg(http/https)
        //Constant.apiURL = "http://"+settingsBean.mipaddress.toString()+":"+settingsBean.mportno.toString()+"/";
        //TODO take request type from system params table eg(http/https)
        Constant.isHttpsCallNeeded = settingsBean.isHttps==1? true : false;
        String isHttpsVal = "${settingsBean.isHttps==1? "https://" : "http://"}";
        String isPortRequiredVal = "${settingsBean.isPortRequired==1? "" :":${settingsBean.mportno}" }";
        Constant.apiURL = isHttpsVal+settingsBean.mipaddress.toString()+isPortRequiredVal+"/";
      }
    });

  }




  static getDropDownInitialize()async{

    //documentId id type 3
    await  AppDatabase.get().getLookupDataFromLocalDb(909067).then((onValue){

      globals.dropdownCaptionsValuesKyc[2].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;

        globals.dropdownCaptionsValuesKyc[2].add(bean);
      }
    });
//social financial
    await  AppDatabase.get().getLookupDataFromLocalDb(909003).then((onValue){
      globals.dropDownCaptionValuesCOdeKeysSocialFinancial[0].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCOdeKeysSocialFinancial[0].add(bean);
      }
    });
    //if yes the
    await  AppDatabase.get().getLookupDataFromLocalDb(909015).then((onValue){
      globals.dropdownCaptionsValuesFamilyDetails[1].clear();
      globals.dropdownCaptionsValuesSupplimantaryCardDetails[1].clear();
      globals.dropdownCaptionsValuesGuarantorInfo[3].clear();
      globals.dropdownCaptionsValuesFamilyDetails[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        //globals.dropdownCaptionsValuesPersonalInfo[0].add(bean);
        globals.dropdownCaptionsValuesFamilyDetails[1].add(bean);
        globals.dropdownCaptionsValuesSupplimantaryCardDetails[1].add(bean);
        globals.dropdownCaptionsValuesGuarantorInfo[3].add(bean);

        globals.dropdownCaptionsValuesFamilyDetails[5].add(bean);
      }
    });

//mdesignation
    await  AppDatabase.get().getLookupDataFromLocalDb(11123).then((onValue){
      globals.dropdownCaptionsValuesSupplimantaryCardDetails[2].clear();

      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesSupplimantaryCardDetails[2].add(bean);

      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(4093).then((onValue){
      globals.dropdownCaptionsValuesFamilyDetails[6].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesFamilyDetails[6].add(bean);
      }
    });

    //relegion
    await  AppDatabase.get().getLookupDataFromLocalDb(1132).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[1].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[1].add(bean);
      }
    });

    //is married
    await  AppDatabase.get().getLookupDataFromLocalDb(1154).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[2].clear();
      globals.dropdownCaptionsValuesFamilyDetails[3].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[2].add(bean);
        globals.dropdownCaptionsValuesFamilyDetails[3].add(bean);
      }
    });

    //is educated
    await  AppDatabase.get().getLookupDataFromLocalDb(1159).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[3].clear();
      globals.dropdownCaptionsValuesFamilyDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[3].add(bean);
        globals.dropdownCaptionsValuesFamilyDetails[0].add(bean);
      }
    });

    //socical fin bank detatils
    await  AppDatabase.get().getLookupDataFromLocalDb(120001).then((onValue){
      globals.dropdownCaptionsValuesSocialFinDetails[0].clear();
      globals.dropdownCaptionsValuesPersonalInfo[20].clear();

      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesSocialFinDetails[0].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[20].add(bean);

      }
    });
    //occupation
    await  AppDatabase.get().getLookupDataFromLocalDb(42034).then((onValue){
      globals.dropdownCaptionsValuesFamilyDetails[2].clear();
      globals.dropdownCaptionsValuesSupplimantaryCardDetails[0].clear();
      globals.dropdownCaptionsValuesPersonalInfo[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesFamilyDetails[2].add(bean);
        globals.dropdownCaptionsValuesSupplimantaryCardDetails[0].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[4].add(bean);
      }
    });

    //secondary occupation and is occupation
    await  AppDatabase.get().getLookupDataFromLocalDb(909011).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[7].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[7].add(bean);
      }
    });

    //Title
    await  AppDatabase.get().getLookupDataFromLocalDb(1059).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[6].clear();
      globals.dropdownCaptionsValuesPersonalInfo[17].clear();
      globals.dropdownCaptionsValuesPersonalInfo[18].clear();

      globals.dropdownCaptionsValuesFamilyDetails[4].clear();
      globals.dropdownCaptionsValuesCollateralsInfo[2].clear();
      globals.dropDownCaptionValuesCollateralREMlandandhouse[0].clear();
      globals.dropDownCaptionValuesCollateralT24Address[0].clear();
      globals.dropdownCaptionsValuesSupplimantaryCardDetails[3].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[6].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[17].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[18].add(bean);
        globals.dropdownCaptionsValuesFamilyDetails[4].add(bean);
        globals.dropdownCaptionsValuesCollateralsInfo[2].add(bean);
        globals.dropDownCaptionValuesCollateralREMlandandhouse[0].add(bean);
        globals.dropDownCaptionValuesCollateralT24Address[0].add(bean);
        globals.dropdownCaptionsValuesSupplimantaryCardDetails[3].add(bean);
      }
    });


    //size of property
    await  AppDatabase.get().getLookupDataFromLocalDb(2211).then((onValue){
      globals.dropDownCaptionValuesCollateralT24Address[4].clear();
      globals.dropDownCaptionValuesCollateralREMlandandhouse[4].clear();
      globals.dropDownCaptionValuesCollateralT24Address[4].clear();
      globals.dropDownCaptionValuesCollateralREMlandandbuilding[0].clear();
      globals.dropDownCaptionValuesCollateralREMlandandbuilding[1].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCollateralT24Address[4].add(bean);
        globals.dropDownCaptionValuesCollateralREMlandandhouse[4].add(bean);
        globals.dropDownCaptionValuesCollateralT24Address[4].add(bean);
        globals.dropDownCaptionValuesCollateralREMlandandbuilding[0].add(bean);
        globals.dropDownCaptionValuesCollateralREMlandandbuilding[1].add(bean);
      }
    });

    //Region
    await  AppDatabase.get().getLookupDataFromLocalDb(11390).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[5].add(bean);
      }
    });

//gender
    await  AppDatabase.get().getLookupDataFromLocalDb(1139).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[8].clear();
      globals.dropdownCaptionsValuesSupplimantaryCardDetails[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[8].add(bean);
        globals.dropdownCaptionsValuesSupplimantaryCardDetails[4].add(bean);
      }
    });

    //Name title 2
    await  AppDatabase.get().getLookupDataFromLocalDb(1059).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[9].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[9].add(bean);
      }
    });

    //Language
    await  AppDatabase.get().getLookupDataFromLocalDb(38999).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[10].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[10].add(bean);
      }
    });

    //Target
    await  AppDatabase.get().getLookupDataFromLocalDb(109900 ).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[11].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[11].add(bean);
      }
    });

    //Ownership
    await  AppDatabase.get().getLookupDataFromLocalDb(109800).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[12].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[12].add(bean);
      }
    });

    //resident status
    await  AppDatabase.get().getLookupDataFromLocalDb(1001119).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[13].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[13].add(bean);
      }
    });
    //Is cp employee personal
    await  AppDatabase.get().getLookupDataFromLocalDb(11111112).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[14].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[14].add(bean);
      }
    });
    //Rank of employee personal
    await  AppDatabase.get().getLookupDataFromLocalDb(11111111).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[15].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[15].add(bean);
      }
    });


//id type 1 , pan no
    await  AppDatabase.get().getLookupDataFromLocalDb(1075).then((onValue){//1321
      globals.dropdownCaptionsValuesKyc[0].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesKyc[0].add(bean);
        //      globals.dropdownCaptionsValuesKyc[1].add(bean);
      }
    });
    //custType
    await  AppDatabase.get().getLookupDataFromLocalDb(101004).then((onValue){
      globals.dropdownCaptionsValuesProfileDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesProfileDetails[0].add(bean);
      }
    });

    //nationality
    await  AppDatabase.get().getLookupDataFromLocalDb(5055).then((onValue){
      globals.dropdownCaptionsValuesProfileDetails[1].clear();
      globals.dropdownCaptionsValuesPersonalInfo[22].clear();
      for(int i = 0;i<onValue.length;i++){
        print("setting required values ${onValue[i].mcodedesc}");
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesProfileDetails[1].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[22].add(bean);
      }
    });

    //contact
    //address type
    await  AppDatabase.get().getLookupDataFromLocalDb(909002).then((onValue){
      globals.dropdownCaptionsValuesKycDetails2[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesKycDetails2[0].add(bean);
      }
    });

    //Homw ownership
    await  AppDatabase.get().getLookupDataFromLocalDb(90900222).then((onValue){
      globals.dropdownCaptionsValuesKycDetails2[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesKycDetails2[1].add(bean);
      }
    });
    //business owned
    await  AppDatabase.get().getLookupDataFromLocalDb(150000).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[0].add(bean);
      }
    });

    //IS self employed
    //mdsitrequiretorefroff
    await  AppDatabase.get().getLookupDataFromLocalDb(51).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[1].clear();
      globals.dropdownCaptionsValuesESMS2[1].clear();
      globals.dropdownCaptionsValuesCollateralsInfo[6].clear();
      globals.dropdownCaptionsValuesCollateralsInfo[7].clear();
      globals.dropdownCaptionsValuesCollateralsInfo[8].clear();
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[5].clear();
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[7].clear();
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[8].clear();
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[9].clear();

      globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[1].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[1].add(bean);
        globals.dropdownCaptionsValuesESMS2[1].add(bean);
        globals.dropdownCaptionsValuesCollateralsInfo[6].add(bean);
        globals.dropdownCaptionsValuesCollateralsInfo[7].add(bean);
        globals.dropdownCaptionsValuesCollateralsInfo[8].add(bean);
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[5].add(bean);
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[7].add(bean);
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[8].add(bean);
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[9].add(bean);
        globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[1].add(bean);

      }
    });


    //Type Of Loan
    await  AppDatabase.get().getLookupDataFromLocalDb(12345).then((onValue){
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[4].clear();

      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[4].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(42032).then((onValue){
      globals.dropDownCaptionValuesCollateralREMlandandhouse[3].clear();
      globals.dropDownCaptionValuesCollateralT24Address[3].clear();

      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCollateralREMlandandhouse[3].add(bean);
        globals.dropDownCaptionValuesCollateralT24Address[3].add(bean);
      }
    });



    //COmpany category
    await  AppDatabase.get().getLookupDataFromLocalDb(1234567).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[2].clear();


      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[2].add(bean);

      }
    });

    //Business-type
    await  AppDatabase.get().getLookupDataFromLocalDb(42033).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[3].clear();
      globals.dropdownCaptionsValuesPersonalInfo[19].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[3].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[19].add(bean);

      }
    });

    //source name
    await  AppDatabase.get().getLookupDataFromLocalDb(1511111).then((onValue){

      globals.dropDownCaptionValuesBusinessDetails[4].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[4].add(bean);
      }
    });


    //Statues of emp
    await  AppDatabase.get().getLookupDataFromLocalDb(1511112).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[5].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[5].add(bean);

      }
    });

    //Is CP emp
    await  AppDatabase.get().getLookupDataFromLocalDb(51).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[6].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[6].add(bean);

      }
    });

    //Rank of employee employmet screen
    await  AppDatabase.get().getLookupDataFromLocalDb(150001).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[7].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[7].add(bean);

      }
    });


    //Position owned
    await  AppDatabase.get().getLookupDataFromLocalDb(3031).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[8].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[8].add(bean);

      }
    });

    //Departmant
    await  AppDatabase.get().getLookupDataFromLocalDb(4053).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[9].clear();
      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[9].add(bean);

      }
    });

    //Business status
    await  AppDatabase.get().getLookupDataFromLocalDb(29).then((onValue){
      globals.dropDownCaptionValuesBusinessDetails[10].clear();
      globals.dropdownCaptionsValuesPersonalInfo[21].clear();

      for(int i = 0;i<onValue.length;i++){
        Map<String,String> map = new Map<String,String>();;
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesBusinessDetails[10].add(bean);
        globals.dropdownCaptionsValuesPersonalInfo[21].add(bean);


      }
    });
    //LoanLimitDetails
    await  AppDatabase.get().getLookupDataFromLocalDb(909022).then((onValue){//purpose of loan
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[0].add(bean);
      }
    });

    //frequency
    await  AppDatabase.get().getLookupDataFromLocalDb(655).then((onValue){
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[1].clear();
      globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[2].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[1].add(bean);
        globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[2].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(909999).then((onValue){//repayment mode
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[2].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[2].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(909094).then((onValue){// mode of disb
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[3].clear();
      globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[3].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[3].add(bean);
        globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[3].add(bean);
      }
    });

    //expense detail , business
    await  AppDatabase.get().getLookupDataFromLocalDb(1100).then((onValue){
      globals.dropdownCaptionsValuesExpenseDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value;
        globals.dropdownCaptionsValuesExpenseDetails[0].add(bean);
      }
    });

    //expense detail , household
    await  AppDatabase.get().getLookupDataFromLocalDb(1500).then((onValue){
      globals.dropdownCaptionsValuesExpenseDetails[1].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesExpenseDetails[1].add(bean);
      }
    });

    // name of bank
    await  AppDatabase.get().getLookupDataFromLocalDb(909050).then((onValue){
      globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2].add(bean);
        //globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2].sort((a, b) => a.mcodedesc.compareTo(b.mcodedesc));
      }
    });

    // asset detail
    await  AppDatabase.get().getLookupDataFromLocalDb(909041).then((onValue){
      globals.dropDownCaptionValuesCOdeKeysSocialFinancial[3].clear();
      for(int i = 0;i<onValue.length;i++){

        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCOdeKeysSocialFinancial[3].add(bean);
      }
    });

    //agriculture land type
    await  AppDatabase.get().getLookupDataFromLocalDb(1800).then((onValue){
      globals.dropDownCaptionValuesCOdeKeysSocialFinancial[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCOdeKeysSocialFinancial[1].add(bean);
      }
    });

    //role of member
    await  AppDatabase.get().getLookupDataFromLocalDb(1260).then((onValue){
      globals.dropdownCaptionsValuesProfileDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesProfileDetails[0].add(bean);
      }
    });

    await AppDatabase.get().getLookupDataFromLocalDb(110789).then((onValue) {
      //mode of payout
      globals.dropdownCaptionsValuesModeOfPayout[0].clear();
      for (int i = 0; i < onValue.length; i++) {
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode;
        bean.mcodetype = onValue[i].mcodetype;
        bean.mfield1value = onValue[i].mfield1value;
        globals.dropdownCaptionsValuesModeOfPayout[0].add(bean);
      }
    });


    //Guarantor
    await  AppDatabase.get().getLookupDataFromLocalDb(909066).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[0].add(bean);
      }
    });
    //applicant type
    await  AppDatabase.get().getLookupDataFromLocalDb(909018).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[1].clear();
      globals.dropDownCaptionDocumentCollecter[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[1].add(bean);
        globals.dropDownCaptionDocumentCollecter[1].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(1140).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[2].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[2].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(909003).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[4].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(2000).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[5].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(909011).then((onValue){
      globals.dropdownCaptionsValuesGuarantorInfo[6].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesGuarantorInfo[6].add(bean);
      }
    });

    // Currency
    await  AppDatabase.get().getLookupDataFromLocalDb(120001).then((onValue){
      globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[0].add(bean);
      }
    });


    //LTV
    await  AppDatabase.get().getLookupDataFromLocalDb(9088).then((onValue){
      globals.dropdownCaptionsValuesVehicleAcceptanceInfo[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesVehicleAcceptanceInfo[0].add(bean);
      }
    });



    //Good/V.Good
    await  AppDatabase.get().getLookupDataFromLocalDb(91).then((onValue){
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[0].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[1].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[2].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[3].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[4].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[5].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[6].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[7].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[8].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[9].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[10].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[11].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[12].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation1[13].clear();

      globals.dropdownCaptionsValuesCollateralVehicleValuation2[0].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[1].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[2].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[3].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[4].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[5].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[6].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[7].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[8].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[9].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[10].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[11].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[12].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation2[13].clear();

      globals.dropdownCaptionsValuesCollateralVehicleValuation3[0].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[1].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[2].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[3].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[4].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[5].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[6].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[7].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[8].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[9].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[10].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[11].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation3[12].clear();

      globals.dropdownCaptionsValuesCollateralVehicleValuation4[0].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[1].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[2].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[3].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[4].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[5].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[6].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[7].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[8].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[9].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[10].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[11].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[12].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[13].clear();
      globals.dropdownCaptionsValuesCollateralVehicleValuation4[14].clear();
    //  globals.dropDownCaptionValuesCollateralREMlandandhouse[3].clear();

      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[0].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[1].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[2].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[3].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[4].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[5].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[6].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[7].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[8].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[9].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[10].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[11].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[12].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation1[13].add(bean);

        globals.dropdownCaptionsValuesCollateralVehicleValuation2[0].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[1].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[2].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[3].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[4].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[5].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[6].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[7].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[8].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[9].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[10].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[11].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[12].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation2[13].add(bean);

        globals.dropdownCaptionsValuesCollateralVehicleValuation3[0].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[1].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[2].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[3].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[4].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[5].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[6].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[7].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[8].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[9].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[10].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[11].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation3[12].add(bean);

        globals.dropdownCaptionsValuesCollateralVehicleValuation4[0].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[1].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[2].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[3].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[4].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[5].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[6].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[7].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[8].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[9].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[10].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[11].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[12].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[13].add(bean);
        globals.dropdownCaptionsValuesCollateralVehicleValuation4[14].add(bean);

      }
    });
    //Collaterals
    await  AppDatabase.get().getLookupDataFromLocalDb(10).then((onValue){
      globals.dropdownCaptionsValuesCollateralsInfo[0].clear();
      for(int i = 0;i<onValue.length;i++){



        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollateralsInfo[0].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(8080808).then((onValue){
      globals.dropdownCaptionsValuesCollateralsInfo[1].clear();
      for(int i = 0;i<onValue.length;i++){



        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollateralsInfo[1].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(909009).then((onValue){
      globals.dropdownCaptionsValuesCollateralsInfo[3].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollateralsInfo[3].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(13).then((onValue){
      globals.dropdownCaptionsValuesCollateralsInfo[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.
        dropdownCaptionsValuesCollateralsInfo[4].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(5103).then((onValue){
      globals.dropdownCaptionsValuesCollateralsInfo[9].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.
        dropdownCaptionsValuesCollateralsInfo[9].add(bean);
      }
    });
    //collateral title
    await  AppDatabase.get().getLookupDataFromLocalDb(511).then((onValue){
     // globals.dropdownCaptionsValuesCollateralsInfo[1].clear();
      globals.dropdownCaptionsValuesCollateralsInfo[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollateralsInfo[5].add(bean);
      }
    });

    //House build Type
    await  AppDatabase.get().getLookupDataFromLocalDb(42030).then((onValue){
      globals.dropDownCaptionValuesCollateralREMlandandhouse[1].clear();
      globals.dropDownCaptionValuesCollateralT24Address[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCollateralREMlandandhouse[1].add(bean);
        globals.dropDownCaptionValuesCollateralT24Address[1].add(bean);
      }
    });


    //Enviornment
    await  AppDatabase.get().getLookupDataFromLocalDb(42031).then((onValue){
      globals.dropDownCaptionValuesCollateralREMlandandhouse[2].clear();
      globals.dropDownCaptionValuesCollateralT24Address[2].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionValuesCollateralREMlandandhouse[2].add(bean);
        globals.dropDownCaptionValuesCollateralT24Address[2].add(bean);
      }
    });


    //end


    //ESMS STart

    await  AppDatabase.get().getLookupDataFromLocalDb(1001111).then((onValue){
      globals.dropdownCaptionsValuesESMS[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[0].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001112).then((onValue){
      globals.dropdownCaptionsValuesESMS[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[1].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001113).then((onValue){
      globals.dropdownCaptionsValuesESMS[2].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[2].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001114).then((onValue){
      globals.dropdownCaptionsValuesESMS[3].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[3].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001115).then((onValue){
      globals.dropdownCaptionsValuesESMS[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[4].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001116).then((onValue){
      globals.dropdownCaptionsValuesESMS[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[5].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001117).then((onValue){
      globals.dropdownCaptionsValuesESMS[6].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[6].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001118).then((onValue){
      globals.dropdownCaptionsValuesESMS[7].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[7].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001199).then((onValue){
      globals.dropdownCaptionsValuesESMS[8].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[8].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(1001121).then((onValue){
      globals.dropdownCaptionsValuesESMS[9].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS[9].add(bean);
      }
    });

//mdecision
    await  AppDatabase.get().getLookupDataFromLocalDb(12121313).then((onValue){
      globals.dropdownCaptionsValuesESMS2[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesESMS2[0].add(bean);
      }
    });


    //STart RiskRatings
    //mcountryrisk
    await  AppDatabase.get().getLookupDataFromLocalDb(12121).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[0].add(bean);
      }
    });

    //mvisaperiod
    await  AppDatabase.get().getLookupDataFromLocalDb(12122).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[1].add(bean);
      }
    });

    //mvisavalid
    await  AppDatabase.get().getLookupDataFromLocalDb(12123).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[2].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[2].add(bean);
      }
    });

    //mvisatype
    await  AppDatabase.get().getLookupDataFromLocalDb(12124).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[3].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[3].add(bean);
      }
    });

    //mnatureofbuss
    await  AppDatabase.get().getLookupDataFromLocalDb(12125).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[4].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[4].add(bean);
      }
    });

    //mhwwsacctopn
    await  AppDatabase.get().getLookupDataFromLocalDb(12126).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[5].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[5].add(bean);
      }
    });

    //mnetwrth
    await  AppDatabase.get().getLookupDataFromLocalDb(12127).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[6].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[6].add(bean);
      }
    });

    //mexpectedvalue
    await  AppDatabase.get().getLookupDataFromLocalDb(12128).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[7].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[7].add(bean);
      }
    });

    //mnooftransmnthly
    await  AppDatabase.get().getLookupDataFromLocalDb(12129).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[8].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[8].add(bean);
      }
    });

    //mhighnetwrth
    await  AppDatabase.get().getLookupDataFromLocalDb(12130).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[9].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[9].add(bean);
      }
    });

    //mprcdservrskque1
    await  AppDatabase.get().getLookupDataFromLocalDb(12131).then((onValue){
      globals.dropdownCaptionsValuesRiskRatings[10].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesRiskRatings[10].add(bean);
      }
    });

    //ENds here

    //Documents COllector
    await  AppDatabase.get().getLookupDataFromLocalDb(13131313).then((onValue){
      globals.dropDownCaptionDocumentCollecter[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropDownCaptionDocumentCollecter[0].add(bean);
      }
    });

    //Repayment Frequency

    await  AppDatabase.get().getLookupDataFromLocalDb(909119).then((onValue){
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[6].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[6].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(12350).then((onValue){
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[10].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[10].add(bean);
      }
    });
    await  AppDatabase.get().getLookupDataFromLocalDb(20204).then((onValue){
      globals.dropdownCaptionsValuesCustLoanDetailsInfo[11].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCustLoanDetailsInfo[11].add(bean);
      }
    });

    await  AppDatabase.get().getLookupDataFromLocalDb(234556).then((onValue){
      globals.dropdownCaptionsValuesPersonalInfo[16].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesPersonalInfo[16].add(bean);

      }
    });

    //Collateral gold
    //item
    await  AppDatabase.get().getLookupDataFromLocalDb(12121313).then((onValue){
      globals.dropdownCaptionsValuesCollalteralGold[0].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollalteralGold[0].add(bean);
      }
    });

    //caratetype
    await  AppDatabase.get().getLookupDataFromLocalDb(12121314).then((onValue){
      globals.dropdownCaptionsValuesCollalteralGold[1].clear();
      for(int i = 0;i<onValue.length;i++){
        LookupBeanData bean = new LookupBeanData();
        bean.mcodedesc = onValue[i].mcodedesc;
        bean.mcode = onValue[i].mcode ;
        bean.mcodetype = onValue[i].mcodetype ;
        bean.mfield1value = onValue[i].mfield1value ;
        globals.dropdownCaptionsValuesCollalteralGold[1].add(bean);
      }
    });
  }

  static Future setSystemVariables()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SystemParameterBean  sysBean = new SystemParameterBean();
    int lbrcode =prefs.getInt(TablesColumnFile.musrbrcode);

    if(prefs!=null) {
      sysBean = await AppDatabase.get().getSystemParameter('1', lbrcode);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.mValidity, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      // if(AppDatabase.get().getSystemParameter(2,lbrcode)!=null){
      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('2', 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.mIsProspectNeeded, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('3', 0);
      if (sysBean != null) {
        prefs.setString(
            TablesColumnFile.mIsProspectRepeatNeeded, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }
      // for Term Deposit RATE OF INTEREST logic
      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('5', 0); // id
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.mTdparam, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('8', 0);
      if (sysBean != null) {
        print(sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
        int CGT1toCGT2Gap = 0;
        try {
          CGT1toCGT2Gap = int.parse(sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
        } catch (_) {
          print("Exception in parsing");
        }

        prefs.setInt(TablesColumnFile.CGT1toCGT2Gap, CGT1toCGT2Gap);
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('7', 0);
      if (sysBean != null) {
        print(sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
        int CgtToGrtgap = 0;
        try {
          CgtToGrtgap = int.parse(sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
        } catch (_) {
          print("Exception in parsing");
        }

        prefs.setInt(TablesColumnFile.CGT2toGRTGap, CgtToGrtgap);
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('11', 0);
      prefs.setString(TablesColumnFile.mIsGroupLendingNeeded, "0");
      if (sysBean != null) {
        prefs.setString(
            TablesColumnFile.mIsGroupLendingNeeded, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }


      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('12', 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.mCompanyName, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('CENTER', 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.CENTERCAPTION, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('GROUP', 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.GROUPCAPTION, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter('14', 0);
      print("Setting system paramaetr for iscgt2 needed");
      prefs.setString(TablesColumnFile.isCGT2Needed, "0");
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.isCGT2Needed, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean =
      await AppDatabase.get().getSystemParameter('RESEDENCYADDRESSMCODE', 0);
      if (sysBean != null) {
        prefs.setString(
            TablesColumnFile.RESEDENCYADDRESSMCODE, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter(
          'DEFAULTEXCHANGETOCURRENCY', 0);
      if (sysBean != null) {
        prefs.setString(
            TablesColumnFile.DEFAULTEXCHANGETOCURRENCY, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter(
          TablesColumnFile.ISOVERDUEREQ, 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.ISOVERDUEREQ, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter(
          TablesColumnFile.LCSBASEURL, 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.LCSBASEURL, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }

      sysBean = new SystemParameterBean();
      sysBean = await AppDatabase.get().getSystemParameter(
          TablesColumnFile.LOSBASEURL, 0);
      if (sysBean != null) {
        prefs.setString(TablesColumnFile.LOSBASEURL, sysBean.mcodevalue!=null?sysBean.mcodevalue:"");
      }
    }


  }


  static Future<String> getAppPath(String value,String FileName) async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
   // await createFolder();
    //File('"storage/emulated/0/$extFolderName/${FileName}${DateTime.now()}.txt').writeAsString('$value');
    File('${documentsDirectory.path}/${FileName}${DateTime.now()}.txt').writeAsString('$value');
  }

  static createFolder()async{
    var status = await Permission.storage.status;
    if (await Permission.storage.request().isGranted) {
      final path= Directory("storage/emulated/0/$extFolderName");
      if ((await path.exists())){
        // TODO:
        print("exist");
      }else{
        // TODO:
        print("not exist");
        path.create();
      }
    }else{
      //openAppSettings();
      print("No Read Write Access"+status.toString());
    }

  }
 static  printBigString(String printObj , String printTypeName){
    print("Start here    XXXXXXXXXXXXXXXX : "+printTypeName);
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(printObj).forEach((match) => print(match.group(0)));
    print("Ends here    XXXXXXXXXXXXXXXX : "+printTypeName);
  }

  static  String ifNullCheck(String value) {
    if (value == null || value.isEmpty || value == 'null') {
      value = null;
    }
    return value;
  }

  static String ifDateNullCheck(DateTime value) {
    if (value == null || value == 'null') {
      return null;
    } else {
      return value.toIso8601String();
    }
  }
  static bool ifBoolNullCheck(var value) {
    if (value == 'true' || value == true) {
      return true;
    } else {
      return false;
    }
  }

}

