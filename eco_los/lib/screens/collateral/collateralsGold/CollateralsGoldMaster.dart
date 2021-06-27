
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralsGold/bean/CollateralsGoldMasterBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class CollateralsGoldMaster extends StatefulWidget {
  final collateralPassedObject;
  final collateralsGoldMasterPassedObject;
  //CollateralsREMMaster({Key key, this.collateralPassedObject}) : super(key: key);

  CollateralsGoldMaster(this.collateralPassedObject,this.collateralsGoldMasterPassedObject);


  @override
  _CollateralsGoldMasterState createState() => new _CollateralsGoldMasterState();
}

class _CollateralsGoldMasterState extends State<CollateralsGoldMaster> {

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  var rows2;
  var cols2;

  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String branch = "";
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;

  DateTime startTime = DateTime.now();
  final dateFormat = DateFormat("yyyy, mm, dd");
  DateTime date;
  TimeOfDay time;
  String approvalAmtLimit="0.0";
  String mreportinguser= "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String itemvar;
  String caratetypevar;
  int numberofitems;
  double weight;
  double netweight;
  double marketvalue;
  double sanction;
  double lendingamnt;
  double elegibleamnt;

  //CollateralsGoldMasterBean  collateralsGoldMasterBean;

  List<CollateralsGoldMasterBean>  collateralsGoldMasterBeanList;


  LookupBeanData item;
  LookupBeanData caratetype;
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);





  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      //   print("inside  code Desc is null");
      switch (no) {
        case 0:
          item = blankBean;
          break;
        case 1:
          caratetype= blankBean;
          // CustomerFormationMasterTabsState.custListBean.mrelegion = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollalteralGold[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollalteralGold[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollalteralGold[no][k]);
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
      // print("coming here");
      switch (no) {
        case 0:
          item = value;
          itemvar =value.mcode;
          break;
        case 1:
          caratetype = value;
          caratetypevar =value.mcode;
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
    k < globals.dropdownCaptionsValuesCollalteralGold[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollalteralGold[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      //   print("data here is of  dropdownwale biayajai " + value.mcodedesc);
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

    // collateralsGoldMasterBean = new CollateralsGoldMasterBean();
    if (widget.collateralsGoldMasterPassedObject != null) {
      collateralsGoldMasterBeanList = widget.collateralsGoldMasterPassedObject;
    }else{
      collateralsGoldMasterBeanList = new List<CollateralsGoldMasterBean>();
    }

    getSessionVariables();
    setRowsItemInitials();
  }




  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();




    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode).toString();
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation=  prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude  = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
      reportingUser= prefs.getString(TablesColumnFile.reportingUser);


    });
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        callBackDialog(context);
      },
      child: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          elevation: 1.0,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                callBackDialog(context);
              }),
          backgroundColor: Color(0xff07426A),
          brightness: Brightness.light,
          title: new Text(
            'Collateral gold',
            //textDirection: TextDirection,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontStyle: FontStyle.normal),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.save,
                color: Colors.white,
                size: 40.0,
              ),
              onPressed: () {
                proceed();
              },
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ],
        ),
        body:new Form(
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
                padding: EdgeInsets.all(0.0),
                children: <Widget>[

                  SizedBox(height: 16.0),

                  Center(
                    child: new Column(children: [
                      //occupationRadio(),

                      Container(
                        color: Constant.mandatoryColor
                        ,child:new DropdownButtonFormField(
                        value: item,
                        items: generateDropDown(0),
                        onChanged: (LookupBeanData newValue) {
                          showDropDown(newValue, 0);
                        },
                        validator: (args) {
                          print(args);
                        },
                        //  isExpanded: true,
                        //hint:Text("Select"),
                        decoration: InputDecoration(labelText: Translations.of(context).text('item')),
                        // style: TextStyle(color: Colors.grey),
                      ),)


                    ]),
                  ),

                  SizedBox(height: 16.0),

                  Center(
                    child: new Column(children: [
                      //occupationRadio(),

                      Container(
                        color: Constant.mandatoryColor
                        ,child:new DropdownButtonFormField(
                        value: caratetype,
                        items: generateDropDown(1),
                        onChanged: (LookupBeanData newValue) {
                          showDropDown(newValue, 1);
                        },
                        validator: (args) {
                          print(args);
                        },
                        //  isExpanded: true,
                        //hint:Text("Select"),
                        decoration: InputDecoration(labelText: Translations.of(context).text('caratetype')),
                        // style: TextStyle(color: Colors.grey),
                      ),)


                    ]),
                  ),


                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('numberofitems'),
                        labelText: Translations.of(context).text('numberofitems'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyIntNumber],

                      initialValue:  numberofitems == null
                          ? ""
                          :  numberofitems.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          numberofitems = int.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),



                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('weight'),
                        labelText: Translations.of(context).text('weight'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  weight == null
                          ? ""
                          :  weight.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          weight = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),


                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('netweight'),
                        labelText: Translations.of(context).text('netweight'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  netweight == null
                          ? ""
                          :  netweight.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          netweight = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),


                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('marketvalue'),
                        labelText: Translations.of(context).text('marketvalue'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  marketvalue == null
                          ? ""
                          :  marketvalue.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          marketvalue = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),


                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('sanction'),
                        labelText: Translations.of(context).text('sanction'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  sanction == null
                          ? ""
                          :  sanction.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          sanction = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),

                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('lendingamnt'),
                        labelText: Translations.of(context).text('lendingamnt'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  lendingamnt == null
                          ? ""
                          :  lendingamnt.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          lendingamnt = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),

                  SizedBox(height: 16.0),
                  new TextFormField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //keyboardType: TextInputType.multiline,
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('elegibleamnt'),
                        labelText: Translations.of(context).text('elegibleamnt'),
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

                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                      initialValue:  elegibleamnt == null
                          ? ""
                          :  elegibleamnt.toString(),

                      onSaved: (String value) {

                        if (value.isNotEmpty &&
                            value != "" &&
                            value != null &&
                            value != 'null') {
                          elegibleamnt = double.parse(value);
                        }

                      }
                  ),
                  SizedBox(height: 32.0),

                  new IconButton(
                      padding: EdgeInsets.only(right: 30.0),
                      icon: new Icon(
                        Icons.add,
                        color: Color(0xff07426A),
                        size: 50.0,
                      ),
                      splashColor: Colors.red,
                      onPressed: () {
                        addToList();
                      }),
                  SingleChildScrollView(

                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      rows: rows2,
                      columns: cols2,
                    ),
                  ),
                ])),
      ),
    );

  }


  addToList(){

    //Validations here



    print("Done");
    CollateralsGoldMasterBean  collateralsGoldMasterBean = new CollateralsGoldMasterBean();

    /*  await AppDatabase.get().getMaxCollateralREMlandandhouseTrefNo().then((val){
      collateralsGoldMasterBean.trefno =val;
    });
  */
    /*if (widget.collateralsGoldMasterPassedObject != null) {
      collateralsGoldMasterBeanList = widget.collateralsGoldMasterPassedObject;
    } else {
      collateralsGoldMasterBeanList = new List<CollateralsGoldMasterBean>();
    }*/


    collateralsGoldMasterBean.mlbrcode= 0;
    collateralsGoldMasterBean.mprdacctid="";


    if (collateralsGoldMasterBean.mcreateddt == null) {
      collateralsGoldMasterBean.mcreateddt = DateTime.now();
    }

    if (collateralsGoldMasterBean.mcreatedby == null ||
        collateralsGoldMasterBean.mcreatedby == '' ||
        collateralsGoldMasterBean.mcreatedby == 'null') {
      collateralsGoldMasterBean.mcreatedby = username;
    }

    collateralsGoldMasterBean.mlastupdatedt = DateTime.now();
    collateralsGoldMasterBean.mgeolocation = geoLocation;
    collateralsGoldMasterBean.mgeologd = geoLongitude;
    collateralsGoldMasterBean.mgeolatd = geoLatitude;

    collateralsGoldMasterBean.missynctocoresys = 0;
    collateralsGoldMasterBean.mlastupdateby = username;
    collateralsGoldMasterBean.mlastsynsdate = null;



    collateralsGoldMasterBean.item=   itemvar ;
    collateralsGoldMasterBean.caratetype= caratetypevar    ;
    collateralsGoldMasterBean.numberofitems= numberofitems    ;
    collateralsGoldMasterBean.weight = weight  ;
    collateralsGoldMasterBean.netweight =netweight;
    collateralsGoldMasterBean.marketvalue =marketvalue;
    collateralsGoldMasterBean.sanction =sanction;
    collateralsGoldMasterBean.lendingamnt =lendingamnt;
    collateralsGoldMasterBean.elegibleamnt =elegibleamnt;
    collateralsGoldMasterBeanList.add(collateralsGoldMasterBean);



    itemvar=  ""    ;
    caratetypevar= ""      ;
    numberofitems= 0     ;
    weight =    0.0  ;
    netweight = 0.0     ;
    marketvalue =  0.0    ;
    sanction =      0.0;
    lendingamnt =     0.0 ;
    elegibleamnt =     0.0 ;

    setState(() {

    });

    //set Rows

    cols2 = [
      new DataColumn(
        label: const Text("Item"),
      ),
      new DataColumn(
        label: const Text("CarateType"),
      ),
      new DataColumn(
        label: const Text("Number oF Items"),
      ),
      new DataColumn(
        label: const Text("Weight"),
      ),
      new DataColumn(
        label: const Text("net Weight"),
      ),
      new DataColumn(
        label: const Text("Market Value"),
      ),
      new DataColumn(
        label: const Text("Sanction"),
      ),
      new DataColumn(
        label: const Text("Lending Amount"),
      ),
      new DataColumn(
        label: const Text("Elegible Amount"),
      ),
    ];

    rows2 = new List.generate(
        collateralsGoldMasterBeanList.length,
            (int a) =>
        new DataRow(
          // selected: selectedIndex.contains(a) ? true : false,
            onSelectChanged: (val) {
            },


            cells: [
              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].item==null  ?"" : collateralsGoldMasterBeanList[a].item.toString())),
              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].caratetype==null || collateralsGoldMasterBeanList[a].caratetype=='null' ? "" :
                  collateralsGoldMasterBeanList[a].caratetype.toString()
                  )),
              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].numberofitems==null || collateralsGoldMasterBeanList[a].numberofitems=='null' ? "" :
                  collateralsGoldMasterBeanList[a].numberofitems.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].weight==null || collateralsGoldMasterBeanList[a].weight=='null' ? "" :
                  collateralsGoldMasterBeanList[a].weight.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].netweight==null || collateralsGoldMasterBeanList[a].netweight=='null' ? "" :
                  collateralsGoldMasterBeanList[a].netweight.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].marketvalue==null || collateralsGoldMasterBeanList[a].marketvalue=='null' ? "" :
                  collateralsGoldMasterBeanList[a].marketvalue.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].sanction==null || collateralsGoldMasterBeanList[a].sanction=='null' ? "" :
                  collateralsGoldMasterBeanList[a].sanction.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].lendingamnt==null || collateralsGoldMasterBeanList[a].lendingamnt=='null' ? "" :
                  collateralsGoldMasterBeanList[a].lendingamnt.toString()
                  )),

              new DataCell(
                  new Text(collateralsGoldMasterBeanList[a].elegibleamnt==null || collateralsGoldMasterBeanList[a].elegibleamnt=='null' ? "" :
                  collateralsGoldMasterBeanList[a].elegibleamnt.toString()
                  )),
            ]));
    setState(() {

    });
  }


  Future<bool> callBackDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to Go To Loan List without saving data'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);

//                CustomerFormationMasterTabsState.applicantDob ="__-__-____";

            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  proceed() async {
    if (!validateSubmit()) {
      return;
    }
    _submitData();

  }

  Future<Null> _submitData() async {
    _successfulSubmit();
  }


  Future<void> _successfulSubmit() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.offline_pin,
              color: Colors.green,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Gold Collatral Submitted Successfully'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  bool validateSubmit() {
    return true;
  }

  void setRowsItemInitials() {

    cols2 = [
      new DataColumn(
        label: const Text("Dummy"),
      ),
      new DataColumn(
        label: const Text("Items"),
      ),
      new DataColumn(
        label: const Text("Dummy"),
      ),
      new DataColumn(
        label: const Text("Items"),
      ),
      new DataColumn(
        label: const Text("Dummy"),
      ),
      new DataColumn(
        label: const Text("Items"),
      ),
      new DataColumn(
        label: const Text("Dummy"),
      ),
      new DataColumn(
        label: const Text("Items"),
      ),
      new DataColumn(
        label: const Text("Dummy"),
      ),



    ];

    rows2 = new List.generate(
        collateralsGoldMasterBeanList.length,
            (int a) =>
        new DataRow(
          // selected: selectedIndex.contains(a) ? true : false,
            onSelectChanged: (val) {
            },


            cells: [
              new DataCell(
                  new Text("")),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
              new DataCell(
                  new Text(""
                  )),
            ]));
  }


}