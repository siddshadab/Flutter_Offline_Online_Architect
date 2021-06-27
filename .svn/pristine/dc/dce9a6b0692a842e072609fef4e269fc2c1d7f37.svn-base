import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralREM/CollateralsREMMaster.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;

class CollateralREMLandAndBuilding extends StatefulWidget {
  @override
  _CollateralREMLandAndBuilding createState() =>
      new _CollateralREMLandAndBuilding();
}

class _CollateralREMLandAndBuilding
    extends State<CollateralREMLandAndBuilding> {
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
    k < globals.dropDownCaptionValuesCollateralREMlandandbuilding[no].length;
    k++) {
      mapData.add(globals.dropDownCaptionValuesCollateralREMlandandbuilding[no][k]);
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
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyl = blankBean.mcode;
          break;
        case 1:
          SizeOfPropertyH = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyh = blankBean.mcode;
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
      k < globals.dropDownCaptionValuesCollateralREMlandandbuilding[no].length;
      k++) {
        if (globals.dropDownCaptionValuesCollateralREMlandandbuilding[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropDownCaptionValuesCollateralREMlandandbuilding[no][k]);
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
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyl= value.mcode;
          break;
        case 1:
          SizeOfPropertyH = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyh= value.mcode;
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
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyl);
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofpropertyh);
    for (int k = 0;
    k < globals.dropDownCaptionValuesCollateralREMlandandbuilding.length;
    k++) {
      for (int i = 0;
      i < globals.dropDownCaptionValuesCollateralREMlandandbuilding[k].length;
      i++) {
        if (globals.dropDownCaptionValuesCollateralREMlandandbuilding[k][i].mcode ==
            tempDropDownValues[k]) {
          setValue(k, globals.dropDownCaptionValuesCollateralREMlandandbuilding[k][i]);
        }
      }
    }
    if(!CollateralsREMMasterState.landIssue.contains("_")){
      try{
        //  print("inside try");

        String temptemplandIssue = CollateralsREMMasterState.landIssue;
        print(temptemplandIssue);
        //  print(temptempCollateralsREMMasterState.landIssue.substring(6)+"-"+temptempCollateralsREMMasterState.landIssue.substring(3,5)+"-"+temptempCollateralsREMMasterState.landIssue.substring(0,2));
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
    if(!CollateralsREMMasterState.houseIssue.contains("_")){
      try{
        //  print("inside try");

        String temptempHouseIssue = CollateralsREMMasterState.houseIssue;
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
                    new Row(
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
                    SizedBox(height: 10.0),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100.0,
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
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mltypeofownercerti = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mltypeofownercerti == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mltypeofownercerti),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhtypeofownercerti = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhtypeofownercerti == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhtypeofownercerti),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 100.0,
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
                                width: 20.0,
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
                                            CollateralsREMMasterState.landIssue = CollateralsREMMasterState.landIssue.replaceRange(0, 2, val);
                                            FocusScope.of(context).requestFocus(monthLandFocus);
                                          } else {
                                            CollateralsREMMasterState.landIssue =
                                                CollateralsREMMasterState.landIssue.replaceRange(0, 2, "0" + val);
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
                                width: 20.0,
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
                                          CollateralsREMMasterState.landIssue = CollateralsREMMasterState.landIssue.replaceRange(3, 5, val);

                                          FocusScope.of(context).requestFocus(yearLandFocus);
                                        } else {
                                          CollateralsREMMasterState.landIssue =
                                              CollateralsREMMasterState.landIssue.replaceRange(3, 5, "0" + val);
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
                                width: 35,
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
                                      CollateralsREMMasterState.landIssue =  CollateralsREMMasterState.landIssue.replaceRange(6, 10, val);

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
                              SizedBox(
                                width: 10.0,
                              ),
                              new Container(
                                width: 20.0,
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
                                            CollateralsREMMasterState.houseIssue = CollateralsREMMasterState.houseIssue.replaceRange(0, 2, val);
                                            FocusScope.of(context).requestFocus(monthHouseFocus);
                                          } else {
                                            CollateralsREMMasterState.houseIssue =
                                                CollateralsREMMasterState.houseIssue.replaceRange(0, 2, "0" + val);
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
                                width: 20.0,
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
                                          CollateralsREMMasterState.houseIssue = CollateralsREMMasterState.houseIssue.replaceRange(3, 5, val);

                                          FocusScope.of(context).requestFocus(yearHouseFocus);
                                        } else {
                                          CollateralsREMMasterState.houseIssue =
                                              CollateralsREMMasterState.houseIssue.replaceRange(3, 5, "0" + val);
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
                                width: 35,
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
                                      CollateralsREMMasterState.houseIssue =  CollateralsREMMasterState.houseIssue.replaceRange(6, 10, val);

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
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('IssNoProp')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlissuednoprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlissuednoprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlissuednoprop),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhissuednoprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhissuednoprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhissuednoprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('IssuBy')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(60)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlissueby = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlissueby == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlissueby),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(60)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhissueby = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhissueby == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhissueby),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                    Container(
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



                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('SzeProp')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlsizeprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlsizeprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlsizeprop),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhsizeprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhsizeprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhsizeprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('PrprtyBrdrNrth')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlnpropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlnpropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlnpropborder),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhnpropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhnpropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhnpropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('PropBrdrSuth')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlspropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlspropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlspropborder),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhspropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhspropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhspropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('PropBrdrWst')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlwpropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlwpropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlwpropborder),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhwpropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhwpropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhwpropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('PropBordEst')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mlepropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlepropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlepropborder),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhepropborder = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhepropborder == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhepropborder),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text("Location Property"),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mllocprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mllocprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mllocprop),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(50)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhlocprop = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhlocprop == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhlocprop),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text("Title Owner"),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mltitleowener = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mltitleowener == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mltitleowener),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(65)
                                ],
                                onSaved: (String value) {
                                  CollateralsREMMasterState
                                      .collateralREMlandandhouseBean
                                      .mhtitleowener = value;
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhtitleowener == null
                                    ? null
                                    : new TextEditingController(text:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhtitleowener),
                                keyboardType: TextInputType.text,
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(color: Constant.mandatoryColor),
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "The Valuation Collects information  about propersties "
                                  "priced around properties and similar locations from the following sources(Currency is same as loan)"
                                  "",
                              style: TextStyle(color: Colors.blue, fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('LclAothTllvlu')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(12)
                                ],
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mllocalauthvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mllocalauthvalue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mllocalauthvalue = double.parse(value);
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(12)
                                ],
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhlocalauthvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mhlocalauthvalue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
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
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('RlEsttCmpnyVal')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(12)
                                ],
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlrealestatecmpnyvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mlrealestatecmpnyvalue)),
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mlrealestatecmpnyvalue =
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mhrealestatecmpnyvalue =
                                        double.parse(value);
                                  } catch (_) {


                                  }
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhrealestatecmpnyvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mhrealestatecmpnyvalue)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('AskNeigVal')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mlaskneighonvalue = double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlaskneighonvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mlaskneighonvalue)),
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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mhaskneighonvalue = double.parse(value);
                                  } catch (_) {

                                  }
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhaskneighonvalue == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mhaskneighonvalue)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 155.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(Translations.of(context).text('SummaryValProp')),
                          ),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try{
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mlsumonvalprop = double.parse(value);
                                  }catch(_){}
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mlsumonvalprop == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mlsumonvalprop)),

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
                            SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              width: 155.0,
                              child: new TextFormField(
                                inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                onSaved: (String value) {
                                  try {
                                    CollateralsREMMasterState
                                        .collateralREMlandandhouseBean
                                        .mhsumonvalprop = double.parse(value);
                                  }catch(_){}
                                },
                                controller:  CollateralsREMMasterState
                                    .collateralREMlandandhouseBean
                                    .mhsumonvalprop == null    ? null
                                    : new TextEditingController(text:  formatDouble.format(CollateralsREMMasterState.collateralREMlandandhouseBean
                                    .mhsumonvalprop)),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                decoration: new InputDecoration(
                                    border: new OutlineInputBorder(
                                        borderSide:
                                        new BorderSide(color: Colors.teal)),
                                    suffixStyle:
                                    const TextStyle(color: Colors.green)),
                              ),
                            )
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
    if (picked != null && picked !=  CollateralsREMMasterState.collateralREMlandandhouseBean.mhissuedt)
      setState(() {
        CollateralsREMMasterState
            .collateralREMlandandhouseBean.mhissuedt = picked;
        CollateralsREMMasterState.houseIssue = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempHouseDay = "0" + picked.day.toString();
        } else
          tempHouseDay = picked.day.toString();
        CollateralsREMMasterState.houseIssue = CollateralsREMMasterState.houseIssue.replaceRange(0, 2, tempHouseDay);
        tempHouseYear = picked.year.toString();
        CollateralsREMMasterState.houseIssue = CollateralsREMMasterState.houseIssue.replaceRange(6, 10, tempHouseYear);
        if (picked.month.toString().length == 1) {
          tempHouseMonth = "0" + picked.month.toString();
        } else
          tempHouseMonth = picked.month.toString();
        CollateralsREMMasterState.houseIssue = CollateralsREMMasterState.houseIssue.replaceRange(3, 5, tempHouseMonth);
      });
  }
  Future<Null> _selectLandDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CollateralsREMMasterState.collateralREMlandandhouseBean.mlissuedt)
      setState(() {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mlissuedt= picked;
        tempLandDay = formatter.format(picked);
        if(picked.day.toString().length==1){
          tempLandDay = "0"+picked.day.toString();

        }
        else tempLandDay = picked.day.toString();
        CollateralsREMMasterState.landIssue = CollateralsREMMasterState.landIssue.replaceRange(0, 2, tempLandDay);
        tempLandYear = picked.year.toString();
        CollateralsREMMasterState.landIssue = CollateralsREMMasterState.landIssue.replaceRange(6, 10,tempLandYear);
        if(picked.month.toString().length==1){
          tempLandMonth = "0"+picked.month.toString();
        }
        else
          tempLandMonth = picked.month.toString();
        CollateralsREMMasterState.landIssue = CollateralsREMMasterState.landIssue.replaceRange(3, 5, tempLandMonth);
      });
  }



}
