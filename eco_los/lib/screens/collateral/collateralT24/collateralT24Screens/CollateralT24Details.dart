import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/LoanApplication/bean/DeleteTableBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/collateral/AddCollaterals.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/collateral/collateralT24/bean/CollateralT24Bean.dart';
import 'package:eco_los/screens/collateral/collateralT24/collateralT24Screens/CollateralT24Master.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForSubOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralREM/CollateralsREMMaster.dart';
import 'package:eco_los/screens/collateral/collateralREM/bean/CollateralREMlandandhouseBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/address/FullScreenDialogForAreaSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForCountrySelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForDistrictSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForStateSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForSubDistrictSelection.dart';
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';

import 'package:shared_preferences/shared_preferences.dart';


class CollateralT24Details extends StatefulWidget {
  @override
  _CollateralT24Details createState() =>
      new _CollateralT24Details();
}

class _CollateralT24Details
    extends State<CollateralT24Details> {
  String tempLandDay ;
  String tempLandMonth ;
  String tempLandYear ;
  FocusNode monthLandFocus;
  FocusNode yearLandFocus;
  var formatter = new DateFormat('dd-MM-yyyy');
  final formatDouble = new NumberFormat("#,##0.00", "en_US");
  String tempHouseDay ;
  String tempHouseMonth ;
  String tempHouseYear ;
  FocusNode monthHouseFocus;
  FocusNode yearHouseFocus;
  LookupBeanData SizeOfPropertyL;
  LookupBeanData SizeOfPropertyH;
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropDownCaptionValuesCollateralT24Details[no].length;
    k++) {
      mapData.add(globals.dropDownCaptionValuesCollateralT24Details[no][k]);
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

    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {

        case 0:
          SizeOfPropertyL = blankBean;
          CollateralT24MasterState.collateralT24Bean.msizeofpropertyl = blankBean.mcode;
          break;
        case 1:
          SizeOfPropertyH = blankBean;
          CollateralT24MasterState.collateralT24Bean.msizeofpropertyh = blankBean.mcode;
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
      k < globals.dropDownCaptionValuesCollateralT24Details[no].length;
      k++) {
        if (globals.dropDownCaptionValuesCollateralT24Details[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropDownCaptionValuesCollateralT24Details[no][k]);
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
          SizeOfPropertyL = value;
          CollateralT24MasterState.collateralT24Bean.msizeofpropertyl= value.mcode;
          break;
        case 1:
          SizeOfPropertyH = value;
          CollateralT24MasterState.collateralT24Bean.msizeofpropertyh= value.mcode;
          break;
        default:
          break;
      }
    });
  }
  @override
  void initState() {
    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralT24MasterState.collateralT24Bean.msizeofpropertyl);
    tempDropDownValues
        .add(CollateralT24MasterState.collateralT24Bean.msizeofpropertyh);
    for (int k = 0;
    k < globals.dropDownCaptionValuesCollateralT24Details.length;
    k++) {
      for (int i = 0;
      i < globals.dropDownCaptionValuesCollateralT24Details[k].length;
      i++) {
        if (globals.dropDownCaptionValuesCollateralT24Details[k][i].mcode ==
            tempDropDownValues[k]) {
          setValue(k, globals.dropDownCaptionValuesCollateralT24Details[k][i]);
        }
      }
    }
    if(!CollateralT24MasterState.landIssue.contains("_")){
      try{
        //  print("inside try");

        String temptemplandIssue = CollateralT24MasterState.landIssue;
        print(temptemplandIssue);
        //  print(temptempCollateralT24MasterState.landIssue.substring(6)+"-"+temptempCollateralT24MasterState.landIssue.substring(3,5)+"-"+temptempCollateralT24MasterState.landIssue.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(temptemplandIssue.substring(6)+"-"+temptemplandIssue.substring(3,5)+"-"+temptemplandIssue.substring(0,2));
        //   print(formattedDate);
        tempLandDay = formattedDate.day.toString();
        //   print(tempDay);
        tempLandMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        tempLandYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }
    if(!CollateralT24MasterState.houseIssue.contains("_")){
      try{
        //  print("inside try");

        String temptempHouseIssue = CollateralT24MasterState.houseIssue;
        print(temptempHouseIssue);
        //  print(temptempHouseIssue.substring(6)+"-"+temptempHouseIssue.substring(3,5)+"-"+temptempHouseIssue.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(temptempHouseIssue.substring(6)+"-"+temptempHouseIssue.substring(3,5)+"-"+temptempHouseIssue.substring(0,2));
        //   print(formattedDate);
        tempHouseDay = formattedDate.day.toString();
        //   print(tempDay);
        tempHouseMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        tempHouseYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }
    super.initState();
  }

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return new SafeArea(
        child: new Form(
            key: _formKey,
            onWillPop: () {
              return Future(() => true);
            },
            onChanged: () {
              final FormState _form2 = _formKey.currentState;
              _form2.save();
            },
            child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[

                    SizedBox(
                      height: 20.0,
                    ),
                   /* new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                            child: Text(
                              Translations.of(context).text('type_of_property'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new Container(
                                width: 100.0,
                                child: new Text(
                                  Translations.of(context).text('land'),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                                width: 100.0,
                                child: new Text(
                                  Translations.of(context).text('house'),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),*/
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('Typownrshpcerti')),
                          ),
                        ),

                        //////////////////////////////////////
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mtypeofownercerti = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mtypeofownercerti == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mtypeofownercerti),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhtypeofownercerti = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhtypeofownercerti == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhtypeofownercerti),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('DtIss')),
                          ),
                        ),
                        new Container(
                          decoration: BoxDecoration(),
                          child: new Row(
                            children: <Widget>[
                              new Container(
                                width: 40.0,
                                child: new TextField(
                                    decoration: InputDecoration(hintText: Translations.of(context).text('DD')),
                                    inputFormatters: [
                                      new LengthLimitingTextInputFormatter(2),
                                      globals.onlyIntNumber
                                    ],
                                    controller: tempLandDay == null
                                        ? null
                                        : new TextEditingController(text: tempLandDay),
                                    keyboardType: TextInputType.numberWithOptions(),
                                    onChanged: (val) {
                                      if (val != "0") {
                                        tempLandDay = val;

                                        if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                          if (val.length == 2) {
                                            CollateralT24MasterState.landIssue = CollateralT24MasterState.landIssue.replaceRange(0, 2, val);
                                            FocusScope.of(context).requestFocus(monthLandFocus);
                                          } else {
                                            CollateralT24MasterState.landIssue =
                                                CollateralT24MasterState.landIssue.replaceRange(0, 2, "0" + val);
                                          }
                                        } else {
                                          setState(() {
                                            tempLandDay = "";
                                          });
                                        }
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text("/"),
                              ),
                              new Container(
                                width: 40.0,
                                child: new TextField(
                                  decoration: InputDecoration(
                                    hintText: Translations.of(context).text('MM'),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(),
                                  inputFormatters: [
                                    new LengthLimitingTextInputFormatter(2),
                                    globals.onlyIntNumber
                                  ],
                                  focusNode: monthLandFocus,
                                  controller: tempLandMonth == null
                                      ? null
                                      : new TextEditingController(text: tempLandMonth),
                                  onChanged: (val) {
                                    if (val != "0") {
                                      tempLandMonth = val;
                                      if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                        if (val.length == 2) {
                                          CollateralT24MasterState.landIssue = CollateralT24MasterState.landIssue.replaceRange(3, 5, val);

                                          FocusScope.of(context).requestFocus(yearLandFocus);
                                        } else {
                                          CollateralT24MasterState.landIssue =
                                              CollateralT24MasterState.landIssue.replaceRange(3, 5, "0" + val);
                                        }
                                      } else {
                                        setState(() {
                                          tempLandMonth = "";
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text("/"),
                              ),
                              Container(
                                width: 60,
                                child: new TextField(
                                  decoration: InputDecoration(
                                    hintText: Translations.of(context).text('YYYY'),
                                  ),
                                  keyboardType: TextInputType.numberWithOptions(),
                                  inputFormatters: [
                                    new LengthLimitingTextInputFormatter(4),
                                    globals.onlyIntNumber
                                  ],
                                  focusNode: yearLandFocus,
                                  controller: tempLandYear == null
                                      ? null
                                      : new TextEditingController(text: tempLandYear),
                                  onChanged: (val) {
                                    tempLandYear = val;
                                    if (val.length == 4)
                                      CollateralT24MasterState.landIssue =  CollateralT24MasterState.landIssue.replaceRange(6, 10, val);

                                  },

                                ),
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () {
                                    _selectLandDate(context);
                                  }),


                            ],
                          ),
                        ),
                      ],
                    ),


              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(Translations.of(context).text('mtrtydt')),
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(),
                    child: new Row(
                      children: <Widget>[
                  new Container(
                    width: 40.0,
                    child: new TextField(
                        decoration: InputDecoration(hintText: Translations.of(context).text('DD')),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(2),
                          globals.onlyIntNumber
                        ],
                        controller: tempHouseDay == null
                            ? null
                            : new TextEditingController(text: tempHouseDay),
                        keyboardType: TextInputType.numberWithOptions(),
                        onChanged: (val) {
                          if (val != "0") {
                            tempHouseDay = val;

                            if (int.parse(val) <= 31 && int.parse(val) > 0) {
                              if (val.length == 2) {
                                CollateralT24MasterState.houseIssue = CollateralT24MasterState.houseIssue.replaceRange(0, 2, val);
                                FocusScope.of(context).requestFocus(monthHouseFocus);
                              } else {
                                CollateralT24MasterState.houseIssue =
                                    CollateralT24MasterState.houseIssue.replaceRange(0, 2, "0" + val);
                              }
                            } else {
                              setState(() {
                                tempHouseDay = "";
                              });
                            }
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Text("/"),
                  ),
                  new Container(
                    width: 40.0,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: Translations.of(context).text('MM'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      focusNode: monthHouseFocus,
                      controller: tempHouseMonth == null
                          ? null
                          : new TextEditingController(text: tempHouseMonth),
                      onChanged: (val) {
                        if (val != "0") {
                          tempHouseMonth = val;
                          if (int.parse(val) <= 12 && int.parse(val) > 0) {
                            if (val.length == 2) {
                              CollateralT24MasterState.houseIssue = CollateralT24MasterState.houseIssue.replaceRange(3, 5, val);

                              FocusScope.of(context).requestFocus(yearHouseFocus);
                            } else {
                              CollateralT24MasterState.houseIssue =
                                  CollateralT24MasterState.houseIssue.replaceRange(3, 5, "0" + val);
                            }
                          } else {
                            setState(() {
                              tempHouseMonth = "";
                            });
                          }
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Text("/"),
                  ),
                  Container(
                    width: 60,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: Translations.of(context).text('YYYY'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(4),
                        globals.onlyIntNumber
                      ],
                      focusNode: yearHouseFocus,
                      controller: tempHouseYear == null
                          ? null
                          : new TextEditingController(text: tempHouseYear),
                      onChanged: (val) {
                        tempHouseYear = val;
                        if (val.length == 4)
                          CollateralT24MasterState.houseIssue =  CollateralT24MasterState.houseIssue.replaceRange(6, 10, val);

                      },

                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectHouseDate(context);
                      })

                ],
              ),
            ),
          ],
        ),
                    SizedBox(height: 10.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('IssNoP')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .missuednoprop = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .missuednoprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .missuednoprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhissuednoprop = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhissuednoprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhissuednoprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('IssuBy')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(60)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .missueby = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .missueby == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .missueby),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                          /*  SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(60)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhissueby = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhissueby == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhissueby),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),

                   /* Container(
                      color: Constant.semiMandatoryColor,
                      child: new DropdownButtonFormField(
                        value:SizeOfPropertyL==null?null: SizeOfPropertyL,
                        items: generateDropDown(0),
                        onChanged: (LookupBeanData newValue) {
                          showDropDown(newValue, 0);
                        },
                        validator: (args) {
                          print(args);
                        },
                        decoration: InputDecoration(labelText: Translations.of(context).text('SzPropFrLnd')),
                      ),),
                    Container(
                      color: Constant.semiMandatoryColor,
                      child: new DropdownButtonFormField(
                        value:SizeOfPropertyH==null?null: SizeOfPropertyH,
                        items: generateDropDown(1),
                        onChanged: (LookupBeanData newValue) {
                          showDropDown(newValue, 1);
                        },
                        validator: (args) {
                          print(args);
                        },
                        decoration: InputDecoration(labelText: Translations.of(context).text('SzOfPropFrHus')),
                      ),),
*/


                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('collRefNo')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mcollrefno = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollrefno == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollrefno),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhsizeprop = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhsizeprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhsizeprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('collrecpt')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mcollrecpt = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollrecpt == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollrecpt),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhnpropborder = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhnpropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhnpropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),


                    

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('prdofdpst')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(3)
                                ],
                                onSaved: (String val) {
                                  if(val!=null&&val!="") {
                                  try{
                                  CollateralT24MasterState.collateralT24Bean.mprdofdpst = int.parse(val);
                                  }catch(e){

                                  }

                                  }
                                  else{
                                  CollateralT24MasterState.collateralT24Bean.mprdofdpst = 0;
                                  }

                                  //}
                                },
                                controller:  CollateralT24MasterState.collateralT24Bean.mprdofdpst != null&& CollateralT24MasterState.collateralT24Bean.mprdofdpst != 0
                                    ? TextEditingController(text: CollateralT24MasterState.collateralT24Bean.mprdofdpst.toString())
                                    : TextEditingController(text:""),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mhspropborder = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhspropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhspropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('Acc_No')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(16)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .maccno = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .maccno == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .maccno),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('collateralOwner')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mcollownr = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollownr == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcollownr),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('collateralType')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralT24MasterState
                                      .collateralT24Bean
                                      .mcolltype = value;
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcolltype == null
                                    ? null
                                    : new TextEditingController(text:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcolltype),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('excvlue')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(15)
                                ],
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mexcvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mexcvalue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mexcvalue = double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                          /*  SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(12)
                                ],
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhlocalauthvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mhlocalauthvalue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mhlocalauthvalue = double.parse(value);
                                  } catch (_) {
                                  }
                                },
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('prncplvlue')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(15)
                                ],
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mprncplvlue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mprncplvlue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mprncplvlue =
                                        double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                           /* SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mhrealestatecmpnyvalue =
                                        double.parse(value);
                                  } catch (_) {


                                  }
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhrealestatecmpnyvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mhrealestatecmpnyvalue)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('nmlvlue')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mnmnlvlue = double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mnmnlvlue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mnmnlvlue)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('cntrlbnkvlue')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try{
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mcntrlbnkvlue = double.parse(value);
                                  }catch(_){}
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mcntrlbnkvlue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mcntrlbnkvlue)),

                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),
                            /*SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mhsumonvalprop = double.parse(value);
                                  }catch(_){}
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mhsumonvalprop == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mhsumonvalprop)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )*/
                          ],
                        ),

                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 200.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('mturtyvlue')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 300.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralT24MasterState
                                        .collateralT24Bean
                                        .mmtrtyvlue = double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                controller:  CollateralT24MasterState
                                    .collateralT24Bean
                                    .mmtrtyvlue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralT24MasterState.collateralT24Bean
                                    .mmtrtyvlue)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),

                                    //helperText: 'Keep it short, this is just a demo.',

                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ))));
  }


  Future<Null> _selectHouseDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked !=  CollateralT24MasterState.collateralT24Bean.mmtrtydt)
      setState(() {
        CollateralT24MasterState
            .collateralT24Bean.mmtrtydt = picked;
        CollateralT24MasterState.houseIssue = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempHouseDay = "0" + picked.day.toString();
        } else
          tempHouseDay = picked.day.toString();
        CollateralT24MasterState.houseIssue = CollateralT24MasterState.houseIssue.replaceRange(0, 2, tempHouseDay);
        tempHouseYear = picked.year.toString();
        CollateralT24MasterState.houseIssue = CollateralT24MasterState.houseIssue.replaceRange(6, 10, tempHouseYear);
        if (picked.month.toString().length == 1) {
          tempHouseMonth = "0" + picked.month.toString();
        } else
          tempHouseMonth = picked.month.toString();
        CollateralT24MasterState.houseIssue = CollateralT24MasterState.houseIssue.replaceRange(3, 5, tempHouseMonth);
      });
  }
  Future<Null> _selectLandDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CollateralT24MasterState.collateralT24Bean.missuedt)
      setState(() {
        CollateralT24MasterState.collateralT24Bean.missuedt= picked;
        tempLandDay = formatter.format(picked);
        if(picked.day.toString().length==1){
          tempLandDay = "0"+picked.day.toString();

        }
        else tempLandDay = picked.day.toString();
        CollateralT24MasterState.landIssue = CollateralT24MasterState.landIssue.replaceRange(0, 2, tempLandDay);
        tempLandYear = picked.year.toString();
        CollateralT24MasterState.landIssue = CollateralT24MasterState.landIssue.replaceRange(6, 10,tempLandYear);
        if(picked.month.toString().length==1){
          tempLandMonth = "0"+picked.month.toString();
        }
        else
          tempLandMonth = picked.month.toString();
        CollateralT24MasterState.landIssue = CollateralT24MasterState.landIssue.replaceRange(3, 5, tempLandMonth);
      });
  }



}
