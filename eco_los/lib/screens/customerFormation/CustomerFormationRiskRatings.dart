


import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'CustomerFormationMasterTabs.dart';
import 'bean/RiskRatingsBean.dart';


class CustomerFormationRiskRatings extends StatefulWidget {
  CustomerFormationRiskRatings();

  @override
  _CustomerFormationRiskRatingsState createState() =>
      new _CustomerFormationRiskRatingsState();
}

class _CustomerFormationRiskRatingsState
    extends State<CustomerFormationRiskRatings> {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  LookupBeanData mcountryrisk;
  LookupBeanData mvisaperiod;
  LookupBeanData mvisavalid;
  LookupBeanData mvisatype;
  LookupBeanData mnatureofbuss;
  LookupBeanData mhwwsacctopn;
  LookupBeanData mnetwrth;
  LookupBeanData mexpectedvalue;
  LookupBeanData mnooftransmnthly;
  LookupBeanData mhighnetwrth;
  LookupBeanData mprcdservrskque1;

  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);

  showDropDown(LookupBeanData selectedObj, int no) {
    if(selectedObj.mcodedesc.isEmpty){
      print("inside code Desc is null");
      switch (no) {
        case 0:
          mcountryrisk = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mcountryrisk= blankBean.mcode;
          break;
        case 1:
          mvisaperiod = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisaperiod = blankBean.mcode;
          break;
        case 2:
          mvisavalid = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisavalid= blankBean.mcode;
          break;
        case 3:
          mvisatype = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisatype = blankBean.mcode;
          break;
        case 4:
          mnatureofbuss = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnatureofbuss =blankBean.mcode;
          break;
        case 5:
          mhwwsacctopn = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhwwsacctopn =blankBean.mcode;
          break;
        case 6:
          mnetwrth = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnetwrth = blankBean.mcode;
          break;
        case 7:
          mexpectedvalue = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mexpectedvalue = blankBean.mcode;
          break;
        case 8:
          mnooftransmnthly = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnooftransmnthly = blankBean.mcode;
          break;
        case 9:
          mhighnetwrth = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhighnetwrth = blankBean.mcode;
          break;
        case 10:
          mprcdservrskque1 = blankBean;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mprcdservrskque1 = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesRiskRatings[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesRiskRatings[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesRiskRatings[no][k]);
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
          mcountryrisk = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mcountryrisk = value.mcode;
          break;
        case 1:
          mvisaperiod = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisaperiod = value.mcode;
          break;
        case 2:
          mvisavalid = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisavalid = value.mcode;
          break;
        case 3:
          mvisatype = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisatype = value.mcode;
          break;
        case 4:
          mnatureofbuss = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnatureofbuss = value.mcode;
          break;
        case 5:
          mhwwsacctopn = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhwwsacctopn = value.mcode;
          break;
        case 6:
          mnetwrth = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnetwrth = value.mcode;
          break;
        case 7:
          mexpectedvalue = value;
          print(value);
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mexpectedvalue = value.mcode;
          break;
        case 8:
          mnooftransmnthly = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnooftransmnthly = value.mcode;
          break;
        case 9:
          mhighnetwrth = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhighnetwrth = value.mcode;
          break;
        case 10:
          mprcdservrskque1 = value;
          CustomerFormationMasterTabsState.custListBean.riskratingsentity.mprcdservrskque1 = value.mcode;
          break;
          break;
        default:
          break;
      }
    });
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesRiskRatings[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesRiskRatings[no][k]);
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
    if(CustomerFormationMasterTabsState.custListBean.riskratingsentity==null){
      CustomerFormationMasterTabsState.custListBean.riskratingsentity = new RiskRatingsBean();
    }
    List<String> tempDropDownValues = new List<String>();

    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mcountryrisk);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisaperiod);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisavalid);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mvisatype);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnatureofbuss);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhwwsacctopn);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnetwrth);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mexpectedvalue);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mnooftransmnthly);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mhighnetwrth);
    tempDropDownValues.add(CustomerFormationMasterTabsState.custListBean.riskratingsentity.mprcdservrskque1);


    for (int k = 0;
    k < globals.dropdownCaptionsValuesRiskRatings.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesRiskRatings[k].length;
      i++) {
        try{
          if (globals.dropdownCaptionsValuesRiskRatings[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {
            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesRiskRatings[k][i]);
          }
        }catch(_){
          print("Exception Occured");
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
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

          new TextFormField(

            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrAccNo'),
              labelText: Translations.of(context).text('Acc_No'),
              hintStyle: TextStyle(color: Colors.grey),
              /* labelStyle: TextStyle(color: Colors.grey),*/
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
            keyboardType: TextInputType.number,
            inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyIntNumber]
            ,
            // validator: (arg)=>Utility.validateOnlyNumberField(arg),
            initialValue:CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno==0||
                CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno==null ||
                CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno=="null"?
            "":CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno.toString(),
            onSaved: (val) {
              if(val!=null&&val!="")
                CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno = val;

              else CustomerFormationMasterTabsState.custListBean.riskratingsentity.macctno = "";

            } ,
          ),
          SizedBox(height: 10.0,),
          new TextFormField(
            textCapitalization: TextCapitalization.characters,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(

              hintText: Translations.of(context).text('EntrPuraccOpng'),
              labelText: Translations.of(context).text('PuraccOpng'),
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
            inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
            initialValue:
            CustomerFormationMasterTabsState.custListBean.riskratingsentity.vmpurposeofacct!= null&&
                CustomerFormationMasterTabsState.custListBean.riskratingsentity.vmpurposeofacct!="null" ?
            CustomerFormationMasterTabsState.custListBean.riskratingsentity.vmpurposeofacct: "",
            onSaved: (val) => CustomerFormationMasterTabsState.custListBean.riskratingsentity.vmpurposeofacct= val,
          ),

          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('CRsk'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          SizedBox(height: 10.0,),

          Container(
              child:
              new DropdownButtonFormField(
                value:mcountryrisk==null?null: mcountryrisk,
                items: generateDropDown(0),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 0);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('Does')),
              )),

          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('CRsk'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          SizedBox(height: 10.0,),

          Container(
              child:
              new DropdownButtonFormField(
                isExpanded: true,
                value:mvisaperiod==null?null: mvisaperiod,
                items: generateDropDown(1),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 1);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('VsaForOnly')),
              )),
          SizedBox(height: 10.0,),

          Container(
              child:
              new DropdownButtonFormField(
                value:mvisavalid==null?null: mvisavalid,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('VsVal')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mvisatype==null?null: mvisatype,
                items: generateDropDown(3),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 3);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('VsTyp')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                isExpanded: true,
                value:mnatureofbuss==null?null: mnatureofbuss,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('NatBus')),
              )),

          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mhwwsacctopn==null?null: mhwwsacctopn,
                items: generateDropDown(5),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 5);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('HwWsOp')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mnetwrth==null?null: mnetwrth,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('NtWrthSlstrnovr')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mexpectedvalue==null?null: mexpectedvalue,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('ExpVls')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mnooftransmnthly==null?null: mnooftransmnthly,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('NoTran')),
              )),
          SizedBox(height: 10.0,),
          Container(
              child:
              new DropdownButtonFormField(
                value:mhighnetwrth==null?null: mhighnetwrth,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('High')),
              )),

          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(color: Constant.mandatoryColor),
            child: new Row(

              children: <Widget>[Text(Translations.of(context).text('ProdSeRsk'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
            ),
          ),
          SizedBox(height: 10.0,),

          Container(
              child:
              new DropdownButtonFormField(
                value:mprcdservrskque1==null?null: mprcdservrskque1,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {
                  print(args);
                },
                decoration: InputDecoration(labelText: Translations.of(context).text('Doestt')),
              )),
        ],
      ),
    );
  }

    }
