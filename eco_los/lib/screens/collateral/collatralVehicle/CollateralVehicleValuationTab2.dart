import 'dart:async';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
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


class CollateralVehicleValuation2 extends StatefulWidget {
  CollateralVehicleValuation2();

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleValuation2State createState() =>
      new _CollateralVehicleValuation2State();
}

class _CollateralVehicleValuation2State
    extends State<CollateralVehicleValuation2> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData PMirror;
  LookupBeanData PDoor;
  LookupBeanData PBackMirror;
  LookupBeanData PColorOrSpot;
  LookupBeanData FTColorAndSpot;
  LookupBeanData FTTireAndYan;
  LookupBeanData FTCap;
  LookupBeanData FTSplatterCap;
  LookupBeanData BPMirror;
  LookupBeanData BPDoor;
  LookupBeanData BPColorAndSpot;
  LookupBeanData BTColorAndSport;
  LookupBeanData BTTireAndYan;
  LookupBeanData BTCap;


  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          PMirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mpmirror= blankBean.mcode;
          break;
        case 1:
          PDoor = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mpdoor = blankBean.mcode;
          break;
        case 2:
          PBackMirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mpbackmirror= blankBean.mcode;
          break;
        case 3:
          PColorOrSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mpcolororspot = blankBean.mcode;
          break;
        case 4:
          FTColorAndSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mftcolorandspot =blankBean.mcode;
          break;
        case 5:
          FTTireAndYan = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mfttanandyan =blankBean.mcode;
          break;
        case 6:
          FTCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mftcap = blankBean.mcode;
          break;
        case 7:
          FTSplatterCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mftsplattercap = blankBean.mcode;
          break;
        case 8:
          BPMirror = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbpmirror = blankBean.mcode;
          break;
        case 9:
          BPDoor = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbpdoor = blankBean.mcode;
          break;
        case 10:
          BPColorAndSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbpcolorandspot = blankBean.mcode;
          break;
        case 11:
          BTColorAndSport = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtcolorandsport = blankBean.mcode;
          break;
        case 12:
          BTTireAndYan = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbttanandyan = blankBean.mcode;
          break;
        case 13:
          BTCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtcap = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollateralVehicleValuation2[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollateralVehicleValuation2[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollateralVehicleValuation2[no][k]);
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
          PMirror = value;
          CollateralVehicleMasterState.collateralVehicleBean.mpmirror = value.mcode;

          break;
        case 1:
          PDoor = value;
          CollateralVehicleMasterState.collateralVehicleBean.mpdoor = value.mcode;
          break;
        case 2:
          PBackMirror = value;
          CollateralVehicleMasterState.collateralVehicleBean.mpbackmirror = value.mcode;
          break;
        case 3:
          PColorOrSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mpcolororspot = value.mcode;
          break;
        case 4:
          FTColorAndSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mftcolorandspot = value.mcode;
          break;
        case 5:
          FTTireAndYan = value;
          CollateralVehicleMasterState.collateralVehicleBean.mfttanandyan = value.mcode;
          break;
        case 6:
          FTCap = value;
          print(value);
          CollateralVehicleMasterState.collateralVehicleBean.mftcap = value.mcode;
          break;
        case 7:
          FTSplatterCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mftsplattercap = value.mcode;
          break;
        case 8:
          BPMirror = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbpmirror = value.mcode;
          break;
        case 9:
          BPDoor = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbpdoor = value.mcode;
          break;
        case 10:
          BPColorAndSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbpcolorandspot =value.mcode;
          break;
        case 11:
          BTColorAndSport = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtcolorandsport = value.mcode;
          break;
        case 12:
          BTTireAndYan = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbttanandyan = value.mcode;
          break;
        case 13:
          BTCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtcap = value.mcode;
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
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation2[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollateralVehicleValuation2[no][k]);
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
        .add(CollateralVehicleMasterState.collateralVehicleBean.mpmirror);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mpdoor);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mpbackmirror);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mpcolororspot);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mftcolorandspot);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mfttanandyan);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mftcap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mftsplattercap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbpmirror);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbpdoor);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbpcolorandspot);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtcolorandsport);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbttanandyan);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtcap);




    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation2.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesCollateralVehicleValuation2[k].length;
      i++) {


        try{
          if (globals.dropdownCaptionsValuesCollateralVehicleValuation2[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesCollateralVehicleValuation2[k][i]);
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

              children: <Widget>[Text(Translations.of(context).text('PrtOfFrstPass'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
            child: new DropdownButtonFormField(
              value:PMirror==null?null: PMirror,
              items: generateDropDown(0),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 0);
              },
              validator: (args) {
                print(args);
              },
              decoration: InputDecoration(labelText: Translations.of(context).text('MrrClseOpn')),
            ),),
          Container(
              child:
              new DropdownButtonFormField(
                value:PDoor==null?null: PDoor,
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
                value:PBackMirror==null?null: PBackMirror,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('bckmir')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:PColorOrSpot==null?null: PColorOrSpot,
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

              children: <Widget>[Text(Translations.of(context).text('PrtTrRghtSd'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:FTColorAndSpot==null?null: FTColorAndSpot,
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
                value:FTTireAndYan==null?null: FTTireAndYan,
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
                value:FTCap==null?null: FTCap,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('cap')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:FTSplatterCap==null?null: FTSplatterCap,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('SplttrCp')),
              )),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('BackPassrghtsde'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),

          Container(
              child:
              new DropdownButtonFormField(
                value:BPMirror==null?null: BPMirror,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('MrrClseOpn')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BPDoor==null?null: BPDoor,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('DrClseOpn')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BPColorAndSpot==null?null: BPColorAndSpot,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ClrAndSpt')),
              )),

          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('PrtOfBckTrrghtsde'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:BTColorAndSport==null?null: BTColorAndSport,
                items: generateDropDown(11),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 11);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ClrAndSpt')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BTTireAndYan==null?null: BTTireAndYan,
                items: generateDropDown(12),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 12);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('TreAndYn')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BTCap==null?null: BTCap,
                items: generateDropDown(13),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 13);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('cap')),
              )),






        ],
      ),
    );
  }








}


