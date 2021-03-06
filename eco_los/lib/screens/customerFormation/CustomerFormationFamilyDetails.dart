import 'dart:typed_data';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/Helper.dart';
import 'package:eco_los/helpers/SignaturePainter.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationSocialFinancialDetails.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationAddressDetails.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationFamilyDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FamilyDetailsBean.dart';
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


class CustomerFormationFamilyDetails extends StatefulWidget {
  CustomerFormationFamilyDetails({Key key}) : super(key: key);


  @override
  _CustomerFormationFamilyDetailsState createState() =>
      new _CustomerFormationFamilyDetailsState();
}

class _CustomerFormationFamilyDetailsState
    extends State<CustomerFormationFamilyDetails> {

  var formatter = new DateFormat('dd-MM-yyyy');
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData education;
  LookupBeanData relationShip;
  LookupBeanData occupation;
  LookupBeanData married;
  LookupBeanData title;
  LookupBeanData reverseRelationship;
  LookupBeanData mdesignatio;
  String tempDobDay;
  String tempDobMonth;
  String tempDobYear;

  FocusNode DobMonthFocus;
  FocusNode DobYearFocus;
  bool forEdit=false;


  int count = 0;
  final TextEditingController _controller = new TextEditingController();
  static bool isSubmitClicked = false;
  FamilyDetailsBean fdb = new FamilyDetailsBean();
  final List<FamilyDetailsBean> familyObjectListLoacl =
      new List<FamilyDetailsBean>();

  bool isBool = false;
  int i = 0;

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
    // TODO: implement initState
    super.initState();

    DobMonthFocus= new FocusNode();
    DobYearFocus= new FocusNode();


    if(!CustomerFormationMasterTabsState.famDob.contains("_")){
      try{
        print("inside try");

        String tempDobDate = CustomerFormationMasterTabsState.famDob;
        DateTime  formattedDate =  DateTime.parse(tempDobDate.substring(6)+"-"+tempDobDate.substring(3,5)+"-"+tempDobDate.substring(0,2));
        print(formattedDate);

        tempDobDay = formattedDate.day.toString();
        if(tempDobDay.length ==1)tempDobDay = "0"+tempDobDay;
        print(tempDobDay);
        tempDobMonth = formattedDate.month.toString();
        if(tempDobMonth.length ==1)tempDobMonth= "0"+tempDobMonth;
        print(tempDobMonth);
        tempDobYear = formattedDate.year.toString();
        if(tempDobYear.length ==1)tempDobYear= "0"+tempDobYear;
        print(tempDobYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred fam dob");
      }
    }

    if (!isBool) {
      isBool = true;
    }

    if(CustomerFormationMasterTabsState.fdb!=null){


      for (int k = 0; k < globals.dropdownCaptionsValuesFamilyDetails.length; k++) {
        for (int i = 0; i < globals.dropdownCaptionsValuesFamilyDetails[k].length; i++) {


          if (k == 0) {
            print("for k = 0 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.meducation) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }

          if (k == 1) {
            print("for k = 1 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.mrelationwithcust) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }



          }

          if (k == 2) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.moccuptype.toString()) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }

          if (k == 3) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.maritalstatus.toString()) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }

          if (k == 4) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.mnametitle.toString()) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }

          if (k == 5) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.mreverseRelationship.toString()) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }    if (k == 6) {
            print("for k = 2 codes are ${globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode}");
            if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode ==
                CustomerFormationMasterTabsState.fdb.mdesignation.toString()) {

              setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);


            }
          }
        }


      }
    }else{
      CustomerFormationMasterTabsState.fdb= new FamilyDetailsBean();
    }


    for(int i = 0;i<CustomerFormationMasterTabsState.familyDependantRadio.length;i++){
      if(CustomerFormationMasterTabsState.familyDependantRadio[i]==null)CustomerFormationMasterTabsState.familyDependantRadio[i]= 0;
    }
    if (!ifNullCheck(CustomerFormationMasterTabsState.fdb.mmemberno)) {
      CustomerFormationMasterTabsState.familyDependantRadio[0] =
          int.parse(CustomerFormationMasterTabsState.fdb.mmemberno);
    }
    else{
      CustomerFormationMasterTabsState.fdb.mmemberno = "0";
    }

    if (CustomerFormationMasterTabsState.fdb.misearngmembr !=null) {
      CustomerFormationMasterTabsState.familyDependantRadio[1] =
          CustomerFormationMasterTabsState.fdb.misearngmembr;
    }
    else{
      CustomerFormationMasterTabsState.fdb.misearngmembr = 0;
    }


    if (CustomerFormationMasterTabsState.fdb.misstudyingmembr !=null) {
      CustomerFormationMasterTabsState.familyDependantRadio[2] =
          CustomerFormationMasterTabsState.fdb.misstudyingmembr;
    }
    else{
      CustomerFormationMasterTabsState.fdb.misstudyingmembr = 0;
    }
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

  showDropDown(LookupBeanData selectedObj, int no) {

    print("selected Obj is ${selectedObj}");
    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          education = blankBean;
          CustomerFormationMasterTabsState.fdb.meducation = selectedObj.mcode;
          break;
        case 1:
          relationShip = blankBean;
          CustomerFormationMasterTabsState.fdb.mrelationwithcust = selectedObj.mcode;
          break;
        case 2:
          occupation = blankBean;
          CustomerFormationMasterTabsState.fdb.moccuptype = int.parse(selectedObj.mcode);
          break;
        case 3:
          married = blankBean;
          CustomerFormationMasterTabsState.fdb.maritalstatus = selectedObj.mcode;
          break;
        case 4:
          title = blankBean;
          CustomerFormationMasterTabsState.fdb.mnametitle = selectedObj.mcode;
          break;
        case 5:
          reverseRelationship = blankBean;
          CustomerFormationMasterTabsState.fdb.mreverseRelationship = selectedObj.mcode;
          break;
        case 6:
          mdesignatio = blankBean;
          CustomerFormationMasterTabsState.fdb.mdesignation = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesFamilyDetails[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesFamilyDetails[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesFamilyDetails[no][k]);
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
          education = value;
          CustomerFormationMasterTabsState.fdb.meducation = value.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.education = value.code;*/

          break;
        case 1:
          relationShip = value;
          CustomerFormationMasterTabsState.fdb.mrelationwithcust = value.mcode;
          /*CustomerFormationMasterTabsState.custListBean.familyDetailsList.last.relationship = value.code;*/
          break;
        case 2:
          occupation = value;
          CustomerFormationMasterTabsState.fdb.moccuptype = int.parse(value.mcode);
          break;
        case 3:
          married = value;
          CustomerFormationMasterTabsState.fdb.maritalstatus = value.mcode;
          break;
        case 4:
          title = value;
          CustomerFormationMasterTabsState.fdb.mnametitle = value.mcode;
          break;
        case 5:
          reverseRelationship = value;
          CustomerFormationMasterTabsState.fdb.mreverseRelationship = value.mcode;
          break;
        case 6:
          mdesignatio = value;
          CustomerFormationMasterTabsState.fdb.mdesignation = value.mcode;
          break;
        default:
          break;
      }
    });
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    print("caption value : " + globals.dropdownCaptionsFamilyDetails[no]);

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    bean.mcode = "";
    bean.mcodetype = 0;
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesFamilyDetails[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesFamilyDetails[no][k]);
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




  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            /* onWillPop: () {
              return Future(() => true);
            },*/
            onChanged: () {
              final FormState form = _formKey.currentState;
              form.save();
            },
            autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                SizedBox(height: 10.0,),

                new DropdownButtonFormField(
                  value: title==null?null:title,
                  items: generateDropDown(4),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 4);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: globals.dropdownCaptionsFamilyDetails[4]),
                  // style: TextStyle(color: Colors.grey),
                ),

                new TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters,
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrFrstnm'),
                    labelText: Translations.of(context).text('Frstnm'),
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff07426A),
                    )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  controller: CustomerFormationMasterTabsState.fdb.mfname != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.fdb.mfname)
                      : TextEditingController(text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                  onSaved: (val) {
                    //if(val!=null) {
                    //globals.familyMember = val;
                    /*CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList.last.name = val;*/
                    CustomerFormationMasterTabsState.fdb.mfname = val;
                    //}
                  },
                ),
                SizedBox(height: 10.0,),
                new TextFormField(
                  keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                  decoration:  InputDecoration(
                  hintText: Translations.of(context).text('Entrmddlnm'),
                  labelText: Translations.of(context).text('Mddlnm'),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                  controller: CustomerFormationMasterTabsState.fdb.mmname != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.fdb.mmname)
                      : TextEditingController(text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                  onSaved: (val) {
                    //if(val!=null) {
                    //globals.familyMember = val;
                    /*CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList.last.name = val;*/
                    CustomerFormationMasterTabsState.fdb.mmname = val;
                    //}
                  },
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                  keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.characters
                  ,decoration:  InputDecoration(
                  hintText: Translations.of(context).text('Entrlstnm'),
                  labelText: Translations.of(context).text('Lstnm'),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                  controller: CustomerFormationMasterTabsState.fdb.mlname != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.fdb.mlname)
                      : TextEditingController(text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                  onSaved: (val) {
                    //if(val!=null) {
                    //globals.familyMember = val;
                    /*CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList.last.name = val;*/
                    CustomerFormationMasterTabsState.fdb.mlname = val;
                    //}
                  },
                ),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text(Translations.of(context).text('dateOfBirth'))],
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
                          controller: tempDobDay == null?null:new TextEditingController(text: tempDobDay),
                          keyboardType: TextInputType.numberWithOptions(),

                          onChanged: (val){

                            if(val!="0"){
                              tempDobDay = val;


                              if(int.parse(val)<=31&&int.parse(val)>0){



                                if(val.length==2){
                                  CustomerFormationMasterTabsState.famDob = CustomerFormationMasterTabsState.famDob.replaceRange(0, 2, val);
                                  FocusScope.of(context).requestFocus(DobMonthFocus);
                                }
                                else{
                                  CustomerFormationMasterTabsState.famDob = CustomerFormationMasterTabsState.famDob.replaceRange(0, 2, "0"+val);
                                }


                              }
                              else {
                                setState(() {
                                  tempDobDay ="";
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
                          focusNode: DobMonthFocus,
                          controller: tempDobMonth== null?null:new TextEditingController(text: tempDobMonth),
                          onChanged: (val){

                            if(val!="0"){
                              tempDobMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  CustomerFormationMasterTabsState.famDob = CustomerFormationMasterTabsState.famDob.replaceRange(3, 5, val);

                                  FocusScope.of(context).requestFocus(DobYearFocus);

                                }
                                else{
                                  CustomerFormationMasterTabsState.famDob = CustomerFormationMasterTabsState.famDob.replaceRange(3, 5, "0"+val);
                                }
                              }
                              else {
                                setState(() {
                                  tempDobMonth ="";
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


                          focusNode: DobYearFocus,
                          controller: tempDobYear== null?null:new TextEditingController(text: tempDobYear),
                          onChanged: (val){
                            tempDobYear = val;
                            if(val.length==4){
                              CustomerFormationMasterTabsState.famDob = CustomerFormationMasterTabsState.famDob.replaceRange(6, 10,val);
                              print(CustomerFormationMasterTabsState.famDob);
                            }

                          },
                        ),)
                      ,

                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectDobDate(context);
                      } )
                    ],



                  ),

                ),


                new DropdownButtonFormField(
                  value: education==null?null: education,
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
                  decoration: InputDecoration(labelText: Translations.of(context).text('Education')),
                  // style: TextStyle(color: Colors.grey),
                ),
                new DropdownButtonFormField(
                  value: relationShip==null?null:relationShip,
                  items: generateDropDown(1),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 1);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('Relation')),
                  // style: TextStyle(color: Colors.grey),
                ),
                new DropdownButtonFormField(
                  value: reverseRelationship==null?null: reverseRelationship,
                  items: generateDropDown(5),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 5);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('RevRltnshp')),
                  // style: TextStyle(color: Colors.grey),
                ),
                new DropdownButtonFormField(
                  value: married==null?null:married,
                  items: generateDropDown(3),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 3);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('MrtlStts')),
                  // style: TextStyle(color: Colors.grey),
                ),
                new DropdownButtonFormField(
                  value: occupation==null?null:occupation,
                  items: generateDropDown(2),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 2);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('Occupation')),
                  // style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10.0,),

                new DropdownButtonFormField(
                  value: mdesignatio==null?null: mdesignatio,
                  items: generateDropDown(6),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 6);
                  },
                  validator: (args) {
                    print(args);
                  },
                  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('Designation')),
                  // style: TextStyle(color: Colors.grey),
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
                          color: Color(0xff07426A),
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
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            splashColor: Colors.red,
                            onPressed: () {
                              if(forEdit) {
                                try {
                                 /* AppDatabase.get().deleFamDetails(
                                      CustomerFormationMasterTabsState.fdb
                                          .mrefno,
                                      CustomerFormationMasterTabsState.fdb
                                          .trefno);*/
                                }catch(_){}

                                CustomerFormationMasterTabsState.custListBean
                                    .familyDetailsList.removeAt(
                                    CustomerFormationMasterTabsState.fdb
                                        .positionindex);

                                forEdit=false;
                              }
                              if(!CustomerFormationMasterTabsState.famDob.contains("_")){
                                try{
                                  String tempLoanDate = CustomerFormationMasterTabsState.famDob;
                                 //print(tempLoanDate.substring(6)+"-"+tempLoanDate.substring(3,5)+"-"+tempLoanDate.substring(0,2));
                                  CustomerFormationMasterTabsState.fdb.mdob=  DateTime.parse(tempLoanDate.substring(6)+"-"+tempLoanDate.substring(3,5)+"-"+tempLoanDate.substring(0,2));
                                }catch( e){
                                  _showAlert(Translations.of(context).text('DOB'), Translations.of(context).text('BrthDtErr'));
                                  return;
                                }
                              }else {

                              }
                              addToList();
                            })),
                  ],
                ),
              ],
            )));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              new ViewCustomerFormationFamilyDetails(),
          fullscreenDialog: true,
        )).then<FamilyDetailsBean>((familyDetailsBean) {
      setState(() {
        if(familyDetailsBean==null) {
          return;
        }else {
          forEdit = true;
          CustomerFormationMasterTabsState.fdb = familyDetailsBean;
          if (!ifNullCheck(CustomerFormationMasterTabsState.fdb.mmemberno)) {
            CustomerFormationMasterTabsState.familyDependantRadio[0] =
                int.parse(CustomerFormationMasterTabsState.fdb.mmemberno);
          }
          else{
            CustomerFormationMasterTabsState.fdb.mmemberno = "0";
          }

          if (CustomerFormationMasterTabsState.fdb.misearngmembr !=null) {
            CustomerFormationMasterTabsState.familyDependantRadio[1] =
                CustomerFormationMasterTabsState.fdb.misearngmembr;
          }
          else{
            CustomerFormationMasterTabsState.fdb.misearngmembr = 0;
          }


          if (CustomerFormationMasterTabsState.fdb.misstudyingmembr !=null) {
            CustomerFormationMasterTabsState.familyDependantRadio[2] =
                CustomerFormationMasterTabsState.fdb.misstudyingmembr;
          }
          else{
            CustomerFormationMasterTabsState.fdb.misstudyingmembr = 0;
          }
          List tempDropDownValues = new List();
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.meducation.toString());
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.mrelationwithcust);
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.moccuptype);
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.maritalstatus);
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.mnametitle);
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.mreverseRelationship);
          tempDropDownValues.add(CustomerFormationMasterTabsState.fdb.mdesignation);

          for (int k = 0;
          k < globals.dropdownCaptionsValuesFamilyDetails.length;
          k++) {
            for (int i = 0;
            i < globals.dropdownCaptionsValuesFamilyDetails[k].length;
            i++) {
              // print("k and i is $k $i");
              print(globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.length);

              try {
                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode
                    .toString() ==
                    tempDropDownValues[k].toString().trim()) {
                  print("matched $k");
                  setValue(k, globals.dropdownCaptionsValuesFamilyDetails[k][i]);
                }
              } catch (_) {
                print("Exception in dropdown");
              }

if(CustomerFormationMasterTabsState.fdb.mdob!="null"&&CustomerFormationMasterTabsState.fdb.mdob!=null&&CustomerFormationMasterTabsState.fdb.mdob!="") {
  setState(() {
    if (CustomerFormationMasterTabsState.fdb.mdob.day
        .toString()
        .length == 1) {
      tempDobDay =
          "0" + CustomerFormationMasterTabsState.fdb.mdob.day.toString();
    }
    else
      tempDobDay = CustomerFormationMasterTabsState.fdb.mdob.day.toString();
    tempDobYear = CustomerFormationMasterTabsState.fdb.mdob.year.toString();
    if (CustomerFormationMasterTabsState.fdb.mdob.month
        .toString()
        .length == 1) {
      tempDobMonth =
          "0" + CustomerFormationMasterTabsState.fdb.mdob.month.toString();
    }
    else
      tempDobMonth = CustomerFormationMasterTabsState.fdb.mdob.month.toString();
  });

}
            }
          }



        }
      });
    });
  }

  void addToList() {

    if(CustomerFormationMasterTabsState.custListBean.familyDetailsList==null){
      CustomerFormationMasterTabsState.custListBean.familyDetailsList= new  List<FamilyDetailsBean>();
    }


    if(CustomerFormationMasterTabsState.fdb.mfname!=null&&CustomerFormationMasterTabsState.fdb.mfname!="null"){







print("CustomerFormationMasterTabsState.fdb"+CustomerFormationMasterTabsState.fdb.toString());
      CustomerFormationMasterTabsState.custListBean.familyDetailsList.add(CustomerFormationMasterTabsState.fdb);

      education = blankBean;
      relationShip = blankBean;
      occupation = blankBean;
      reverseRelationship = blankBean;
      mdesignatio=blankBean;
      married = blankBean;
      title = blankBean;
      //globals.familyDetailsList.insert(listLength, fdb);

        setState(() {
          tempDobDay = "";
          tempDobMonth= "";
          tempDobYear= "";
          CustomerFormationMasterTabsState.famDob = "__-__-____";
          CustomerFormationMasterTabsState.fdb = new FamilyDetailsBean();
        });

    } else {
      globals.Dialog.alertPopup(context,"Error",Translations.of(context).text('PlsAddMmbrnm'),"Family" );
    }
  }


    Future<Null> _selectDobDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1800, 8),
          lastDate: DateTime.now());
      if (picked != null )
        setState(() {
          CustomerFormationMasterTabsState
              .famDob=formatter.format(picked);
          if(picked.day.toString().length==1){
            tempDobDay= "0"+picked.day.toString();
          }
          else tempDobDay= picked.day.toString();

          if(picked.month.toString().length==1){
            tempDobMonth= "0"+picked.month.toString();
          }
          else
            tempDobMonth= picked.month.toString();
          tempDobYear= picked.year.toString();
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
}

