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



class CollateralVehicleValuation4 extends StatefulWidget {
  CollateralVehicleValuation4();

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleValuation4State createState() =>
      new _CollateralVehicleValuation4State();
}

class _CollateralVehicleValuation4State
    extends State<CollateralVehicleValuation4> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List testString = new List();



  LookupBeanData BtlColorOrSpot;
  LookupBeanData BtlTanAndYan;
  LookupBeanData BtlCap;
  LookupBeanData BtlSplatterCap;
  LookupBeanData BtrColorOrSpot;
  LookupBeanData BtrTireAndYan;
  LookupBeanData BtrCap;
  LookupBeanData BtrSplatterCap;
  LookupBeanData IBarSun;
  LookupBeanData IDescriptionBook;
  LookupBeanData IAutoSystem;
  LookupBeanData IAirConditioner;
  LookupBeanData IMirrorRemote;
  LookupBeanData ISafeBell;
  LookupBeanData IMiddleBox;

  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          BtlColorOrSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlcolororspot= blankBean.mcode;
          break;
        case 1:
          BtlTanAndYan = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtltanandyan = blankBean.mcode;
          break;

        case 2:
          BtlCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlcap = blankBean.mcode;
          break;
        case 3:
          BtlSplatterCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlsplattercap =blankBean.mcode;
          break;
        case 4:
          BtrColorOrSpot = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrcolororspot =blankBean.mcode;
          break;
        case 5:
          BtrTireAndYan = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrtireandyan = blankBean.mcode;
          break;
        case 6:
          BtrCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrcap = blankBean.mcode;
          break;
        case 7:
          BtrSplatterCap = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrsplattercap = blankBean.mcode;
          break;
        case 8:
          IBarSun = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mibarsun = blankBean.mcode;
          break;
        case 9:
          IDescriptionBook = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.midescriptionbook = blankBean.mcode;
          break;
        case 10:
          IAutoSystem = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.miautosystem = blankBean.mcode;
          break;
        case 11:
          IAirConditioner = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.miairconditioner = blankBean.mcode;
          break;
        case 12:
          IMirrorRemote = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mimirrorremote = blankBean.mcode;
          break;
        case 13:
          ISafeBell = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.misafebell = blankBean.mcode;
          break;
        case 14:
          IMiddleBox = blankBean;
          CollateralVehicleMasterState.collateralVehicleBean.mimiddlebox= blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollateralVehicleValuation4[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollateralVehicleValuation4[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollateralVehicleValuation4[no][k]);
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
          BtlColorOrSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlcolororspot = value.mcode;

          break;
        case 1:
          BtlTanAndYan = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtltanandyan = value.mcode;
          break;

        case 2:
          BtlCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlcap = value.mcode;
          break;
        case 3:
          BtlSplatterCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtlsplattercap = value.mcode;
          break;
        case 4:
          BtrColorOrSpot = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrcolororspot = value.mcode;
          break;
        case 5:
          BtrTireAndYan = value;
          print(value);
          CollateralVehicleMasterState.collateralVehicleBean.mbtrtireandyan = value.mcode;
          break;
        case 6:
          BtrCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrcap = value.mcode;
          break;
        case 7:
          BtrSplatterCap = value;
          CollateralVehicleMasterState.collateralVehicleBean.mbtrsplattercap = value.mcode;
          break;
        case 8:
          IBarSun = value;
          CollateralVehicleMasterState.collateralVehicleBean.mibarsun = value.mcode;
          break;
        case 9:
          IDescriptionBook = value;
          CollateralVehicleMasterState.collateralVehicleBean.midescriptionbook =value.mcode;
          break;
        case 10:
          IAutoSystem = value;
          CollateralVehicleMasterState.collateralVehicleBean.miautosystem = value.mcode;
          break;
        case 11:
          IAirConditioner = value;
          CollateralVehicleMasterState.collateralVehicleBean.miairconditioner = value.mcode;
          break;
        case 12:
          IMirrorRemote = value;
          CollateralVehicleMasterState.collateralVehicleBean.mimirrorremote = value.mcode;
          break;
        case 13:
          ISafeBell = value;
          CollateralVehicleMasterState.collateralVehicleBean.misafebell = value.mcode;
          break;
        case 14:
          IMiddleBox = value;
          CollateralVehicleMasterState.collateralVehicleBean.mimiddlebox = value.mcode;
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
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation4[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollateralVehicleValuation4[no][k]);
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
    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbtlcolororspot);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbtltanandyan);

    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbtlcap);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mbtlsplattercap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtrcolororspot);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtrtireandyan);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtrcap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mbtrsplattercap);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mibarsun);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.midescriptionbook);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.miautosystem);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.miairconditioner);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.mimirrorremote);
    tempDropDownValues.add(CollateralVehicleMasterState.collateralVehicleBean.misafebell);
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mimiddlebox);




    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralVehicleValuation4.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesCollateralVehicleValuation4[k].length;
      i++) {


        try{
          if (globals.dropdownCaptionsValuesCollateralVehicleValuation4[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesCollateralVehicleValuation4[k][i]);
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

              children: <Widget>[Text(Translations.of(context).text('PrtOfBckTre'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
            child: new DropdownButtonFormField(
              value:BtlColorOrSpot==null?null: BtlColorOrSpot,
              items: generateDropDown(0),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 0);
              },
              validator: (args) {
                print(args);
              },
              decoration: InputDecoration(labelText: Translations.of(context).text('ClrSpt')),
            ),),
          Container(
              child:
              new DropdownButtonFormField(
                value:BtlTanAndYan==null?null: BtlTanAndYan,
                items: generateDropDown(1),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 1);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('TreAndYn')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:BtlCap==null?null: BtlCap,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('cap')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:BtlSplatterCap==null?null: BtlSplatterCap,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);
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

              children: <Widget>[Text(Translations.of(context).text('PrtOfBckTrrghtsde'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:BtrColorOrSpot==null?null: BtrColorOrSpot,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ClrSpt')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:BtrTireAndYan==null?null: BtrTireAndYan,
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
                value:BtrCap==null?null: BtrCap,
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
                value:BtrSplatterCap==null?null: BtrSplatterCap,
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

              children: <Widget>[Text(Translations.of(context).text('InsdThCr'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          Container(
              child:
              new DropdownButtonFormField(
                value:IBarSun==null?null: IBarSun,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('BrSn')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:IDescriptionBook==null?null: IDescriptionBook,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('DescBk')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:IAutoSystem==null?null: IAutoSystem,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('AtSys')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:IAirConditioner==null?null: IAirConditioner,
                items: generateDropDown(11),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 11);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('AC')),
              )),
          Container(
              child:
              new DropdownButtonFormField(
                value:IMirrorRemote==null?null: IMirrorRemote,
                items: generateDropDown(12),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 12);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('MirRmteelect')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:ISafeBell==null?null: ISafeBell,
                items: generateDropDown(13),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 13);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('SfBll')),
              )),

          Container(
              child:
              new DropdownButtonFormField(
                value:IMiddleBox==null?null: IMiddleBox,
                items: generateDropDown(14),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 14);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('MdlBx')),
              )),


        ],
      ),
    );
  }








}


