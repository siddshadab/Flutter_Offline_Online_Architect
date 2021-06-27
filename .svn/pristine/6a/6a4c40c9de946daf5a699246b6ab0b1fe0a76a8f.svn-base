
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;



class CollateralVehicleBuying extends StatefulWidget {
  CollateralVehicleBuying({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CollateralVehicleBuyingState createState() =>
      new _CollateralVehicleBuyingState();
}

class _CollateralVehicleBuyingState
    extends State<CollateralVehicleBuying> {
  String tempRegDateYear;
  String tempRegDateDay;
  String tempRegDateMonth;
  String tempRegDateDate = "----/--/--";
  var formatter = new DateFormat('dd-MM-yyyy');

  String regDate = "__-__-____";
  FocusNode monthRegDateFocus;
  FocusNode yearRegDateFocus;
  String tempRegExpDateYear;
  String tempRegExpDateDay;
  String tempRegExpDateMonth;
  String tempRegExpDateDate = "----/--/--";

  String regExpDate = "__-__-____";
  FocusNode monthRegExpDateFocus;
  FocusNode yearRegExpDateFocus;
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
    }
    else{
      if(!regExpDate.contains("_")){
        try{
          //  print("inside try");

          String tempApplicantdob = regExpDate;
          print(tempApplicantdob);
          //  print(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
          DateTime  formattedDate =  DateTime.parse(tempApplicantdob.substring(6)+"-"+tempApplicantdob.substring(3,5)+"-"+tempApplicantdob.substring(0,2));
          //   print(formattedDate);
          tempRegExpDateDay = formattedDate.day.toString();
          //   print(tempDay);
          tempRegExpDateMonth = formattedDate.month.toString();
          ////  print(tempMonth);
          tempRegExpDateYear = formattedDate.year.toString();
          //   print(tempYear);
          setState(() {

          });

        }catch(e){

          print("Exception Occupred");
        }
      }
      if (CollateralVehicleMasterState.collateralVehicleBean.mregexpdate != null &&
          CollateralVehicleMasterState.collateralVehicleBean.mregexpdate!= 'null' &&
          CollateralVehicleMasterState.collateralVehicleBean.mregexpdate != '') {
        String tempDay;
        String tempMonth;
        if (CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.day.toString().length == 1)
          tempDay = "0" + CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.day.toString();
        else
          tempDay = CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.day.toString();

        if (CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.month.toString().length == 1)
          tempMonth = "0" + CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.month.toString();
        else
          tempMonth = CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.month.toString();

        regExpDate =
            regExpDate
                .replaceRange(0, 2, tempDay);

        regExpDate =
            regExpDate
                .replaceRange(3, 5, tempMonth);

        regExpDate =
            regExpDate.replaceRange(
                6, 10, CollateralVehicleMasterState.collateralVehicleBean.mregexpdate.year.toString());
      }
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

                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(

                    hintText: Translations.of(context).text('EntrBrnd'),
                    labelText: Translations.of(context).text('brand'),
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
                  CollateralVehicleMasterState.collateralVehicleBean.mbrand!= null&&
                      CollateralVehicleMasterState.collateralVehicleBean.mbrand!="null" ?
                  CollateralVehicleMasterState.collateralVehicleBean.mbrand: "",
                  onSaved: (val) => CollateralVehicleMasterState.collateralVehicleBean.mbrand= val,
                ),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(

                        hintText: Translations.of(context).text('EntrTyp'),
                        labelText: Translations.of(context).text('type'),
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
                      initialValue:  CollateralVehicleMasterState.collateralVehicleBean.mtype!= null&&
                          CollateralVehicleMasterState.collateralVehicleBean.mtype!="null"
                          ? CollateralVehicleMasterState.collateralVehicleBean.mtype
                          : "",
                      onSaved: (val) => CollateralVehicleMasterState.collateralVehicleBean.mtype= val,
                    )),
                Container(
                  child: new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrClr'),
                      labelText: Translations.of(context).text('Clr'),
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
                    controller: CollateralVehicleMasterState.collateralVehicleBean.mcolor != null
                        ? TextEditingController(text: CollateralVehicleMasterState.collateralVehicleBean.mcolor)
                        : TextEditingController(text: ""),

                    onSaved: (val) {
                      //  if(val!=null) {
                      CollateralVehicleMasterState.collateralVehicleBean.mcolor = val;
                      // }
                    },
                  ),
                ),

                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrBdyNo'),
                        labelText: Translations.of(context).text('BdyNo'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff07426A),
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),

                      controller: CollateralVehicleMasterState.collateralVehicleBean.mbodyno != null&&CollateralVehicleMasterState.collateralVehicleBean.mbodyno!= 0
                          ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.mbodyno.toString())
                          : TextEditingController(text:""),
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        if(val!=null&&val!="") {

                          try{
                            CollateralVehicleMasterState.collateralVehicleBean.mbodyno= val;
                          }catch(e){

                          }

                        }
                        else{
                          CollateralVehicleMasterState.collateralVehicleBean.mbodyno = '0';
                        }

                        //}
                      },
                    )),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrEngNo'),
                        labelText: Translations.of(context).text('EngNo'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff07426A),
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),

                      controller: CollateralVehicleMasterState.collateralVehicleBean.mengineno != null&&CollateralVehicleMasterState.collateralVehicleBean.mengineno!= 0
                          ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.mengineno.toString())
                          : TextEditingController(text:""),
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        if(val!=null&&val!="") {

                          try{
                            CollateralVehicleMasterState.collateralVehicleBean.mengineno= val;
                          }catch(e){

                          }

                        }
                        else{
                          CollateralVehicleMasterState.collateralVehicleBean.mengineno = '0';
                        }

                        //}
                      },
                    )),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrChssNo'),
                        labelText: Translations.of(context).text('ChssNo'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff07426A),
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),

                      controller: CollateralVehicleMasterState.collateralVehicleBean.mchassisno != null&&CollateralVehicleMasterState.collateralVehicleBean.mchassisno!= 0
                          ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.mchassisno.toString())
                          : TextEditingController(text:""),
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        if(val!=null&&val!="") {

                          try{
                            CollateralVehicleMasterState.collateralVehicleBean.mchassisno= (val);
                          }catch(e){

                          }

                        }
                      },
                    )),
                Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(

                      hintText: Translations.of(context).text('EntrMdBy'),
                      labelText: Translations.of(context).text('MdeBy'),
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
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(60),

                    ],
                    controller:CollateralVehicleMasterState.collateralVehicleBean.mmadeby == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralVehicleMasterState.collateralVehicleBean.mmadeby),
                    onSaved: (val) {
                      if(val!=null&&val!=""){
                        try{
                          CollateralVehicleMasterState.collateralVehicleBean.mmadeby= (val);
                        }catch(e){

                        }
                      }

                    },
                  ),
                ),

                new TextFormField(
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrNoAxls'),
                    labelText: Translations.of(context).text('NoAxls'),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff07426A),
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),

                  controller: CollateralVehicleMasterState.collateralVehicleBean.mnoofaxles!= null&&CollateralVehicleMasterState.collateralVehicleBean.mnoofaxles!= 0
                      ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.mnoofaxles.toString())
                      : TextEditingController(text:""),
                  keyboardType: TextInputType.number,
                  onSaved: (val) {
                    if(val!=null&&val!="") {

                      try{
                        CollateralVehicleMasterState.collateralVehicleBean.mnoofaxles= int.parse(val);
                      }catch(e){

                      }
                    }
                    else{
                      CollateralVehicleMasterState.collateralVehicleBean.mnoofaxles = 0;
                    }
                  },
                ),


                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrNoCyl'),
                        labelText: Translations.of(context).text('NuCyl'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff07426A),
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),

                      controller: CollateralVehicleMasterState.collateralVehicleBean.mnoofcylinder!= null&&CollateralVehicleMasterState.collateralVehicleBean.mnoofcylinder!= 0
                          ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.mnoofcylinder.toString())
                          : TextEditingController(text:""),
                      keyboardType: TextInputType.number,
                      onSaved: (val) {
                        if(val!=null&&val!="") {

                          try{
                            CollateralVehicleMasterState.collateralVehicleBean.mnoofcylinder= int.parse(val);
                          }catch(e){

                          }

                        }
                        else{
                          CollateralVehicleMasterState.collateralVehicleBean.mnoofcylinder = 0;
                        }
                      },
                    )),



                new TextFormField(
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrSzcylr'),
                    labelText: Translations.of(context).text('Szecyl'),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff07426A),
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(20),

                  ],
                  controller: CollateralVehicleMasterState.collateralVehicleBean.msizeofcylinder!= null&&CollateralVehicleMasterState.collateralVehicleBean.msizeofcylinder!= 0
                      ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.msizeofcylinder.toString())
                      : TextEditingController(text:""),
                  keyboardType: TextInputType.number,
                  onSaved: (val) {
                    if(val!=null&&val!="") {

                      try{
                        CollateralVehicleMasterState.collateralVehicleBean.msizeofcylinder= int.parse(val);
                      }catch(e){

                      }

                    }
                    else{
                      CollateralVehicleMasterState.collateralVehicleBean.msizeofcylinder = 0;
                    }
                  },
                ),

                Container(
                  child: new TextFormField(

                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrEngnePwr'),
                      labelText: Translations.of(context).text('EngPwr'),
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
                    controller:CollateralVehicleMasterState.collateralVehicleBean.menginepower == null
                        ? TextEditingController(text: "")
                        : TextEditingController(
                        text: CollateralVehicleMasterState.collateralVehicleBean.menginepower.toString()),
                    inputFormatters: [
                      globals.onlyDoubleNumber
                    ],
                    onSaved: (val) {
                      if (val != null && val != "") {
                        globals.income = double.parse(val);
                        CollateralVehicleMasterState.collateralVehicleBean.menginepower =
                            double.parse(val);
                      } else {
                        CollateralVehicleMasterState.collateralVehicleBean.menginepower = null;
                      }
                    },
                  ),
                ),
                new TextFormField(
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrYrMd'),
                    labelText: Translations.of(context).text('YrMd'),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff07426A),
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),

                  controller: CollateralVehicleMasterState.collateralVehicleBean.myearmade!= null&&CollateralVehicleMasterState.collateralVehicleBean.myearmade!= 0
                      ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.myearmade.toString())
                      : TextEditingController(text:""),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(4),
                    globals.onlyIntNumber
                  ],                  onSaved: (val) {
                  if(val!=null&&val!="") {

                    try{
                      CollateralVehicleMasterState.collateralVehicleBean.myearmade= int.parse(val);
                    }catch(e){

                    }
                  }
                  else{
                    CollateralVehicleMasterState.collateralVehicleBean.myearmade = 0;
                  }
                },
                ),
                Container(
                    color: Constant.semiMandatoryColor,
                    child:
                    new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrCrNo'),
                        labelText: Translations.of(context).text('CrNo'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff07426A),
                            )),
                        contentPadding: EdgeInsets.all(20.0),
                      ),

                      controller: CollateralVehicleMasterState.collateralVehicleBean.midentitycarno!= null&&CollateralVehicleMasterState.collateralVehicleBean.midentitycarno!= 0
                          ? TextEditingController(text:CollateralVehicleMasterState.collateralVehicleBean.midentitycarno.toString())
                          : TextEditingController(text:""),
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        if(val!=null&&val!="") {

                          try{
                            CollateralVehicleMasterState.collateralVehicleBean.midentitycarno= (val);
                          }catch(e){

                          }

                        }
                      },
                    )),
                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(),
                  child: new Row(
                    children: <Widget>[Text("Registration Date")],
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: 50.0,
                        child: new TextField(
                            decoration: InputDecoration(hintText: "DD"),
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(2),
                              globals.onlyIntNumber
                            ],
                            controller: tempRegDateDay == null
                                ? null
                                : new TextEditingController(text: tempRegDateDay),
                            keyboardType: TextInputType.numberWithOptions(),
                            onChanged: (val) {
                              if (val != "0") {
                                tempRegDateDay = val;

                                if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                  if (val.length == 2) {
                                    regDate = regDate.replaceRange(0, 2, val);
                                    FocusScope.of(context).requestFocus(monthRegDateFocus);
                                  } else {
                                    regDate =
                                        regDate.replaceRange(0, 2, "0" + val);
                                  }
                                } else {
                                  setState(() {
                                    tempRegDateDay = "";
                                  });
                                }
                              }
                            }),
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
                          focusNode: monthRegDateFocus,
                          controller: tempRegDateMonth == null
                              ? null
                              : new TextEditingController(text: tempRegDateMonth),
                          onChanged: (val) {
                            if (val != "0") {
                              tempRegDateMonth = val;
                              if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                if (val.length == 2) {
                                  regDate = regDate.replaceRange(3, 5, val);

                                  FocusScope.of(context).requestFocus(yearRegDateFocus);
                                } else {
                                  regDate =
                                      regDate.replaceRange(3, 5, "0" + val);
                                }
                              } else {
                                setState(() {
                                  tempRegDateMonth = "";
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
                        width: 80,
                        child: new TextField(
                          decoration: InputDecoration(
                            hintText: "YYYY",
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(4),
                            globals.onlyIntNumber
                          ],
                          focusNode: yearRegDateFocus,
                          controller: tempRegDateYear == null
                              ? null
                              : new TextEditingController(text: tempRegDateYear),
                          onChanged: (val) {
                            tempRegDateYear = val;
                            if (val.length == 4)
                              regDate =  regDate.replaceRange(6, 10, val);

                          },

                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectRegDtDate(context);
                          })
                    ],
                  ),
                ),

                SizedBox(height: 20.0,),
                Container(
                  decoration: BoxDecoration(),
                  child: new Row(
                    children: <Widget>[Text("Registration Expiry Date")],
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        width: 50.0,
                        child: new TextField(
                            decoration: InputDecoration(hintText: "DD"),
                            inputFormatters: [
                              new LengthLimitingTextInputFormatter(2),
                              globals.onlyIntNumber
                            ],
                            controller: tempRegExpDateDay == null
                                ? null
                                : new TextEditingController(text: tempRegExpDateDay),
                            keyboardType: TextInputType.numberWithOptions(),
                            onChanged: (val) {
                              if (val != "0") {
                                tempRegExpDateDay = val;

                                if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                  if (val.length == 2) {
                                    regExpDate = regExpDate.replaceRange(0, 2, val);
                                    FocusScope.of(context).requestFocus(monthRegExpDateFocus);
                                  } else {
                                    regExpDate =
                                        regExpDate.replaceRange(0, 2, "0" + val);
                                  }
                                } else {
                                  setState(() {
                                    tempRegExpDateDay = "";
                                  });
                                }
                              }
                            }),
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
                          focusNode: monthRegExpDateFocus,
                          controller: tempRegExpDateMonth == null
                              ? null
                              : new TextEditingController(text: tempRegExpDateMonth),
                          onChanged: (val) {
                            if (val != "0") {
                              tempRegExpDateMonth = val;
                              if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                if (val.length == 2) {
                                  regExpDate = regExpDate.replaceRange(3, 5, val);

                                  FocusScope.of(context).requestFocus(yearRegExpDateFocus);
                                } else {
                                  regExpDate =
                                      regExpDate.replaceRange(3, 5, "0" + val);
                                }
                              } else {
                                setState(() {
                                  tempRegExpDateMonth = "";
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
                        width: 80,
                        child: new TextField(
                          decoration: InputDecoration(
                            hintText: "YYYY",
                          ),
                          keyboardType: TextInputType.numberWithOptions(),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(4),
                            globals.onlyIntNumber
                          ],
                          focusNode: yearRegExpDateFocus,
                          controller: tempRegExpDateYear == null
                              ? null
                              : new TextEditingController(text: tempRegExpDateYear),
                          onChanged: (val) {
                            tempRegExpDateYear = val;
                            if (val.length == 4)
                              regExpDate =  regExpDate.replaceRange(6, 10, val);

                          },

                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectRegExpDtDate(context);
                          })
                    ],
                  ),
                ),




              ],
            ),
          ),
        ],
      ),
    );

  }

  Future<Null> _selectRegDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != CollateralVehicleMasterState.collateralVehicleBean.mregdate)
      setState(() {
        CollateralVehicleMasterState.collateralVehicleBean.mregdate = picked;
        tempRegDateDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempRegDateDay = "0" + picked.day.toString();
        } else
          tempRegDateDay = picked.day.toString();
        regDate = regDate.replaceRange(0, 2, tempRegDateDay);
        tempRegDateYear = picked.year.toString();
        regDate = regDate.replaceRange(6, 10, tempRegDateYear);
        if (picked.month.toString().length == 1) {
          tempRegDateMonth = "0" + picked.month.toString();
        } else
          tempRegDateMonth = picked.month.toString();
        regDate = regDate.replaceRange(3, 5, tempRegDateMonth);
      });
    setState(() {

    });
  }
  Future<Null> _selectRegExpDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != CollateralVehicleMasterState.collateralVehicleBean.mregexpdate)
      setState(() {
        CollateralVehicleMasterState.collateralVehicleBean.mregexpdate = picked;
        tempRegExpDateDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempRegExpDateDay = "0" + picked.day.toString();
        } else
          tempRegExpDateDay = picked.day.toString();
        regExpDate = regExpDate.replaceRange(0, 2, tempRegExpDateDay);
        tempRegExpDateYear = picked.year.toString();
        regExpDate = regExpDate.replaceRange(6, 10, tempRegExpDateYear);
        if (picked.month.toString().length == 1) {
          tempRegExpDateMonth = "0" + picked.month.toString();
        } else
          tempRegExpDateMonth = picked.month.toString();
        regExpDate = regExpDate.replaceRange(3, 5, tempRegExpDateMonth);
      });
    setState(() {

    });
  }
}


