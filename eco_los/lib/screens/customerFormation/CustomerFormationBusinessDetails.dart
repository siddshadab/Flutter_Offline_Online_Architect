import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBussinessDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';

import 'package:eco_los/systems/address/FullScreenDialogForAreaSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForCountrySelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForDistrictSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForStateSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForSubDistrictSelection.dart';


class CustomerFormationBusinessDetails extends StatefulWidget {
  CustomerFormationBusinessDetails({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CustomerFormationBusinessDetailsState createState() =>
      new _CustomerFormationBusinessDetailsState();
}

class _CustomerFormationBusinessDetailsState
    extends State<CustomerFormationBusinessDetails> {
  CountryDropDownBean tempContrybean = new CountryDropDownBean();
  StateDropDownList tempStateBean = new StateDropDownList();
  SubDistrictDropDownList tempSubDistrictBean = new SubDistrictDropDownList();
  DistrictDropDownList tempDistrictBean = new DistrictDropDownList();
  AreaDropDownList tempAreaDistrict = new AreaDropDownList();
  FullScreenDialogForCountrySelection _myCountryDialog =
  new FullScreenDialogForCountrySelection();
  FullScreenDialogForStateSelection _myStateDialog =
  new FullScreenDialogForStateSelection();
  FullScreenDialogForDistrictSelection _myDistrictDialog =
  new FullScreenDialogForDistrictSelection();
  FullScreenDialogForSubDistrictSelection _mySubDistrictDialog =
  new FullScreenDialogForSubDistrictSelection();
  FullScreenDialogForAreaSelection _myAreaDialog =
  new FullScreenDialogForAreaSelection();
  String countryName="";
  String stateName="";
  String districtName="";
  String subDistrictName="";
  String areaName="";
  CountryDropDownBean cddb= new  CountryDropDownBean();
  bool isSalaried =true;
  bool show =false;
  final formatDouble = new NumberFormat("#,##0.00", "en_US");

  String tempEmpToDay;
  String tempEmpToMonth;
  String tempEmpToYear;
  String tempEmpFromDay;
  String tempEmpFromMonth;
  String tempEmpFromYear;
  FocusNode EmpToMonthFocus;
  FocusNode EmpToYearFocus;
  FocusNode EmpFromMonthFocus;
  FocusNode EmpFromYearFocus;

  String tempEmpDateOfImcorpDay;
  String tempEmpDateOfImcorpMonth;
  String tempEmpDateOfImcorpYear;
  FocusNode EmpDateOfImcorpMonthFocus;
  FocusNode EmpDateOfImcorpYearFocus;

  var formatter = new DateFormat('dd-MM-yyyy');

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData occupaOrBuisness;
  LookupBeanData misselfemp;
  LookupBeanData comCatg;
  LookupBeanData bussType;
  LookupBeanData msrcname;
  LookupBeanData mstatusofemp;
  LookupBeanData misprimarysrcincome;
  LookupBeanData mrankemp;
  LookupBeanData mposition;
  LookupBeanData mdepartment;
  LookupBeanData mbussstatus;
  bool isYes=false;
  bool forEdit=false;

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
  @override
  void initState() {

    EmpToMonthFocus= new FocusNode();
    EmpDateOfImcorpYearFocus= new FocusNode();
    EmpToYearFocus = new FocusNode();
    EmpFromMonthFocus = new FocusNode();
    EmpFromYearFocus = new FocusNode();
    EmpDateOfImcorpMonthFocus = new FocusNode();
    getSessionVariables();
    print("hello init");
       if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.isNotEmpty){
      print("I am not empty");
      print(isYes);
      print(CustomerFormationMasterTabsState.custListBean
          .customerBusinessDetailsBean[0].misprimarysrcincome.toString());
      if(CustomerFormationMasterTabsState.custListBean
          .customerBusinessDetailsBean[0].misprimarysrcincome=="2"){
        print(isYes);
        isYes=true;
        print(isYes);

      }
    }
    if(!CustomerFormationMasterTabsState.EmpFromDate.contains("_")){
      try{
        print("inside try");

        String tempEmpFromDate = CustomerFormationMasterTabsState.EmpFromDate;
        print(tempEmpFromDate.substring(6)+"-"+tempEmpFromDate.substring(3,5)+"-"+tempEmpFromDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempEmpFromDate.substring(6)+"-"+tempEmpFromDate.substring(3,5)+"-"+tempEmpFromDate.substring(0,2));
        print(formattedDate);

        tempEmpFromDay = formattedDate.day.toString();
        if(tempEmpFromDay.length ==1)tempEmpFromDay = "0"+tempEmpFromDay;
        print(tempEmpFromDay);
        tempEmpFromMonth = formattedDate.month.toString();
        if(tempEmpFromMonth.length ==1)tempEmpFromMonth= "0"+tempEmpFromMonth;
        print(tempEmpFromMonth);
        tempEmpFromYear = formattedDate.year.toString();
        if(tempEmpFromYear.length ==1)tempEmpFromYear= "0"+tempEmpFromYear;
        print(tempEmpFromYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    if(!CustomerFormationMasterTabsState.EmpToDate.contains("_")){
      try{
        print("inside try");

        String tempEmpToDate = CustomerFormationMasterTabsState.EmpToDate;
        print(tempEmpToDate.substring(6)+"-"+tempEmpToDate.substring(3,5)+"-"+tempEmpToDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempEmpToDate.substring(6)+"-"+tempEmpToDate.substring(3,5)+"-"+tempEmpToDate.substring(0,2));
        print(formattedDate);
        tempEmpToDay = formattedDate.day.toString();
        if(tempEmpToDay.length==1)tempEmpToDay="0"+tempEmpToDay;
        print(tempEmpToDay);
        tempEmpToMonth = formattedDate.month.toString();
        if(tempEmpToMonth.length==1)tempEmpToMonth="0"+tempEmpToMonth;
        tempEmpToYear = formattedDate.year.toString();
        if(tempEmpToYear.length==1)tempEmpToYear="0"+tempEmpToYear;
        print(tempEmpToYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }
    if(!CustomerFormationMasterTabsState.EmpDateOfImcorp.contains("_")){
      try{
        print("inside try");

        String tempEmpDateOfImcorpDate = CustomerFormationMasterTabsState.EmpDateOfImcorp;
        print(tempEmpDateOfImcorpDate.substring(6)+"-"+tempEmpDateOfImcorpDate.substring(3,5)+"-"+tempEmpDateOfImcorpDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempEmpDateOfImcorpDate.substring(6)+"-"+tempEmpDateOfImcorpDate.substring(3,5)+"-"+tempEmpDateOfImcorpDate.substring(0,2));
        print(formattedDate);
        tempEmpDateOfImcorpDay = formattedDate.day.toString();
        if(tempEmpDateOfImcorpDay.length==1)tempEmpDateOfImcorpDay="0"+tempEmpDateOfImcorpDay;
        print(tempEmpDateOfImcorpDay);
        tempEmpDateOfImcorpMonth = formattedDate.month.toString();
        if(tempEmpToMonth.length==1)tempEmpDateOfImcorpMonth="0"+tempEmpDateOfImcorpMonth;
        tempEmpDateOfImcorpYear = formattedDate.year.toString();
        if(tempEmpDateOfImcorpYear.length==1)tempEmpDateOfImcorpYear="0"+tempEmpDateOfImcorpYear;
        print(tempEmpDateOfImcorpYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }


    /* if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean==null){
      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean = new CustomerBusinessDetailsBean();
    }*/
    List tempDropDownValues = new List();
    for (int i = 0; i <
        CustomerFormationMasterTabsState.businessDetailRadios.length; i++) {
      if (CustomerFormationMasterTabsState.businessDetailRadios[i] == null)
        CustomerFormationMasterTabsState.businessDetailRadios[i] = 0;
    }

    // try{
    if (!ifNullCheck(CustomerFormationMasterTabsState.cbdb.mbusnhousesameplaceyn)) {
      CustomerFormationMasterTabsState.businessDetailRadios[0] = int.parse(
          CustomerFormationMasterTabsState.cbdb.mbusnhousesameplaceyn);
    }
    else{
      CustomerFormationMasterTabsState.cbdb.mbusnhousesameplaceyn = "0";
    }
    //} catch(_){
    //CustomerFormationMasterTabsState.businessDetailRadios[0]=0;
    //}
    //try {
    if (!ifNullCheck(CustomerFormationMasterTabsState.cbdb.mregisteredyn)) {
      CustomerFormationMasterTabsState.businessDetailRadios[1] = int.parse(
          CustomerFormationMasterTabsState.cbdb.mregisteredyn);
    }
    else{
      CustomerFormationMasterTabsState.cbdb.mregisteredyn = "0";
    }
    /*}
    catch(_){
      CustomerFormationMasterTabsState.businessDetailRadios[1]=0;
    }*/
//try{
    if(!ifNullCheck(CustomerFormationMasterTabsState.cbdb.mbusinesstrend)) {
      CustomerFormationMasterTabsState.businessDetailRadios[2] = int.parse(
          CustomerFormationMasterTabsState.cbdb.mbusinesstrend);
    }
    else{
      CustomerFormationMasterTabsState.cbdb.mbusinesstrend = "0";
    }

    if(!ifNullCheck(CustomerFormationMasterTabsState.cbdb.mcusactivitytype.toString())) {
      CustomerFormationMasterTabsState.businessDetailRadios[3] = int.parse(
          CustomerFormationMasterTabsState.cbdb.mcusactivitytype.toString());
      if(CustomerFormationMasterTabsState.cbdb.mcusactivitytype=='1') {
        isSalaried = false;

      }else{
        isSalaried=true;
      }
      setState(() {

      });
    }
    else{
      CustomerFormationMasterTabsState.cbdb.mcusactivitytype = '0';
    }

    /* }catch(_){
    CustomerFormationMasterTabsState.businessDetailRadios[2]=0;
    }*/
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbuslocownership.toString());
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.misselfemp);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mcompanycategory);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbusstype);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.msrcname);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mstatusofemp);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.misprimarysrcincome);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mrankofemp);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mposition);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mdepartment);
    tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbussstatus);

    for (int k = 0;
    k < globals.dropDownCaptionValuesBusinessDetails.length;
    k++) {
      for (int i = 0;
      i < globals.dropDownCaptionValuesBusinessDetails[k].length;
      i++) {
        if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode ==
            tempDropDownValues[k]) {
          setValue(k, globals.dropDownCaptionValuesBusinessDetails[k][i]);
        }
      }
    }
  }

  showDropDown(LookupBeanData selectedObj, int no) {


    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          occupaOrBuisness = blankBean;
          CustomerFormationMasterTabsState.cbdb.mbuslocownership = int.parse(selectedObj.mcode);
          break;
        case 1:
          misselfemp = blankBean;
          // CustomerFormationMasterTabsState.cbdb.misselfemp = selectedObj.mcode;
          break;
        case 2:
          comCatg = blankBean;
          CustomerFormationMasterTabsState.cbdb.mcompanycategory = selectedObj.mcode;
          break;
        case 3:
          bussType = blankBean;
          CustomerFormationMasterTabsState.cbdb.mbusstype = selectedObj.mcode;
          break;
        case 4:
          msrcname = blankBean;
          CustomerFormationMasterTabsState.cbdb.msrcname = selectedObj.mcode;
          break;
        case 5:
          mstatusofemp = blankBean;
          CustomerFormationMasterTabsState.cbdb.mstatusofemp = selectedObj.mcode;
          break;
        case 6:
          misprimarysrcincome = blankBean;
          CustomerFormationMasterTabsState.cbdb.misprimarysrcincome = selectedObj.mcode;
          break;
        case 7:
          mrankemp = blankBean;
          CustomerFormationMasterTabsState.cbdb.mrankofemp = selectedObj.mcode;
          break;
        case 8:
          mposition = blankBean;
          CustomerFormationMasterTabsState.cbdb.mposition = selectedObj.mcode;
          break;
        case 9:
          mdepartment = blankBean;
          CustomerFormationMasterTabsState.cbdb.mdepartment = selectedObj.mcode;
          break;
        case 10:
          mbussstatus = blankBean;
          CustomerFormationMasterTabsState.cbdb.mbussstatus = selectedObj.mcode;
          break;
        default:
          break;
      }
      setState(() {

      });
    }
    else {
      bool isBreak = false;
      for (int k = 0;
      k < globals.dropDownCaptionValuesBusinessDetails[no].length;
      k++) {
        if (globals.dropDownCaptionValuesBusinessDetails[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropDownCaptionValuesBusinessDetails[no][k]);
          isBreak=true;
          break;
        }
        if(isBreak){
          break;
        }
      }
    }


  }


  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);


  setValue(int no, LookupBeanData value) {
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          occupaOrBuisness = value;
          CustomerFormationMasterTabsState.cbdb.mbuslocownership = int.parse(value.mcode);
          //102 should not be there here
          if(value.mcode =='103' || value.mcode =='104' || value.mcode =='105'){
            // misselfemp = value;
            CustomerFormationMasterTabsState.cbdb.misselfemp = "1";
          }else{
            CustomerFormationMasterTabsState.cbdb.misselfemp = "2";
          }
          break;
        case 1:
          misselfemp = value;
          // CustomerFormationMasterTabsState.cbdb.misselfemp = value.mcode;
          break;
        case 2:
          comCatg = value;
          CustomerFormationMasterTabsState.cbdb.mcompanycategory = value.mcode;
          break;
        case 3:
          bussType = value;
          CustomerFormationMasterTabsState.cbdb.mbusstype = value.mcode;
          CustomerFormationMasterTabsState.cbdb.mbuslocownership = int.parse('102');
          CustomerFormationMasterTabsState.cbdb.misselfemp = "2";
          break;
        case 4:
          msrcname = value;
          CustomerFormationMasterTabsState.cbdb.msrcname = value.mcode;
          break;
        case 5:
          mstatusofemp = value;
          CustomerFormationMasterTabsState.cbdb.mstatusofemp = value.mcode;
          break;
        case 6:
          misprimarysrcincome = value;
          CustomerFormationMasterTabsState.cbdb.misprimarysrcincome = value.mcode;
          break;
        case 7:
          mrankemp = value;
          CustomerFormationMasterTabsState.cbdb.mrankofemp = value.mcode;
          break;
        case 8:
          mposition = value;
          CustomerFormationMasterTabsState.cbdb.mposition = value.mcode;
          break;
        case 9:
          mdepartment = value;
          CustomerFormationMasterTabsState.cbdb.mdepartment = value.mcode;
          break;
        case 10:
          mbussstatus = value;
          CustomerFormationMasterTabsState.cbdb.mbussstatus = value.mcode;
          break;
        default:
          break;
      }
    });
  }

  Future<Null> getSessionVariables() async {
    if(CustomerFormationMasterTabsState.cbdb
        .mbuscountry!=null) {
      await AppDatabase.get().getCountryNameViaCountryCode(
          CustomerFormationMasterTabsState.cbdb.mbuscountry).then((onValue){
        setState(() {
          if(onValue.countryName!=null){
            countryName = onValue.countryName;
          }

        });
      });
    }
    if(CustomerFormationMasterTabsState.cbdb
        .mbusstate!=null) {
      await AppDatabase.get().getStateNameViaStateCode(
          CustomerFormationMasterTabsState.cbdb.mbusstate).then((onValue){
        setState(() {
          if(onValue.stateDesc!=null){
            stateName = onValue.stateDesc;
          }

        });
      });
    }
    if(CustomerFormationMasterTabsState.cbdb
        .mdistcd!=null) {
      await AppDatabase.get().getDistrictNameViaDistrictCode(
          CustomerFormationMasterTabsState.cbdb.mdistcd.toString()).then((onValue){
        setState(() {
          if(onValue.distDesc!=null){
            districtName = onValue.distDesc;
          }

        });
      });
    }

    if(CustomerFormationMasterTabsState.cbdb
        .mbuscity!=null) {
      await AppDatabase.get().getPlaceNameViaPlaceCode(
          CustomerFormationMasterTabsState.cbdb.mbuscity).then((onValue){
        setState(() {
          if(onValue.placeCdDesc!=null){
            subDistrictName = onValue.placeCdDesc;
          }

        });
      });
    }

    if(CustomerFormationMasterTabsState.cbdb
        .mbusarea!=null) {
      await AppDatabase.get().getAreaNameViaAreaCode(
          CustomerFormationMasterTabsState.cbdb.mbusarea.toString()).then((onValue){
        setState(() {
          if(onValue.areaDesc!=null){
            areaName = onValue.areaDesc;
          }

        });
      });
    }
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    //print("caption value : " + globals.dropDownCaptionBusinessDetails[no]);

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    bean.mcode = "";
    bean.mcodetype = 0;
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropDownCaptionValuesBusinessDetails[no].length;
    k++) {
      mapData.add(globals.dropDownCaptionValuesBusinessDetails[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      //print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();
    return _dropDownMenuItems1;
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

  @override
  Widget build(BuildContext context) {
    return !isSalaried?
    Card(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          Center(
            child: new Table(children: [


            ]),
          ),


            Center(
            child: new Column(children: [     //occupationRadio(),
            Container(
            color: Constant.mandatoryColor
            ,child:new DropdownButtonFormField(
              value: misprimarysrcincome,
              items: generateDropDown(6),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 6);

              },
              validator: (args) {
                print(args);
              },
              //  isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('IsPrmrySrceOfInc')),
              // style: TextStyle(color: Colors.grey),
            ),)


            ]),
            ),



          Center(
            child: new Column(children: [     //occupationRadio(),
              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: bussType,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);

                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('ComBusType')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),

          SizedBox(height: 16.0),
          Container(
          color: Constant.mandatoryColor,
            child:new DropdownButtonFormField(
              value: mbussstatus,
              items: generateDropDown(10),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 10);

              },
              validator: (args) {
                print(args);
              },
              //  isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('BusiStts')),
              // style: TextStyle(color: Colors.grey),
            ),),


          new ListTile(
            title: new Text(Translations.of(context).text('misselfemp')),
            subtitle:  CustomerFormationMasterTabsState.cbdb == null ||
                CustomerFormationMasterTabsState.cbdb.misselfemp == null
                ? new Text("")
                : new Text(
                "${ CustomerFormationMasterTabsState.cbdb.misselfemp=='2'?Translations.of(context).text('Yes'):Translations.of(context).text('No')}"),
          ),
          SizedBox(height: 10.0,),
          show?Center(
            child: new Table(children: [

            ]),
          ):new Container(),
       show?     Center(
    child: new Column(children: [     //occupationRadio(),
    Container(
    color: Constant.mandatoryColor
    ,child:new DropdownButtonFormField(
    value: misprimarysrcincome,
    items: generateDropDown(6),
    onChanged: (LookupBeanData newValue) {
    showDropDown(newValue, 6);

    },
    validator: (args) {
    print(args);
    },
    decoration: InputDecoration(labelText: Translations.of(context).text('IsPrmrySrceOfInc')),
    ),)


    ]),
    ):new Container(),

        show?  Center(
            child: new Column(children: [     //occupationRadio(),
              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: bussType,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);

                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('ComBusType')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ):new Container(),

          SizedBox(height: 16.0),
         show? Container(
    color: Constant.mandatoryColor,
            child:new DropdownButtonFormField(
              value: mbussstatus,
              items: generateDropDown(10),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 10);

              },
              validator: (args) {
                print(args);
              },
              //  isExpanded: true,
              //hint:Text("Select"),
              decoration: InputDecoration(labelText: Translations.of(context).text('BusiStts')),
              // style: TextStyle(color: Colors.grey),
            ),): new Container(),
         show? new ListTile(
            title: new Text(Translations.of(context).text('misselfemp')),
            subtitle:  CustomerFormationMasterTabsState.cbdb == null ||
                CustomerFormationMasterTabsState.cbdb.misselfemp == null
                ? new Text("")
                : new Text(
                "${ CustomerFormationMasterTabsState.cbdb.misselfemp=='2'?Translations.of(context).text('Yes'):Translations.of(context).text('No')}"),
          ):new Container(),

          new Form(
            key: _formKey,
            autovalidate: false,
            onWillPop: () {
              return Future(() => true);
            },
            onChanged: () async{
              final FormState form = _formKey.currentState;
              calculatenetProfit();
              form.save();
            },
            child: new Column(
              children: [
              Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('companyNamehint'),
                    labelText: Translations.of(context).text('companyNamelabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(60),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mcompanyname != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mcompanyname)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mcompanyname= val,
                ),),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('mobilehint'),
                    labelText: Translations.of(context).text('mobilelabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixText: "+855",
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(10),globals.onlyIntNumber],
                  initialValue:  CustomerFormationMasterTabsState.cbdb.mmobile != null
                      ?   CustomerFormationMasterTabsState.cbdb.mmobile
                      :  "",


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mmobile= val,
                )),Container(
            color: Constant.mandatoryColor,
            child:
                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('orgnamehint'),
                    labelText: Translations.of(context).text('orgnamelabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mbusinessname != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mbusinessname)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mbusinessname= val,
                )),

                SizedBox(height: 16.0),
                Container(
                        color: Constant.mandatoryColor,
                  child: new Row(

                    children: <Widget>[Text(Translations.of(context).text('empDateOfImcorp'))],
                  ),
                ),
                new
                  Container(
                    color: Constant.mandatoryColor,

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
                          controller: tempEmpDateOfImcorpDay == null?null:new TextEditingController(text: tempEmpDateOfImcorpDay),
                          keyboardType: TextInputType.numberWithOptions(),

                          onChanged: (val){

                            if(val!="0"){
                              tempEmpDateOfImcorpDay = val;


                              if(int.parse(val)<=31&&int.parse(val)>0){



                                if(val.length==2){
                                  CustomerFormationMasterTabsState.EmpDateOfImcorp = CustomerFormationMasterTabsState.EmpDateOfImcorp.replaceRange(0, 2, val);
                                  FocusScope.of(context).requestFocus(EmpDateOfImcorpMonthFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.EmpDateOfImcorp = CustomerFormationMasterTabsState.EmpDateOfImcorp.replaceRange(0, 2, "0"+val);
                                }


                              }
                              else {
                                setState(() {
                                  tempEmpDateOfImcorpDay ="";
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
                      new Container(
                          color: Constant.mandatoryColor,
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
                          focusNode: EmpDateOfImcorpMonthFocus,
                          controller: tempEmpDateOfImcorpMonth== null?null:new TextEditingController(text: tempEmpDateOfImcorpMonth),
                          onChanged: (val){
                            if(val!="0"){
                              tempEmpDateOfImcorpMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  CustomerFormationMasterTabsState.EmpDateOfImcorp = CustomerFormationMasterTabsState.EmpDateOfImcorp.replaceRange(3, 5, val);
                                  print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpDateOfImcorp);
                                  FocusScope.of(context).requestFocus(EmpDateOfImcorpYearFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.EmpDateOfImcorp = CustomerFormationMasterTabsState.EmpDateOfImcorp.replaceRange(3, 5, "0"+val);
                                  print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpDateOfImcorp);
                                }
                              }
                              else {
                                setState(() {
                                  tempEmpDateOfImcorpMonth ="";
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
                          color: Constant.mandatoryColor,
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


                          focusNode: EmpDateOfImcorpYearFocus,
                          controller: tempEmpDateOfImcorpYear== null?null:new TextEditingController(text: tempEmpDateOfImcorpYear),
                          onChanged: (val){
                            tempEmpDateOfImcorpYear = val;
                            if(val.length==4) CustomerFormationMasterTabsState.EmpDateOfImcorp = CustomerFormationMasterTabsState.EmpDateOfImcorp.replaceRange(6, 10,val);

                          },
                        ),)
                      ,

                      SizedBox(
                        width: 50.0,
                      ),

                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectEmpDateOfImcorpDate(context);
                      } )
                    ],


                  ),

                ),
                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('yearsInBussHint'),
                      labelText: Translations.of(context).text('yearsInBusslabel'),
                      hintStyle: TextStyle(color: Colors.grey),
                      /*labelStyle: TextStyle(color: Colors.grey),*/
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(2),globals.onlyIntNumber],
                    initialValue:  CustomerFormationMasterTabsState.cbdb.mbusyrsmnths != null
                        ?   CustomerFormationMasterTabsState.cbdb.mbusyrsmnths.toString()
                        :  "",


                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        CustomerFormationMasterTabsState.cbdb.mbusyrsmnths = int.parse(val);
                      }


                    }
                )),
                SizedBox(height: 16.0),
                new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('empRegnoHint'),
                      labelText: Translations.of(context).text('empRegnolabel'),
                      hintStyle: TextStyle(color: Colors.grey),
                      /*labelStyle: TextStyle(color: Colors.grey),*/
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(16),globals.onlyAphaNumeric],


                    controller:  CustomerFormationMasterTabsState.cbdb.mregistrationno != null
                        ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mregistrationno.toString())
                        : TextEditingController(text: ""),


                    onSaved: (val) {
                      print(val);
                      if(val!=null&&val!="") {
                        CustomerFormationMasterTabsState.cbdb.mregistrationno = val;
                      }
                    }
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.mandatoryColor
                  ,child:new DropdownButtonFormField(
                  value: comCatg,
                  items: generateDropDown(2),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 2);

                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('CmpnyCat')),
                  // style: TextStyle(color: Colors.grey),
                ),),

                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.multiline,
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('mmanagerdetailshint'),
                    labelText: Translations.of(context).text('mmanagerdetailslabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(50),
                    globals.onlyAphaNumeric
                  ],
                  controller:  CustomerFormationMasterTabsState.cbdb.mmanagerdetails != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mmanagerdetails)
                      : TextEditingController(text: ""),

                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mmanagerdetails = val,
                ),
                SizedBox(height: 16.0),

                new TextFormField(

                  keyboardType: TextInputType.number,
                  decoration:  InputDecoration(

                    hintText: Translations.of(context).text('mtotalmanhint'),
                    labelText: Translations.of(context).text('mtotalmanlabel'),
                    hintStyle: TextStyle(color: Colors.grey),

                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(7),globals.onlyIntNumber],
                  controller:  CustomerFormationMasterTabsState.cbdb.mtotalman != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mtotalman.toString())
                      : TextEditingController(text: ""),

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mtotalman =
                          int.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                ),

                SizedBox(height: 16.0),
                new TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('mtotalwomenhint'),
                      labelText: Translations.of(context).text('mtotalwomenlabel'),
                      hintStyle: TextStyle(color: Colors.grey),
                      /*labelStyle: TextStyle(color: Colors.grey),*/
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(7),globals.onlyIntNumber],
                    controller:  CustomerFormationMasterTabsState.cbdb.mtotalwomen != null
                        ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mtotalwomen.toString())
                        : TextEditingController(text: ""),
                    onSaved: (String value) {
                      try {
                        CustomerFormationMasterTabsState.cbdb.mtotalwomen =
                            int.parse(value);
                        //addToList(context,0);
                      } catch (_) {}
                    }
                ),
                new ListTile(
                  title: new Text(Translations.of(context).text('mtotalmanpowerlabel')),
                  subtitle:  CustomerFormationMasterTabsState.cbdb == null ||
                      CustomerFormationMasterTabsState.cbdb.mtotalmanpower == null
                      ? new Text("")
                      : new Text(
                      "${ CustomerFormationMasterTabsState.cbdb.mtotalmanpower}"),
                ),

                SizedBox(height: 16.0),

            Container(
              color: Constant.semiMandatoryColor ,
              child:
                new TextFormField(
                  initialValue:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mcapital != null
                      ?  formatDouble.format(CustomerFormationMasterTabsState.cbdb.mcapital
                      )
                      : "",

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mcapital =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(15),
                    globals.onlyDoubleNumber
                  ],
                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('mcapitalhint'),
                      labelText: Translations.of(context).text('mcapitallabel'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )),
                SizedBox(height: 16.0),
                isSalaried?
    Container(
    color: Constant.mandatoryColor,
    child:
                new TextFormField(
                  controller:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mnetamount != null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mnetamount
                      ))
                      : TextEditingController(
                      text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mnetamount =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('monthlyincome'),
                      labelText: Translations.of(context).text('monthlyincome'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )):
                isSalaried?
                Container(
                    color: Constant.mandatoryColor,
                    child:
                new TextFormField(
                  controller:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mnetamount != null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mnetamount
                      ))
                      : TextEditingController(
                      text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],


                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mnetamount =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('monthlyincome'),
                      labelText: Translations.of(context).text('monthlyincome'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )):Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                  controller:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mnetamount != null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mnetamount
                      ))
                      : TextEditingController(
                      text: ""),

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mnetamount =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('empnetincmhint'),
                      labelText: Translations.of(context).text('empnetincmlable'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )),

                SizedBox(height: 10.0,),
            Container(
              color: Constant.semiMandatoryColor ,
              child:
                new TextFormField(
                  controller:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mcostofgoodssold != null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mcostofgoodssold
                      ))
                      : TextEditingController(
                      text: ""),

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mcostofgoodssold =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('mcostofgoodssoldhint'),
                      labelText: Translations.of(context).text('mcostofgoodssoldlabel'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )),
                SizedBox(height: 16.0),
            Container(
              color: Constant.semiMandatoryColor ,
              child:
                new TextFormField(
                  controller:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.moperationexpenditure != null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.moperationexpenditure
                      ))
                      : TextEditingController(
                      text: ""),

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.moperationexpenditure =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('moperationexpenditurehint'),
                      labelText: Translations.of(context).text('moperationexpenditurelabel'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )),


                SizedBox(height: 16.0),

                new ListTile(
                  title: new Text(Translations.of(context).text('mnetprofitlabel')),
                  subtitle:  CustomerFormationMasterTabsState.cbdb == null ||
                      CustomerFormationMasterTabsState.cbdb.mnetprofit == null
                      ? new Text("")
                      : new Text(
                    "${ CustomerFormationMasterTabsState.cbdb.mnetprofit}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                ),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                  initialValue:
                  CustomerFormationMasterTabsState.cbdb != null &&
                      CustomerFormationMasterTabsState.cbdb.mbusinessownerandshareholdingpercentage != null
                      ? formatDouble.format(CustomerFormationMasterTabsState.cbdb.mbusinessownerandshareholdingpercentage
                      )
                      :  "",

                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.cbdb.mbusinessownerandshareholdingpercentage =
                          double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('businessownerandshareholdingpercentagehint'),
                      labelText: Translations.of(context).text('businessownerandshareholdingpercentagelabel'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                )),

                /*SizedBox(height: 16.0),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('trgtmarkthint'),
                    labelText: Translations.of(context).text('trgtmarktlabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    *//*labelStyle: TextStyle(color: Colors.grey),*//*
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.msrcname != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.msrcname)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.msrcname= val,
                ),
*/
/*
                SizedBox(height: 16.0),
                Center(
                  child: new Column(children: [
                    //occupationRadio(),

                    Container(
                      color: Constant.mandatoryColor
                      ,child:new DropdownButtonFormField(
                      value: msrcname,
                      items: generateDropDown(4),
                      onChanged: (LookupBeanData newValue) {
                        showDropDown(newValue, 4);

                      },
                      validator: (args) {
                        print(args);
                      },
                      //  isExpanded: true,
                      //hint:Text("Select"),
                      decoration: InputDecoration(labelText: globals.dropDownCaptionBusinessDetails[4]),
                      // style: TextStyle(color: Colors.grey),
                    ),)


                  ]),
                ),
*/

                SizedBox(height: 16.0),

                Container(

                  child:new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                  initialValue: CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc == null
                      ? ""
                      : CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc.toString(),
                  onSaved: (String value) {

                    if (value.isNotEmpty &&
                        value != "" &&
                        value != null &&
                        value != 'null') {
                      CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc = double.parse(value);
                    }

                  },

                  keyboardType: TextInputType
                      .numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Colors
                                  .teal)),
                      hintText: Translations.of(context).text('emplincfromothrsrchint'),
                      labelText: Translations.of(context).text('emplincfromothrsrclable'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.green)),
                ),),
                SizedBox(height: 16.0),
                Container(
                  child:new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('empnameothericomehint'),
                    labelText: Translations.of(context).text('empnameothericomelable'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.msrcname != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.msrcname)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.msrcname= val,
                ),),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('trgtmarkthint'),
                    labelText: Translations.of(context).text('trgtmarktlabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mtagtmrkt != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mtagtmrkt)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mtagtmrkt= val,
                )),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('strtgyhint'),
                    labelText: Translations.of(context).text('strtgylabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mstrtgy != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mstrtgy)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mstrtgy= val,
                )),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('Bussprocsshint'),
                    labelText: Translations.of(context).text('Bussprocsslabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mbussprocss != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mbussprocss)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mbussprocss= val,
                )),

                SizedBox(height: 16.0),
            Container(
              color: Constant.mandatoryColor,
              child:new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('comptrhint'),
                    labelText: Translations.of(context).text('comptrlabel'),
                    hintStyle: TextStyle(color: Colors.grey),
                    /*labelStyle: TextStyle(color: Colors.grey),*/
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                  controller:  CustomerFormationMasterTabsState.cbdb.mcomptrmekt != null
                      ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mcomptrmekt)
                      : TextEditingController(text: ""),


                  onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mcomptrmekt= val,
                )),

                Container(
                  color: Constant.semiMandatoryColor ,
                  child: new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('AddrLine1Hint'),
                      labelText: Translations.of(context).text('AddrLine1'),
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
                    controller: CustomerFormationMasterTabsState.cbdb.mbusaddress1 != null
                        ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress1)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(50)/*,
                    globals.onlyCharacter*/
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.cbdb.mbusaddress1 = val;
                      // }
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('AddrLine2Hint'),
                      labelText: Translations.of(context).text('AddrLine2'),
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
                    controller: CustomerFormationMasterTabsState.cbdb.mbusaddress2 != null
                        ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress2)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(50)/*,
                    globals.onlyCharacter*/
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.cbdb.mbusaddress2 = val;
                      // }
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrAddrsslnhr'),
                    labelText: Translations.of(context).text('AddLn'),
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
                  controller: CustomerFormationMasterTabsState.cbdb.mbusaddress3 != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress3)
                      : TextEditingController(text: ""),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(50)/*,
                    globals.onlyCharacter*/
                  ],
                  onSaved: (val) {
                    //  if(val!=null) {
                    CustomerFormationMasterTabsState.cbdb.mbusaddress3 = val;
                    // }
                  },
                ),
                SizedBox(height: 16.0),
                Container(
                  color:  Constant.semiMandatoryColor,
                  child: new ListTile(

                    title: new Text(Translations.of(context).text('Country')),
                    subtitle: countryName == null ||
                        countryName== "null"
                        ? new Text("")
                        : new Text("${countryName}"),
                    onTap: () async {
                      getCountryName();
                    },
                  ),
                ),
                new Divider(),//),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new ListTile(

                    title: new Text(Translations.of(context).text('State')),
                    subtitle:
                    stateName == null || stateName== "null"
                        ? new Text("")
                        : new Text("${stateName} "),
                    onTap: () async {
                      getStateName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),


                Container(
                  color: Constant.semiMandatoryColor,
                  child: new ListTile(

                    title: new Text(Translations.of(context).text('District')),
                    subtitle:
                    districtName == null || districtName== "null"
                        ? new Text("")
                        : new Text("${districtName}"),
                    onTap: () async {
                      getDistrictName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.mandatoryColor,
                  child: new ListTile(

                    title: new Text(
                        Translations.of(context).text('SubDistrict')),
                    subtitle: subDistrictName == null ||
                        subDistrictName== "null"
                        ? new Text("")
                        : new Text("${subDistrictName} "),
                    onTap: () async {
                      getSubDistrictName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.semiMandatoryColor,
                  child:new ListTile(
                    title: new Text(Translations.of(context).text('Area')),
                    subtitle:
                    areaName== null || areaName== "null"
                        ? new Text("")
                        : new Text("${areaName}"),
                    onTap: () async {
                      getArea();
                    },
                  ),
                ),





                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: new IconButton(
                        icon: new Icon(
                          Icons.format_list_bulleted,
                          color: Color(0xff07426A),
                          size: 50.0,
                        ),
                        onPressed: () async{
                          await _navigateAndDisplaySelection(context);
                        },
                      ),
                    ),
                    Flexible(
                        child: new IconButton(
                            padding: EdgeInsets.only(right: 30.0),
                            icon: new Icon(
                              Icons.add,
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            splashColor: Colors.red,
                            onPressed: () {
                              print("jhvdszgsudfbnhk");
                              if(forEdit) {
                                try {
                                  /*AppDatabase.get().deleBussDetails(
                                      CustomerFormationMasterTabsState.cbdb
                                          .mrefno,
                                      CustomerFormationMasterTabsState.cbdb
                                          .trefno);*/
                                }catch(_){}
                                print("CustomerFormationMasterTabsState.cbdb.positionindex1 ${CustomerFormationMasterTabsState.cbdb
                                    .positionindex}");
                                CustomerFormationMasterTabsState.custListBean
                                    .customerBusinessDetailsBean.removeAt(
                                    CustomerFormationMasterTabsState.cbdb
                                        .positionindex);

                                forEdit=false;
                              }


                              isYes=false;
                              for(int checkyes=0;checkyes<CustomerFormationMasterTabsState.custListBean
                                  .customerBusinessDetailsBean.length;checkyes++){
                                if(CustomerFormationMasterTabsState.custListBean
                                    .customerBusinessDetailsBean[checkyes].misprimarysrcincome=="2"){
                                  isYes=true;
                                }
                              }
                              if(CustomerFormationMasterTabsState.cbdb.misprimarysrcincome=="2" && isYes){
                                _showAlert(
                                    Translations.of(context).text('IsPrmrySrceOfInc'), Translations.of(context).text('Cntbeysagn'));
                                return;
                              }

                              if(CustomerFormationMasterTabsState.cbdb.misprimarysrcincome=="2"){
                              try{
                                if (CustomerFormationMasterTabsState.cbdb.mbusinessownerandshareholdingpercentage>100) {
                                  _showAlert(
                                      Translations.of(context).text('BusShrnghldr'), Translations.of(context).text('Ctbegrtr'));
                                }
                              }
                              catch(_){

                              }

                              if (CustomerFormationMasterTabsState.cbdb.mnetamount== "" ||
                                  CustomerFormationMasterTabsState.cbdb.mnetamount==  null) {
                                _showAlert(
                                    Translations.of(context).text('empmonthlyincmhint'), Translations.of(context).text('MstBeSpcfd'));
                              } else  if (CustomerFormationMasterTabsState.cbdb.mbusstype== "" ||
                                  CustomerFormationMasterTabsState.cbdb.mbusstype==  null) {
                                _showAlert(
                                    Translations.of(context).text('BusTyp'), Translations.of(context).text('MstBeSpcfd'));
                              }else  if (CustomerFormationMasterTabsState.cbdb.mcompanycategory== "" ||
                                  CustomerFormationMasterTabsState.cbdb.mcompanycategory==  null) {
                                _showAlert(
                                    Translations.of(context).text('CmpnyCat'), Translations.of(context).text('MstBeSpcfd'));
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mbuscountry==null||CustomerFormationMasterTabsState.cbdb.mbuscountry.toString().trim()==""){
                                _showAlert(Translations.of(context).text('Country'), Translations.of(context).text('CnntbeEmpty'));
                                return;
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mbusstate==null||CustomerFormationMasterTabsState.cbdb.mbusstate.trim()==""){
                                _showAlert(Translations.of(context).text('State'), Translations.of(context).text('CnntbeEmpty'));
                                return;
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mdistcd==null||CustomerFormationMasterTabsState.cbdb.mdistcd.toString().trim()==""){
                                _showAlert("district", "Cannot be Empty");
                                return;
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mbuscity==null||CustomerFormationMasterTabsState.cbdb.mbuscity.toString().trim()==""){
                                _showAlert("Commune", "Cannot be Empty");
                                return;
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mbusaddress1==null||CustomerFormationMasterTabsState.cbdb.mbusaddress1.length<2){
                                _showAlert("Address 1 ", "Must be more then 2 char");
                                return;
                              }
                              else if(CustomerFormationMasterTabsState.cbdb.mbusaddress2==null||CustomerFormationMasterTabsState.cbdb.mbusaddress2.length<2){
                                _showAlert(Translations.of(context).text('Add2'), Translations.of(context).text('mstmrthnchr'));
                                return;
                              }else if(CustomerFormationMasterTabsState.cbdb.mbusarea==null||CustomerFormationMasterTabsState.cbdb.mbusarea.toString().trim()==""){
                                _showAlert(Translations.of(context).text('Area'), Translations.of(context).text('CnntbeEmpty'));
                                return;
                              }

                              else {
                                addToList();
                              }

                            }
                         }
                            )
                    ),
                  ],
                ),


                SizedBox(height: 30.0,)



              ],
            ),
          ),
        ],
      ),
    )
        :Card(
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: <Widget>[SizedBox(height: 16.0),
          Center(
            child: new Table(children: [

            ]),
          ),

          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: occupaOrBuisness,
                items: generateDropDown(0),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 0);

                },
                validator: (args) {
                  print(args);
                },
                //  isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('EmpTyp')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),


          Center(
            child: new Column(children: [

              Center(
                child: new Column(children: [     //occupationRadio(),
                  Container(
                    color: Constant.mandatoryColor
                    ,child:new DropdownButtonFormField(
                    value: misprimarysrcincome,
                    items: generateDropDown(6),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 6);

                    },
                    validator: (args) {
                      print(args);
                    },
                    //  isExpanded: true,
                    //hint:Text("Select"),
                    decoration: InputDecoration(labelText: Translations.of(context).text('IsPrmrySrceOfInc')),
                    // style: TextStyle(color: Colors.grey),
                  ),)


                ]),
              ),

            ]),
          ),

          Center(
            child: new Column(children: [
              //occupationRadio(),

              Container(
                color: Constant.mandatoryColor
                ,child:new DropdownButtonFormField(
                value: mrankemp,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);

                },
                validator: (args) {
                  print(args);
                },
                isExpanded: true,
                //hint:Text("Select"),
                decoration: InputDecoration(labelText: Translations.of(context).text('RnkOfEmp')),
                // style: TextStyle(color: Colors.grey),
              ),)


            ]),
          ),

          new ListTile(
            title: new Text(Translations.of(context).text('misselfemp')),
            subtitle:  CustomerFormationMasterTabsState.cbdb == null ||
                CustomerFormationMasterTabsState.cbdb.misselfemp == null
                ? new Text("")
                : new Text(
                "${ CustomerFormationMasterTabsState.cbdb.misselfemp=='2'?Translations.of(context).text('Yes'):Translations.of(context).text('No')}"),
          ),
          SizedBox(height: 10.0,),
          new Form(
              key: _formKey,
              autovalidate: false,
              onWillPop: () {
                return Future(() => true);
              },
              onChanged: () {
                final FormState form = _formKey.currentState;
                form.save();
              },
              child: new Column(
                  children: [

                    SizedBox(height: 16.0),
              Container(
                  color: Constant.mandatoryColor,
                  child:
                    new TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('yearsInEmpHint'),
                          labelText: Translations.of(context).text('yearsInEmplabel'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(2),globals.onlyIntNumber],
                        controller:  CustomerFormationMasterTabsState.cbdb.mbusyrsmnths != null
                            ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mbusyrsmnths.toString())
                            : TextEditingController(text: ""),


                        onSaved: (val) {
                          if(val!=null&&val!=""){
                            CustomerFormationMasterTabsState.cbdb.mbusyrsmnths = int.parse(val);
                          }


                        }
                    )),
              Container(
                  color: Constant.mandatoryColor,
                  child:
                    new TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('companyNamehint'),
                        labelText: Translations.of(context).text('companyNamelabel'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
                      controller:  CustomerFormationMasterTabsState.cbdb.mbusinessname != null
                          ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mbusinessname)
                          : TextEditingController(text: ""),


                      onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mbusinessname= val,
                    ),),
                    SizedBox(height: 16.0),

                    Center(
                      child: new Column(children: [
                        Container(
                          color: Constant.mandatoryColor
                          ,child:new DropdownButtonFormField(
                          value: mposition,
                          isExpanded: true,
                          items: generateDropDown(8),
                          onChanged: (LookupBeanData newValue) {
                            showDropDown(newValue, 8);

                          },
                          validator: (args) {
                            print(args);
                          },
                          decoration: InputDecoration(labelText: Translations.of(context).text('emplposlable')),
                        ),)


                      ]),
                    ),


                    new TextFormField(
                        textCapitalization: TextCapitalization.characters,
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
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(16),globals.onlyAphaNumeric],


                        controller:  CustomerFormationMasterTabsState.cbdb.mregistrationno != null
                            ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mregistrationno.toString())
                            : TextEditingController(text: ""),


                        onSaved: (val) {
                          print(val);
                          if(val!=null&&val!="") {
                            CustomerFormationMasterTabsState.cbdb.mregistrationno = val;
                          }
                        }
                    ),

                    SizedBox(height: 16.0),
                    Center(
                      child: new Column(children: [
                        Container(
                          color: Constant.mandatoryColor
                          ,child:new DropdownButtonFormField(
                          isExpanded: true,
                          value: mdepartment,
                          items: generateDropDown(9),
                          onChanged: (LookupBeanData newValue) {
                            showDropDown(newValue, 9);

                          },
                          validator: (args) {
                            print(args);
                          },
                          decoration: InputDecoration(labelText: Translations.of(context).text('empldeplable')),
                        ),)


                      ]),
                    ),
                    SizedBox(height: 16.0),
                    isSalaried?


                    new TextFormField(
                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      controller:
                      CustomerFormationMasterTabsState.cbdb.mmonthlyincome !=
                          null
                          ? TextEditingController(
                          text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mmonthlyincome))
                          : TextEditingController(text: "0.0"),
                      onSaved: (String value) {
                        try {
                          CustomerFormationMasterTabsState.cbdb.mmonthlyincome = double.parse(value);
                          //addToList(context,0);
                        } catch (_) {}
                      },
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: Translations.of(context).text('monthlyincome'),
                          labelText: Translations.of(context).text('monthlyincome'),
                          prefixText: '',
                          suffixText: '',
                          suffixStyle: const TextStyle(color: Colors.green)),
                    ):
                    Container(
                        color: Constant.mandatoryColor ,
                        child:
                    new TextFormField(
                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      controller:
                      CustomerFormationMasterTabsState.cbdb.mmonthlyincome !=
                          null
                          ? TextEditingController(
                          text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mmonthlyincome))
                          : TextEditingController(text: "0.0"),
                      onSaved: (String value) {
                        try {
                          CustomerFormationMasterTabsState.cbdb.mmonthlyincome = double.parse(value);
                          //addToList(context,0);
                        } catch (_) {}
                      },
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.teal)),
                          hintText: Translations.of(context).text('empmonthlyincmhint'),
                          labelText: Translations.of(context).text('empmonthlyincmlable'),
                          prefixText: '',
                          suffixText: '',
                          suffixStyle: const TextStyle(color: Colors.green)),
                    )),

                    SizedBox(height: 16.0),

                    new TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(
                          hintText: Translations.of(context).text('nofemphint'),
                          labelText: Translations.of(context).text('noofemplabel'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(6),globals.onlyIntNumber],
                        controller:  CustomerFormationMasterTabsState.cbdb.mnoofempincmpny != null
                            ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mnoofempincmpny.toString())
                            : TextEditingController(text: ""),


                        onSaved: (val) {
                          if(val!=null&&val!=""){
                            CustomerFormationMasterTabsState.cbdb.mnoofempincmpny = int.parse(val);
                          }


                        }
                    ),

                    SizedBox(height: 16.0),
                    new TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('profssnhint'),
                        labelText: Translations.of(context).text('profssnlabel'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
                      controller:  CustomerFormationMasterTabsState.cbdb.mprofession != null
                          ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mprofession)
                          : TextEditingController(text: ""),


                      onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mprofession= val,
                    ),

                    SizedBox(height: 16.0),
                    new TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('mobilehint'),
                        labelText: Translations.of(context).text('mobilelabel'),
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixText: "+855",
                        /*labelStyle: TextStyle(color: Colors.grey),*/
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(10),globals.onlyAphaNumeric],
                      controller:  CustomerFormationMasterTabsState.cbdb.mmobile != null
                          ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.mmobile)
                          : TextEditingController(text: ""),


                      onSaved: (val) => CustomerFormationMasterTabsState.cbdb.mmobile= val,
                    ),

                    SizedBox(height: 16.0),
                    Center(
                      child: new Column(children: [
                        //occupationRadio(),

                        Container(
                          color: Constant.mandatoryColor
                          ,child:new DropdownButtonFormField(
                          value: mstatusofemp,
                          items: generateDropDown(5),
                          onChanged: (LookupBeanData newValue) {
                            showDropDown(newValue, 5);

                          },
                          validator: (args) {
                            print(args);
                          },
                          //  isExpanded: true,
                          //hint:Text("Select"),
                          decoration: InputDecoration(labelText: Translations.of(context).text('SttsOfEmp')),
                          // style: TextStyle(color: Colors.grey),
                        ),)


                      ]),
                    ),


                    SizedBox(height: 16.0),
                    new TextFormField(
                      controller:
                      CustomerFormationMasterTabsState.cbdb != null &&
                          CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc != null
                          ? TextEditingController(
                          text: formatDouble.format(CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc
                          ))
                          : TextEditingController(
                          text: ""),

                      onSaved: (String value) {
                        try {
                          CustomerFormationMasterTabsState.cbdb.mincomefromothrsrc =
                              double.parse(value);
                          //addToList(context,0);
                        } catch (_) {}
                      },
                      keyboardType: TextInputType
                          .numberWithOptions(decimal: true),
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Colors
                                      .teal)),
                          hintText: Translations.of(context).text('emplincfromothrsrchint'),
                          labelText: Translations.of(context).text('emplincfromothrsrclable'),
                          prefixText: '',
                          suffixText: '',
                          suffixStyle: const TextStyle(
                              color: Colors.green)),
                    ),
                    SizedBox(height: 16.0),
                    new TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: Translations.of(context).text('empnameothericomehint'),
                        labelText: Translations.of(context).text('empnameothericomelable'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(100),globals.onlyAphaNumeric],
                      controller:  CustomerFormationMasterTabsState.cbdb.msrcname != null
                          ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.msrcname)
                          : TextEditingController(text: ""),


                      onSaved: (val) => CustomerFormationMasterTabsState.cbdb.msrcname= val,
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.mandatoryColor,
                      child: new Row(
                        children: <Widget>[Text(Translations.of(context).text('empFrom'))],
                      ),
                    ),
                    new Container(
                      color: Constant.mandatoryColor,
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
                              controller: tempEmpFromDay == null?null:new TextEditingController(text: tempEmpFromDay),
                              keyboardType: TextInputType.numberWithOptions(),

                              onChanged: (val){

                                if(val!="0"){
                                  tempEmpFromDay = val;


                                  if(int.parse(val)<=31&&int.parse(val)>0){



                                    if(val.length==2){
                                      CustomerFormationMasterTabsState.EmpFromDate = CustomerFormationMasterTabsState.EmpFromDate.replaceRange(0, 2, val);
                                      FocusScope.of(context).requestFocus(EmpFromMonthFocus);
                                    }
                                    else{
                                      CustomerFormationMasterTabsState.EmpFromDate = CustomerFormationMasterTabsState.EmpFromDate.replaceRange(0, 2, "0"+val);
                                    }


                                  }
                                  else {
                                    setState(() {
                                      tempEmpFromDay ="";
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
                          new Container(
                            color: Constant.mandatoryColor,
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
                              focusNode: EmpFromMonthFocus,
                              controller: tempEmpFromMonth== null?null:new TextEditingController(text: tempEmpFromMonth),
                              onChanged: (val){
                                if(val!="0"){
                                  tempEmpFromMonth = val;
                                  if(int.parse(val)<=12&&int.parse(val)>0){

                                    if(val.length==2){
                                      CustomerFormationMasterTabsState.EmpFromDate = CustomerFormationMasterTabsState.EmpFromDate.replaceRange(3, 5, val);
                                      print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpFromDate);
                                      FocusScope.of(context).requestFocus(EmpFromYearFocus);
                                    }
                                    else{
                                      CustomerFormationMasterTabsState.EmpFromDate = CustomerFormationMasterTabsState.EmpFromDate.replaceRange(3, 5, "0"+val);
                                      print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpFromDate);
                                    }
                                  }
                                  else {
                                    setState(() {
                                      tempEmpFromMonth ="";
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
                            color: Constant.mandatoryColor,
                            child:new TextField(


                              decoration: InputDecoration(
                                hintText: Translations.of(context).text('YYYY'),

                              ),

                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(4),
                                globals.onlyIntNumber
                              ],


                              focusNode: EmpFromYearFocus,
                              controller: tempEmpFromYear== null?null:new TextEditingController(text: tempEmpFromYear),
                              onChanged: (val){
                                tempEmpFromYear = val;
                                if(val.length==4) CustomerFormationMasterTabsState.EmpFromDate = CustomerFormationMasterTabsState.EmpFromDate.replaceRange(6, 10,val);

                              },
                            ),)
                          ,

                          SizedBox(
                            width: 50.0,
                          ),

                          IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                            _selectEmpFromDate(context);
                          } )
                        ],


                      ),

                    ),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.mandatoryColor,
                      child: new Row(

                        children: <Widget>[Text(Translations.of(context).text('empTo'))],
                      ),
                    ),
                    new Container(
                      color: Constant.mandatoryColor,
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
                              controller: tempEmpToDay == null?null:new TextEditingController(text: tempEmpToDay),
                              keyboardType: TextInputType.numberWithOptions(),

                              onChanged: (val){

                                if(val!="0"){
                                  tempEmpToDay = val;


                                  if(int.parse(val)<=31&&int.parse(val)>0){



                                    if(val.length==2){
                                      CustomerFormationMasterTabsState.EmpToDate = CustomerFormationMasterTabsState.EmpToDate.replaceRange(0, 2, val);
                                      FocusScope.of(context).requestFocus(EmpToMonthFocus);
                                    }
                                    else{
                                      CustomerFormationMasterTabsState.EmpToDate = CustomerFormationMasterTabsState.EmpToDate.replaceRange(0, 2, "0"+val);
                                    }


                                  }
                                  else {
                                    setState(() {
                                      tempEmpToDay ="";
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
                          new Container(
                            color: Constant.mandatoryColor,
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
                              focusNode: EmpToMonthFocus,
                              controller: tempEmpToMonth== null?null:new TextEditingController(text: tempEmpToMonth),
                              onChanged: (val){
                                if(val!="0"){
                                  tempEmpToMonth = val;
                                  if(int.parse(val)<=12&&int.parse(val)>0){

                                    if(val.length==2){
                                      CustomerFormationMasterTabsState.EmpToDate = CustomerFormationMasterTabsState.EmpToDate.replaceRange(3, 5, val);
                                      print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpToDate);
                                      FocusScope.of(context).requestFocus(EmpToYearFocus);
                                    }
                                    else{
                                      CustomerFormationMasterTabsState.EmpToDate = CustomerFormationMasterTabsState.EmpToDate.replaceRange(3, 5, "0"+val);
                                      print("repaymrnt Date is "+CustomerFormationMasterTabsState.EmpToDate);
                                    }
                                  }
                                  else {
                                    setState(() {
                                      tempEmpToMonth ="";
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
                            color: Constant.mandatoryColor,
                            child:new TextField(


                              decoration: InputDecoration(
                                hintText: Translations.of(context).text('YYYY'),

                              ),

                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(4),
                                globals.onlyIntNumber
                              ],


                              focusNode: EmpToYearFocus,
                              controller: tempEmpToYear== null?null:new TextEditingController(text: tempEmpToYear),
                              onChanged: (val){
                                tempEmpToYear = val;
                                if(val.length==4) CustomerFormationMasterTabsState.EmpToDate = CustomerFormationMasterTabsState.EmpToDate.replaceRange(6, 10,val);

                              },
                            ),)
                          ,

                          SizedBox(
                            width: 50.0,
                          ),

                          IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                            _selectEmpToDate(context);
                          } )
                        ],


                      ),

                    ),
                    SizedBox(height: 16.0),
              Container(
                  color: Constant.mandatoryColor,
                  child:
                    new TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('myrsofexpinyrshint'),
                          labelText: Translations.of(context).text('myrsofexpinyrslabel'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(3),globals.onlyIntNumber],
                        controller:  CustomerFormationMasterTabsState.cbdb.myrsofexpinyrs != null
                            ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.myrsofexpinyrs.toString())
                            : TextEditingController(text: ""),
                        onSaved: (String value) {
                          try {
                            CustomerFormationMasterTabsState.cbdb.myrsofexpinyrs =
                                int.parse(value);
                            //addToList(context,0);
                          } catch (_) {}
                        }
                    )),
                    SizedBox(height: 16.0),
              Container(
                  color: Constant.mandatoryColor,
                  child:
                    new TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('myrsofexpinmnthshint'),
                          labelText: Translations.of(context).text('myrsofexpinmnthslabel'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(2),globals.onlyIntNumber],
                        controller:  CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths != null
                            ? TextEditingController(text:  CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths.toString())
                            : TextEditingController(text: ""),
                        onSaved: (String value) {
                          try {
                            CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths =
                                int.parse(value);
                            //addToList(context,0);
                          } catch (_) {}
                        }
                    )),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.semiMandatoryColor ,
                      child: new TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        decoration:  InputDecoration(
                          hintText: Translations.of(context).text('AddrLine1Hint'),
                          labelText: Translations.of(context).text('AddrLine1'),
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
                        controller: CustomerFormationMasterTabsState.cbdb.mbusaddress1 != null
                            ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress1)
                            : TextEditingController(text: ""),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(50)/*,
                    globals.onlyCharacter*/
                        ],
                        onSaved: (val) {
                          //  if(val!=null) {
                          CustomerFormationMasterTabsState.cbdb.mbusaddress1 = val;
                          // }
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.semiMandatoryColor,
                      child: new TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        decoration:  InputDecoration(
                          hintText: Translations.of(context).text('AddrLine2Hint'),
                          labelText: Translations.of(context).text('AddrLine2'),
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
                        controller: CustomerFormationMasterTabsState.cbdb.mbusaddress2 != null
                            ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress2)
                            : TextEditingController(text: ""),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(35)/*,
                    globals.onlyCharacter*/
                        ],
                        onSaved: (val) {
                          //  if(val!=null) {
                          CustomerFormationMasterTabsState.cbdb.mbusaddress2 = val;
                          // }
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    new TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrAddrsslnhr'),
                        labelText: Translations.of(context).text('AddLn'),
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
                      controller: CustomerFormationMasterTabsState.cbdb.mbusaddress3 != null
                          ? TextEditingController(text: CustomerFormationMasterTabsState.cbdb.mbusaddress3)
                          : TextEditingController(text: ""),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(50)
                      ],
                      onSaved: (val) {
                        CustomerFormationMasterTabsState.cbdb.mbusaddress3 = val;

                      },
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      color:  Constant.semiMandatoryColor,
                      child: new ListTile(

                        title: new Text(Translations.of(context).text('Country')),
                        subtitle: countryName == null ||
                            countryName== "null"
                            ? new Text("")
                            : new Text("${countryName}"),
                        onTap: () async {
                          getCountryName();
                        },
                      ),
                    ),
                    new Divider(),//),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.semiMandatoryColor,
                      child: new ListTile(

                        title: new Text(Translations.of(context).text('State')),
                        subtitle:
                        stateName == null || stateName== "null"
                            ? new Text("")
                            : new Text("${stateName} "),
                        onTap: () async {
                          getStateName();
                        },
                      ),
                    ),

                    new Divider(),
                    SizedBox(height: 16.0),


                    Container(
                      color: Constant.semiMandatoryColor,
                      child: new ListTile(

                        title: new Text(Translations.of(context).text('District')),
                        subtitle:
                        districtName == null || districtName== "null"
                            ? new Text("")
                            : new Text("${districtName}"),
                        onTap: () async {
                          getDistrictName();
                        },
                      ),
                    ),

                    new Divider(),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.mandatoryColor,
                      child: new ListTile(

                        title: new Text(Translations.of(context).text('SubDistrict')),
                        subtitle: subDistrictName == null ||
                            subDistrictName== "null"
                            ? new Text("")
                            : new Text("${subDistrictName} "),
                        onTap: () async {
                          getSubDistrictName();
                        },
                      ),
                    ),

                    new Divider(),
                    SizedBox(height: 16.0),
                    Container(
                      color: Constant.semiMandatoryColor,
                      child:new ListTile(
                        title: new Text(Translations.of(context).text('Area')),
                        subtitle:
                        areaName== null || areaName== "null"
                            ? new Text("")
                            : new Text("${areaName}"),
                        onTap: () async {
                          getArea();
                        },
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: new IconButton(
                            icon: new Icon(
                              Icons.format_list_bulleted,
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            onPressed: () async{
                              await _navigateAndDisplaySelection(context);
                            },
                          ),
                        ),
                        Flexible(
                            child: new IconButton(
                                padding: EdgeInsets.only(right: 30.0),
                                icon: new Icon(
                                  Icons.add,
                                  color: Color(0xff07426A),
                                  size: 50.0,
                                ),
                                splashColor: Colors.red,
                                onPressed: () {
                                  if(forEdit) {
                                    try {
                                      /*AppDatabase.get().deleBussDetails(
                                          CustomerFormationMasterTabsState.cbdb
                                              .mrefno,
                                          CustomerFormationMasterTabsState.cbdb
                                              .trefno);*/
                                    }catch(_){}

                                    print("CustomerFormationMasterTabsState.cbdb.positionindex ${CustomerFormationMasterTabsState.cbdb
                                        .positionindex}");
                                    CustomerFormationMasterTabsState.custListBean
                                        .customerBusinessDetailsBean.removeAt(
                                        CustomerFormationMasterTabsState.cbdb
                                            .positionindex);

                                    forEdit=false;
                                  }

                                  isYes=false;
                                  for(int checkyes=0;checkyes<CustomerFormationMasterTabsState.custListBean
                                      .customerBusinessDetailsBean.length;checkyes++){
                                    if(CustomerFormationMasterTabsState.custListBean
                                        .customerBusinessDetailsBean[checkyes].misprimarysrcincome=="2"){
                                      isYes=true;
                                    }
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.misprimarysrcincome=="2" && isYes){
                                    _showAlert(
                                        Translations.of(context).text('IsPrmrySrceOfInc'), Translations.of(context).text('Cntbeysagn'));
                                    return;
                                  }
    if(CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths!=null &&CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths.toString().trim()!="null" &&CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths.toString().trim()!=""&&CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths!=0) {
    if(CustomerFormationMasterTabsState.cbdb.myrsofexpinmnths>11){

                                      _showAlert("Month of experience",
                                          "Cannot be more then 11");
                                      return;
                                    }}
                                  if (CustomerFormationMasterTabsState.cbdb.mbuslocownership== "" ||
                                      CustomerFormationMasterTabsState.cbdb.mbuslocownership==  null) {
                                    _showAlert(
                                        Translations.of(context).text('EmpTyp'), Translations.of(context).text('MstBeSpcfd'));
                                    return;
                                  }
                                  if (CustomerFormationMasterTabsState.cbdb.misprimarysrcincome== "" ||
                                      CustomerFormationMasterTabsState.cbdb.misprimarysrcincome==  null) {
                                    _showAlert(
                                        Translations.of(context).text('IsPrmrySrceOfInc'), Translations.of(context).text('MstBeSpcfd'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mbuslocownership =='104'){
                                    if((CustomerFormationMasterTabsState.cbdb.mrankofemp==null||CustomerFormationMasterTabsState.cbdb.mrankofemp.toString().trim()=="")){
                                      _showAlert(Translations.of(context).text('RnkOfEmp'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }
                                    if(CustomerFormationMasterTabsState.cbdb.mposition==null||CustomerFormationMasterTabsState.cbdb.mposition.toString().trim()==""){
                                      _showAlert(Translations.of(context).text('emplposlable'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }
                                    if(CustomerFormationMasterTabsState.cbdb.mregistrationno==null||CustomerFormationMasterTabsState.cbdb.mregistrationno.toString().trim()==""){
                                      _showAlert(Translations.of(context).text('empidlable'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }
                                    if(CustomerFormationMasterTabsState.cbdb.mdepartment==null||CustomerFormationMasterTabsState.cbdb.mdepartment.toString().trim()==""){
                                      _showAlert(Translations.of(context).text('empldeplable'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }
                                    print("CustomerFormationMasterTabsState.cbdb.mmobilecccc"+CustomerFormationMasterTabsState.cbdb.mmobile.toString());
                                    if(CustomerFormationMasterTabsState.cbdb.mbuslocownership =='103'&& (CustomerFormationMasterTabsState.cbdb.mmonthlyincome== "" ||
                                        CustomerFormationMasterTabsState.cbdb.mmonthlyincome==  null)) {
                                      _showAlert(
                                          Translations.of(context).text('empmonthlyincmlable'), Translations.of(context).text('MstBeSpcfd'));
                                    }
                                    print("CustomerFormationMasterTabsState.cbdb.mmobile111"+CustomerFormationMasterTabsState.cbdb.mmobile.toString());
                                    if(CustomerFormationMasterTabsState.cbdb.mprofession==null||CustomerFormationMasterTabsState.cbdb.mprofession.toString().trim()==""){
                                      _showAlert(Translations.of(context).text('profssnlabel'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }
                                    print("CustomerFormationMasterTabsState.cbdb.mmobile"+CustomerFormationMasterTabsState.cbdb.mmobile.toString());
                                     if(CustomerFormationMasterTabsState.cbdb.mmobile==null||CustomerFormationMasterTabsState.cbdb.mmobile.length<9 || CustomerFormationMasterTabsState.cbdb.mmobile.length>10 ){
                                      _showAlert(Translations.of(context).text('mobileno'), Translations.of(context).text('Mustbecharlong'));
                                      return;
                                    }

                                    if(CustomerFormationMasterTabsState.cbdb.mstatusofemp==null||CustomerFormationMasterTabsState.cbdb.mstatusofemp.toString().trim()==""){
                                      _showAlert(Translations.of(context).text('sttsOfEmp'), Translations.of(context).text('CnntbeEmpty'));
                                      return;
                                    }

                                    try {
                                      String EmpFromDates = CustomerFormationMasterTabsState.EmpFromDate;

                                      CustomerFormationMasterTabsState.cbdb.mempfrom = DateTime.parse(EmpFromDates.substring(6) +
                                          "-" +
                                          EmpFromDates.substring(3, 5) +
                                          "-" +
                                          EmpFromDates.substring(0, 2));


                                      // print("custListBean.mdob.year"+age.toString());
                                      if (DateTime.now().isBefore(CustomerFormationMasterTabsState.cbdb.mempfrom)) {

                                        //  if (CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate==DateTime.now() || CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.isBefore(DateTime.now())) {
                                        _showAlert("Employment from date", "It should be greater than Current Date");
                                        // _tabController.animateTo(8);
                                        return  ;
                                      }
                                    } catch (e) {
                                      _showAlert("Employment from date", "It is Mandatory");
                                      //_tabController.animateTo(8);
                                      return  ;
                                    }
                                    if(!CustomerFormationMasterTabsState.EmpToDate.contains("_")){
                                      try{
                                        String tempToDate = CustomerFormationMasterTabsState.EmpToDate;

                                        CustomerFormationMasterTabsState.cbdb.mempto=  DateTime.parse(tempToDate.substring(6)+"-"+tempToDate.substring(3,5)+"-"+tempToDate.substring(0,2));
                                      }catch( e){
                                        _showAlert(Translations.of(context).text('EmpToDt'), Translations.of(context).text('EmpToErr'));
                                      }
                                    }}


                                  if(CustomerFormationMasterTabsState.cbdb.mbusaddress1==null||CustomerFormationMasterTabsState.cbdb.mbusaddress1.length<2){
                                    _showAlert(Translations.of(context).text('AddrLine1'), Translations.of(context).text('Mustbemorethenchar'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mbusaddress2==null||CustomerFormationMasterTabsState.cbdb.mbusaddress2.length<2){
                                    _showAlert(Translations.of(context).text('add2'), Translations.of(context).text('Mustbemorethenchar'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mbuscountry==null||CustomerFormationMasterTabsState.cbdb.mbuscountry.toString().trim()==""){
                                    _showAlert(Translations.of(context).text('Country'), Translations.of(context).text('CnntbeEmpty'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mbusstate==null||CustomerFormationMasterTabsState.cbdb.mbusstate.trim()==""){
                                    _showAlert(Translations.of(context).text('State'), Translations.of(context).text('CnntbeEmpty'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mdistcd==null||CustomerFormationMasterTabsState.cbdb.mdistcd.toString().trim()==""){
                                    _showAlert(Translations.of(context).text('District'), Translations.of(context).text('CnntbeEmpty'));
                                    return;
                                  }
                                  if(CustomerFormationMasterTabsState.cbdb.mbuscity==null||CustomerFormationMasterTabsState.cbdb.mbuscity.toString().trim()==""){
                                    _showAlert(Translations.of(context).text('SubDistrict'), Translations.of(context).text('CnntbeEmpty'));
                                    return;
                                  }
                                  else if(CustomerFormationMasterTabsState.cbdb.mbusarea==null||CustomerFormationMasterTabsState.cbdb.mbusarea.toString().trim()==""){
                                    _showAlert(Translations.of(context).text('Area'), Translations.of(context).text('CnntbeEmpty'));
                                    return;
                                  }

                                  else {
                                    addToList();
                                  }
                                })),
                      ],
                    ),


                    SizedBox(height: 30.0,)
                  ])),
          ]),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {

    final result = Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
          new ViewCustomerFormationBussinessDetails(),
          fullscreenDialog: true,
        )).then<CustomerBusinessDetailsBean>((customerBusinessDetailsBean){
      setState(() {

        if(customerBusinessDetailsBean==null) {
          return;
        }else{

          forEdit=true;

          CustomerFormationMasterTabsState.EmpToDate= "__-__-____";
          CustomerFormationMasterTabsState.EmpFromDate= "__-__-____";
          CustomerFormationMasterTabsState.cbdb=customerBusinessDetailsBean;
          print("SSSSSSSSSSSSSSSSSSSSSS1");

          print(CustomerFormationMasterTabsState.cbdb.mcusactivitytype);

          if(!ifNullCheck(CustomerFormationMasterTabsState.cbdb.mcusactivitytype.toString())) {
            CustomerFormationMasterTabsState.businessDetailRadios[3] = int.parse(
                CustomerFormationMasterTabsState.cbdb.mcusactivitytype.toString());
            if (CustomerFormationMasterTabsState.cbdb.mcusactivitytype ==
                '1') {
                isSalaried = false;
                show=true;
            } else {

                isSalaried = true;

            }
            setState(() {

            });
          }

if(CustomerFormationMasterTabsState.cbdb.mempfrom!="null"&&CustomerFormationMasterTabsState.cbdb.mempfrom!=null&&CustomerFormationMasterTabsState.cbdb.mempfrom!=""){
          setState(() {

            if(CustomerFormationMasterTabsState.cbdb.mempfrom.day.toString().length==1){
              tempEmpFromDay= "0"+CustomerFormationMasterTabsState.cbdb.mempfrom.day.toString();
            }
            else tempEmpFromDay= CustomerFormationMasterTabsState.cbdb.mempfrom.day.toString();
            tempEmpFromYear= CustomerFormationMasterTabsState.cbdb.mempfrom.year.toString();
            if(CustomerFormationMasterTabsState.cbdb.mempfrom.month.toString().length==1){
              tempEmpFromMonth= "0"+CustomerFormationMasterTabsState.cbdb.mempfrom.month.toString();
            }
            else
              tempEmpFromMonth= CustomerFormationMasterTabsState.cbdb.mempfrom.month.toString();

          });}
          if(CustomerFormationMasterTabsState.cbdb.mempto!="null"&&CustomerFormationMasterTabsState.cbdb.mempto!=null&&CustomerFormationMasterTabsState.cbdb.mempto!=""){

              setState(() {
          if(CustomerFormationMasterTabsState.cbdb.mempto.day.toString().length==1){
            tempEmpToDay= "0"+CustomerFormationMasterTabsState.cbdb.mempto.day.toString();
          }
          else tempEmpToDay= CustomerFormationMasterTabsState.cbdb.mempto.day.toString();
          tempEmpToYear= CustomerFormationMasterTabsState.cbdb.mempto.year.toString();
          if(CustomerFormationMasterTabsState.cbdb.mempto.month.toString().length==1){
            tempEmpToMonth= "0"+CustomerFormationMasterTabsState.cbdb.mempto.month.toString();
          }
          else
            tempEmpToMonth= CustomerFormationMasterTabsState.cbdb.mempto.month.toString();

        });}
          if(CustomerFormationMasterTabsState.cbdb.mdateofincorporation!="null"&&CustomerFormationMasterTabsState.cbdb.mdateofincorporation!=null&&CustomerFormationMasterTabsState.cbdb.mdateofincorporation!="") {
            setState(() {
              if (CustomerFormationMasterTabsState.cbdb.mdateofincorporation.day
                  .toString()
                  .length == 1) {
                tempEmpDateOfImcorpDay = "0" +
                    CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                        .day.toString();
              }
              else
                tempEmpDateOfImcorpDay =
                    CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                        .day.toString();
              tempEmpDateOfImcorpYear =
                  CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                      .year.toString();
              if (CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                  .month
                  .toString()
                  .length == 1) {
                tempEmpDateOfImcorpMonth = "0" +
                    CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                        .month.toString();
              }
              else
                tempEmpDateOfImcorpMonth =
                    CustomerFormationMasterTabsState.cbdb.mdateofincorporation
                        .month.toString();
            });
          }

          getSessionVariables();
          if(customerBusinessDetailsBean.mbusnhousesameplaceyn!="null"||
              customerBusinessDetailsBean.mbusnhousesameplaceyn!=null||
              customerBusinessDetailsBean.mbusnhousesameplaceyn!=''){
            CustomerFormationMasterTabsState.cbdb.mbusnhousesameplaceyn=customerBusinessDetailsBean.mbusnhousesameplaceyn;
          }
          List tempDropDownValues = new List();
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbuslocownership.toString());
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.misselfemp);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mcompanycategory);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbusstype);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.msrcname);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mstatusofemp);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.misprimarysrcincome);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mrankofemp);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mposition);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mdepartment);
          tempDropDownValues.add(CustomerFormationMasterTabsState.cbdb.mbussstatus);
          for (int k = 0;
          k < globals.dropDownCaptionValuesBusinessDetails.length;
          k++) {
            for (int i = 0;
            i < globals.dropDownCaptionValuesBusinessDetails[k].length;
            i++) {
              // print("k and i is $k $i");
              print(globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.length);

              try {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode
                    .toString() ==
                    tempDropDownValues[k].toString().trim()) {
                  print("matched $k");
                  setValue(k, globals.dropDownCaptionValuesBusinessDetails[k][i]);
                }
              } catch (_) {
                print("Exception in dropdown");
              }
            }
          }
        }
      }) ;

    });
  }
  void addToList() {

    if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean==null){
      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean= new  List<CustomerBusinessDetailsBean>();
    }
    try {
      CustomerFormationMasterTabsState.cbdb.mempfrom = DateTime.parse(CustomerFormationMasterTabsState.EmpFromDate.substring(6) +
          "-" +
          CustomerFormationMasterTabsState.EmpFromDate.substring(3, 5) +
          "-" +
          CustomerFormationMasterTabsState.EmpFromDate.substring(0, 2));
    } catch (e) {

      print("CustomerFormationMasterTabsState.EmpFromDate ${CustomerFormationMasterTabsState.EmpFromDate}");
      //return false;
    }
    try {
      CustomerFormationMasterTabsState.cbdb.mempto = DateTime.parse(CustomerFormationMasterTabsState.EmpToDate.substring(6) +
          "-" +
          CustomerFormationMasterTabsState.EmpToDate.substring(3, 5) +
          "-" +
          CustomerFormationMasterTabsState.EmpToDate.substring(0, 2));
    } catch (e) {

      print("CustomerFormationMasterTabsState.EmpToDate ${CustomerFormationMasterTabsState.EmpToDate}");
      //return false;
    }
    if(CustomerFormationMasterTabsState.cbdb.mposition=='' || CustomerFormationMasterTabsState.cbdb.mposition=='' ){
      CustomerFormationMasterTabsState.cbdb.mposition='11';
    }

    if(CustomerFormationMasterTabsState.cbdb.mbusinessname!=null&&CustomerFormationMasterTabsState.cbdb.mbusinessname!="null"){
      // int listLength = globals.familyDetailsList.length;
      print("adding ${CustomerFormationMasterTabsState.cbdb}");


      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.add(CustomerFormationMasterTabsState.cbdb);



      //globals.familyDetailsList.insert(listLength, cbdb);
      setState(() {
        CustomerFormationMasterTabsState.cbdb = new CustomerBusinessDetailsBean();
        CustomerFormationMasterTabsState.cbdb.mmonthlyincome=0.0;
        CustomerFormationMasterTabsState.cbdb.mnetamount=0.0;
        occupaOrBuisness = blankBean;
        mbussstatus=blankBean;
        misselfemp = blankBean;
        comCatg = blankBean;
        bussType = blankBean;
        msrcname = blankBean;
        misprimarysrcincome = blankBean;
        mrankemp = blankBean;
        mposition = blankBean;
        mdepartment = blankBean;
        mstatusofemp= blankBean;
        countryName="";
        stateName="";
        districtName="";
        subDistrictName="";
        areaName="";
        tempEmpToDay ="";
        tempEmpToMonth="";
        tempEmpToYear="";
        tempEmpFromDay="";
        tempEmpFromMonth="";
        tempEmpFromYear="";
        tempEmpDateOfImcorpDay="";
        tempEmpDateOfImcorpMonth="";
        tempEmpDateOfImcorpYear="";
        CustomerFormationMasterTabsState.EmpToDate= "__-__-____";
        CustomerFormationMasterTabsState.EmpFromDate= "__-__-____";
        CustomerFormationMasterTabsState.EmpDateOfImcorp= "__-__-____";
      });
    }
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
      CustomerFormationMasterTabsState.cbdb
          .mbuscountry = tempContrybean.cntryCd;
      AppDatabase.get().getCountryNameViaCountryCode(
          tempContrybean.cntryCd.toString()).then((onValue) {
        countryName = onValue.countryName;
        print("onValue.countryName"+onValue.countryName);
        print("countryName"+countryName);
      });
    }
  }
  Future getStateName() async {
    tempStateBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myStateDialog,
          fullscreenDialog: true,
        ));
    if(tempStateBean!=null) {
      CustomerFormationMasterTabsState.cbdb
          .mbusstate = tempStateBean.stateCd;
      AppDatabase.get().getStateNameViaStateCode(
          tempStateBean.stateCd.toString()).then((onValue) {
        stateName = onValue.stateDesc;

      });
    }
  }
  Future getDistrictName() async {
    tempDistrictBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myDistrictDialog,
          fullscreenDialog: true,
        ));
    if(tempDistrictBean!=null) {
      CustomerFormationMasterTabsState.cbdb
          .mdistcd = tempDistrictBean.distCd;
      AppDatabase.get().getDistrictNameViaDistrictCode(
          tempDistrictBean.distCd.toString()).then((onValue) {
        districtName = onValue.distDesc;

      });
    }
  }
  Future getSubDistrictName() async {
    tempSubDistrictBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _mySubDistrictDialog,
          fullscreenDialog: true,
        ));
    if(tempSubDistrictBean!=null) {
      CustomerFormationMasterTabsState.cbdb
          .mbuscity = tempSubDistrictBean.placeCd;
      AppDatabase.get().getPlaceNameViaPlaceCode(
          tempSubDistrictBean.placeCd.toString()).then((onValue) {
        subDistrictName = onValue.placeCdDesc;

      });
    }
  }
  Future getArea() async {
    tempAreaDistrict = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myAreaDialog,
          fullscreenDialog: true,
        ));
    if(tempAreaDistrict!=null) {
      CustomerFormationMasterTabsState.cbdb
          .mbusarea = tempAreaDistrict.areaCd;
      AppDatabase.get().getAreaNameViaAreaCode(
          tempAreaDistrict.areaCd.toString()).then((onValue) {
        areaName = onValue.areaDesc;

      });
    }
  }


  Future<void> _showAlert(arg, error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$arg error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  Future<Null> _selectEmpToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CustomerFormationMasterTabsState
        .cbdb.mempto)
      setState(() {
        CustomerFormationMasterTabsState.cbdb.mempto= picked;
        CustomerFormationMasterTabsState. EmpToDate = formatter.format(picked);


        if(picked.day.toString().length==1){
          tempEmpToDay= "0"+picked.day.toString();
        }
        else tempEmpToDay= picked.day.toString();
        tempEmpToYear= picked.year.toString();
        if(picked.month.toString().length==1){
          tempEmpToMonth= "0"+picked.month.toString();
        }
        else
          tempEmpToMonth= picked.month.toString();

      });
  }

  Future<Null> _selectEmpFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != CustomerFormationMasterTabsState
        .cbdb.mempfrom)
      setState(() {
        CustomerFormationMasterTabsState.cbdb.mempfrom= picked;
        CustomerFormationMasterTabsState. EmpFromDate = formatter.format(picked);

        print(CustomerFormationMasterTabsState
            .EmpFromDate);
        if(picked.day.toString().length==1){
          tempEmpFromDay= "0"+picked.day.toString();
        }
        else tempEmpFromDay= picked.day.toString();
        tempEmpFromYear= picked.year.toString();
        if(picked.month.toString().length==1){
          tempEmpFromMonth= "0"+picked.month.toString();
        }
        else
          tempEmpFromMonth= picked.month.toString();

      });
  }

  Future<Null> _selectEmpDateOfImcorpDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != CustomerFormationMasterTabsState
        .cbdb.mdateofincorporation)
      setState(() {
        CustomerFormationMasterTabsState.cbdb.mdateofincorporation= picked;
        CustomerFormationMasterTabsState. EmpDateOfImcorp = formatter.format(picked);
        print(CustomerFormationMasterTabsState
            .EmpDateOfImcorp);
        if(picked.day.toString().length==1){
          tempEmpDateOfImcorpDay= "0"+picked.day.toString();
        }
        else tempEmpDateOfImcorpDay= picked.day.toString();
        tempEmpDateOfImcorpYear= picked.year.toString();
        if(picked.month.toString().length==1){
          tempEmpDateOfImcorpMonth= "0"+picked.month.toString();
        }
        else
          tempEmpDateOfImcorpMonth= picked.month.toString();

      });
  }
  void calculatenetProfit() {

    CustomerFormationMasterTabsState.cbdb.mnetprofit=0.0;
    CustomerFormationMasterTabsState.cbdb.mtotalmanpower=0;
    if( CustomerFormationMasterTabsState.cbdb !=null){

      if( CustomerFormationMasterTabsState.cbdb.moperationexpenditure!=null && CustomerFormationMasterTabsState.cbdb.mcostofgoodssold!=null && CustomerFormationMasterTabsState.cbdb.mnetamount!=null){
        CustomerFormationMasterTabsState.cbdb.mnetprofit= CustomerFormationMasterTabsState.cbdb.mnetamount -(CustomerFormationMasterTabsState.cbdb.moperationexpenditure + CustomerFormationMasterTabsState.cbdb.mcostofgoodssold);
      }

      if( CustomerFormationMasterTabsState.cbdb.mtotalman!=null ){
        //  try {
        CustomerFormationMasterTabsState.cbdb.mtotalmanpower += CustomerFormationMasterTabsState.cbdb.mtotalman;
        // }catch(_){}
      }

      if( CustomerFormationMasterTabsState.cbdb.mtotalwomen!=null ){
        // try {
        CustomerFormationMasterTabsState.cbdb.mtotalmanpower +=
            CustomerFormationMasterTabsState.cbdb.mtotalwomen;
        // }catch(_){}
      }
    }


  }


}


