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

class CollateralREMlandandhouse extends StatefulWidget {
  CollateralREMlandandhouse({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralREMlandandhouseState createState() =>
      new _CollateralREMlandandhouseState();
}

class _CollateralREMlandandhouseState
    extends State<CollateralREMlandandhouse> {
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
  LookupBeanData Title;
  LookupBeanData HouseBuiltType;
  LookupBeanData EnvDescription;
  LookupBeanData DescOfProperty;
  LookupBeanData SizeOfProperty;

  static String registrationDate = "__-__-____";
  String tempDate = "----/--/--";
  String tempYear ;
  String tempDay ;
  String tempMonth ;
  static String EPEBDate = "__-__-____";
  String etempDate = "----/--/--";
  String etempYear ;
  String etempDay ;
  String etempMonth ;
  FocusNode monthFocus;
  FocusNode yearFocus;
  var formatter = new DateFormat('dd-MM-yyyy');

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData occupaOrBuisness;

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
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          Title = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mtitle= blankBean.mcode;
          break;
        case 1:
          HouseBuiltType = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mhousebuilttype = blankBean.mcode;
          break;
        case 2:
          EnvDescription = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.menvdescription= blankBean.mcode;
          break;
        case 3:
          DescOfProperty = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty = blankBean.mcode;
          break;
        case 4:
          SizeOfProperty = blankBean;
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofproperty = blankBean.mcode;
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
      k < globals.dropDownCaptionValuesCollateralREMlandandhouse[no].length;
      k++) {
        if (globals.dropDownCaptionValuesCollateralREMlandandhouse[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropDownCaptionValuesCollateralREMlandandhouse[no][k]);
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
          Title = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mtitle = value.mcode;

          break;
        case 1:
          HouseBuiltType = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mhousebuilttype = value.mcode;
          break;
        case 2:
          EnvDescription = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.menvdescription = value.mcode;
          break;
        case 3:
          DescOfProperty = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty= value.mcode;
          break;
        case 4:
          SizeOfProperty = value;
          CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofproperty= value.mcode;
          break;
        default:
          break;
      }
    });
  }
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropDownCaptionValuesCollateralREMlandandhouse[no].length;
    k++) {
      mapData.add(globals.dropDownCaptionValuesCollateralREMlandandhouse[no][k]);
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
  void initState() {
    super.initState();
    getSessionVariables();

    if(CollateralsREMMasterState.collateralREMlandandhouseBean==null){
      CollateralsREMMasterState.collateralREMlandandhouseBean= new CollateralREMlandandhouseBean();
    }
    if(!registrationDate.contains("_")){
      try{
        //  print("inside try");

        String tempRegistrationDate = registrationDate;
        print(tempRegistrationDate);
        //  print(tempRegistrationDate.substring(6)+"-"+tempRegistrationDate.substring(3,5)+"-"+tempRegistrationDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempRegistrationDate.substring(6)+"-"+tempRegistrationDate.substring(3,5)+"-"+tempRegistrationDate.substring(0,2));
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
    if(!EPEBDate.contains("_")){
      try{
        //  print("inside try");

        String tempEPEBDate = EPEBDate;
        print(tempEPEBDate);
        //  print(tempEPEBDate.substring(6)+"-"+tempEPEBDate.substring(3,5)+"-"+tempEPEBDate.substring(0,2));
        DateTime  formattedDate =  DateTime.parse(tempEPEBDate.substring(6)+"-"+tempEPEBDate.substring(3,5)+"-"+tempEPEBDate.substring(0,2));
        //   print(formattedDate);
        etempDay = formattedDate.day.toString();
        //   print(tempDay);
        etempMonth = formattedDate.month.toString();
        ////  print(tempMonth);
        etempYear = formattedDate.year.toString();
        //   print(tempYear);
        setState(() {

        });

      }catch(e){

        print("Exception Occupred");
      }
    }
    
    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.mtitle);
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.mhousebuilttype);
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.menvdescription);
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty);
    tempDropDownValues
        .add(CollateralsREMMasterState.collateralREMlandandhouseBean.msizeofproperty);
    for (int k = 0;
    k < globals.dropDownCaptionValuesCollateralREMlandandhouse.length;
    k++) {
      for (int i = 0;
      i < globals.dropDownCaptionValuesCollateralREMlandandhouse[k].length;
      i++) {
        if (globals.dropDownCaptionValuesCollateralREMlandandhouse[k][i].mcode ==
            tempDropDownValues[k]) {
          setValue(k, globals.dropDownCaptionValuesCollateralREMlandandhouse[k][i]);
        }
      }
    }
  }


  Future<Null> getSessionVariables() async {
    if(CollateralsREMMasterState.collateralREMlandandhouseBean
        .mcountry!=null) {
      await AppDatabase.get().getCountryNameViaCountryCode(CollateralsREMMasterState.collateralREMlandandhouseBean
          .mcountry).then((onValue){
        setState(() {
          if(onValue.countryName!=null){
            countryName = onValue.countryName;
          }

        });
      });
    }
    if(CollateralsREMMasterState.collateralREMlandandhouseBean.mstate!=null) {
      await AppDatabase.get().getStateNameViaStateCode(
          CollateralsREMMasterState.collateralREMlandandhouseBean.mstate).then((onValue){
        setState(() {
          if(onValue.stateDesc!=null){
            stateName = onValue.stateDesc;
          }

        });
      });
    }
    if(CollateralsREMMasterState.collateralREMlandandhouseBean.mdist!=null) {
      await AppDatabase.get().getDistrictNameViaDistrictCode(
          CollateralsREMMasterState.collateralREMlandandhouseBean.mdist.toString()).then((onValue){
        setState(() {
          if(onValue.distDesc!=null){
            districtName = onValue.distDesc;
          }

        });
      });
    }


    if(CollateralsREMMasterState.collateralREMlandandhouseBean.msubdist!=null) {
      await AppDatabase.get().getPlaceNameViaPlaceCode(
          CollateralsREMMasterState.collateralREMlandandhouseBean.msubdist).then((onValue){
        setState(() {
          if(onValue.placeCdDesc!=null){
            subDistrictName = onValue.placeCdDesc;
          }

        });
      });
    }
    if(CollateralsREMMasterState.collateralREMlandandhouseBean.marea!=null) {
      await AppDatabase.get().getAreaNameViaAreaCode(
          CollateralsREMMasterState.collateralREMlandandhouseBean.marea.toString()).then((onValue){
        setState(() {
          if(onValue.areaDesc!=null){
            areaName = onValue.areaDesc;
          }

        });
      });
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

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: <Widget>[
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
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new DropdownButtonFormField(
                    value:Title==null?null: Title,
                    items: generateDropDown(0),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 0);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('Title')),
                  ),),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(

                        hintText: Translations.of(context).text('EntrFrstnm'),
                        labelText: Translations.of(context).text('Frstnm'),
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
                      initialValue:
                      CollateralsREMMasterState.collateralREMlandandhouseBean.mfname!= null&&
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mfname!="null" ?
                      CollateralsREMMasterState.collateralREMlandandhouseBean.mfname: "",
                      onSaved: (val) => CollateralsREMMasterState.collateralREMlandandhouseBean.mfname= val,
                    )),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(

                      keyboardType: TextInputType.multiline,
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
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                      initialValue:  CollateralsREMMasterState.collateralREMlandandhouseBean.mmname!= null&&
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mmname!="null"
                          ? CollateralsREMMasterState.collateralREMlandandhouseBean.mmname
                          : "",
                      onSaved: (val) => CollateralsREMMasterState.collateralREMlandandhouseBean.mmname= val,
                    )),


                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(

                      keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(


                        hintText: Translations.of(context).text('Entrlstnm'),
                        labelText: Translations.of(context).text('Lstnm'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                      initialValue:  CollateralsREMMasterState.collateralREMlandandhouseBean.mlname!= null&&
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mlname!="null"
                          ? CollateralsREMMasterState.collateralREMlandandhouseBean.mlname
                          : "",
                      onSaved: (val) => CollateralsREMMasterState.collateralREMlandandhouseBean.mlname= val,
                    )),
                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text(Translations.of(context).text('AddDet'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
                  ),
                ),

                Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('AddrLine1Hint'),
                      labelText: Translations.of(context).text('AddrLine1'),
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

                    //inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
                    inputFormatters: [new LengthLimitingTextInputFormatter(149),globals.onlyAphaNumeric],
                    controller:CollateralsREMMasterState.collateralREMlandandhouseBean.maddress1 == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralsREMMasterState.collateralREMlandandhouseBean.maddress1),
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.maddress1= (val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),


                Container(
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
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
                            color: Colors.blue,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),

                    inputFormatters: [new LengthLimitingTextInputFormatter(149)],

                    controller:CollateralsREMMasterState.collateralREMlandandhouseBean.maddress2 == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralsREMMasterState.collateralREMlandandhouseBean.maddress2),
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.maddress2= (val);
                        }catch(e){

                        }
                      }

                    },
                  ),
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
                new ListTile(
                  title: new Text(Translations.of(context).text('Area')),
                  subtitle:
                  areaName== null || areaName== "null"
                      ? new Text("")
                      : new Text("${areaName}"),
                  onTap: () async {
                    getArea();
                  },
                ),

              /*  Container(
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter PO Box No here',
                      labelText: 'PO Box No ',
                      hintStyle: TextStyle(color: Colors.grey),
                      *//*labelStyle: TextStyle(color: Colors.grey),*//*
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
                    keyboardType: TextInputType.number,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mpoboxno != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mpoboxno.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(6),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mpoboxno = int.parse(val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),*/
                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text(Translations.of(context).text('PropDet'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
                  ),
                ),

               /* Container(
                  child: new DropdownButtonFormField(
                    value:HouseBuiltType==null?null: HouseBuiltType,
                    items: generateDropDown(1),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 1);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: "House Built Type (if House And Plot)"),
                  ),),

                Container(
                  child: new DropdownButtonFormField(
                    value:EnvDescription==null?null: EnvDescription,
                    items: generateDropDown(2),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 2);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: "Environment Description"),
                  ),),
*/
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new DropdownButtonFormField(
                    value:SizeOfProperty==null?null:SizeOfProperty,
                    items: generateDropDown(4),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 4);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('SzeOfrop')),
                  ),),
                Container(

                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrPltArhr'),
                      labelText: Translations.of(context).text('PltAr'),
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

                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mlotarea != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mlotarea.toString())
                        : TextEditingController(text: ""),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(6),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mlotarea = double.parse(val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),

                Container(

                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrFlrArahr'),
                      labelText: Translations.of(context).text('FlrAra'),
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
                    keyboardType: TextInputType.number,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mfloorarea != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mfloorarea .toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(6),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mfloorarea  = double.parse(val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),
                Container(
                  child: new DropdownButtonFormField(
                    value:DescOfProperty==null?null: DescOfProperty,
                    items: generateDropDown(3),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 3);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('DescProp')),
                  ),),
            //    Container(
               /*   color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Description Of Property',
                      labelText: 'Description Of Property',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
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
                    keyboardType: TextInputType.text,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyAphaNumeric
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mdescofproperty= val;
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),*/
             /*   Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text("Registration Details",style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
                  ),
                ),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter TCT No/CCT No here',
                      labelText: 'TCT No/CCT No',
                      hintStyle: TextStyle(color: Colors.grey),
                      *//*labelStyle: TextStyle(color: Colors.grey),*//*
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
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mtctno != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mtctno.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mtctno= int.parse(val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Serial Number here',
                      labelText: 'Serial Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      *//*labelStyle: TextStyle(color: Colors.grey),*//*
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
                    keyboardType: TextInputType.number,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.msrno != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.msrno.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.msrno= int.parse(val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text("Registration Date")],
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
                                hintText: "DD"
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
                                    registrationDate = registrationDate.replaceRange(0, 2, val);
                                    FocusScope.of(context).requestFocus(monthFocus);
                                  }
                                  else{
                                    registrationDate = registrationDate.replaceRange(0, 2, "0"+val);
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
                          focusNode: monthFocus,
                          controller: tempMonth == null?null:new TextEditingController(text: tempMonth),
                          onChanged: (val){
                            if(val!="0"){
                              tempMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  registrationDate = registrationDate.replaceRange(3, 5, val);
                                  FocusScope.of(context).requestFocus(yearFocus);
                                }
                                else{
                                  registrationDate = registrationDate.replaceRange(3, 5, "0"+val);
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
                      ),
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
                          focusNode: yearFocus,
                          controller: tempYear == null?null:new TextEditingController(text: tempYear),
                          onChanged: (val){
                            tempYear = val;
                            if(val.length==4) registrationDate = registrationDate.replaceRange(6, 10,val);
                          },
                        ),),
                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectDate(context);
                      })
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child: new Row(

                    children: <Widget>[Text("EPEB Date")],
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
                                hintText: "DD"
                            ),
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(2),
                              globals.onlyIntNumber
                            ],
                            controller: etempDay == null?null:new TextEditingController(text: etempDay),
                            keyboardType: TextInputType.numberWithOptions(),
                            onChanged: (val){
                              if(val!="0"){
                                etempDay = val;
                                if(int.parse(val)<=31&&int.parse(val)>0){



                                  if(val.length==2){
                                    EPEBDate = EPEBDate.replaceRange(0, 2, val);
                                    FocusScope.of(context).requestFocus(monthFocus);
                                  }
                                  else{
                                    EPEBDate = EPEBDate.replaceRange(0, 2, "0"+val);
                                  }
                                }
                                else {
                                  setState(() {
                                    etempDay ="";
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
                          focusNode: monthFocus,
                          controller: etempMonth == null?null:new TextEditingController(text: etempMonth),
                          onChanged: (val){
                            if(val!="0"){
                              etempMonth = val;
                              if(int.parse(val)<=12&&int.parse(val)>0){

                                if(val.length==2){
                                  EPEBDate = EPEBDate.replaceRange(3, 5, val);
                                  FocusScope.of(context).requestFocus(yearFocus);
                                }
                                else{
                                  EPEBDate = EPEBDate.replaceRange(3, 5, "0"+val);
                                }
                              }
                              else {
                                setState(() {
                                  etempMonth ="";
                                });
                              }
                            }
                          },
                        ),
                      ),
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
                          focusNode: yearFocus,
                          controller: etempYear == null?null:new TextEditingController(text: etempYear),
                          onChanged: (val){
                            etempYear = val;
                            if(val.length==4) EPEBDate = EPEBDate.replaceRange(6, 10,val);
                          },
                        ),),
                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(icon: Icon(Icons.calendar_today), onPressed:(){
                        _selectDateE(context);
                      })
                    ],
                  ),
                ),*/

              /*  Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Restriction Code/Remarks here',
                      labelText: 'Restriction Code/Remarks',
                      hintStyle: TextStyle(color: Colors.grey),
                      *//*labelStyle: TextStyle(color: Colors.grey),*//*
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
                    keyboardType: TextInputType.text,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mrescodeorremark != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mrescodeorremark.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyAphaNumeric
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mrescodeorremark= (val);
                        }catch(e){
                        }
                      }
                    },
                  ),
                ),

                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter EPEB Number here',
                      labelText: 'EPEB Number',
                      hintStyle: TextStyle(color: Colors.grey),

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
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mepebno != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mepebno.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mepebno= int.parse(val);
                        }catch(e){
                        }
                      }
                    },
                  ),
                ),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Registration of Deeds Location here',
                      labelText: 'Registration of Deeds Location',
                      hintStyle: TextStyle(color: Colors.grey),

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
                    keyboardType: TextInputType.text,
                    controller: CollateralsREMMasterState.collateralREMlandandhouseBean.mregofdeedslocation != null
                        ? TextEditingController(text: CollateralsREMMasterState.collateralREMlandandhouseBean.mregofdeedslocation.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      globals.onlyAphaNumeric
                    ],
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralsREMMasterState.collateralREMlandandhouseBean.mregofdeedslocation= val;
                        }catch(e){
                        }
                      }
                    },
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );

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
      CollateralsREMMasterState.collateralREMlandandhouseBean.mcountry = tempContrybean.cntryCd;
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
      CollateralsREMMasterState.collateralREMlandandhouseBean.mstate = tempStateBean.stateCd;
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
      CollateralsREMMasterState.collateralREMlandandhouseBean.mdist = tempDistrictBean.distCd.toString();
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
      CollateralsREMMasterState.collateralREMlandandhouseBean.msubdist = tempSubDistrictBean.placeCd;
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
      CollateralsREMMasterState.collateralREMlandandhouseBean.marea = tempAreaDistrict.areaCd.toString();
      AppDatabase.get().getAreaNameViaAreaCode(
          tempAreaDistrict.areaCd.toString()).then((onValue) {
        areaName = onValue.areaDesc;

      });
    }
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CollateralsREMMasterState.collateralREMlandandhouseBean.mregdate)
      setState(() {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mregdate= picked;
        tempDate = formatter.format(picked);
        if(picked.day.toString().length==1){
          tempDay = "0"+picked.day.toString();

        }
        else tempDay = picked.day.toString();
        registrationDate = registrationDate.replaceRange(0, 2, tempDay);
        tempYear = picked.year.toString();
        registrationDate = registrationDate.replaceRange(6, 10,tempYear);
        if(picked.month.toString().length==1){
          tempMonth = "0"+picked.month.toString();
        }
        else
          tempMonth = picked.month.toString();
        registrationDate = registrationDate.replaceRange(3, 5, tempMonth);

      });
  }

  Future<Null> _selectDateE(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != CollateralsREMMasterState.collateralREMlandandhouseBean.mepebdate)
      setState(() {
        CollateralsREMMasterState.collateralREMlandandhouseBean.mepebdate= picked;
        etempDate = formatter.format(picked);
        if(picked.day.toString().length==1){
          etempDay = "0"+picked.day.toString();

        }
        else etempDay = picked.day.toString();
        EPEBDate = EPEBDate.replaceRange(0, 2, etempDay);
        etempYear = picked.year.toString();
        EPEBDate = EPEBDate.replaceRange(6, 10,etempYear);
        if(picked.month.toString().length==1){
          etempMonth = "0"+picked.month.toString();
        }
        else
          etempMonth = picked.month.toString();
        EPEBDate = EPEBDate.replaceRange(3, 5, etempMonth);

      });
  }


}


