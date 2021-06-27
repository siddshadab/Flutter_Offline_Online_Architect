import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class CollateralVehicleOrignalOwner extends StatefulWidget {
  CollateralVehicleOrignalOwner({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleOrignalOwnerState createState() =>
      new _CollateralVehicleOrignalOwnerState();
}

class _CollateralVehicleOrignalOwnerState
    extends State<CollateralVehicleOrignalOwner> {
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
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
    getSessionVariables();
    if(CollateralVehicleMasterState.collateralVehicleBean==null){
      CollateralVehicleMasterState.collateralVehicleBean= new CollateralVehicleBean();
    }else{
      setValuesOnCode();
    }
  }

  Future<Null> getSessionVariables() async {
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
                    child:
                    new TextFormField(
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(

                        hintText: Translations.of(context).text('EntrCompBus'),
                        labelText: Translations.of(context).text('CompanyNameOrBuss'),
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
                      initialValue:
                      CollateralVehicleMasterState.collateralVehicleBean.mbusinessname!= null&&
                          CollateralVehicleMasterState.collateralVehicleBean.mbusinessname!="null" ?
                      CollateralVehicleMasterState.collateralVehicleBean.mbusinessname: "",
                      onSaved: (val) => CollateralVehicleMasterState.collateralVehicleBean.mbusinessname= val,
                    )),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(

                      keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(


                        hintText: Translations.of(context).text('EntrOwnrNm'),
                        labelText: Translations.of(context).text('OwnrNme'),
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
                      initialValue:  CollateralVehicleMasterState.collateralVehicleBean.mownername!= null&&
                          CollateralVehicleMasterState.collateralVehicleBean.mownername!="null"
                          ? CollateralVehicleMasterState.collateralVehicleBean.mownername
                          : "",
                      onSaved: (val) => CollateralVehicleMasterState.collateralVehicleBean.mownername= val,
                    )),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrMobNohr'),
                      labelText: Translations.of(context).text('mobileno'),
                      prefixText: "+855",
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
                    controller: CollateralVehicleMasterState.collateralVehicleBean.mtel != null
                        ? TextEditingController(text: CollateralVehicleMasterState.collateralVehicleBean.mtel)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(10),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CollateralVehicleMasterState.collateralVehicleBean.mtel = val;
                      // }
                    },
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

                    //inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],

                    controller:CollateralVehicleMasterState.collateralVehicleBean.maddress1 == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralVehicleMasterState.collateralVehicleBean.maddress1),
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralVehicleMasterState.collateralVehicleBean.maddress1= (val);
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

                    inputFormatters: [new LengthLimitingTextInputFormatter(35)],

                    controller:CollateralVehicleMasterState.collateralVehicleBean.maddress2 == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralVehicleMasterState.collateralVehicleBean.maddress2),
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralVehicleMasterState.collateralVehicleBean.maddress2= (val);
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
            Container(
              color: Constant.mandatoryColor,
              child:
                new ListTile(
                  title: new Text(Translations.of(context).text('Area')),
                  subtitle:
                  areaName== null || areaName== "null"
                      ? new Text("")
                      : new Text("${areaName}"),
                  onTap: () async {
                    getArea();
                  },
                ),),





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
      CollateralVehicleMasterState.collateralVehicleBean.mcountry = tempContrybean.cntryCd;
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
      CollateralVehicleMasterState.collateralVehicleBean.mstate = tempStateBean.stateCd;
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
      CollateralVehicleMasterState.collateralVehicleBean.mdist = tempDistrictBean.distCd.toString();
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
      CollateralVehicleMasterState.collateralVehicleBean.msubdist = tempSubDistrictBean.placeCd;
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
      CollateralVehicleMasterState.collateralVehicleBean.marea = tempAreaDistrict.areaCd.toString();
      AppDatabase.get().getAreaNameViaAreaCode(
          tempAreaDistrict.areaCd.toString()).then((onValue) {
        areaName = onValue.areaDesc;

      });
    }
  }

  void setValuesOnCode() async{
    if(CollateralVehicleMasterState.collateralVehicleBean
        .mcountry!=null) {
      await AppDatabase.get().getCountryNameViaCountryCode(CollateralVehicleMasterState.collateralVehicleBean
          .mcountry).then((onValue){
        setState(() {
          if(onValue.countryName!=null){
            countryName = onValue.countryName;
          }

        });
      });
    }
    if(CollateralVehicleMasterState.collateralVehicleBean.mstate!=null) {
      await AppDatabase.get().getStateNameViaStateCode(
          CollateralVehicleMasterState.collateralVehicleBean.mstate).then((onValue){
        setState(() {
          if(onValue.stateDesc!=null){
            stateName = onValue.stateDesc;
          }

        });
      });
    }
    if(CollateralVehicleMasterState.collateralVehicleBean.mdist!=null) {
      await AppDatabase.get().getDistrictNameViaDistrictCode(
          CollateralVehicleMasterState.collateralVehicleBean.mdist.toString()).then((onValue){
        setState(() {
          if(onValue.distDesc!=null){
            districtName = onValue.distDesc;
          }

        });
      });
    }


    if(CollateralVehicleMasterState.collateralVehicleBean.msubdist!=null) {
      await AppDatabase.get().getPlaceNameViaPlaceCode(
          CollateralVehicleMasterState.collateralVehicleBean.msubdist).then((onValue){
        setState(() {
          if(onValue.placeCdDesc!=null){
            subDistrictName = onValue.placeCdDesc;
          }

        });
      });
    }
    if(CollateralVehicleMasterState.collateralVehicleBean.marea!=null) {
      await AppDatabase.get().getAreaNameViaAreaCode(
          CollateralVehicleMasterState.collateralVehicleBean.marea.toString()).then((onValue){
        setState(() {
          if(onValue.areaDesc!=null){
            areaName = onValue.areaDesc;
          }

        });
      });
    }
  }
}


