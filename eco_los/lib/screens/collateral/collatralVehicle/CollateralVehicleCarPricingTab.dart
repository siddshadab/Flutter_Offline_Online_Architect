import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralsGold/bean/CollateralsGoldMasterBean.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class CollateralVehicleCarPricing extends StatefulWidget {
  CollateralVehicleCarPricing({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleCarPricingState createState() =>
      new _CollateralVehicleCarPricingState();
}

class _CollateralVehicleCarPricingState
    extends State<CollateralVehicleCarPricing> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  LookupBeanData occupaOrBuisness;
  final formatDouble = new NumberFormat("#,##0.00", "en_US");

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
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrCrPrcngClnt'),
                      labelText: Translations.of(context).text('CrPrcngByClnt'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff07426A),
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller:CollateralVehicleMasterState.collateralVehicleBean.mcarpricing == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: formatDouble.format(CollateralVehicleMasterState.collateralVehicleBean.mcarpricing).toString()),
                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {
                        try{
                          CollateralVehicleMasterState.collateralVehicleBean.mcarpricing =
                              double.parse(val);
                            } catch (_) {}

                    },
                  ),
                ),

                Container(
                  color: Constant.mandatoryColor,

                  child: new TextFormField(

                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrStdPrcng'),
                      labelText: Translations.of(context).text('StdPr'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff07426A),
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller:CollateralVehicleMasterState.collateralVehicleBean.mstdpricing == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: formatDouble.format(CollateralVehicleMasterState.collateralVehicleBean.mstdpricing).toString()),
                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {

                      try{
                        CollateralVehicleMasterState.collateralVehicleBean.mstdpricing =
                            double.parse(val);
                      } catch (_) {}

                      },
                  ),
                ),

                Container(
                  color: Constant.mandatoryColor,

                  child: new TextFormField(

                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrInsuPrc'),
                      labelText: Translations.of(context).text('InsPrcng'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff07426A),
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller:CollateralVehicleMasterState.collateralVehicleBean.minsurancepricing == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: formatDouble.format(CollateralVehicleMasterState.collateralVehicleBean.minsurancepricing).toString()),
                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {
                      try{
                        CollateralVehicleMasterState.collateralVehicleBean.minsurancepricing =
                            double.parse(val);
                      } catch (_) {}

                    },
                  ),
                ),

                Container(
                  color: Constant.mandatoryColor,

                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrPrcAftrEvalBrnch'),
                      labelText: Translations.of(context).text('PrcngAftrEvalBrnch'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff07426A),
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller:CollateralVehicleMasterState.collateralVehicleBean.mpriceafterevaluation == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: formatDouble.format(CollateralVehicleMasterState.collateralVehicleBean.mpriceafterevaluation).toString()),

                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {

                      try{
                        CollateralVehicleMasterState.collateralVehicleBean.mpriceafterevaluation =
                            double.parse(val);
                      } catch (_) {}


                    },
                  ),
                ),
                Container(
                  color: Constant.mandatoryColor,

                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrLTV'),
                      labelText: Translations.of(context).text('LTV'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff07426A),
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    controller:CollateralVehicleMasterState.collateralVehicleBean.mltv == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralVehicleMasterState.collateralVehicleBean.mltv.toString()),
                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {
                     try{
                        CollateralVehicleMasterState.collateralVehicleBean.mltv =
                            double.parse(val);
                      } catch (_) {}

                    },
                  ),
                ),







              ],
            ),
          ),
        ],
      ),
    );

  }


}


