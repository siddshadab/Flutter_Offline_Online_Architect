import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBankDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/ESMSBean.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'CustomerFormationMasterTabs.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ESMS extends StatefulWidget {
  ESMS();

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _ESMSState createState() =>
      new _ESMSState();
}

class _ESMSState
    extends State<ESMS> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData Exclistchecked;
  LookupBeanData Isbrwrinlist;
  LookupBeanData Nontrgtcust;
  LookupBeanData Isbrwrinnontrgt;
  LookupBeanData Airemssn;
  LookupBeanData Wastewater;
  LookupBeanData Solidnhrdauswaste;
  LookupBeanData Hrdzchemnfule;
  LookupBeanData mrescnsmpt;
  LookupBeanData mnuisance;
  bool isairem=false;
  bool iswastewater=false;
  bool issolidhdwaste=false;
  bool ishzdschem=false;


  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      print("inside code Desc is null");
      switch (no) {
        case 0:
          Exclistchecked = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mexclistchecked= blankBean.mcode;
          break;
        case 1:
          Isbrwrinlist = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinlist = blankBean.mcode;
          break;
        case 2:
          Nontrgtcust = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mnontrgtcust= blankBean.mcode;
          break;
        case 3:
          Isbrwrinnontrgt = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinnontrgt = blankBean.mcode;
          break;
        case 4:
          Airemssn = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mairemssn =blankBean.mcode;
          break;
        case 5:
          Wastewater = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mwastewater =blankBean.mcode;
          break;
        case 6:
          Solidnhrdauswaste = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.msolidnhrdauswaste = blankBean.mcode;
          break;
        case 7:
          Hrdzchemnfule = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mhrdzchemnfule = blankBean.mcode;
          break;
        case 8:
          mrescnsmpt = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mrescnsmpt = blankBean.mcode;
          break;
        case 9:
          mnuisance = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesESMS[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesESMS[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesESMS[no][k]);
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
      print("coming here");
      switch (no) {
        case 0:
          Exclistchecked = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mexclistchecked = value.mcode;
          break;
        case 1:
          Isbrwrinlist = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinlist = value.mcode;
          break;
        case 2:
          Nontrgtcust = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mnontrgtcust = value.mcode;
          break;
        case 3:
          Isbrwrinnontrgt = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinnontrgt = value.mcode;
          break;
        case 4:
          Airemssn = value;

          CustomerFormationMasterTabsState.custListBean.esmsentity.mairemssn = value.mcode;
          if(CustomerFormationMasterTabsState.custListBean.esmsentity.mairemssn=="1"){
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeapplglrequire="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeevediance="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.maecmplncstatus="";
            isairem=true;
          }
          else{
            isairem=false;
          }
          break;
        case 5:
          Wastewater = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mwastewater = value.mcode;
          if(CustomerFormationMasterTabsState.custListBean.esmsentity.mwastewater=="1"){
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwapplglrequire="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwevediance="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwcmplncstatus="";
            iswastewater=true;
          }
          else{
            iswastewater=false;
          }
          break;
        case 6:
          Solidnhrdauswaste = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.msolidnhrdauswaste = value.mcode;
          if(CustomerFormationMasterTabsState.custListBean.esmsentity.msolidnhrdauswaste=="1"){
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshevediance="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshcmplncstatus="";
            issolidhdwaste=true;
          }
          else{
            issolidhdwaste=false;
          }
          break;
        case 7:
          Hrdzchemnfule = value;
          print(value);
          CustomerFormationMasterTabsState.custListBean.esmsentity.mhrdzchemnfule = value.mcode;
          if(CustomerFormationMasterTabsState.custListBean.esmsentity.mhrdzchemnfule=="1"){
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhcapplglrequire="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhcevediance="";
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhccmplncstatus="";
            ishzdschem=true;
          }
          else{
            ishzdschem=false;
          }
          break;
        case 8:
          mrescnsmpt = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mrescnsmpt = value.mcode;
          break;
        case 9:
          mnuisance = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance = value.mcode;
          break;
          break;
        default:
          break;
      }
    });
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesESMS[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesESMS[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();
    return _dropDownMenuItems1;
  }

    @override
    void initState() {

      // TODO: implement initState
      super.initState();
      if(CustomerFormationMasterTabsState.custListBean.esmsentity==null){
        CustomerFormationMasterTabsState.custListBean.esmsentity = new ESMSBean();
      }
    List<String> tempDropDownValues = new List<String>();

    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.esmsentity.mexclistchecked);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinlist);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.esmsentity.mnontrgtcust);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.esmsentity.misbrwrinnontrgt);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.esmsentity.mairemssn);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.esmsentity.mwastewater);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.esmsentity.msolidnhrdauswaste);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.esmsentity.mhrdzchemnfule);
      tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.esmsentity.mrescnsmpt);
      tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance);


    for (int k = 0;
    k < globals.dropdownCaptionsValuesESMS.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesESMS[k].length;
      i++) {
        try{
          if (globals.dropdownCaptionsValuesESMS[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {
            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesESMS[k][i]);
          }
        }catch(_){
          print("Exception Occured");
        }
      }
    }
  }
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);
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
    return new Form(
      key: _formKey,
      onWillPop: () {
        return Future(() => true);
      }
      ,onChanged: () {
      final FormState form = _formKey.currentState;
      form.save();
    },
      child: ListView(
        shrinkWrap: true,
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('ModeADD'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new DropdownButtonFormField(
              value:Exclistchecked==null?null: Exclistchecked,
              items: generateDropDown(0),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 0);
              },
              validator: (args) {
                print(args);
              },
              decoration: InputDecoration(labelText: Translations.of(context).text('ExclsnLstChckd')),
            ),),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Isbrwrinlist==null?null: Isbrwrinlist,
                items: generateDropDown(1),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 1);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('IsBrrwrinexclslnLst')),
              )),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Nontrgtcust==null?null: Nontrgtcust,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('NnTrgtCstmrLstChckd')),
              )),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Isbrwrinnontrgt==null?null: Isbrwrinnontrgt,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('IsBrrwrNnTrgtCustLst')),
              )),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Airemssn==null?null: Airemssn,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ArEmssn')),
              )),
          isairem?
          new Container():new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrApplLglRqrmnt'),
              labelText: Translations.of(context).text('ApplcblLglReq'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeapplglrequire!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.maeapplglrequire!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeapplglrequire: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.maeapplglrequire= val,
          ),
          isairem?
          new Container():
          new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrCmplncstslglreq'),
              labelText: Translations.of(context).text('Cmplncstslglrequ'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.maecmplncstatus!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.maecmplncstatus!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.maecmplncstatus: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.maecmplncstatus= val,
          ),
          isairem?
          new Container():new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(
              hintText: Translations.of(context).text('EntrEvdncOfCmplncColl'),
              labelText: Translations.of(context).text('EvdncCmplncColl'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeevediance!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.maeevediance!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.maeevediance: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.maeevediance= val,
          ),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Wastewater==null?null: Wastewater,
                items: generateDropDown(5),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 5);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('WstWtr')),
              )),
          iswastewater?
          new Container():new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrApplLglRqurmnt'),
              labelText: Translations.of(context).text('ApplLglReq'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwapplglrequire!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mwwapplglrequire!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwapplglrequire: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mwwapplglrequire= val,
          ),
          iswastewater?
          new Container():
          new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrCmplncstslglreq'),
              labelText: Translations.of(context).text('Cmplncstslglreq'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwcmplncstatus!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mwwcmplncstatus!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwcmplncstatus: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mwwcmplncstatus= val,
          ),
          iswastewater?
          new Container(): new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrEvdncOfCmplncColl'),
              labelText: Translations.of(context).text('EvdncCmplncColl'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwevediance!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mwwevediance!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mwwevediance: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mwwevediance= val,
          ),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Solidnhrdauswaste==null?null: Solidnhrdauswaste,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('SldHzrdsWsts')),
              )),
          issolidhdwaste?
          new Container(): new TextFormField(
           // enabled: false,
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrApplLglRqrmnt'),
              labelText: Translations.of(context).text('ApplcblLglReq'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire= val,
          ),
          /*new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(

              hintText: 'Enter Applicable Legal Requirement',
              labelText: 'Applicable Legal Requirement',
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mshapplglrequire= val,
          ),*/
          issolidhdwaste?
          new Container():  new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrCmplncstslglreq'),
              labelText: Translations.of(context).text('Cmplncstslglrequ'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshcmplncstatus!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mshcmplncstatus!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshcmplncstatus: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mshcmplncstatus= val,
          ),
          issolidhdwaste?
          new Container():
          new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrEvdncOfCmplncColl'),
              labelText: Translations.of(context).text('EvdncCmplncColl'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshevediance!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mshevediance!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mshevediance: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mshevediance= val,
          ),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                value:Hrdzchemnfule==null?null: Hrdzchemnfule,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('Hzrdschmclsflspstcds')),
              )),
 ishzdschem?
          new Container():
 new TextFormField(
   textCapitalization: TextCapitalization.characters,
   keyboardType: TextInputType.text,
   decoration:  InputDecoration(

     hintText: Translations.of(context).text('EntrApplLglRqrmnt'),
     labelText: Translations.of(context).text('ApplcblLglReq'),
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
   inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
   initialValue:
   CustomerFormationMasterTabsState.custListBean.esmsentity.mhcapplglrequire!= null&&
       CustomerFormationMasterTabsState.custListBean.esmsentity.mhcapplglrequire!="null" ?
   CustomerFormationMasterTabsState.custListBean.esmsentity.mhcapplglrequire: "",
   onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mhcapplglrequire= val,
 ),
          ishzdschem?
          new Container():
          new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrCmplncstslglreq'),
              labelText: Translations.of(context).text('Cmplncstslglrequ'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhccmplncstatus!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mhccmplncstatus!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhccmplncstatus: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mhccmplncstatus= val,
          ),
          ishzdschem?
          new Container():new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrEvdncOfCmplncColl'),
              labelText: Translations.of(context).text('EvdncCmplncColl'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhcevediance!= null&&
                CustomerFormationMasterTabsState.custListBean.esmsentity.mhcevediance!="null" ?
            CustomerFormationMasterTabsState.custListBean.esmsentity.mhcevediance: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.esmsentity.mhcevediance= val,
          ),

          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                isExpanded: true,
                value:mrescnsmpt==null?null: mrescnsmpt,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('RsurceCnsmptn')),
              )),
          Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child:
              new DropdownButtonFormField(
                isExpanded: true,
                value:mnuisance==null?null: mnuisance,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('Nsnc')),
              )),



        ],
      ),
    );
  }
}
