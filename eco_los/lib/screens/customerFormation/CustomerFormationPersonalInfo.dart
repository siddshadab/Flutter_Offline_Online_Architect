import 'dart:async';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForMainOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForSubOccupationSelection.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/address/FullScreenDialogForCountrySelection.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class CustomerFormationPersonalInfo extends StatefulWidget {
  CustomerFormationPersonalInfo();



  @override
  _CustomerFormationPersonalInfoState createState() =>
      new _CustomerFormationPersonalInfoState();
}

class _CustomerFormationPersonalInfoState
    extends State<CustomerFormationPersonalInfo> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List testString = new List();
  CountryDropDownBean tempContrybean = new CountryDropDownBean();
  FullScreenDialogForCountrySelection _myCountryDialog =
  new FullScreenDialogForCountrySelection();
  String countryName="";

  FocusNode monthFocus;
  FocusNode yearFocus;
  FocusNode monthFocusH;
  FocusNode yearFocusH;
  FocusNode incomonthFocus;
  FocusNode incoyearFocus;
  FocusNode regmonthFocus;
  FocusNode regyearFocus;
  FocusNode repmonthFocus;
  FocusNode repyearFocus;
  FocusNode buscommonthFocus;
  FocusNode buscomyearFocus;
  LookupBeanData title;
  //LookupBeanData title2;
  LookupBeanData ifYesThen;
  LookupBeanData relegion;
  LookupBeanData maritialStatus;
  LookupBeanData qualification;
  LookupBeanData occupation;
  LookupBeanData region;
  //LookupBeanData region;
  LookupBeanData motherTongue;
  LookupBeanData secondryOccuptn;
  LookupBeanData gender;
  LookupBeanData mtarget;
  LookupBeanData mownership;
  LookupBeanData mresstatus;
  LookupBeanData miscpemp;
  LookupBeanData mrankofemp;
  LookupBeanData mcusttype;
  LookupBeanData morgtitle;
  LookupBeanData morgtitlek;
  LookupBeanData mcomtype;
  LookupBeanData mdefaultcurrency;
  LookupBeanData mcompanystatus;
  LookupBeanData mnationality;

  bool iscpemp=false;
  bool iscompany=false;

  SubLookupForSubPurposeOfLoan mainOcc = new SubLookupForSubPurposeOfLoan();
  SubLookupForSubPurposeOfLoan subOcc = new SubLookupForSubPurposeOfLoan();

  List<LookupBeanData> onValueTitle = List<LookupBeanData>();

  DateTime selectedDate = DateTime.now();

  var formatter = new DateFormat('dd-MM-yyyy');
  String tempDate = "----/--/--";
  String tempYear ;
  String tempDay ;
  String tempMonth;
  String tempDateH = "----/--/--";
  String tempYearH ;
  String tempDayH ;
  String tempMonthH;
  String incoDate = "----/--/--";
  String incoYear ;
  String incoDay ;
  String incoMonth;
  String regDate = "----/--/--";
  String regYear ;
  String regDay ;
  String regMonth;

  String repDOB = "----/--/--";
  String repYear ;
  String repDay ;
  String repMonth;
  String buscomDOB = "----/--/--";
  String buscomYear ;
  String buscomDay ;
  String buscomMonth;

  DateTime date;
  TimeOfDay time;
  bool boolValidate = false;

  bool ifNullCheck(String value) {
    bool isNull = false;
    try {
      if (value == null || value == 'null' || value.trim()=='') {
        isNull = true;
      }
    }catch(_){
      isNull =true;
    }
    return isNull;
  }

  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
   //   print("inside  code Desc is null");
      switch (no) {
        case 0:
          ifYesThen = blankBean;
           break;
        case 1:
          relegion = blankBean;
          CustomerFormationMasterTabsState.custListBean.mrelegion = blankBean.mcode;
          break;
        case 2:
          maritialStatus = blankBean;
          CustomerFormationMasterTabsState.custListBean.mmaritialStatus= 0;
          setState(() {

          });
          break;
        case 3:
          qualification = blankBean;
          CustomerFormationMasterTabsState.custListBean.mqualification = blankBean.mcode;
          break;
        case 4:
          occupation = blankBean;
          CustomerFormationMasterTabsState.custListBean.moccupation =0;
          break;
        case 5:
          region = blankBean;
          CustomerFormationMasterTabsState.custListBean.mRuralUrban = blankBean.mcode;
          break;
        case 6:
          title = blankBean;
          CustomerFormationMasterTabsState.custListBean.mnametitle = blankBean.mcode;
         // title2 = blankBean;
          CustomerFormationMasterTabsState.custListBean.mnametitle2 = blankBean.mcode;
          break;
        case 7:
          secondryOccuptn = blankBean;
          CustomerFormationMasterTabsState.custListBean.msecoccupatn = 0;
          break;
        case 8:
          gender = blankBean;
          CustomerFormationMasterTabsState.custListBean.mgender = blankBean.mcode;
          break;
       case 9:

          break;
        case 10:
          motherTongue =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mlangofcust = blankBean.mcode;
          break;
        case 11:
          mtarget =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mtarget = blankBean.mcode;
          break;
        case 12:
          mownership =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mownership = blankBean.mcode;
          break;
        case 13:
          mresstatus =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mresstatus = blankBean.mcode;
          break;
        case 14:
          miscpemp =  blankBean;
          CustomerFormationMasterTabsState.custListBean.miscpemp = blankBean.mcode;
          break;
        case 15:
          mrankofemp =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mrankofemp = blankBean.mcode;
          break;
        case 16:
          mcusttype =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mcusttype = blankBean.mcode;
          break;
        case 17:
          morgtitle =  blankBean;
          CustomerFormationMasterTabsState.custListBean.morgtitle = blankBean.mcode;
          break;
        case 18:
          morgtitlek =  blankBean;
          CustomerFormationMasterTabsState.custListBean.morgtitlek = blankBean.mcode;
          break;
        case 19:
          mcomtype =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mcomtype = blankBean.mcode;
          break;
        case 20:
          mdefaultcurrency =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mdefaultcurrency = blankBean.mcode;
          break;
        case 21:
          mcompanystatus =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mcompanystatus = blankBean.mcode;
          break;
        case 22:
          mnationality =  blankBean;
          CustomerFormationMasterTabsState.custListBean.mnation = blankBean.mcode;
          break;

        default:
          break;
      }
      setState(() {

      });
    }
    else{
      bool isBreak = false;
      for (int k = 0;
      k < globals.dropdownCaptionsValuesPersonalInfo[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesPersonalInfo[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesPersonalInfo[no][k]);
          isBreak=true;
          break;
        }
        if(isBreak){
          break;
        }
      }

    }


  }

  setValue(int no, LookupBeanData value) {
    setState(() {
     // print("coming here");
      switch (no) {
        case 0:
            ifYesThen = value;
          break;
        case 1:
          relegion = value;
          CustomerFormationMasterTabsState.custListBean.mrelegion = value.mcode;
          break;
        case 2:
          maritialStatus = value;
          CustomerFormationMasterTabsState.custListBean.mmaritialStatus = int.parse(value.mcode);
          setState(() {

          });
          break;
        case 3:
          qualification = value;
          CustomerFormationMasterTabsState.custListBean.mqualification = value.mcode;
          break;
        case 4:
          occupation = value;
          CustomerFormationMasterTabsState.custListBean.moccupation = int.parse(value.mcode);
          break;
        case 5:
          region = value;
          CustomerFormationMasterTabsState.custListBean.mRuralUrban = value.mcode;
          break;
        case 6:
          title = value;
         // print(value);
          CustomerFormationMasterTabsState.custListBean.mnametitle = value.mcode;
         // title2 = value;
          CustomerFormationMasterTabsState.custListBean.mnametitle2 = value.mcode;
          break;
        case 7:
          secondryOccuptn = value;
          CustomerFormationMasterTabsState.custListBean.msecoccupatn = int.parse(value.mcode);
          break;
        case 8:
          gender = value;
          CustomerFormationMasterTabsState.custListBean.mgender = value.mcode;
          break;
        case 9:

          break;
        case 10:
          motherTongue =  value;
          CustomerFormationMasterTabsState.custListBean.mlangofcust = value.mcode;
          break;
        case 11:
          mtarget =  value;
          CustomerFormationMasterTabsState.custListBean.mtarget = value.mcode;
          break;
        case 12:
          mownership =  value;
          CustomerFormationMasterTabsState.custListBean.mownership = value.mcode;
          break;
        case 13:
          mresstatus =  value;
          CustomerFormationMasterTabsState.custListBean.mresstatus = value.mcode;
          break;
        case 14:
          miscpemp =  value;
          //print("VAr"+CustomerFormationMasterTabsState.custListBean.miscpemp );
          //print("Code"+value.mcode);
          if(value.mcode=="1"){
            iscpemp=true;
            CustomerFormationMasterTabsState.custListBean.mempid="";
            CustomerFormationMasterTabsState.custListBean.mrankofemp="";
            mrankofemp=blankBean;
          }

          else{
            iscpemp=false;
          }
          CustomerFormationMasterTabsState.custListBean.miscpemp = value.mcode;
          break;
        case 15:
          mrankofemp =  value;
          CustomerFormationMasterTabsState.custListBean.mrankofemp = value.mcode;
          break;
        case 16:
          mcusttype =  value;
          if(value.mcode=="1"){
            iscompany=true;


           /* CustomerFormationMasterTabsState.custListBean.mempid="";
            CustomerFormationMasterTabsState.custListBean.mfatherfname="";
            CustomerFormationMasterTabsState.custListBean.mfathermname="";
            CustomerFormationMasterTabsState.custListBean.mfatherlname="";
            CustomerFormationMasterTabsState.custListBean.misearngmembr="";
            CustomerFormationMasterTabsState.custListBean.misstudyingmembr="";
            CustomerFormationMasterTabsState.custListBean.mmemberno="";
            CustomerFormationMasterTabsState.custListBean.mischldrn="";
            maritialStatus=blankBean;
            mresstatus=blankBean;
            relegion==blankBean;
            qualification=blankBean;
            motherTongue=blankBean;
            occupation=blankBean;
            miscpemp=blankBean;
            mrankofemp=blankBean;
            secondryOccuptn=blankBean;

            gender=blankBean;
            tempDay="";
            tempMonth="";
            tempYear="";*/

          }

          else{
            iscompany=false;
      /*      morgtitle=blankBean;
            mcompanystatus=blankBean;
            CustomerFormationMasterTabsState.custListBean.mnameoforg="";
            CustomerFormationMasterTabsState.custListBean.mnameoforgk="";
            CustomerFormationMasterTabsState.custListBean.mregno="";
            CustomerFormationMasterTabsState.custListBean.mtaxregno="";
            CustomerFormationMasterTabsState.custListBean.mcomecoindicator="";
            CustomerFormationMasterTabsState.custListBean.mnationalid="";
            CustomerFormationMasterTabsState.custListBean.missuingauth="";
            CustomerFormationMasterTabsState.custListBean.mbusinessdesc="";
            repDay="";
            repMonth="";
            repYear="";
            incoDay="";
            incoMonth="";
            incoYear="";
            regDay="";
            regMonth="";
            regYear="";
            buscomDay="";
            buscomMonth="";
            buscomYear="";
            mdefaultcurrency=blankBean;
            mnationality=blankBean;
            morgtitle=blankBean;
            mcomtype=blankBean;*/
          }
          CustomerFormationMasterTabsState.custListBean.mcusttype = value.mcode;
          break;
        case 17:
          morgtitle =  value;
          CustomerFormationMasterTabsState.custListBean.morgtitle = value.mcode;
          CustomerFormationMasterTabsState.custListBean.morgtitlek = value.mcode;
          break;
        case 18:
          morgtitlek =  value;
          CustomerFormationMasterTabsState.custListBean.morgtitlek = value.mcode;
          break;
        case 19:
          mcomtype =  value;
          CustomerFormationMasterTabsState.custListBean.mcomtype = value.mcode;
          break;
        case 20:
          mdefaultcurrency =  value;
          CustomerFormationMasterTabsState.custListBean.mdefaultcurrency = value.mcode;
          break;
        case 21:
          mcompanystatus =  value;
          CustomerFormationMasterTabsState.custListBean.mcompanystatus = value.mcode;
          break;
        case 22:
          mnationality =  value;
          CustomerFormationMasterTabsState.custListBean.mnation = value.mcode;
          break;

         default:
          break;
      }
    });
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    //print("caption value : " + globals.dropdownCaptionsPersonalInfo[no]);

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
        k < globals.dropdownCaptionsValuesPersonalInfo[no].length;
        k++) {
      mapData.add(globals.dropdownCaptionsValuesPersonalInfo[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
   //   print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: Text(value.mcodedesc,
          overflow: TextOverflow.ellipsis),


      );
    }).toList();
    /**/
    /*   if(no==0){
      print(mapData);
      testString = mapData;
    }*/
    return _dropDownMenuItems1;
  }

  @override
  void initState() {


    monthFocus = new FocusNode();
    yearFocus = new FocusNode();
  ////  print("Appllicant DOB is ${CustomerFormationMasterTabsState.applicantDob}");
    monthFocusH = new FocusNode();
    yearFocusH = new FocusNode();
    buscommonthFocus = new FocusNode();
    buscomyearFocus = new FocusNode();
    repmonthFocus = new FocusNode();
    repyearFocus = new FocusNode();
    regmonthFocus = new FocusNode();
    regyearFocus = new FocusNode();
    incomonthFocus = new FocusNode();
    incoyearFocus = new FocusNode();
   // print("Spouse DOB is ${CustomerFormationMasterTabsState.husDob}");

    for(int i = 0;i<CustomerFormationMasterTabsState.personalInfoRadios.length;i++){
      if(CustomerFormationMasterTabsState.personalInfoRadios[i]==null)CustomerFormationMasterTabsState.personalInfoRadios[i]= 0;
    }
    if(CustomerFormationMasterTabsState.custListBean.mLoanAgreed!=null)CustomerFormationMasterTabsState.personalInfoRadios[0] = CustomerFormationMasterTabsState.custListBean.mLoanAgreed;
    //if(CustomerFormationMasterTabsState.custListBean.mInsuranceCovYN!=null)CustomerFormationMasterTabsState.personalInfoRadios[1] = int.parse(CustomerFormationMasterTabsState.custListBean.mInsuranceCovYN);
    if (!ifNullCheck(CustomerFormationMasterTabsState.custListBean
        .mInsuranceCovYN)) {
      try{
        CustomerFormationMasterTabsState.personalInfoRadios[1] = int.parse(
            CustomerFormationMasterTabsState.custListBean
                .mInsuranceCovYN);
      }
     catch(_){

     }
    }
    else{
      CustomerFormationMasterTabsState.custListBean
          .mInsuranceCovYN = "0";
    }
    if(CustomerFormationMasterTabsState.custListBean.mGend!=null)CustomerFormationMasterTabsState.personalInfoRadios[2] = CustomerFormationMasterTabsState.custListBean.mGend;
    else {
      CustomerFormationMasterTabsState.custListBean.mGend = 0;
    }
      if(CustomerFormationMasterTabsState.custListBean.mTypeofCoverage!=null)CustomerFormationMasterTabsState.personalInfoRadios[4] = CustomerFormationMasterTabsState.custListBean.mTypeofCoverage;
    else {
      CustomerFormationMasterTabsState.custListBean.mTypeofCoverage = 0;
    }


    // TODO: implement initState
    super.initState();
    List<String> tempDropDownValues = new List<String>();

    print("CustomerFormationMasterTabsState.custListBean.mgender "+ CustomerFormationMasterTabsState.custListBean.mgender.toString());
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.ifYesThen);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.mrelegion);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.mmaritialStatus.toString());
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.mqualification);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.moccupation.toString());
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mRuralUrban);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mnametitle);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.msecoccupatn.toString());
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mgender);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mnametitle2);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mlangofcust);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mtarget);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mownership);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mresstatus);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.miscpemp);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mrankofemp);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mcusttype);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.morgtitle);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.morgtitlek);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mcomtype);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mdefaultcurrency);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mcompanystatus);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.mnationality);

    if(!CustomerFormationMasterTabsState.applicantDob.contains("_")){
      try{
      //  print("inside try");

        String tempApplicantdob = CustomerFormationMasterTabsState.applicantDob;
        print("tempApplicantdob"+tempApplicantdob);
      //  print(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
     //   print(formattedDate);
        tempDay = formattedDate.day.toString();
     //   print(tempDay);
        tempMonth = formattedDate.month.toString();
      ////  print(tempMonth);
        tempYear = formattedDate.year.toString();
     //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }
  if(!CustomerFormationMasterTabsState.incoDate.contains("_")){
    try{
      //  print("inside try");

      String tempIncoDate = CustomerFormationMasterTabsState.incoDate;
      print("tempIncoDate"+tempIncoDate);
      //  print(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
      DateTime  formattedDate =  DateTime.parse(tempIncoDate.substring(6)+"-"+tempIncoDate.substring(3,5)+"-"+tempIncoDate.substring(0,2));
      //   print(formattedDate);
      incoDay = formattedDate.day.toString();
      //   print(incoDay);
      incoMonth = formattedDate.month.toString();
      ////  print(incoMonth);
      incoYear = formattedDate.year.toString();
      //   print(incoYear);
      setState(() {

      });

    }catch(e){

      print("Exception Occupred");
    }
  }


    if(!CustomerFormationMasterTabsState.regDate.contains("_")){
      try{
        //  print("inside try");

        String tempRegDate= CustomerFormationMasterTabsState.regDate;
        print(tempRegDate);
        DateTime  formattedDate =  DateTime.parse(tempRegDate.substring(6)+"-"+tempRegDate.substring(3,5)+"-"+tempRegDate.substring(0,2));
        //   print(formattedDate);
        regDay = formattedDate.day.toString();
        //   print(tempDay);
        regMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        regYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    if(!CustomerFormationMasterTabsState.repDOB.contains("_")){
      try{
        //  print("inside try");

        String tempRepDOB= CustomerFormationMasterTabsState.repDOB;
        print(tempRepDOB);
        //  print(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempRepDOB.substring(6)+"-"+tempRepDOB.substring(3,5)+"-"+tempRepDOB.substring(0,2));
        //   print(formattedDate);
        repDay = formattedDate.day.toString();
        //   print(tempDay);
        repMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        repYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    if(!CustomerFormationMasterTabsState.buscomDOB.contains("_")){
      try{
        //  print("inside try");

        String tempBusComDOB= CustomerFormationMasterTabsState.buscomDOB;
        print(tempBusComDOB);
        //  print(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempBusComDOB.substring(6)+"-"+tempBusComDOB.substring(3,5)+"-"+tempBusComDOB.substring(0,2));
        //   print(formattedDate);
        buscomDay = formattedDate.day.toString();
        //   print(tempDay);
        buscomMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        buscomYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }


    if(!CustomerFormationMasterTabsState.husDob.contains("_")){
      try{
        print("inside try");

        String tempHusDob = CustomerFormationMasterTabsState.husDob;
        print(tempHusDob.substring(6)+"-"+tempHusDob.substring(3,5)+"-"+tempHusDob.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempHusDob.substring(6)+"-"+tempHusDob.substring(3,5)+"-"+tempHusDob.substring(0,2));
        print(formattedDate);
        tempDayH = formattedDate.day.toString();
        print(tempDayH);
        tempMonthH = formattedDate.month.toString();
        print(tempMonthH);
        tempYearH = formattedDate.year.toString();
        print(tempYearH);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    for (int k = 0;
        k < globals.dropdownCaptionsValuesPersonalInfo.length;
        k++) {
      for (int i = 0;
          i < globals.dropdownCaptionsValuesPersonalInfo[k].length;
          i++) {

      //  print("tempDropDownValues[k].toString()"+tempDropDownValues[k].toString());
        try{
          if (globals.dropdownCaptionsValuesPersonalInfo[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            print("tempDropDownValues[k].toString()"+globals.dropdownCaptionsValuesPersonalInfo[k][i].mcode.toString());
            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesPersonalInfo[k][i]);
          }
        }catch(_){
          print("Exception Occured");

        }
      }
    }

  }



  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);
  List<Widget> _makeRadios(int numberOfRadios, List textName, int position) {
    List<Widget> radios = new List<Widget>();
    for (int i = 0; i < numberOfRadios; i++) {
      radios.add(Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: new Row(
          children: <Widget>[
            new Text(
              textName[i],
              textAlign: TextAlign.right,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
              ),
            ),
            new Radio(
              value: i,
              groupValue: CustomerFormationMasterTabsState.personalInfoRadios[position],
              onChanged: (selection) => _onRadioSelected(selection, position),
              activeColor: Color(0xff07426A),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ));
    }
    return radios;
  }

  Widget getTextContainer(String textValue) {
    return new Container(
      padding: EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 20.0),
      child: new Text(
        textValue,
        //textDirection: TextDirection,
        textAlign: TextAlign.start,
        /*overflow: TextOverflow.ellipsis,*/
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontStyle: FontStyle.normal,
            fontSize: 12.0),
      ),
    );
  }


  _onRadioSelected(int selection, int position) {
    setState(() => CustomerFormationMasterTabsState.personalInfoRadios[position] = selection);
    if (position == 0) {
      CustomerFormationMasterTabsState.custListBean.mLoanAgreed = selection;
    } else if (position == 1) {
      CustomerFormationMasterTabsState.custListBean.mInsuranceCovYN = selection as String;

    } else if (position == 2) {
      CustomerFormationMasterTabsState.custListBean.mGend = selection;

    }  else if (position == 4) {
      CustomerFormationMasterTabsState.custListBean.mTypeofCoverage = selection;

    }
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      //autovalidate: CustomerFormationMasterTabsState.autoValidate,
      onWillPop: () {
        return Future(() => true);
      }
      ,onChanged: () {
      final FormState form = _formKey.currentState;
      form.save();
    },
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        children: <Widget>[
          SizedBox(height: 16.0),
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: mcusttype,
                items: generateDropDown(16),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 16);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('CustmType')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),
          iscompany?
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: morgtitle,
                items: generateDropDown(17),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 17);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('Title')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ): new Container(),
          iscompany?        new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('org_name'),
                  labelText: Translations.of(context).text('org_name'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(200),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mnameoforg != null ? CustomerFormationMasterTabsState.custListBean.mnameoforg : "",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState.custListBean.mnameoforg =
                      value;
                }),
          ): new Container(),
          iscompany?        new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('sorg_name'),
                  labelText: Translations.of(context).text('sorg_name'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(200),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.msnameoforg != null ? CustomerFormationMasterTabsState.custListBean.msnameoforg : "",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState.custListBean.msnameoforg =
                      value;
                }),
          ): new Container(),
          iscompany?
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: morgtitle,
                items: generateDropDown(17),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 17);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText:Translations.of(context).text('title2') ),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ):new Container(),
          iscompany?        new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('org_name_k'),
                  labelText: Translations.of(context).text('org_name_k'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(200),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mnameoforgk != null ? CustomerFormationMasterTabsState.custListBean.mnameoforgk : "",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState.custListBean.mnameoforgk =
                      value;
                }),
          ): new Container(),
          iscompany?        new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('sorg_name_k'),
                  labelText: Translations.of(context).text('sorg_name_k'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(100),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.msnameoforgk != null ? CustomerFormationMasterTabsState.custListBean.msnameoforgk : "",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState.custListBean.msnameoforgk =
                      value;
                }),
          ): new Container(),
          iscompany?        new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('inco_reg'),
                  labelText: Translations.of(context).text('inco_reg'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(60),
                  globals.onlyAphaNumeric
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mregno != null ? CustomerFormationMasterTabsState.custListBean.mregno : "",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState.custListBean.mregno =
                      value;
                }),
          ): new Container(),
          iscompany?
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('inco_date'))],
            ),
          ): new Container(),
iscompany?
          new Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor,),



            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  child: new TextField(
                      decoration:
                      InputDecoration(
                          hintText: Translations.of(context).text('DD')
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      controller: incoDay == null?null:new TextEditingController(text: incoDay),
                      keyboardType: TextInputType.numberWithOptions(),

                      onChanged: (val){

                        if(val!="0"){
                          incoDay = val;


                          if(int.parse(val)<=31&&int.parse(val)>0){



                            if(val.length==2){
                              CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(0, 2, val);
                              FocusScope.of(context).requestFocus(incomonthFocus);
                            }
                            else{
                              CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(0, 2, "0"+val);
                            }


                          }
                          else {
                            setState(() {
                              incoDay ="";
                            });

                          }


                        }
                      }

                  ),

                )
                ,


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('MM'),


                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: incomonthFocus,
                    controller: incoMonth == null?null:new TextEditingController(text: incoMonth),
                    onChanged: (val){
                      if(val!="0"){
                        incoMonth = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(incoyearFocus);
                          }
                          else{
                            CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            incoMonth ="";
                          });

                        }
                      }



                    },

                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

                Container(
                  width:80,

                  child:new TextField(


                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('YYYY'),

                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                      globals.onlyIntNumber
                    ],


                    focusNode: incoyearFocus,
                    controller: incoYear == null?null:new TextEditingController(text: incoYear),
                    onChanged: (val){
                      incoYear = val;
                      if(val.length==4) CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(6, 10,val);

                    },
                  ),)
                ,

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectIncoDate(context);
                } )
              ],


            ),

          ): new Container(),
          iscompany?  new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('tax_reg_no'),
                  labelText: Translations.of(context).text('tax_reg_no'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(100),
                  globals.onlyAphaNumeric
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mtaxregno != null ? CustomerFormationMasterTabsState.custListBean.mtaxregno : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mtaxregno =
                      value;
                }),
          ):new Container(),


          iscompany?
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('tax_reg_date'))],
            ),
          ): new Container(),
          iscompany?
          new Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor,),



            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  child: new TextField(
                      decoration:
                      InputDecoration(
                          hintText: Translations.of(context).text('DD')
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      controller: regDay == null?null:new TextEditingController(text: regDay),
                      keyboardType: TextInputType.numberWithOptions(),

                      onChanged: (val){

                        if(val!="0"){
                          regDay = val;


                          if(int.parse(val)<=31&&int.parse(val)>0){



                            if(val.length==2){
                              CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(0, 2, val);
                              FocusScope.of(context).requestFocus(regmonthFocus);
                            }
                            else{
                              CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(0, 2, "0"+val);
                            }


                          }
                          else {
                            setState(() {
                              regDay ="";
                            });

                          }


                        }
                      }

                  ),

                )
                ,


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('MM'),


                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: regmonthFocus,
                    controller: regMonth == null?null:new TextEditingController(text: regMonth),
                    onChanged: (val){
                      if(val!="0"){
                        regMonth = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(regyearFocus);
                          }
                          else{
                            CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            regMonth ="";
                          });

                        }
                      }



                    },

                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

                Container(
                  width:80,

                  child:new TextField(


                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('YYYY'),

                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                      globals.onlyIntNumber
                    ],


                    focusNode: regyearFocus,
                    controller: regYear == null?null:new TextEditingController(text: regYear),
                    onChanged: (val){
                      regYear = val;
                      if(val.length==4) CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(6, 10,val);

                    },
                  ),)
                ,

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectregDate(context);
                } )
              ],


            ),

          ): new Container(),

          iscompany?  new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('cmp_eco_indi'),
                  labelText: Translations.of(context).text('cmp_eco_indi'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(20),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mcomecoindicator != null ? CustomerFormationMasterTabsState.custListBean.mcomecoindicator : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mcomecoindicator =
                      value;
                }),
          ):new Container(),

          iscompany?  new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('NtID'),
                  labelText: Translations.of(context).text('NtID'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(9),
                  globals.onlyAphaNumeric
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mnationalid != null ? CustomerFormationMasterTabsState.custListBean.mnationalid : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mnationalid =
                      value;
                }),
          ):new Container(),


          iscompany?
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('rep_dob'))],
            ),
          ): new Container(),
          iscompany?
          new Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor,),



            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  child: new TextField(
                      decoration:
                      InputDecoration(
                          hintText: Translations.of(context).text('DD')
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      controller: repDay == null?null:new TextEditingController(text: repDay),
                      keyboardType: TextInputType.numberWithOptions(),

                      onChanged: (val){

                        if(val!="0"){
                          repDay = val;


                          if(int.parse(val)<=31&&int.parse(val)>0){



                            if(val.length==2){
                              CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(0, 2, val);
                              FocusScope.of(context).requestFocus(repmonthFocus);
                            }
                            else{
                              CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(0, 2, "0"+val);
                            }


                          }
                          else {
                            setState(() {
                              repDay ="";
                            });

                          }


                        }
                      }

                  ),

                )
                ,


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('MM'),


                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: repmonthFocus,
                    controller: repMonth == null?null:new TextEditingController(text: repMonth),
                    onChanged: (val){
                      if(val!="0"){
                        repMonth = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(repyearFocus);
                          }
                          else{
                            CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            repMonth ="";
                          });

                        }
                      }



                    },

                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

                Container(
                  width:80,

                  child:new TextField(


                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('YYYY'),

                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                      globals.onlyIntNumber
                    ],


                    focusNode: repyearFocus,
                    controller: repYear == null?null:new TextEditingController(text: repYear),
                    onChanged: (val){
                      repYear = val;
                      if(val.length==4) CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(6, 10,val);

                    },
                  ),)
                ,

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectrepDOB(context);
                } )
              ],


            ),

          ): new Container(),


          iscompany?  new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('Issuauth'),
                  labelText: Translations.of(context).text('Issuauth'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(20),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.missuingauth != null ? CustomerFormationMasterTabsState.custListBean.missuingauth : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.missuingauth =
                      value;
                }),
          ):new Container(),
          iscompany?
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: mnationality,
                items: generateDropDown(22),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 22);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('Ntnlty')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ): new Container(),
iscompany?Center(
  child: new Column(children: [
    //occupationRadio(),

    Container(
      color: Constant.mandatoryColor
      ,child:new DropdownButtonFormField(
      value: mcomtype,
      items: generateDropDown(19),
      onChanged: (LookupBeanData newValue) {
        showDropDown(newValue, 19);
      },
      validator: (args) {
        print(args);
      },
      //  isExpanded: true,
      //hint:Text("Select"),
      decoration: InputDecoration(labelText: Translations.of(context).text('comp_type')),
      // style: TextStyle(color: Colors.grey),
    ),)


  ]),
):new Container(),

          iscompany?Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: mdefaultcurrency,
                items: generateDropDown(20),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 20);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('def_cur')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ):new Container(),


          iscompany?
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('buss_comm_date'))],
            ),
          ): new Container(),
          iscompany?
          new Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor,),



            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  child: new TextField(
                      decoration:
                      InputDecoration(
                          hintText: Translations.of(context).text('DD')
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      controller: buscomDay == null?null:new TextEditingController(text: buscomDay),
                      keyboardType: TextInputType.numberWithOptions(),

                      onChanged: (val){

                        if(val!="0"){
                          buscomDay = val;


                          if(int.parse(val)<=31&&int.parse(val)>0){



                            if(val.length==2){
                              CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(0, 2, val);
                              FocusScope.of(context).requestFocus(buscommonthFocus);
                            }
                            else{
                              CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(0, 2, "0"+val);
                            }


                          }
                          else {
                            setState(() {
                              buscomDay ="";
                            });

                          }


                        }
                      }

                  ),

                )
                ,


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('MM'),


                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: buscommonthFocus,
                    controller: buscomMonth == null?null:new TextEditingController(text: buscomMonth),
                    onChanged: (val){
                      if(val!="0"){
                        buscomMonth = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(buscomyearFocus);
                          }
                          else{
                            CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            buscomMonth ="";
                          });

                        }
                      }



                    },

                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

                Container(
                  width:80,

                  child:new TextField(


                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('YYYY'),

                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                      globals.onlyIntNumber
                    ],


                    focusNode: buscomyearFocus,
                    controller: buscomYear == null?null:new TextEditingController(text: buscomYear),
                    onChanged: (val){
                      buscomYear = val;
                      if(val.length==4) CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(6, 10,val);

                    },
                  ),)
                ,

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectbuscomDOB(context);
                } )
              ],


            ),

          ): new Container(),
          iscompany?  new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('buss_desc'),
                  labelText: Translations.of(context).text('buss_desc'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(100),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mbusinessdesc != null ? CustomerFormationMasterTabsState.custListBean.mbusinessdesc : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mbusinessdesc =
                      value;
                }),
          ):new Container(),
          iscompany?
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: mcompanystatus,
                items: generateDropDown(21),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 21);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('comp_status')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ):new Container(),

          SizedBox(height: 16.0),
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                  color: Constant.mandatoryColor
                  ,child:new DropdownButtonFormField(
                value: title,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('Title')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),

          SizedBox(height: 16.0),
          new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('EntrFrstnm'),
                  labelText: Translations.of(context).text('Frstnm'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xff07426A),
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xff07426A),
                  )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(50),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mfname != null ? CustomerFormationMasterTabsState.custListBean.mfname : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mfname =
                      value;
                }),
          ),
          SizedBox(height: 16.0),

          new TextFormField(
              textCapitalization: TextCapitalization.characters,
              decoration:  InputDecoration(

                hintText: Translations.of(context).text('Entrmddlnm'),
                labelText: Translations.of(context).text('Mddlnm'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff07426A),
                )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(50),
                globals.onlyCharacter
              ],
              initialValue:
              CustomerFormationMasterTabsState.custListBean.mmname != null ? CustomerFormationMasterTabsState.custListBean.mmname : "",
              validator: (arg) =>
                  Utility.validateOnlyCharacterFieldNotMandat(arg),
              onSaved: (String value) {
                CustomerFormationMasterTabsState.custListBean.mmname = value;
              }),
          SizedBox(height: 16.0),
          new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('Entrlstnm'),
                  labelText: Translations.of(context).text('Lstnm'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xff07426A),
                  )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(50),
                  globals.onlyCharacter
                ],
                initialValue: CustomerFormationMasterTabsState.custListBean.mlname != null ? CustomerFormationMasterTabsState.custListBean.mlname : "",
                onSaved: (String value) {
                  /*globals.lastName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mlname = value;
                }),
          ),


          SizedBox(height: 16.0),
          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: title,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText:Translations.of(context).text('title2') ),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),

          SizedBox(height: 16.0),
          new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('fname2'),
                  labelText: Translations.of(context).text('fname2hint'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(50),
                  globals.onlyCharacter
                ],
                initialValue:
                CustomerFormationMasterTabsState.custListBean.mfname2 != null ? CustomerFormationMasterTabsState.custListBean.mfname2 : "",
                onSaved: (String value) {
                  /*globals.firstName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mfname2 =
                      value;
                }),
          ),
          SizedBox(height: 16.0),

          new TextFormField(
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('mname2'),
                labelText: Translations.of(context).text('mname2hint'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff07426A),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(50),
                globals.onlyCharacter
              ],
              initialValue:
              CustomerFormationMasterTabsState.custListBean.mmname2 != null ? CustomerFormationMasterTabsState.custListBean.mmname2 : "",
              validator: (arg) =>
                  Utility.validateOnlyCharacterFieldNotMandat(arg),
              onSaved: (String value) {
                CustomerFormationMasterTabsState.custListBean.mmname2 = value;
              }),
          SizedBox(height: 16.0),
          new Container(
            color: Constant.mandatoryColor,
            child: new TextFormField(
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('lname2'),
                  labelText: Translations.of(context).text('lname2hint'),
                  hintStyle: TextStyle(color: Colors.grey),
                  /*labelStyle: TextStyle(color: Colors.grey),*/
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(50),
                  globals.onlyCharacter
                ],
                initialValue: CustomerFormationMasterTabsState.custListBean.mlname2 != null ? CustomerFormationMasterTabsState.custListBean.mlname2 : "",
                onSaved: (String value) {
                  /*globals.lastName = value;*/
                  CustomerFormationMasterTabsState.custListBean.mlname2 = value;
                }),
          ),

          SizedBox(height: 20.0,),
          iscompany?new Container():     Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('ApplDaOB'))],
            ),
          ),
iscompany?new Container():
          new Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor,),



            child: new Row(
              children: <Widget>[
            new Container(
            width: 50.0,
                child: new TextField(
                  decoration:
                  InputDecoration(
                      hintText: Translations.of(context).text('DD')
                  ),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(2),
                    globals.onlyIntNumber
                  ],
                  controller: tempDay == null?null:new TextEditingController(text: tempDay),
                  keyboardType: TextInputType.numberWithOptions(),

                  onChanged: (val){

                    if(val!="0"){
                      tempDay = val;


                      if(int.parse(val)<=31&&int.parse(val)>0){



                        if(val.length==2){
                          CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(0, 2, val);
                          FocusScope.of(context).requestFocus(monthFocus);
                        }
                        else{
                          CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(0, 2, "0"+val);
                        }


                      }
                      else {
                        setState(() {
                          tempDay ="";
                        });

                      }


                    }
                    }

                ),

              )
               ,


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                        hintText: Translations.of(context).text('MM'),


                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: monthFocus,
                    controller: tempMonth == null?null:new TextEditingController(text: tempMonth),
                    onChanged: (val){
                      if(val!="0"){
                        tempMonth = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(yearFocus);
                          }
                          else{
                            CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            tempMonth ="";
                          });

                        }
                      }



                    },

                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

              Container(
                width:80,

                child:new TextField(


                  decoration: InputDecoration(
                      hintText: Translations.of(context).text('YYYY'),

                  ),

                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                    globals.onlyIntNumber
                  ],


                  focusNode: yearFocus,
                  controller: tempYear == null?null:new TextEditingController(text: tempYear),
                  onChanged: (val){
                    tempYear = val;
                    if(val.length==4) CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(6, 10,val);

                  },
                ),)
                ,

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectDate(context);
                } )
              ],


            ),

          ),

          iscompany?new Container():       Container(
            color: Constant.mandatoryColor
            ,child: new DropdownButtonFormField(
            value:gender==null?null: gender,
            items: generateDropDown(8),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 8);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('gender')),
            // style: TextStyle(color: Colors.grey),
          ),),


          iscompany?new Container():    new TextFormField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: Translations.of(context).text('fatfnamehint'),
                labelText: Translations.of(context).text('fatfnamlabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff07426A),
                )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(50),
                globals.onlyCharacter
              ],
              initialValue: CustomerFormationMasterTabsState
                          .custListBean.mfatherfname !=
                      null
                  ? CustomerFormationMasterTabsState
                      .custListBean.mfatherfname
                  : " ",
              onSaved: (String value) {
                CustomerFormationMasterTabsState
                    .custListBean.mfatherfname = value;
              }),
          SizedBox(height: 16.0),
          iscompany?new Container(): new TextFormField(
              textCapitalization: TextCapitalization.characters,

              decoration: InputDecoration(
                hintText: Translations.of(context).text('fatmnamehint'),
                labelText: Translations.of(context).text('fatmnamelabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff07426A),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(50),
                globals.onlyCharacter
              ],
              initialValue: CustomerFormationMasterTabsState
                  .custListBean.mfathermname !=
                  null
                  ? CustomerFormationMasterTabsState
                  .custListBean.mfathermname
                  : " ",
              onSaved: (String value) {
                CustomerFormationMasterTabsState
                    .custListBean.mfathermname = value;
              }),
          SizedBox(height: 16.0),
          iscompany?new Container():   new TextFormField(
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: Translations.of(context).text('fatlnamehint'),
                labelText: Translations.of(context).text('fatlname2label'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff07426A),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(50),
                globals.onlyCharacter
              ],
              initialValue: CustomerFormationMasterTabsState
                  .custListBean.mfatherlname !=
                  null
                  ? CustomerFormationMasterTabsState
                  .custListBean.mfatherlname
                  : " ",
              onSaved: (String value) {
                CustomerFormationMasterTabsState
                    .custListBean.mfatherlname = value;
              }),
          SizedBox(height: 16.0),
          iscompany?new Container():  Container(
            color: Constant.mandatoryColor
            ,child:new DropdownButtonFormField(
            value:maritialStatus==null?null: maritialStatus,
            items: generateDropDown(2),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 2);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('Mrtlstts')),
            // style: TextStyle(color: Colors.grey),
          ),),
         /* SizedBox(height: 16.0),
          Container(
            color: maritialStatus!=null && maritialStatus.mcodedesc!=null &&maritialStatus.mcodedesc.toUpperCase().trim()=="MARRIED"?
            Constant.mandatoryColor:null,
            child:new TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter Spouse  Name',
                  labelText: 'Spouse Name',
                  hintStyle: TextStyle(color: Colors.grey),
                  *//*labelStyle: TextStyle(color: Colors.grey),*//*
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(100),
                  globals.onlyCharacter
                ],
                initialValue: CustomerFormationMasterTabsState
                    .custListBean.mhusbandname !=
                    null
                    ? CustomerFormationMasterTabsState
                    .custListBean.mhusbandname
                    : " ",
                onSaved: (String value) {
                  CustomerFormationMasterTabsState
                      .custListBean.mhusbandname = value;
                }),
          ),

          SizedBox(height: 20.0,),
          Container(
            child: new Row(
              children: <Widget>[Text(Constant.husDob)],
            ),
          ),

          new Container(  child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                  child: new TextField(
                      decoration:
                      InputDecoration(
                          hintText: "DD"
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      controller: tempDayH == null?null:new TextEditingController(text: tempDayH),
                      keyboardType: TextInputType.numberWithOptions(),

                      onChanged: (val){
                        if(val!="0"){
                          tempDayH = val;

                          if(int.parse(val)<=31&&int.parse(val)>0){

                            if(val.length==2){
                              CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(0, 2, val);
                              FocusScope.of(context).requestFocus(monthFocusH);
                            }
                            else{
                              CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(0, 2, "0"+val);
                            }
                          }
                          else {
                            setState(() {
                              tempDayH ="";
                            });
                          }
                        }
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),
                new Container(
                  width: 50.0,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: "MM",
                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    focusNode: monthFocusH,
                    controller: tempMonthH == null?null:new TextEditingController(text: tempMonthH),
                    onChanged: (val){
                      if(val!="0"){
                        tempMonthH = val;
                        if(int.parse(val)<=12&&int.parse(val)>0){

                          if(val.length==2){
                            CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(3, 5, val);

                            FocusScope.of(context).requestFocus(yearFocusH);
                          }
                          else{
                            CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(3, 5, "0"+val);
                          }
                        }
                        else {
                          setState(() {
                            tempMonthH ="";
                          });
                        }
                      }
                    },
                  ),
                )
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("/"),
                ),

                Container(
                  width:80,
                  child:new TextField(
                    decoration: InputDecoration(
                      hintText: "YYYY",
                    ),

                    keyboardType: TextInputType.numberWithOptions(),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(4),
                      globals.onlyIntNumber
                    ],
                    focusNode: yearFocusH,
                    controller: tempYearH == null?null:new TextEditingController(text: tempYearH),
                    onChanged: (val){
                      tempYearH = val;
                      if(val.length==4) CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(6, 10,val);

                    },
                  ),),

                SizedBox(
                  width: 50.0,
                ),

                IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                  _selectHusDate(context);
                } )
              ],
            ),
          ),
*/
          iscompany?new Container():    Container(
        color: Constant.mandatoryColor
        ,child:
          new DropdownButtonFormField(
            value: mresstatus,
            items: generateDropDown(13),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 13);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('rsdntstts')),
            // style: TextStyle(color: Colors.grey),
          ),
      ),


          iscompany?new Container():   Container(
        color: Constant.mandatoryColor
        ,child:
          new DropdownButtonFormField(
            value: relegion,
            items: generateDropDown(1),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 1);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('religion')),
            // style: TextStyle(color: Colors.grey),
          ),
      ),

          iscompany?new Container():
          Container(
            color: Constant.mandatoryColor,

            child:new DropdownButtonFormField(
            value: qualification==null?null: qualification,
            items: generateDropDown(3),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 3);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('qualification')),
            // style: TextStyle(color: Colors.grey),
          ) ),

         /* new DropdownButtonFormField(
            value: region==null?null:region,
            items: generateDropDown(5),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 5);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: "Location Type"),
            // style: TextStyle(color: Colors.grey),
          ),*/



          iscompany?new Container():   Container(
            color: Constant.mandatoryColor,
            child:new DropdownButtonFormField(
            value: motherTongue,
            items: generateDropDown(10),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 10);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('lang')),
            // style: TextStyle(color: Colors.grey),
          ),),

          iscompany?new Container():Container(
            color: Constant.mandatoryColor,
            child: new DropdownButtonFormField(
          value: occupation==null?null:occupation,
            items: generateDropDown(4),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 4);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: Translations.of(context).text('Occptn')),
            // style: TextStyle(color: Colors.grey),
          ),
          ),


          SizedBox(height: 16.0),
          iscompany?new Container(): Container(
        color: Constant.mandatoryColor
        ,child:
          new DropdownButtonFormField(
            value: miscpemp==null?null:miscpemp,
            items: generateDropDown(14),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 14);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText:
                Translations.of(context).text('IsBankEmp')),
            // style: TextStyle(color: Colors.grey),
          ),
      ),
          iscompany?new Container():   iscpemp?Card(
            //color: Constant.mandatoryColor

            child: new IgnorePointer(
              ignoring: true,
              child:new DropdownButtonFormField(
                value: mrankofemp,
                items: generateDropDown(15),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 15);
                },
                validator: (args) {
                  print(args);
                },
                  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('RnkOfEmp')

                ),
                // style: TextStyle(color: Colors.grey),
              ),),):Card(
            //color: Constant.mandatoryColor
            child:new DropdownButtonFormField(
              value: mrankofemp,
              items: generateDropDown(15),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 15);
              },
              validator: (args) {
                print(args);
              },
               isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('RnkOfEmp')),
              // style: TextStyle(color: Colors.grey),
            ),),
       /*   SizedBox(height: 16.0),
          new DropdownButtonFormField(
            value: mrankofemp==null?null:mrankofemp,
            items: generateDropDown(15),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 15);
            },
            validator: (args) {
              print(args);
            },
            //  isExpanded: true,
            //hint:Text("Select"),
            decoration: InputDecoration(labelText: "Rank Of Employee"),
            // style: TextStyle(color: Colors.grey),
          ),*/
          iscompany?new Container():  iscpemp?
          Container(

            child: new TextFormField(
              enabled: false,
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('empidhint'),
                labelText: Translations.of(context).text('empidlable'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.mempid != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.mempid)
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(30),
                globals.onlyAphaNumeric
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.mempid = val;
                // }
              },
            ),
          ):Container(

            child: new TextFormField(
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('empidhint'),
                labelText: Translations.of(context).text('empidlable'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.mempid != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.mempid)
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(30),
                globals.onlyAphaNumeric
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.mempid = val;
                // }
              },
            ),
          ),


          new Card(
            color: Constant.mandatoryColor,
            child: DropdownButtonFormField(
              isExpanded: true,
              value: mtarget,
              items: generateDropDown(11),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 11);
              },
              validator: (args) {
                print(args);

              },
              //  isExpanded: true,
              hint:Text(""),
              decoration: InputDecoration(labelText: Translations.of(context).text('target')),
              // style: TextStyle(color: Colors.grey),
            ),

          ),


          new Card(
              color: Constant.mandatoryColor,
            child: new ListTile(
                title: new Text(Translations.of(context).text('industry')),
                subtitle: CustomerFormationMasterTabsState.custListBean.mmainoccupn == null
                    ? new Text("")
                    : new Text("Industry : ${CustomerFormationMasterTabsState.custListBean.mmainoccupndesc}   And Code : ${CustomerFormationMasterTabsState.custListBean.mmainoccupn}"),
                onTap: () => getMainOccupation("Industry",occupation!=null ?int.parse(occupation.mcode!=null?occupation.mcode:"0"):0 )),
          ),
          new Card(
              color: Constant.mandatoryColor,
            child: new ListTile(
                title: new Text(Translations.of(context).text('sector')),
                subtitle: CustomerFormationMasterTabsState.custListBean.msuboccupn == null
                    ? new Text("")
                    : new Text("Sector : ${CustomerFormationMasterTabsState.custListBean.msuboccupndesc}   And Code : ${CustomerFormationMasterTabsState.custListBean.msuboccupn}"),
                onTap: () => getSubOccupation("Sector",
                    int.parse(CustomerFormationMasterTabsState.custListBean.mmainoccupn != null ? CustomerFormationMasterTabsState.custListBean.mmainoccupn : 0))),
          ),
          new Card(
            color: Constant.mandatoryColor,
            child: DropdownButtonFormField(
              value: mownership,
              items: generateDropDown(12),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 12);
              },
              validator: (args) {
                print(args);
              },
                isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('ownership')),
              // style: TextStyle(color: Colors.grey),
            ),
          ),

//          Center(
//            child: new Column(children: [
//              //occupationRadio(),
//
//              Container(
//
//                color: Constant.mandatoryColor,
//                child:new DropdownButtonFormField(
//                value: mownership,
//                items: generateDropDown(12),
//                onChanged: (LookupBeanData newValue) {
//                  showDropDown(newValue, 12);
//                },
//                validator: (args) {
//                  print(args);
//                },
//                //  isExpanded: true,
//                //hint:Text("Select"),
//                decoration: InputDecoration(labelText: Translations.of(context).text('ownership')),
//                // style: TextStyle(color: Colors.grey),
//              ),)
//
//
//            ]),
//          ),



//          SizedBox(height: 16.0),
//          iscompany?new Container(): new DropdownButtonFormField(
//            value: secondryOccuptn==null?null:secondryOccuptn,
//            items: generateDropDown(7),
//            onChanged: (LookupBeanData newValue) {
//              showDropDown(newValue, 7);
//            },
//            validator: (args) {
//              print(args);
//            },
//            //  isExpanded: true,
//            //hint:Text("Select"),
//            decoration: InputDecoration(labelText: Translations.of(context).text('SecOcc')),
//            // style: TextStyle(color: Colors.grey),
//          ),

          iscompany?new Container(): new Card(
            color: Constant.mandatoryColor,
            child: DropdownButtonFormField(
              value: secondryOccuptn==null?null:secondryOccuptn,
              items: generateDropDown(7),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 7);
              },
              validator: (args) {
                print(args);
              },
              isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('SecOcc')),
              // style: TextStyle(color: Colors.grey),
            ),

          ),

//          iscompany?new Container():
//          new DropdownButtonFormField(
//            value: secondryOccuptn==null?null:secondryOccuptn,
//            items: generateDropDown(7),
//            onChanged: (LookupBeanData newValue) {
//              showDropDown(newValue, 7);
//            },
//            validator: (args) {
//              print(args);
//            },
//            //  isExpanded: true,
//            //hint:Text("Select"),
//            decoration: InputDecoration(labelText: Translations.of(context).text('SecOcc')),
//            // style: TextStyle(color: Colors.grey),
//          ),

          iscompany?new Container():  Container(
            color: Constant.mandatoryColor,

            child: new TextFormField(
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('iserngmembrBalhint'),
                labelText: Translations.of(context).text('iserngmembrlabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.misearngmembr != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.misearngmembr.toString())
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
                globals.onlyIntNumber
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.misearngmembr = val;
                // }
              },
            ),
          ),

          iscompany?new Container():  Container(
            color: Constant.mandatoryColor,

            child: new TextFormField(
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('isstydngmemhint'),
                labelText: Translations.of(context).text('isstydngmemlabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.misstudyingmembr != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.misstudyingmembr)
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
                globals.onlyIntNumber
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.misstudyingmembr = val;
                // }
              },
            ),
          ),


          iscompany?new Container():  Container(
            color: Constant.mandatoryColor,

            child: new TextFormField(
              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('isdependnthint'),
                labelText: Translations.of(context).text('isdependntlabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.mmemberno != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.mmemberno)
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
                globals.onlyIntNumber
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.mmemberno = val;
                // }
              },
            ),
          ),


          iscompany?new Container():  Container(
            color: Constant.mandatoryColor,

            child: new TextFormField(

              keyboardType: TextInputType.phone,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('ischldrnhint'),
                labelText: Translations.of(context).text('ischldrnlabel'),
                hintStyle: TextStyle(color: Colors.grey),
                /*labelStyle: TextStyle(color: Colors.grey),*/
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5c6bc0),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
              controller: CustomerFormationMasterTabsState.custListBean.mischldrn != null
                  ? TextEditingController(text: CustomerFormationMasterTabsState.custListBean.mischldrn)
                  : TextEditingController(text: ""),
              inputFormatters: [
                new LengthLimitingTextInputFormatter(2),
                globals.onlyIntNumber
              ],
              onSaved: (val) {
                //  if(val!=null) {
                CustomerFormationMasterTabsState.custListBean.mischldrn = val;
                // }
              },
            ),
          ),

        ],
      ),
    );
  }


  Future getMainOccupation(String purposeMode, int selectedPosition) async {
    mainOcc = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForMainOccupationSelection(position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      //subPurposeName=purposeObjVal.codeDesc;
      //subPurposeId = purposeObjVal.code;
      CustomerFormationMasterTabsState.custListBean.mmainoccupndesc = purposeObjVal.codeDesc;
      CustomerFormationMasterTabsState.custListBean.mmainoccupn = (purposeObjVal.code.trim());
    });

  }

  Future getSubOccupation(String purposeMode, int selectedPosition) async {
    mainOcc = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForSubOccupationSelection(type: "Sector Selection List",basicCode: 1800000,position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      //subPurposeName=purposeObjVal.codeDesc;
      //subPurposeId = purposeObjVal.code;
      CustomerFormationMasterTabsState.custListBean.msuboccupndesc = purposeObjVal.codeDesc;
      CustomerFormationMasterTabsState.custListBean.msuboccupn = (purposeObjVal.code.trim());
    });
    /*  if (purposeMode == "subpurpose") {
//   if (purposeObj??  purposeObj.codeDesc??  purposeObj.code?? ) {
      subPurposeName = purposeObj.codeDesc ?? "";
      subPurposeId = purposeObj.code;
      // }
    }*/
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .custListBean.mdob)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mdob= picked;
        tempDate = formatter.format(picked);
        if(picked.day.toString().length==1){
          tempDay = "0"+picked.day.toString();

        }
        else tempDay = picked.day.toString();
        CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(0, 2, tempDay);
        tempYear = picked.year.toString();
        CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(6, 10,tempYear);
        if(picked.month.toString().length==1){
          tempMonth = "0"+picked.month.toString();
        }
        else
        tempMonth = picked.month.toString();
        CustomerFormationMasterTabsState.applicantDob = CustomerFormationMasterTabsState.applicantDob.replaceRange(3, 5, tempMonth);

      });
  }
  Future<Null> _selectbuscomDOB(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .custListBean.mbusinesscommncmntdate)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mbusinesscommncmntdate= picked;
        buscomDOB = formatter.format(picked);
        if(picked.day.toString().length==1){
          buscomDay = "0"+picked.day.toString();

        }
        else buscomDay = picked.day.toString();
        CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(0, 2, buscomDay);
        buscomYear = picked.year.toString();
        CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(6, 10,buscomYear);
        if(picked.month.toString().length==1){
          buscomMonth = "0"+picked.month.toString();
        }
        else
          buscomMonth = picked.month.toString();
        CustomerFormationMasterTabsState.buscomDOB = CustomerFormationMasterTabsState.buscomDOB.replaceRange(3, 5, buscomMonth);

      });
  }
  Future<Null> _selectrepDOB(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .custListBean.mregdob)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mregdob= picked;
        repDOB = formatter.format(picked);
        if(picked.day.toString().length==1){
          repDay = "0"+picked.day.toString();

        }
        else repDay = picked.day.toString();
        CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(0, 2, repDay);
        repYear = picked.year.toString();
        CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(6, 10,repYear);
        if(picked.month.toString().length==1){
          repMonth = "0"+picked.month.toString();
        }
        else
          repMonth = picked.month.toString();
        CustomerFormationMasterTabsState.repDOB = CustomerFormationMasterTabsState.repDOB.replaceRange(3, 5, repMonth);

      });
  }
  Future<Null> _selectregDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .custListBean.mtaxregdatae)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mtaxregdatae= picked;
        regDate = formatter.format(picked);
        if(picked.day.toString().length==1){
          regDay = "0"+picked.day.toString();

        }
        else regDay = picked.day.toString();
        CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(0, 2, regDay);
        regYear = picked.year.toString();
        CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(6, 10,regYear);
        if(picked.month.toString().length==1){
          regMonth = "0"+picked.month.toString();
        }
        else
          regMonth = picked.month.toString();
        CustomerFormationMasterTabsState.regDate = CustomerFormationMasterTabsState.regDate.replaceRange(3, 5, regMonth);

      });
  }
  Future<Null> _selectIncoDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .custListBean.mregdatae)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mregdatae= picked;
        incoDate = formatter.format(picked);
        if(picked.day.toString().length==1){
          incoDay = "0"+picked.day.toString();

        }
        else incoDay = picked.day.toString();
        CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(0, 2, incoDay);
        incoYear = picked.year.toString();
        CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(6, 10,incoYear);
        if(picked.month.toString().length==1){
          incoMonth = "0"+picked.month.toString();
        }
        else
          incoMonth = picked.month.toString();
        CustomerFormationMasterTabsState.incoDate = CustomerFormationMasterTabsState.incoDate.replaceRange(3, 5, incoMonth);

      });
  }
  Future<Null> _selectHusDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState.custListBean.mhusdob)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.mhusdob= picked;
        tempDateH = formatter.format(picked);
        if(picked.day.toString().length==1){
          tempDayH = "0"+picked.day.toString();

        }
        else tempDayH = picked.day.toString();
        CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(0, 2, tempDayH);
        tempYearH = picked.year.toString();
        CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(6, 10,tempYearH);
        if(picked.month.toString().length==1){
          tempMonthH = "0"+picked.month.toString();
        }
        else
          tempMonthH = picked.month.toString();
        CustomerFormationMasterTabsState.husDob = CustomerFormationMasterTabsState.husDob.replaceRange(3, 5, tempMonthH);

      });
  }

  Future getCountryName() async {
    tempContrybean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myCountryDialog,
          fullscreenDialog: true,
        ));
    if(tempContrybean!=null) {
      CustomerFormationMasterTabsState.custListBean.mregcountryname = tempContrybean.cntryCd;
      AppDatabase.get().getCountryNameViaCountryCode(
          tempContrybean.cntryCd.toString()).then((onValue) {
        countryName = onValue.countryName;
        print("onValue.countryName"+onValue.countryName);
        print("countryName"+countryName);
      });
    }
  }
}
