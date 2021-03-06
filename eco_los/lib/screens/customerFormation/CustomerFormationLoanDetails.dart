import 'dart:typed_data';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/Helper.dart';
import 'package:eco_los/helpers/SignaturePainter.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationSocialFinancialDetails.dart';
import 'package:eco_los/screens/customerFormation/ViewBorrowingDetails.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationAddressDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BorrowingDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class CustomerFormationLoanDetails extends StatefulWidget {
  CustomerFormationLoanDetails({Key key}) : super(key: key);

  @override
  _CustomerFormationLoanDetails createState() =>
      new _CustomerFormationLoanDetails();
}

class _CustomerFormationLoanDetails
    extends State<CustomerFormationLoanDetails> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final formatDouble = new NumberFormat("#,##0.00", "en_US");

  String tempLoanDay;
  String tempLoanMonth;
  String tempLoanYear;
  String tempRepaymentDay;
  String tempRepaymentMonth;
  String tempRepaymentYear;
  FocusNode loanMonthFocus;
  FocusNode loanYearFocus;
  FocusNode repaymentMonthFocus;
  FocusNode repaymentYearFocus;
  var formatter = new DateFormat('dd-MM-yyyy');
  LookupBeanData mcurrcd;
  LookupBeanData mrestructdloan;
  LookupBeanData mfrequency;
  LookupBeanData mmodeofdis;
  final TextEditingController _typeAheadController = TextEditingController();
  bool forEdit=false;
  bool chkLoanFromOtherBank =true;


  @override
  void initState() {


    loanMonthFocus= new FocusNode();
    loanYearFocus= new FocusNode();
    repaymentMonthFocus = new FocusNode();
    repaymentYearFocus = new FocusNode();
    print(CustomerFormationMasterTabsState.loanDate);
    if(!CustomerFormationMasterTabsState.loanDate.contains("_")){
      try{
        print("inside try");

        String tempLoanDate = CustomerFormationMasterTabsState.loanDate;
        print(tempLoanDate.substring(6)+"-"+tempLoanDate.substring(3,5)+"-"+tempLoanDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempLoanDate.substring(6)+"-"+tempLoanDate.substring(3,5)+"-"+tempLoanDate.substring(0,2));
        print(formattedDate);

        tempLoanDay = formattedDate.day.toString();
        if(tempLoanDay.length ==1)tempLoanDay = "0"+tempLoanDay;
        print(tempLoanDay);
        tempLoanMonth = formattedDate.month.toString();
        if(tempLoanMonth.length ==1)tempLoanMonth= "0"+tempLoanMonth;
        print(tempLoanMonth);
        tempLoanYear = formattedDate.year.toString();
        if(tempLoanMonth.length ==1)tempLoanMonth= "0"+tempLoanMonth;
        print(tempLoanMonth);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    if(!CustomerFormationMasterTabsState.repaymentDate.contains("_")){
      try{
        print("inside try");

        String tempRepaymentDate = CustomerFormationMasterTabsState.repaymentDate;
        print(tempRepaymentDate.substring(6)+"-"+tempRepaymentDate.substring(3,5)+"-"+tempRepaymentDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempRepaymentDate.substring(6)+"-"+tempRepaymentDate.substring(3,5)+"-"+tempRepaymentDate.substring(0,2));
        print(formattedDate);
        tempRepaymentDay = formattedDate.day.toString();
        if(tempRepaymentDay.length==1)tempRepaymentDay="0"+tempRepaymentDay;
        print(tempRepaymentDay);
        tempRepaymentMonth = formattedDate.month.toString();
        if(tempRepaymentMonth.length==1)tempRepaymentMonth="0"+tempRepaymentMonth;
        print(tempLoanMonth);
        tempRepaymentYear = formattedDate.year.toString();
        if(tempRepaymentYear.length==1)tempRepaymentYear="0"+tempRepaymentYear;
        print(tempRepaymentYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }

    if(CustomerFormationMasterTabsState.borrowingDetailsBean!=null){


      for (int k = 0; k < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails.length; k++) {
        for (int i = 0; i < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k].length; i++) {


          if (k == 0) {
            print("for k = 0 codes are ${globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.borrowingDetailsBean.mcurcd) {

              setValue(k, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i]);


            }
          }

          if (k == 1) {
            print("for k = 1 codes are ${globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.borrowingDetailsBean.mrestructrdloan) {

              setValue(k, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i]);


            }



          }

          if (k == 2) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.borrowingDetailsBean.mfrequency.toString()) {

              setValue(k, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i]);


            }

          }

          if (k == 3) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.borrowingDetailsBean.mmodeofdisb.toString()) {

              setValue(k, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i]);


            }

          }
        }

        _typeAheadController.text=CustomerFormationMasterTabsState.borrowingDetailsBean.mnameofborrower;
      }
    }else{
      CustomerFormationMasterTabsState.borrowingDetailsBean= new BorrowingDetailsBean();
    }

  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
//    print("caption value : " + globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no].toString());

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    bean.mcode = "";
    bean.mcodetype = 0;
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();
    /*   if(no==0){
      print(mapData);
      testString = mapData;
    }*/
    return _dropDownMenuItems1;
  }


  showDropDown(LookupBeanData selectedObj, int no) {

    print("selected Obj is ${selectedObj}");
    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          mcurrcd = blankBean;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mcurcd = selectedObj.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.education = value.code;*/

          break;
        case 1:
          mrestructdloan = blankBean;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mrestructrdloan = selectedObj.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.relationship = value.code;*/
          break;
        case 2:
          mfrequency = blankBean;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mfrequency = selectedObj.mcode;
          break;
        case 2:
          mmodeofdis = blankBean;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mmodeofdisb = selectedObj.mcode;
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
      k < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[no][k]);
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
    print("value is ${value}");
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          mcurrcd = value;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mcurcd = value.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.education = value.code;*/

          break;
        case 1:
          mrestructdloan = value;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mrestructrdloan = value.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.relationship = value.code;*/
          break;
        case 2:
          mfrequency = value;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mfrequency = value.mcode;
          break;
        case 3:
          mmodeofdis = value;
          CustomerFormationMasterTabsState.borrowingDetailsBean.mmodeofdisb = value.mcode;
          break;
        default:
          break;
      }
    });
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
    return new Form(
      key: _formKey,
      onWillPop: () {
        return Future(() => true);
      },
      onChanged: () {
        final FormState form = _formKey.currentState;
        form.save();
      },
      autovalidate: true,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
          SizedBox(height: 16.0),
          new Container(
            child: new Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                  ),
                  child: new Row(
                    children: <Widget>[
                  FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    Translations.of(context).text('LnFrmothrfindtl'),
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0),
                  ),
                  )


                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),


                TypeAheadFormField<LookupBeanData>(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: this._typeAheadController,
                      decoration: InputDecoration(
                          labelText: Translations.of(context).text('bankName')
                      )
                  ),
                  suggestionsCallback: (pattern) {
                    return returnLookup(pattern);
                  },

                  itemBuilder: (context, item) {
                    return ListTile(
                      title: Text(item.mcodedesc),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (item) {
                    this._typeAheadController.text = item.mcodedesc;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bank Name';
                    }
                  },
                  onSaved: (value) => CustomerFormationMasterTabsState.borrowingDetailsBean.mnameofborrower = value,
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('enter_Product_Name'),
                      labelText: Translations.of(context).text('product_name'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,

                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.msource != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.msource.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                    onSaved: (val) {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.msource = val;
                    }),

                new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('EntrAccNo'),
                      labelText: Translations.of(context).text('Acc_No'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.macctno != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.macctno.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyAphaNumeric],
                    onSaved: (val) {
                      if(val!=null&&val!="") CustomerFormationMasterTabsState.borrowingDetailsBean.macctno = val;
                    }),




                SizedBox(height: 10.0,),
                new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyDoubleNumber],

                  controller:
                  CustomerFormationMasterTabsState.borrowingDetailsBean.msvngamount !=
                      null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.borrowingDetailsBean.msvngamount))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.msvngamount = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('EntrSvngsAmt'),
                      labelText: Translations.of(context).text('SvngAmt'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),


                SizedBox(height: 10.0,),
                new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyDoubleNumber],

                  controller:
                  CustomerFormationMasterTabsState.borrowingDetailsBean.mamount !=
                      null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.borrowingDetailsBean.mamount))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.mamount = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('EntrLnAmt'),
                      labelText: Translations.of(context).text('LnAmt'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyDoubleNumber],

                  controller:
                  CustomerFormationMasterTabsState.borrowingDetailsBean.memiamt !=
                      null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.borrowingDetailsBean.memiamt))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.memiamt = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('EntrInstllmntAmt'),
                      labelText: Translations.of(context).text('InstllmntAmt'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(5),globals.onlyDoubleNumber],

                  controller:
                  CustomerFormationMasterTabsState.borrowingDetailsBean.mintrate !=
                      null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.borrowingDetailsBean.mintrate))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.mintrate = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('EntrRtofIntrst'),
                      labelText: Translations.of(context).text('RtofIntrst'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),


                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text(Translations.of(context).text('loanDate'))],
                  ),
                ),


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
                          controller: tempLoanDay == null?null:new TextEditingController(text: tempLoanDay),
                          keyboardType: TextInputType.numberWithOptions(),

                          onChanged: (val){

                            if(val!="0"){
                              tempLoanDay = val;


                              if(int.parse(val)<=31&&int.parse(val)>0){



                                if(val.length==2){
                                  CustomerFormationMasterTabsState.loanDate = CustomerFormationMasterTabsState.loanDate.replaceRange(0, 2, val);
                                  FocusScope.of(context).requestFocus(loanMonthFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.loanDate = CustomerFormationMasterTabsState.loanDate.replaceRange(0, 2, "0"+val);
                                }


                              }
                              else {
                                setState(() {
                                  tempLoanDay ="";
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
                          focusNode: loanMonthFocus,
                          controller: tempLoanMonth== null?null:new TextEditingController(text: tempLoanMonth),
                          onChanged: (val){

                            if(val!="0"){
                              tempLoanMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  CustomerFormationMasterTabsState.loanDate = CustomerFormationMasterTabsState.loanDate.replaceRange(3, 5, val);

                                  FocusScope.of(context).requestFocus(loanYearFocus);

                                }
                                else{
                                  CustomerFormationMasterTabsState.loanDate = CustomerFormationMasterTabsState.loanDate.replaceRange(3, 5, "0"+val);
                                }
                              }
                              else {
                                setState(() {
                                  tempLoanMonth ="";
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


                          focusNode: loanYearFocus,
                          controller: tempLoanYear== null?null:new TextEditingController(text: tempLoanYear),
                          onChanged: (val){
                            tempLoanYear = val;
                            if(val.length==4){
                              CustomerFormationMasterTabsState.loanDate = CustomerFormationMasterTabsState.loanDate.replaceRange(6, 10,val);
                              print(CustomerFormationMasterTabsState.loanDate);
                            }

                          },
                        ),)
                      ,

                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectLoanDate(context);
                      } )
                    ],



                  ),

                ),


                /*     Container(
                  child: new Row(

                    children: <Widget>[Text(Constant.repaymentDate)],
                  ),
                ),

                new Container(
                  child: new Row(
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
                          controller: tempRepaymentDay == null?null:new TextEditingController(text: tempRepaymentDay),
                          keyboardType: TextInputType.numberWithOptions(),

                          onChanged: (val){

                            if(val!="0"){
                              tempRepaymentDay = val;


                              if(int.parse(val)<=31&&int.parse(val)>0){



                                if(val.length==2){
                                  CustomerFormationMasterTabsState.repaymentDate = CustomerFormationMasterTabsState.repaymentDate.replaceRange(0, 2, val);
                                  FocusScope.of(context).requestFocus(repaymentMonthFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.repaymentDate = CustomerFormationMasterTabsState.repaymentDate.replaceRange(0, 2, "0"+val);
                                }


                              }
                              else {
                                setState(() {
                                  tempRepaymentDay ="";
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
                          focusNode: repaymentMonthFocus,
                          controller: tempRepaymentMonth== null?null:new TextEditingController(text: tempRepaymentMonth),
                          onChanged: (val){
                            if(val!="0"){
                              tempRepaymentMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  CustomerFormationMasterTabsState.repaymentDate = CustomerFormationMasterTabsState.repaymentDate.replaceRange(3, 5, val);
                                  print("repaymrnt Date is "+CustomerFormationMasterTabsState.repaymentDate);
                                  FocusScope.of(context).requestFocus(repaymentYearFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.repaymentDate = CustomerFormationMasterTabsState.repaymentDate.replaceRange(3, 5, "0"+val);
                                  print("repaymrnt Date is "+CustomerFormationMasterTabsState.repaymentDate);
                                }
                              }
                              else {
                                setState(() {
                                  tempRepaymentMonth ="";
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


                          focusNode: repaymentYearFocus,
                          controller: tempRepaymentYear== null?null:new TextEditingController(text: tempRepaymentYear),
                          onChanged: (val){
                            tempRepaymentYear = val;
                            if(val.length==4) CustomerFormationMasterTabsState.repaymentDate = CustomerFormationMasterTabsState.repaymentDate.replaceRange(6, 10,val);

                          },
                        ),)
                      ,

                      SizedBox(
                        width: 50.0,
                      ),

                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectRepaymentDate(context);
                      } )
                    ],


                  ),

                ),*/

                SizedBox(height: 10.0,),
                new TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('EntrTnurinmnths'),
                      labelText: Translations.of(context).text('Tnrinmnths'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.mperiod != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.mperiod.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(4),globals.onlyIntNumber],
                    onSaved: (val) {
                      if(val!=null&&val!="") CustomerFormationMasterTabsState.borrowingDetailsBean.mperiod = int.parse(val);
                    }),


                new DropdownButtonFormField(
                  value: mcurrcd==null?null: mcurrcd,
                  items: generateDropDown(0),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 0);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('Currency')),
                  // style: TextStyle(color: Colors.grey),
                ),

                new DropdownButtonFormField(
                  value: mrestructdloan==null?null: mrestructdloan,
                  items: generateDropDown(1),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 1);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('RstrctrdLn')),
                  // style: TextStyle(color: Colors.grey),
                ),

                new DropdownButtonFormField(
                  value: mfrequency==null?null: mfrequency,
                  items: generateDropDown(2),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 2);
                  },
                  validator: (args) {
                    print(args);
                  },
                    isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('Frequency')),
                  // style: TextStyle(color: Colors.grey),
                ),

                new DropdownButtonFormField(
                  value: mmodeofdis==null?null: mmodeofdis,
                  items: generateDropDown(3),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 3);
                  },
                  validator: (args) {
                    print(args);
                  },
                  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('RpymntTyp')),
                  // style: TextStyle(color: Colors.grey),
                ),
                new TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrLnprps'),
                      labelText: Translations.of(context).text('Lnprps'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.mpurpose != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.mpurpose.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyCharacter],
                    onSaved: (val) {
                      if(val!=null&&val!="") CustomerFormationMasterTabsState.borrowingDetailsBean.mpurpose = val;
                    }),
                Container(/*color:Constant.semiMandatoryColor,*/child:



                new TextFormField(
                  inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyDoubleNumber],

                  controller:
                  CustomerFormationMasterTabsState.borrowingDetailsBean.moutstandingamt !=
                      null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState.borrowingDetailsBean.moutstandingamt))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.moutstandingamt = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('EntrOutstndngAmt'),
                      labelText: Translations.of(context).text('OutstndngAmt'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),

                ),
                SizedBox(height: 10.0,),
                new TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('EntrLnCycl'),
                      labelText: Translations.of(context).text('LnCycl'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.mloancycle != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.mloancycle.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(4),globals.onlyIntNumber],
                    onSaved: (val) {
                      if(val!=null&&val!="") CustomerFormationMasterTabsState.borrowingDetailsBean.mloancycle = double.parse(val);
                    }),

                SizedBox(height: 10.0,),
                new TextFormField(
                    keyboardType: TextInputType.multiline,
                    textCapitalization: TextCapitalization.characters,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrRmrk'),
                      labelText: Translations.of(context).text('Rmrk'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,

                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    //enabled:  chkLoanFromOtherBank,
                    controller: CustomerFormationMasterTabsState.borrowingDetailsBean.mremark != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.borrowingDetailsBean.mremark.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(150),globals.onlyCharacter],
                    onSaved: (val) {
                      CustomerFormationMasterTabsState.borrowingDetailsBean.mremark = val;
                    }),
              ],
            ),
          ),
          new Container(
            width: 300.0,
            height: 10.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: new IconButton(
                  icon: new Icon(
                    Icons.format_list_bulleted,
                    color:Color(0xff07426A),
                    size: 50.0,

                  ),
                  onPressed: () {
                    _navigateAndDisplaySelection(context);
                  },
                ),
              ),
              Flexible(
                  child: new IconButton(
                      padding: EdgeInsets.only(right: 30.0),
                      icon: new Icon(
                        Icons.add,
                        color:Color(0xff07426A),
                        size: 50.0,
                      ),
                      splashColor: Colors.red,
                      onPressed: () {
                        if(forEdit) {
                          try {
                           /* AppDatabase.get().deleBorrowDetails(
                                CustomerFormationMasterTabsState.borrowingDetailsBean
                                    .mrefno,
                                CustomerFormationMasterTabsState.borrowingDetailsBean
                                    .trefno);*/
                          }catch(_){}

                          CustomerFormationMasterTabsState.custListBean
                              .borrowingDetailsBean.removeAt(
                              CustomerFormationMasterTabsState.borrowingDetailsBean
                                  .positionindex);

                          forEdit=false;
                        }

                        try {
                          String tempLoanDate = CustomerFormationMasterTabsState.loanDate;

                          CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate = DateTime.parse(tempLoanDate.substring(6) +
                              "-" +
                              tempLoanDate.substring(3, 5) +
                              "-" +
                              tempLoanDate.substring(0, 2));
                           if (DateTime.now().isBefore(CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate)) {

                            //  if (CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate==DateTime.now() || CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.isBefore(DateTime.now())) {
                            _showAlert("Loan Date", "It should be greater than Current Date");
                            // _tabController.animateTo(8);
                            return  ;
                          }
                        } catch (e) {
                          _showAlert("Loan Date", "It is Mandatory");
                          //_tabController.animateTo(8);
                          return  ;
                        }

                        /*     try {

                          if (CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate==DateTime.now() || CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.isBefore(DateTime.now())) {
                            _showAlert(Translations.of(context).text('LnDt'), "It should be greater than Current Date");

                            return  ;
                          }
                        } catch (e) {
                          print("CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate"+CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.toString());
                          _showAlert(Translations.of(context).text('LnDt'), Translations.of(context).text('LnDtErr'));

                          return  ;
                        }*/

                        if(!CustomerFormationMasterTabsState.repaymentDate.contains("_")){
                          try{
                            String tempRepaymentDate = CustomerFormationMasterTabsState.repaymentDate;
                            print(tempRepaymentDate.substring(6)+"-"+tempRepaymentDate.substring(3,5)+"-"+tempRepaymentDate.substring(0,2));
                            CustomerFormationMasterTabsState.borrowingDetailsBean.mrepaymentDate=  DateTime.parse(tempRepaymentDate.substring(6)+"-"+tempRepaymentDate.substring(3,5)+"-"+tempRepaymentDate.substring(0,2));
                          }catch( e){
                            _showAlert(Translations.of(context).text('RpymntDt'), Translations.of(context).text('RpymntDtErr'));
                          }
                        }




                        if(CustomerFormationMasterTabsState.borrowingDetailsBean.mnameofborrower==""||CustomerFormationMasterTabsState.borrowingDetailsBean.mnameofborrower==null){
                          _showAlert(Translations.of(context).text('Name'), Translations.of(context).text('CnntbeEmpty'));
                          return;
                        }
                        else if(CustomerFormationMasterTabsState.borrowingDetailsBean.mamount==0||CustomerFormationMasterTabsState.borrowingDetailsBean.mamount==null){
                          _showAlert(Translations.of(context).text('LnAmt'), Translations.of(context).text('CnntbeEmpty'));
                          return;
                        }
                        else if(CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate==""||CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate==null){
                          _showAlert(Translations.of(context).text('LnDt'), Translations.of(context).text('CnntbeEmpty'));
                          return;
                        }
                        /*else if(CustomerFormationMasterTabsState.borrowingDetailsBean.moutstandingamt==""||CustomerFormationMasterTabsState.borrowingDetailsBean.moutstandingamt==null){
                          _showAlert("outstanding amount", "Cannot be Empty");
                          return;
                        }*/

                        else addToList();

                      })),
            ],
          ),
        ],
      ),
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => new ViewBorrowingDetails(),
          fullscreenDialog: true,
        )).then<BorrowingDetailsBean>((borrowingDetailsBean) {
      setState(() {


        if(borrowingDetailsBean==null) {
          return;
        }else {
          forEdit = true;

          CustomerFormationMasterTabsState.borrowingDetailsBean =
              borrowingDetailsBean;

          if(CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate!="null"&&CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate!=null&&CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate!="") {
            setState(() {
              if (CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.day
                  .toString()
                  .length == 1) {
                tempLoanDay =
                    "0" + CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.day.toString();
              }
              else
                tempLoanDay = CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.day.toString();
              tempLoanYear = CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.year.toString();
              if (CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.month
                  .toString()
                  .length == 1) {
                tempLoanMonth =
                    "0" + CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.month.toString();
              }
              else
                tempLoanMonth = CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate.month.toString();
            });

          }


          List tempDropDownValues = new List();
          tempDropDownValues.add(CustomerFormationMasterTabsState.borrowingDetailsBean.mcurcd.toString());
          tempDropDownValues.add(CustomerFormationMasterTabsState.borrowingDetailsBean.mrestructrdloan);
          tempDropDownValues.add(CustomerFormationMasterTabsState.borrowingDetailsBean.mfrequency);
          tempDropDownValues.add(CustomerFormationMasterTabsState.borrowingDetailsBean.mmodeofdisb);

          for (int k = 0;
          k < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails.length;
          k++) {
            for (int i = 0;
            i < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k].length;
            i++) {
              // print("k and i is $k $i");
              print(globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode.length);

              try {
                if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode
                    .toString() ==
                    tempDropDownValues[k].toString().trim()) {
                  print("matched $k");
                  setValue(k, globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i]);
                }
              } catch (_) {
                print("Exception in dropdown");
              }
            }
          }

        }

      });
    });
  }

  void addToList() {


    if(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean==null){
      CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean= new  List<BorrowingDetailsBean>();
    }
    mcurrcd=blankBean;
    mrestructdloan=blankBean;
    mfrequency=blankBean;
    mmodeofdis=blankBean;



    CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.add(CustomerFormationMasterTabsState.borrowingDetailsBean);

    setState(() {

      tempLoanDay = "";
      tempLoanMonth= "";
      tempLoanYear= "";
      tempRepaymentDay= "";
      tempRepaymentMonth= "";
      tempRepaymentYear= "";
      CustomerFormationMasterTabsState.loanDate= "__-__-____";
      CustomerFormationMasterTabsState.repaymentDate= "__-__-____";
      CustomerFormationMasterTabsState.borrowingDetailsBean = new  BorrowingDetailsBean();

    });

  }
  Future<Null> _selectLoanDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null )
      setState(() {
        CustomerFormationMasterTabsState.borrowingDetailsBean.mloanDate= picked;
        CustomerFormationMasterTabsState
            .loanDate=formatter.format(picked);
        if(picked.day.toString().length==1){
          tempLoanDay= "0"+picked.day.toString();
        }
        else tempLoanDay= picked.day.toString();
        tempLoanYear= picked.year.toString();
        if(picked.month.toString().length==1){
          tempLoanMonth= "0"+picked.month.toString();
        }
        else
          tempLoanMonth= picked.month.toString();

      });
  }

  Future<Null> _selectRepaymentDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null )
      setState(() {
        CustomerFormationMasterTabsState
            .repaymentDate= formatter.format(picked);
        print(CustomerFormationMasterTabsState
            .repaymentDate);
        if(picked.day.toString().length==1){
          tempRepaymentDay= "0"+picked.day.toString();
        }
        else tempRepaymentDay= picked.day.toString();
        tempRepaymentYear= picked.year.toString();
        if(picked.month.toString().length==1){
          tempRepaymentMonth= "0"+picked.month.toString();
        }
        else
          tempRepaymentMonth= picked.month.toString();

      });
  }

  Future<void> _showAlert(String error, String message) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${error} error"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new Text("${error} error"),
                  new Text("${message}"),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(Translations.of(context).text('ok'))),
            ],
          );
        });
  }



  List<LookupBeanData> returnLookup(String pattern) {

    List<LookupBeanData> beanList=new List<LookupBeanData>();
    for (int i = 0;
    i < globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2].length;
    i++) {
      try {
        if (globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2][i].mcodedesc.toString().trim().toUpperCase().contains(pattern.trim().toUpperCase())){
          beanList.add(globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2][i]);

        }
      }catch(_){
        print("Exception Occured");
      }
    }

    return beanList;


  }
}

