
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;


class CollateralVehicleAcceptanceCriteria extends StatefulWidget {

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleAcceptanceCriteria createState() =>
      new _CollateralVehicleAcceptanceCriteria();



}

class _CollateralVehicleAcceptanceCriteria
    extends State<CollateralVehicleAcceptanceCriteria> {
  final formKey = new GlobalKey<FormState>();
  List<bool> questionCheck;
  LookupBeanData carType;
  LookupBeanData LTV;
  int radioGroupVal = 0;
  LookupBeanData lookUpA ;
  LookupBeanData lookUpB ;
  LookupBeanData lookUpC ;


  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  List<LookupBeanData> lookups ;

  List<String> legailityIndex = ["Legal","Illegal"];
  bool isEnabled= false;

  @override
  void initState() {
    super.initState();
    lookUpA = new LookupBeanData(mcode: "A",mcodedesc: "A",mcodetype: 30000);
    lookUpB = new LookupBeanData(mcode: "B",mcodedesc: "B",mcodetype: 30000);
    lookUpC = new LookupBeanData(mcode: "C",mcodedesc: "C",mcodetype: 30000);
     lookups = [
      lookUpA ,
      lookUpB ,
      lookUpC

    ];

    if(CollateralVehicleMasterState.collateralVehicleBean.mcartype!=null&&
        CollateralVehicleMasterState.collateralVehicleBean.mcartype.trim()!="null"){

      for(int i = 0;i<lookups.length;i++){
        if(lookups[i].mcode==CollateralVehicleMasterState.collateralVehicleBean.mcartype.trim()){

          if(CollateralVehicleMasterState.collateralVehicleBean.mcartype==0){
            isEnabled = true;
          }
          setValue(0, lookups[i]);

        }


      }
    }
   /* List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(CollateralVehicleMasterState.collateralVehicleBean.mltvdd);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesVehicleAcceptanceInfo.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesVehicleAcceptanceInfo[k].length;
      i++) {

        //  print("tempDropDownValues[k].toString()"+tempDropDownValues[k].toString());
        try{
          if (globals.dropdownCaptionsValuesVehicleAcceptanceInfo[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            print("tempDropDownValues[k].toString()"+globals.dropdownCaptionsValuesVehicleAcceptanceInfo[k][i].mcode.toString());
            print("Matched");
            setValue(k, globals.dropdownCaptionsValuesVehicleAcceptanceInfo[k][i]);
          }
        }catch(_){
          print("Exception Occured");

        }
      }
    }

*/

  }


  LookupBeanData blankBean =
      new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();


    bean.mcodedesc = "";
    mapData.add(blankBean);
    if(no==0){
      for (int k = 0;
      k < lookups.length;
      k++) {
        mapData.add(lookups[k]);
      }
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

  List<DropdownMenuItem<LookupBeanData>> generateDropDownLTV(int no) {
    print("caption value : " + globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no].toString());

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no][k]);
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
  DateTime endTime;

  showDropDown(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      switch (no) {
        case 0:
          carType = blankBean;
          break;

        default:
          break;
      }
      print("Its Enpty");
      setState(() {});
    } else {
      bool isBreak = false;
      for (int k = 0;
          k < lookups.length;
          k++) {
        if (lookups[k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, lookups[k]);
          isBreak = true;
          break;
        }


        if (isBreak) {
          break;
        }
      }




    }
  }
  showDropDownLTV(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      switch (no) {
        case 0:
          LTV = blankBean;
          break;

        default:
          break;
      }
      print("Its Enpty");
      setState(() {});
    } else{
      bool isBreak = false;
      for (int k = 0;
      k < globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValueLTV(no, globals.dropdownCaptionsValuesVehicleAcceptanceInfo[no][k]);
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
          carType = value;
          CollateralVehicleMasterState.collateralVehicleBean.mcartype =
              value.mcode;
          if(value.mcode=="A"){

            CollateralVehicleMasterState.collateralVehicleBean.mdescription = "New Model Zero Milege"
                "Tax Paper No Plate number";
            CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused = "7 Years";
            CollateralVehicleMasterState.collateralVehicleBean.mcredittenor = "7 Years";
          }
          else if(value.mcode=="B"){

            CollateralVehicleMasterState.collateralVehicleBean.mdescription = "New Import Tax paper"
            "No Plate number";
            CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused = "15 Years";
            CollateralVehicleMasterState.collateralVehicleBean.mcredittenor = "5 Years";
          }
          else if(value.mcode=="C"){

            CollateralVehicleMasterState.collateralVehicleBean.mdescription = "Head Plate Number(UsingCar)"
                "Tax Paper No Plate number";
            CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused = "12 Years";
            CollateralVehicleMasterState.collateralVehicleBean.mcredittenor = "-2  Years Upto 10 \n-5 years less than 10";
          }

          print(""+CollateralVehicleMasterState.collateralVehicleBean.mdescription);
          setState(() {

          });
          break;
        case 1:
          LTV = value;
          CollateralVehicleMasterState.collateralVehicleBean.mltvdd =
              value.mcode;
          break;
        default:
          break;
      }
    });
  }
  setValueLTV(int no, LookupBeanData value) {
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          LTV = value;
          CollateralVehicleMasterState.collateralVehicleBean.mltvdd =
              value.mcode;
          break;


        default:
          break;
      }
    });
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

                 child: new DropdownButtonFormField(
                   value: carType,
                   items: generateDropDown(0),
                   onChanged: (LookupBeanData newValue) {
                     showDropDown(newValue, 0);
                   },
                   validator: (args) {
                   },
                   //  isExpanded: true,
                   //hint:Text("Select"),
                   decoration: InputDecoration(labelText: Translations.of(context).text('CrTyp')),
                   // style: TextStyle(color: Colors.grey),
                 ),
               ),

               new ListTile(


                 title: new Text(Translations.of(context).text('description')),
                 subtitle:
                 new Text(CollateralVehicleMasterState.collateralVehicleBean.mdescription==null||
                     CollateralVehicleMasterState.collateralVehicleBean.mdescription=="null"
                     ?"":
                     "${CollateralVehicleMasterState.collateralVehicleBean.mdescription}"),


               ),

               new ListTile(

                 title: new Text(Translations.of(context).text('car_can_be_use')),
                 subtitle:
                 new Text(CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused==null
                     ||CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused=="null"
                     ?"":

                 "${CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused}"),


               ),
               new ListTile(

                 title: new Text(Translations.of(context).text('CrdtTnr')),
                 subtitle:
                 new Text(CollateralVehicleMasterState.collateralVehicleBean.mcredittenor==null
                     ||CollateralVehicleMasterState.collateralVehicleBean.mcredittenor=="null"
                     ?"":

                 "${CollateralVehicleMasterState.collateralVehicleBean.mcredittenor}"),


               ),



               Container(

                 child: new DropdownButtonFormField(
                   value: LTV,
                   items: generateDropDownLTV(0),
                   onChanged: (LookupBeanData newValue) {
                     showDropDownLTV(newValue, 0);
                   },
                   validator: (args) {
                   },
                   //  isExpanded: true,
                   //hint:Text("Select"),
                   decoration: InputDecoration(labelText: Translations.of(context).text('LnToVlueLTV')),
                   // style: TextStyle(color: Colors.grey),
                 ),
               ),
               Container(

                      child: new TextFormField(
                        decoration: InputDecoration(
                          hintText: Translations.of(context).text('enter_car_owner'),
                          labelText: Translations.of(context).text('car_owner'),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              decorationColor: Colors.red),
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
                        controller:CollateralVehicleMasterState.collateralVehicleBean.mwhobelongocarowner == null
                            ? TextEditingController(text: "")
                            : TextEditingController(
                            text: CollateralVehicleMasterState.collateralVehicleBean.mwhobelongocarowner),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          globals.onlyCharacter
                        ],
                        textCapitalization: TextCapitalization.words,
                        onSaved: (val) {
                          CollateralVehicleMasterState.collateralVehicleBean.mwhobelongocarowner = val;
                        },
                      )),

               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: new Card(
                     child: new Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         getTextContainer("ILLegality"),
                         LegalOrIllegal(),
                       ],
                     )),
               ),

               Container(

                      child: new TextFormField(
                        decoration: InputDecoration(
                          hintText: Translations.of(context).text('enter_reason_for_legality'),
                          labelText: Translations.of(context).text('reason_for_legality'),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              decorationColor: Colors.red),
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
                        controller:CollateralVehicleMasterState.collateralVehicleBean.mreason == null
                            ? TextEditingController(text: "")
                            : TextEditingController(
                            text: CollateralVehicleMasterState.collateralVehicleBean.mreason),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                          globals.onlyCharacter
                        ],
                        textCapitalization: TextCapitalization.words,
                        onSaved: (val) {
                          CollateralVehicleMasterState.collateralVehicleBean.mreason= val;
                        },
                      )),


                ]
            ),
          ),
        ],
      ),
    );




   /* return new SafeArea(
        child: SingleChildScrollView(

            child: new Column(
              children: <Widget>[



               Container(

                 child: new DropdownButtonFormField(
                   value: carType,
                   items: generateDropDown(0),
                   onChanged: (LookupBeanData newValue) {
                     showDropDown(newValue, 0);
                   },
                   validator: (args) {
                   },
                   //  isExpanded: true,
                   //hint:Text("Select"),
                   decoration: InputDecoration(labelText: "Car Type"),
                   // style: TextStyle(color: Colors.grey),
                 ),
               ),

               new ListTile(


                 title: new Text("Description"),
                 subtitle:
                 new Text(CollateralVehicleMasterState.collateralVehicleBean.mdescription==null||
                     CollateralVehicleMasterState.collateralVehicleBean.mdescription=="null"
                     ?"":
                     "${CollateralVehicleMasterState.collateralVehicleBean.mdescription}"),


               ),

               new ListTile(

                 title: new Text(Translations.of(context).text('car_can_be_use')),
                 subtitle:
                 new Text(CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused==null
                     ||CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused=="null"
                     ?"":

                 "${CollateralVehicleMasterState.collateralVehicleBean.mcarcanbeused}"),


               ),





               Container(

                   child: new TextFormField(
                     decoration: InputDecoration(
                       hintText: Translations.of(context).text('enter_car_owner'),
                       labelText: Translations.of(context).text('car_owner'),
                       hintStyle: TextStyle(
                           color: Colors.grey,
                           decorationColor: Colors.red),
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

                     inputFormatters: [
                       LengthLimitingTextInputFormatter(30),
                       globals.onlyCharacter
                     ],
                     textCapitalization: TextCapitalization.words,
                     onSaved: (val) {
                      CollateralVehicleMasterState.collateralVehicleBean.mwhobelongocarowner = val;
                     },
                   )),

               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: new Card(
                     child: new Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         getTextContainer("ILLegality"),
                         LegalOrIllegal(),
                       ],
                     )),
               ),

               Container(

                   child: new TextFormField(
                     decoration: InputDecoration(
                       hintText: Translations.of(context).text('enter_reason_for_legality'),
                       labelText: Translations.of(context).text('reason_for_legality'),
                       hintStyle: TextStyle(
                           color: Colors.grey,
                           decorationColor: Colors.red),
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

                     inputFormatters: [
                       LengthLimitingTextInputFormatter(30),
                       globals.onlyCharacter
                     ],
                     textCapitalization: TextCapitalization.words,
                     onSaved: (val) {
                       CollateralVehicleMasterState.collateralVehicleBean.mreason= val;
                     },
                   )),






              ],
            )
        )
    );*/
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



  _onRadioSelected(int selection, int position) {
    setState(() => CollateralVehicleMasterState.carAcceptanceRadio[position] = selection);
    if (position == 0) {

      radioGroupVal = selection;
      CollateralVehicleMasterState.collateralVehicleBean.mcarlegality =selection;
      print("Selection ${selection}");
    }
  }



  List<Widget> _makeRadios(int numberOfRadios, List textName, int position) {
    List<Widget> radios = new List<Widget>();
    for (int i = 0; i < numberOfRadios; i++) {
      radios.add(Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
        child: new Row(
          children: <Widget>[
            new Text(
              textName[i],
              textAlign: TextAlign.right,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
              ),
            ),
            new Radio(
              value: i,
              groupValue: radioGroupVal,
              onChanged: (selection) => _onRadioSelected(selection, position),
              activeColor: Color(0xff07426A),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ));
    }
    return radios;
  }

  Widget LegalOrIllegal() => CollateralVehicleAcceptanceCriteria._get(new Row(
    children: _makeRadios(2, legailityIndex, 0),
    mainAxisAlignment: MainAxisAlignment.spaceAround,
  ));
}
