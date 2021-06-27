import 'dart:async';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class CollateralVehicleValuation extends StatefulWidget {
  CollateralVehicleValuation();

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleValuationState createState() =>
      new _CollateralVehicleValuationState();
}

class _CollateralVehicleValuationState
    extends State<CollateralVehicleValuation> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData Mirror;
  LookupBeanData Door;
  LookupBeanData MirrorBackLock;
  LookupBeanData ColorOrSpot;
  LookupBeanData ColorAndSpot;
  LookupBeanData TireAndYan;
  LookupBeanData CapOfSpllater;
  LookupBeanData HeadMirror;
  LookupBeanData HeadVent;
  LookupBeanData HeadLightFarL;
  LookupBeanData HeadLightFarR;
  LookupBeanData HeadSignal;
  LookupBeanData HeadWinCap;
  LookupBeanData HeadHeadCap;

  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          Mirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mdmirror= blankBean.mcode;
          break;
        case 1:
          Door = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mddoor = blankBean.mcode;
          break;
        case 2:
          MirrorBackLock = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mdmirrorbacklock= blankBean.mcode;
          break;
        case 3:
          ColorOrSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mdcolororspot = blankBean.mcode;
          break;
        case 4:
          ColorAndSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mfcolorandspot =blankBean.mcode;
          break;
        case 5:
          TireAndYan = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mftireandyan =blankBean.mcode;
          break;
        case 6:
          CapOfSpllater = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mfcapofsplatter = blankBean.mcode;
          break;
        case 7:
          HeadMirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhmirror = blankBean.mcode;
          break;
        case 8:
          HeadVent = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhvent = blankBean.mcode;
          break;
        case 9:
          HeadLightFarL = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhlightfarl = blankBean.mcode;
          break;
        case 10:
          HeadLightFarR = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhlightfarr = blankBean.mcode;
          break;
        case 11:
          HeadSignal = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhsignal = blankBean.mcode;
          break;
        case 12:
          HeadWinCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhwincap = blankBean.mcode;
          break;
        case 13:
          HeadHeadCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mhheadcap = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollateralVehicleValuation1[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollateralVehicleValuation1[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollateralVehicleValuation1[no][k]);
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

      switch (no) {
        case 0:
          Mirror = value;
          CollateralVehicleMasterState.collateralVehicleBean.mdmirror = value.mcode;

          break;
        case 1:
          Door = value;
          CollateralVehicleMasterState.collateralVehicleBean.mddoor = value.mcode;
          break;
        case 2:
          MirrorBackLock = value;
          CollateralVehicleMasterState.collateralVehicleBean.mdmirrorbacklock = value.mcode;
          break;
        case 3:
          ColorOrSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mdcolororspot = value.mcode;
          break;
        case 4:
          ColorAndSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mfcolorandspot = value.mcode;
          break;
        case 5:
          TireAndYan = value;
          CollateralVehicleMasterState.collateralVehicleBean.mftireandyan = value.mcode;
          break;
        case 6:
          CapOfSpllater = value;
          CollateralVehicleMasterState.collateralVehicleBean.mfcapofsplatter = value.mcode;
          break;
        case 7:
          HeadMirror = value;

          CollateralVehicleMasterState.collateralVehicleBean.mhmirror = value.mcode;
          break;
        case 8:
          HeadVent = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhvent = value.mcode;
          break;
        case 9:
          HeadLightFarL = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhlightfarl = value.mcode;
          break;
        case 10:
          HeadLightFarR = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhlightfarr = value.mcode;
          break;
        case 11:
          HeadSignal = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhsignal =value.mcode;
          break;
        case 12:
          HeadWinCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhwincap = value.mcode;
          break;
        case 13:
          HeadHeadCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mhheadcap = value.mcode;
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
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation1[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollateralVehicleValuation1[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {

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




    // TODO: implement initState
    super.initState();
    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mdmirror);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mddoor);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mdmirrorbacklock);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mdcolororspot);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mfcolorandspot);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mftireandyan);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mfcapofsplatter);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhmirror);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhvent);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhlightfarl);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhlightfarr);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhsignal);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhwincap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mhheadcap);




    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation1.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesCollateralVehicleValuation1[k].length;
      i++) {


        try{
          if (globals.dropdownCaptionsValuesCollateralVehicleValuation1[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {


            setValue(k, globals.dropdownCaptionsValuesCollateralVehicleValuation1[k][i]);
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
        padding:  EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text("Driver Part",style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
            child: new DropdownButtonFormField(
            value:Mirror==null?null: Mirror,
            items: generateDropDown(0),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 0);
            },
            validator: (args) {

            },
            decoration: InputDecoration(labelText: Translations.of(context).text('MrrClseOpn')),
          ),),
          Container(
              child:
          new DropdownButtonFormField(
            value:Door==null?null: Door,
            items: generateDropDown(1),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 1);
            },
            validator: (args) {
              print(args);
            },
            decoration: InputDecoration(labelText: Translations.of(context).text('DrClseOpn')),
          )),
          Container(
              child:
              new DropdownButtonFormField(
                value:MirrorBackLock==null?null: MirrorBackLock,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('MrBckLck')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:ColorOrSpot==null?null: ColorOrSpot,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ClrSpt')),
              )),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('InFrntCrRghtSde'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:ColorAndSpot==null?null: ColorAndSpot,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ClrAndSpt')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:TireAndYan==null?null: TireAndYan,
                items: generateDropDown(5),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 5);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('TreAndYn')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:CapOfSpllater==null?null: CapOfSpllater,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('CpOfSplltr')),
              )),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('HadOfCr'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadMirror==null?null: HeadMirror,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('mirror')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadVent==null?null: HeadVent,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('vent')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadLightFarL==null?null: HeadLightFarL,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('LghtFarleft')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadLightFarR==null?null: HeadLightFarR,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('LghtFrrght')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadSignal==null?null: HeadSignal,
                items: generateDropDown(11),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 11);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('signal')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadWinCap==null?null: HeadWinCap,
                items: generateDropDown(12),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 12);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('WnCp')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:HeadHeadCap==null?null: HeadHeadCap,
                items: generateDropDown(13),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 13);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('HdCp')),
              )),
        ],
      ),
    );
  }








}


