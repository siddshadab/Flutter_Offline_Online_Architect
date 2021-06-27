import 'dart:async';
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
import 'CollateralVehicleMaster.dart';



class CollateralVehicleValuation3 extends StatefulWidget {
  CollateralVehicleValuation3();

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleValuation3State createState() =>
      new _CollateralVehicleValuation3State();
}

class _CollateralVehicleValuation3State
    extends State<CollateralVehicleValuation3> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData BcBackLightR;
  LookupBeanData BcTurnSignal;
  LookupBeanData BcMessageSignal;
  LookupBeanData BcSignal;
  LookupBeanData BcBackLightL;
  LookupBeanData BcBackDoor;
  LookupBeanData BcCranes;
  LookupBeanData BcTaKeLock;
  LookupBeanData BcHoldLock;
  LookupBeanData BcHandCranes;
  LookupBeanData BcReserveTire;
  LookupBeanData BcBackMirror;
  LookupBeanData BcAntenna;

  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          BcBackLightR = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightr= blankBean.mcode;
          break;
        case 1:
          BcTurnSignal = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcturnsignal = blankBean.mcode;
          break;
        case 2:
          BcMessageSignal = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcmessagesignal= blankBean.mcode;
          break;
        case 3:
          BcSignal = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcsignal = blankBean.mcode;
          break;
        case 4:
          BcBackLightL = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightl =blankBean.mcode;
          break;
        case 5:
          BcBackDoor = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbackdoor =blankBean.mcode;
          break;
        case 6:
          BcCranes = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbccranes = blankBean.mcode;
          break;
        case 7:
          BcTaKeLock = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbctakelock = blankBean.mcode;
          break;
        case 8:
          BcHoldLock = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcholdlock = blankBean.mcode;
          break;
        case 9:
          BcHandCranes = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbchandcranes = blankBean.mcode;
          break;
        case 10:
          BcReserveTire = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcreservetire = blankBean.mcode;
          break;
        case 11:
          BcBackMirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbackmirror = blankBean.mcode;
          break;
        case 12:
          BcAntenna = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbcantenna = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollateralVehicleValuation3[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollateralVehicleValuation3[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollateralVehicleValuation3[no][k]);
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
          BcBackLightR = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightr = value.mcode;

          break;
        case 1:
          BcTurnSignal = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcturnsignal = value.mcode;
          break;
        case 2:
          BcMessageSignal = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcmessagesignal = value.mcode;
          break;
        case 3:
          BcSignal = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcsignal = value.mcode;
          break;
        case 4:
          BcBackLightL = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightl = value.mcode;
          break;
        case 5:
          BcBackDoor = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbackdoor = value.mcode;
          break;
        case 6:
          BcCranes = value;
          print(value);
          CollateralVehicleMasterState.collateralVehicleBean.mbccranes = value.mcode;
          break;
        case 7:
          BcTaKeLock = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbctakelock = value.mcode;
          break;
        case 8:
          BcHoldLock = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcholdlock = value.mcode;
          break;
        case 9:
          BcHandCranes = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbchandcranes = value.mcode;
          break;
        case 10:
          BcReserveTire = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcreservetire =value.mcode;
          break;
        case 11:
          BcBackMirror = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcbackmirror = value.mcode;
          break;
        case 12:
          BcAntenna = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbcantenna = value.mcode;
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
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation3[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollateralVehicleValuation3[no][k]);
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




    // TODO: implement initState
    super.initState();
    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightr);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbcturnsignal);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbcmessagesignal);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbcsignal);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbcbacklightl);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbcbackdoor);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbccranes);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbctakelock);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbcholdlock);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbchandcranes);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbcreservetire);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbcbackmirror);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbcantenna);

    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation3.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesCollateralVehicleValuation3[k].length;
      i++) {


        try{
          if (globals.dropdownCaptionsValuesCollateralVehicleValuation3[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesCollateralVehicleValuation3[k][i]);
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

              children: <Widget>[Text("Back Car",style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
            child: new DropdownButtonFormField(
            value:BcBackLightR==null?null: BcBackLightR,
            items: generateDropDown(0),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 0);
            },
            validator: (args) {
              print(args);
            },
            decoration: InputDecoration(labelText: Translations.of(context).text('BckLghtrghtsde')),
          ),),
          Container(
              child:
          new DropdownButtonFormField(
            value:BcTurnSignal==null?null: BcTurnSignal,
            items: generateDropDown(1),
            onChanged: (LookupBeanData newValue) {
              showDropDown(newValue, 1);
            },
            validator: (args) {
              print(args);
            },
            decoration: InputDecoration(labelText: Translations.of(context).text('TrnSgnl')),
          )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcMessageSignal==null?null: BcMessageSignal,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('MsgSgnl')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcSignal==null?null: BcSignal,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('Sgnl')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcBackLightL==null?null: BcBackLightL,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('BckLghtLftsde')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcBackDoor==null?null: BcBackDoor,
                items: generateDropDown(5),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 5);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('BckDr')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcCranes==null?null: BcCranes,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('cranes')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcTaKeLock==null?null: BcTaKeLock,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('TaKeLck')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcHoldLock==null?null: BcHoldLock,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('HldLck')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcHandCranes==null?null: BcHandCranes,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('HndCrns')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcReserveTire==null?null: BcReserveTire,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('RsrveTre')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:BcBackMirror==null?null: BcBackMirror,
                items: generateDropDown(11),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 11);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('bckmir')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BcAntenna==null?null: BcAntenna,
                items: generateDropDown(12),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 12);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('antenna')),
              )),







        ],
      ),
    );
  }








}


