import 'dart:async';
import 'dart:convert';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/collateral/bean/CollateralBasicSelectionBean.dart';
import 'package:eco_los/screens/collateral/collateralT24/bean/CollateralT24Bean.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/CollateralVehicleMaster.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForSubOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';



class AddCollaterals extends StatefulWidget {
  final collateralsDetailsPassedObject;
  final String LOANUUID;
  final String CUSTUUID;
  final bool isEditAllowed;
  final String mprdCd;

  AddCollaterals({Key key, this.collateralsDetailsPassedObject,this.LOANUUID,this.CUSTUUID,this.isEditAllowed,this.mprdCd}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _AddCollateralsState createState() => new _AddCollateralsState();
}

class _AddCollateralsState extends State<AddCollaterals> {
  static const JsonCodec JSON = const JsonCodec();
  static final GlobalKey<FormState> _formKeyNationalId = new GlobalKey<FormState>();
  SystemParameterBean sysBean = new SystemParameterBean();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  SubLookupForSubPurposeOfLoan subCollrlType = new SubLookupForSubPurposeOfLoan();
  SubLookupForSubPurposeOfLoan subCollrlTypeCat = new SubLookupForSubPurposeOfLoan();
  int selectedSubCollateralPosition = 0;
  int selectedSubCollateralCatPosition = 0;
  String customerName;
  int branch = 0;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;
  //LookupBeanData NationalId;
  CollateralBasicSelectionBean collateralobj = new CollateralBasicSelectionBean();
  LookupBeanData ApplicantType;
  LookupBeanData collatrlTyp;
  LookupBeanData mwthdrwcndtn;
  LookupBeanData collatrlCat;
  LookupBeanData RelationWithApplicant;
  LookupBeanData nameTitle;
  LookupBeanData insurance;
  LookupBeanData colltrlTitle;
  LookupBeanData misappctprimary;
  LookupBeanData mislmap;
  LookupBeanData misexistingcoll;
  bool iexisCollateral=false;
  bool Five=false;
  List mandDocType;



  @override
  void initState() {
    super.initState();
    getSessionVariables();
    setDropDownValues();

  }

  showDropDown(LookupBeanData selectedObj, int no) {

    if(selectedObj.mcodedesc.isEmpty){
      // print("inside  code Desc is null");
      switch (no) {
        case 0:
          ApplicantType = blankBean;
          collateralobj.mapplicanttype=blankBean.mcode;;

          break;
        case 1:
          collatrlTyp = blankBean;
          collateralobj.collatrlTyp=blankBean.mcode;;
          break;
        case 2:
          nameTitle=blankBean;
          collateralobj.nametitle = blankBean.mcode;
          break;
        case 3:
          RelationWithApplicant=blankBean;
          collateralobj.mrelationwithcust = blankBean.mcode;
          break;
        case 4:
          insurance=blankBean;
          collateralobj.insurance = blankBean.mcode;
          break;
        case 5:
          colltrlTitle=blankBean;
          collateralobj.colltrltitle = blankBean.mcode;
          break;
        case 6:
          misappctprimary=blankBean;
          collateralobj.misappctprimary = blankBean.mcode;
          break;
        case 7:
          mislmap=blankBean;
          collateralobj.mislmap = blankBean.mcode;
          break;
        case 8:
          misexistingcoll=blankBean;
         // collateralobj.mislmap = blankBean.mcode;
          break;
          case 9:
            mwthdrwcndtn=blankBean;
             collateralobj.mwthdrwcond = blankBean.mcode;
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
      k < globals.dropdownCaptionsValuesCollateralsInfo[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesCollateralsInfo[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesCollateralsInfo[no][k]);
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
      //   print("coming here");
      switch (no) {
        case 0:
          ApplicantType=value;
          collateralobj.mapplicanttype = value.mcode;
          break;
        case 1:
          collatrlTyp=value;
          collateralobj.collatrlTyp = value.mcode;
          break;
        case 2:
          nameTitle=value;
          collateralobj.nametitle = value.mcode;
          break;
        case 3:
          RelationWithApplicant=value;
          print("value.mcode"+value.mcode.toString());
          collateralobj.mrelationwithcust = value.mcode;
          break;
        case 4:
          insurance=value;
          collateralobj.insurance = value.mcode;
          break;
        case 5:
          colltrlTitle=value;
          collateralobj.colltrltitle =value.mcode;
          break;
        case 6:
          misappctprimary=value;
          collateralobj.misappctprimary = value.mcode;
          print("value.mcode"+ value.mcode.toString());
          if(value.mcode=='2') {
            getPrimaryApplicantName();
          }
          break;
        case 7:
          mislmap=value;
          collateralobj.mislmap =value.mcode;
          break;
        case 8:
          misexistingcoll=value;
          if(value.mcode=='2') {
            iexisCollateral = true;
          }else{
            iexisCollateral = false;
          }
          // collateralobj.mislmap = blankBean.mcode;
          break;
        case 9:
          mwthdrwcndtn=value;
          if(value.mcode=='5') {
            Five = true;
          }else{
            Five = false;
          }
          collateralobj.mwthdrwcond =value.mcode;
          collateralobj.mwithdrawcond =value.mcodedesc;
          break;
        default:
          break;
      }
    });
  }
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);
  List<DropdownMenuItem<LookupBeanData>>  generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralsInfo[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCollateralsInfo[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      bool isMand = false;
      if(mandDocType!=null && mandDocType.length>0 && mandDocType.contains(value.mcode)){
        isMand=true;
      }

      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(
          value.mcodedesc,
          style:new TextStyle(
              fontWeight: FontWeight.bold,
              color: isMand?Colors.red:Colors.black,
              fontStyle: FontStyle.normal),),
      );
    }).toList();

    return _dropDownMenuItems1;
  }
  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    if (widget.collateralsDetailsPassedObject != null) {
      collateralobj = widget.collateralsDetailsPassedObject;
    }

    if(widget.LOANUUID!="null"||widget.LOANUUID!=""||widget.LOANUUID!=null){
      collateralobj.LOANUUID=widget.LOANUUID;
    }

    if(widget.CUSTUUID!="null"||widget.CUSTUUID!=""||widget.CUSTUUID!=null){
      collateralobj.CUSTUUID=widget.CUSTUUID;
    }


    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode);
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation=  prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude  = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
      reportingUser= prefs.getString(TablesColumnFile.reportingUser);
    });

    if (widget.mprdCd != null && widget.mprdCd != "null" &&
        widget.mprdCd != "") {
      await AppDatabase.get()
          .getProductOnPrdCd(30, branch, widget.mprdCd)
          .then((ProductBean response) async {

        if(response.mmandoctype!=null && response.mmandoctype!="null" && response.mmandoctype!='' ) {
          mandDocType = response.mmandoctype.toString().split(",");

        }
      });
    }


  }




  Future<bool> callDialog() {
    globals.Dialog.onPop(
        context,
        Translations.of(context).text('rusre'),
        Translations.of(context).text('gur'),
        "gggggg");
  }


  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () {
          callDialog();
        },
        child: new Scaffold(
          key: _scaffoldKey,
        //  resizeToAvoidBottomInset: false,
          appBar: new AppBar(
            elevation: 1.0,
            leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  callDialog();

                }
            ),
            backgroundColor: Color(0xff07426A),
            brightness: Brightness.light,
            title: new Text(
              'Collaterals Details',
              //textDirection: TextDirection,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.normal),
            ),
            actions: <Widget>[
          widget.isEditAllowed?new IconButton(
                icon: new Icon(
                  Icons.save,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: () {
                  proceed();
                },
              ):new Container(),
              new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
              ),
            ],
          ),
          body: new Form(
            key: _formKey,
            autovalidate: false,
            onWillPop: () {
              return Future(() => true);
            },
            onChanged: () async {
              final FormState form = _formKey.currentState;
              form.save();
              //await calculate();

            },
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              children: <Widget>[
                //TODO

                iexisCollateral?Container(
                    decoration:
                    BoxDecoration(color: Constant.mandatoryColor),
                    child: new Stack(
                      alignment: const Alignment(1.02, 0.0),
                      children: <Widget>[
                    new Container(
                    color: Constant.mandatoryColor,
                      child: new TextFormField(
                        decoration:  InputDecoration(
                          hintText: Translations.of(context).text('EntrCollbkno'),
                          labelText: Translations.of(context).text('Collbkno'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
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
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(10),
                          globals.onlyIntNumber
                        ],


                        controller:
                        collateralobj !=null && collateralobj.mcollbookno !=null
                            ? TextEditingController(
                            text: collateralobj.mcollbookno
                        )
                            : TextEditingController(
                            text: ""),
                        onSaved: (String value) {
                          try {
                            collateralobj.mcollbookno = value;
                          } catch (_) {}
                        },
                      ),
                    ),
                        new RaisedButton(
                          color: Color(0xff01579b),
                          elevation: 20.0,
                          child: new Text(
                            "Fetch Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.only(bottom: 0.0),
                          onPressed: () async{
                            await _fetchData();
                            },
                        ),
                      ],
                    )):new Container(),


                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: mislmap,
                    items: generateDropDown(7),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 7);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('ISLMAP')),
                  ),),

                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: misappctprimary,
                    items: generateDropDown(6),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 6);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('IsApplPrmry')),
                  ),),


                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: ApplicantType,
                    items: generateDropDown(0),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 0);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('PrimSec')),
                  ),),


                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: collatrlTyp,
                    items: generateDropDown(1),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 1);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('collateral_type')),
                  ),),
                new Card(
                  color: Constant.mandatoryColor,
                  child: new ListTile(
                      title: new Text(Translations.of(context).text('collateral_sub_type')),
                      subtitle: collateralobj.msubocolltrldesc == null
                          ? new Text("")
                          : new Text("Collateral Sub Type : ${collateralobj.msubocolltrldesc}   And Code : ${collateralobj.msubcolltrl}"),
                      onTap: () => getSubCollatrl("subCollatrlType",
                           int.parse(collateralobj.collatrlTyp!=null && collateralobj.collatrlTyp.toString()!='null'?collateralobj.collatrlTyp:0))),
                ),

                new Card(
                  color: Constant.mandatoryColor,
                  child: new ListTile(
                      title: new Text(Translations.of(context).text('CollCat')),
                      subtitle: collateralobj.msubocolltrlcatdesc == null
                          ? new Text("")
                          : new Text("Collateral Category: ${collateralobj.msubocolltrlcatdesc}   And Code : ${collateralobj.msubcolltrlcat}"),
                      onTap: () => getSubCollatrlCat("subCollatrlTypeCat",
                           int.parse(collateralobj.msubcolltrl!=null && collateralobj.msubcolltrl.toString()!='null'?collateralobj.msubcolltrl:0))),

                ),




                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: nameTitle,
                    items: generateDropDown(2),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 2);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('NmTtl')),
                  ),),
            new Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrFrstnm'),
                      labelText: Translations.of(context).text('Frstnm'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),


                    controller:
                    collateralobj !=null && collateralobj.mfname !=null
                        ? TextEditingController(
                        text: collateralobj.mfname
                    )
                        : TextEditingController(
                        text: ""),
                    inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],


                    onSaved: (String value) {

                      if (value.isNotEmpty &&
                          value != "" &&
                          value != null &&
                          value != 'null') {
                        collateralobj.mfname = (value);
                      }
                      // cusLoanObj.mloanamtdisbd = cusLoanObj.mappldloanamt;
                      // cusLoanObj.mapprvdloanamt = cusLoanObj.mappldloanamt;
                    }),
            ),
                SizedBox(height: 16.0),


                new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('Entrmddlnm'),
                      labelText: Translations.of(context).text('Mddlnm'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                    controller:
                    collateralobj !=null && collateralobj.mmname !=null
                        ? TextEditingController(
                        text: collateralobj.mmname
                    )
                        : TextEditingController(
                        text: ""),

                    onSaved: (String value) {

                      if (value.isNotEmpty &&
                          value != "" &&
                          value != null &&
                          value != 'null') {
                        collateralobj.mmname = (value);
                      }
                      // cusLoanObj.mloanamtdisbd = cusLoanObj.mappldloanamt;
                      // cusLoanObj.mapprvdloanamt = cusLoanObj.mappldloanamt;
                    }),
            new Container(
              color: Constant.mandatoryColor,
              child:
                new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                   //   color: Constant.mandatoryColor,
                      hintText: Translations.of(context).text('Entrlstnm'),
                      labelText: Translations.of(context).text('Lstnm'),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                      contentPadding: EdgeInsets.all(20.0),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                    controller:
                    collateralobj !=null && collateralobj.mlname !=null
                        ? TextEditingController(
                        text: collateralobj.mlname
                    )
                        : TextEditingController(
                        text: ""),
                   
                    onSaved: (String value) {

                      if (value.isNotEmpty &&
                          value != "" &&
                          value != null &&
                          value != 'null') {
                        collateralobj.mlname = (value);
                      }
                      // cusLoanObj.mloanamtdisbd = cusLoanObj.mappldloanamt;
                      // cusLoanObj.mapprvdloanamt = cusLoanObj.mappldloanamt;
                    }),),

                SizedBox(height: 16.0),
                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: RelationWithApplicant,
                    items: generateDropDown(3),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 3);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('RelatonShpwthappl')),
                  ),),
                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: insurance,
                    items: generateDropDown(4),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 4);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('insurance')),
                  ),),

                Card(
                  color: Constant.mandatoryColor,

                  child: new DropdownButtonFormField(
                    value: colltrlTitle,
                    items: generateDropDown(5),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 5);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('CollTtle')),
                  ),),


                new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrNmttlDoc'),
                        labelText: Translations.of(context).text('NmttleDoc'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
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
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(50),
                        globals.onlyCharacter
                      ],

                      controller:
                      collateralobj !=null && collateralobj.mnameoftitledoc !=null
                          ? TextEditingController(
                          text: collateralobj.mnameoftitledoc
                      )
                          : TextEditingController(
                          text: ""),
                      onSaved: (String value) {
                        try {
                          collateralobj.mnameoftitledoc = value;
                        } catch (_) {}
                      },
                      ),
                ),

                new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrCollbkno'),
                        labelText: Translations.of(context).text('Collbkno'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
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
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),
                        globals.onlyIntNumber
                      ],


                      controller:
                      collateralobj !=null && collateralobj.mcollbookno !=null
                          ? TextEditingController(
                          text: collateralobj.mcollbookno
                      )
                          : TextEditingController(
                          text: ""),
                      onSaved: (String value) {
                        try {
                          collateralobj.mcollbookno = value;
                        } catch (_) {}
                      },
                  ),
                ),

                new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrCollPgeno'),
                        labelText: Translations.of(context).text('Colltrlpgeno'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
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
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),
                        globals.onlyIntNumber
                      ],

                      controller:
                      collateralobj !=null && collateralobj.mcollpageno !=null
                          ? TextEditingController(
                          text: collateralobj.mcollpageno
                      )
                          : TextEditingController(
                          text: ""),
                      onSaved: (String value) {
                        try {
                          collateralobj.mcollpageno = value;
                        } catch (_) {}
                      },
                      ),
                ),

                new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrAttch'),
                        labelText: Translations.of(context).text('NoOfAttchmnt'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
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
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),
                        globals.onlyIntNumber
                      ],

                      controller:
                      collateralobj !=null && collateralobj.mnoofattchmnt !=null
                          ? TextEditingController(
                          text: collateralobj.mnoofattchmnt
                      )
                          : TextEditingController(
                          text: ""),
                      onSaved: (String value) {
                        try {
                          collateralobj.mnoofattchmnt = value;
                        } catch (_) {}
                      },),
                ),

                new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                      decoration:  InputDecoration(
                        hintText: Translations.of(context).text('EntrPlceOfUse'),
                        labelText: Translations.of(context).text('PlceOfUse'),
                        hintStyle: TextStyle(color: Colors.grey),
                        /*labelStyle: TextStyle(color: Colors.grey),*/
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
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(50),
                        globals.onlyAphaNumeric
                      ],

                      controller:
                      collateralobj !=null && collateralobj.mplaceofuse !=null
                          ? TextEditingController(
                          text: collateralobj.mplaceofuse
                      )
                          : TextEditingController(
                          text: ""),
                      onSaved: (String value) {
                        try {
                          collateralobj.mplaceofuse = value;
                        } catch (_) {}
                      },
                      ),
                ),
                Card(
                  color: Constant.mandatoryColor,
                  child: new DropdownButtonFormField(
                    value: mwthdrwcndtn,
                    items: generateDropDown(9),
                    onChanged: (LookupBeanData newValue){
                      showDropDown(newValue, 9);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('wthdrw')),
                  ),),
                Five? new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                    decoration:  InputDecoration(
                      hintText: " Enter Withdrawal Condition",
                      labelText: "Withdrawal Condition",
                      hintStyle: TextStyle(color: Colors.grey),
                      /*labelStyle: TextStyle(color: Colors.grey),*/
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
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(65),
                      globals.onlyAphaNumeric
                    ],
                    controller:
                    collateralobj !=null && collateralobj.mwithdrawcond !=null
                        ? TextEditingController(
                        text: collateralobj.mwithdrawcond
                    )
                        : TextEditingController(
                        text: ""),
                    onSaved: (String value) {
                      try {
                        collateralobj.mwithdrawcond = value;
                      } catch (_) {}
                    },
                  ),
                ): new Container(
                  color: Constant.mandatoryColor,
                  child: new TextFormField(
                    enabled: false,
                    decoration:  InputDecoration(
                      hintText: " Enter Withdrawal Condition",
                      labelText: "Withdrawal Condition",
                      hintStyle: TextStyle(color: Colors.grey),
                      /*labelStyle: TextStyle(color: Colors.grey),*/
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
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(65),
                      globals.onlyAphaNumeric
                    ],

                    controller:
                    collateralobj !=null && collateralobj.mwithdrawcond !=null
                        ? TextEditingController(
                        text: collateralobj.mwithdrawcond
                    )
                        : TextEditingController(
                        text: ""),
                    onSaved: (String value) {
                      try {
                        collateralobj.mwithdrawcond = value;
                      } catch (_) {}
                    },
                  ),
                ),
                new Card(
                  child: new ListTile(
                    title: new Text(Translations.of(context).text('coll_right_id')),
                    subtitle: new Text(
                      "${collateralobj.mcollrightid.toString() != null && collateralobj.mcollrightid.toString() != 'null' ?collateralobj.mcollrightid.toString() : ""}",
                    ),
                  ),
                ),
                new Card(
                  child: new ListTile(
                    title: new Text(Translations.of(context).text('coll_create_id')),
                    subtitle: new Text(
                      "${collateralobj.mollcreateid.toString() != null && collateralobj.mollcreateid.toString() != 'null' ?collateralobj.mollcreateid.toString() : ""}",
                    ),
                  ),
                ),
                new Card(
                  child: new ListTile(
                    title: new Text(Translations.of(context).text('Sub_prod_lim_id')),
                    subtitle: new
                    Text(
                      "${collateralobj.msubprodlimitid.toString() != null && collateralobj.msubprodlimitid.toString() != 'null' ?collateralobj.msubprodlimitid.toString() : ""}",
                    ),
                  ), )
              ],
            ),
          ),
        ))
    ;
  }
  proceed()  async{
    if (!validateSubmit()) {
      return;
    }
  _successfulSubmit();
  }

  submitCollateralAndRoute() async{

    collateralobj.mlastupdatedt = DateTime.now();
    collateralobj.mlastupdateby = username;
    if (collateralobj.mflag == null||collateralobj.mflag == ""||collateralobj.mflag == "null") {
      collateralobj.mflag = 'N';
    }

    if (collateralobj.mcreateddt == null) {
      collateralobj.mcreateddt = DateTime.now();
    }

    if (collateralobj.mcreatedby == null ||
        collateralobj.mcreatedby == '' ||
        collateralobj.mcreatedby == 'null') {
      collateralobj.mcreatedby = username;
    }



    collateralobj.mgeolocation = geoLocation;
    collateralobj.mgeologd = geoLongitude;
    collateralobj.mgeolatd = geoLatitude;

    if(collateralobj.UUID!=null){
      Map collJsonData =  await CollateralBasicSelectionBean.toCollaateralsJson(collateralobj);
      String collData = JSON.encode(collJsonData).toString();
      await AppdatabaseV2.get().updateCollaterals(collateralobj,collData,collateralobj.UUID)
          .then((onValue) {
      });

    }else{
      var uuid = Uuid();
      collateralobj.UUID=uuid.v4();
      //custListBean.riskratingsentity=null;
      Map collJsonData =  await CollateralBasicSelectionBean.toCollaateralsJson(collateralobj);
      String collData = JSON.encode(collJsonData).toString();
      await AppdatabaseV2.get().insertCollateralsMaster(collateralobj,collData)
          .then((onValue) {

      });

    }



    if(collateralobj.collatrlTyp =='33'){
        //Rem
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
            new CollateralsREMMaster(
              collateralPassedObject:collateralobj ,
              collateralREMPassedObject:collateralobj.collateralREMlandandhouseBean ,
                routeType:null,

            )), //When Authorized Navigate to the next screen
      );

      //CollateralsREMMaster
    }else if(collateralobj.collatrlTyp =='34'){
      //Vehh
      Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) =>
            new CollateralVehicleMaster(
              collateralPassedObject:collateralobj ,
              collateralVehiclePassedObject:collateralobj.collateralVehicleBean ,
              routeType:null,

            )), //When Authorized Navigate to the next screen
      );
    }
    // else if(collateralobj.collatrlTyp =='45'){
    //
    // }
    // else if(collateralobj.collatrlTyp =='35'){
    //  // _successfulSubmitcollbasic();
    //
    // }



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
                  Text(Translations.of(context).text('press')),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(Translations.of(context).text('next')),
                onPressed: () async{
                  await submitCollateralAndRoute();
                },
              ),
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> _showAlert(arg, error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$arg error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(Translations.of(context).text('ok')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool validateSubmit() {

    if (collateralobj.collatrlTyp == "" || collateralobj.collatrlTyp== null) {
      _showAlert("Collateral Type ", "It is Mandatory");
      return false;
    }
    if (collateralobj.msubocolltrldesc == "" || collateralobj.msubocolltrldesc== null) {
      _showAlert("Collateral Sub Type ", "It is Mandatory");
      return false;
    }
    if (collateralobj.msubocolltrlcatdesc == "" || collateralobj.msubocolltrlcatdesc== null) {
      _showAlert("Collateral Category ", "It is Mandatory");
      return false;
    }

    if (collateralobj.mapplicanttype == "" || collateralobj.mapplicanttype== null) {
      _showAlert("Applicant Type ", "It is Mandatory");
      return false;
    }

    if (collateralobj.mrelationwithcust == "" || collateralobj.mrelationwithcust== null) {
      _showAlert("Relation With Customer", "It is Mandatory");
      return false;
    }

    return true;

  }

  Future getSubCollatrl(String purposeMode, int selectedPosition) async {
    subCollrlType = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForSubOccupationSelection(type:"Collateral Sub Type",basicCode: 6000,position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      collateralobj.msubocolltrldesc = purposeObjVal.codeDesc;
      collateralobj.msubcolltrl= (purposeObjVal.code.trim());
    });

  }



  Future getSubCollatrlCat(String purposeMode, int selectedPosition) async {
    subCollrlType = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForSubOccupationSelection(type:"Collateral Category",basicCode: 7000,position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      collateralobj.msubocolltrlcatdesc = purposeObjVal.codeDesc;
      collateralobj.msubcolltrlcat= (purposeObjVal.code.trim());
    });

  }

  void getPrimaryApplicantName() {


  }

  _fetchData() async{

   await getMiddleWareData();
  }

  getMiddleWareData() async {
    Utility obj = new Utility();
    final _headers = {'Content-Type': 'application/json'};
    var urlGetCustomerDetails = "collateralBasicSelectionData/getCollateralOnCollId/";

    //try {
      String json = _toJson();
      String bodyValue = await NetworkUtil.callPostService(
          json.toString(),
          Constant.apiURL.toString() + urlGetCustomerDetails.toString(),
          _headers);
      if (bodyValue == "404") {
        _showAlert(Translations.of(context).text('CollNtPrsntWthID'), "");
      } else {
        print(bodyValue);
        //final parsed = JSON.decode(bodyValue).cast<String, dynamic>();
        Map<String, dynamic> map = JSON.decode(bodyValue);
        if(map==null){
          _showAlert(Translations.of(context).text('CollNtPrsntWthID'), "");
        }

        try{
         fromMapMiddlewareSetCollateral(map, true);
         setState(() {});
        } catch (_) {
          _showAlert(Translations.of(context).text('CollNtPrsntWthID'), "");
        }


      }
    /*} catch (_) {
      _showAlert(Translations.of(context).text('CollNtPrsntWthID'), "");
    }*/
  }



  fromMapMiddlewareSetCollateral(Map<String, dynamic> map, bool param1) {
    collateralobj.isFethMode =true;

    collateralobj.mcollstatus=	map[TablesColumnFile.mcollstatus] as String;
    collateralobj.msrno=	map[TablesColumnFile.msrno] as int;
    collateralobj.mapplicanttype=	map[TablesColumnFile.mapplicanttype] as String;
    collateralobj.mwthdrwcond=	map[TablesColumnFile.mwthdrwcond] as String;
    collateralobj.collatrlTyp=map[TablesColumnFile.mcollatrlTyp] as String;
    collateralobj.mcustno=	map[TablesColumnFile.mcustno] as int;
    collateralobj.mrelationwithcust=	map[TablesColumnFile.mrelationwithcust] as String;
    collateralobj.mrelationsince=	map[TablesColumnFile.mrelationsince] as int;
    collateralobj.mfname= map[TablesColumnFile.mfname] as String;
    collateralobj.mmname= map[TablesColumnFile.mmname] as String;
    collateralobj.mlname= map[TablesColumnFile.mlname] as String;
    collateralobj.msubcolltrl= map[TablesColumnFile.msubcolltrl] as String;
    collateralobj.msubocolltrldesc= map[TablesColumnFile.msubocolltrldesc] as String;
    collateralobj.msubcolltrlcat= map[TablesColumnFile.msubcolltrlcat] as String;
    collateralobj.msubocolltrlcatdesc= map[TablesColumnFile.msubocolltrlcatdesc] as String;
    collateralobj.collatrlcat= map[TablesColumnFile.mcollatrlcat] as String;
    //relationwithapplicant= map[TablesColumnFile.mrelationwithapplicant] as String;
    collateralobj.nametitle= map[TablesColumnFile.mnametitle] as String;
    collateralobj.insurance= map[TablesColumnFile.minsurance] as String;
    collateralobj.colltrltitle= map[TablesColumnFile.mcolltrltitle] as String;
    collateralobj.mnameoftitledoc= map[TablesColumnFile.mnameoftitledoc] as String;
    collateralobj.mcollbookno= map[TablesColumnFile.mcollbookno] as String;
    collateralobj.mcollpageno= map[TablesColumnFile.mcollpageno] as String;
    collateralobj.mplaceofuse= map[TablesColumnFile.mplaceofuse] as String;
    collateralobj.mwithdrawcond= map[TablesColumnFile.mwithdrawcond] as String;
    collateralobj.mcollateralsid= map[TablesColumnFile.mcollateralsid] as String;
    collateralobj.mflag= map[TablesColumnFile.mflag] as String;
    collateralobj.mcollrightid= map[TablesColumnFile.mcollrightid] as String;
    collateralobj.mollcreateid= map[TablesColumnFile.mollcreateid] as String;
    collateralobj.msubprodlimitid= map[TablesColumnFile.msubprodlimitid] as String;
    collateralobj.missynctocoresys= map[TablesColumnFile.missynctocoresys] as int;
    collateralobj.misappctprimary= map[TablesColumnFile.misappctprimary] as String;
    collateralobj.mislmap= map[TablesColumnFile.mislmap] as String;
    collateralobj.mnoofattchmnt= map[TablesColumnFile.mnoofattchmnt] as String;

    setDropDownValues();
    setRemValues(map);
    setVehValues(map);
    setCollT24Values(map);


  }

  String _toJson() {

    var mapData = new Map();
    mapData["mcollbookno"] = collateralobj.mcollbookno;

    String json = JSON.encode(mapData);
    print("mapDatat >>>>>>>>>>>>>>>> ${json}");
    return json;
  }

  void setRemValues(Map<String, dynamic> map) {

    collateralobj.collateralREMlandandhouseBean =  new CollateralREMlandandhouseBean();
    collateralobj.collateralREMlandandhouseBean.mlbrcode=	map[TablesColumnFile.mlbrcode] as int;
    collateralobj.collateralREMlandandhouseBean.mprdacctid=	map[TablesColumnFile.mprdacctid] as String;
    collateralobj.collateralREMlandandhouseBean.mtitle=	map[TablesColumnFile.mtitle] as String;
    collateralobj.collateralREMlandandhouseBean.mfname=	map[TablesColumnFile.mfname] as String;
    collateralobj.collateralREMlandandhouseBean.mmname=	map[TablesColumnFile.mmname] as String;
    collateralobj.collateralREMlandandhouseBean.mlname=	map[TablesColumnFile.mlname] as String;
    collateralobj.collateralREMlandandhouseBean.maddress1=	map[TablesColumnFile.maddress1] as String;
    collateralobj.collateralREMlandandhouseBean.maddress2=	map[TablesColumnFile.maddress2] as String;
    collateralobj.collateralREMlandandhouseBean.mcountry=	map[TablesColumnFile.mcountry] as String;
    collateralobj.collateralREMlandandhouseBean.mstate=	map[TablesColumnFile.mstate] as String;
    collateralobj.collateralREMlandandhouseBean.mdist=	map[TablesColumnFile.mdist] as String;
    collateralobj.collateralREMlandandhouseBean.msubdist=	map[TablesColumnFile.msubdist] as String;
    collateralobj.collateralREMlandandhouseBean.marea=	map[TablesColumnFile.marea] as String;
    collateralobj.collateralREMlandandhouseBean.mpoboxno=	map[TablesColumnFile.mpoboxno] as int;
    collateralobj.collateralREMlandandhouseBean.mhousebuilttype=	map[TablesColumnFile.mhousebuilttype] as String;
    collateralobj.collateralREMlandandhouseBean.menvdescription=	map[TablesColumnFile.menvdescription] as String;
    collateralobj.collateralREMlandandhouseBean.mlotarea=	map[TablesColumnFile.mlotarea] as double;
    collateralobj.collateralREMlandandhouseBean.mfloorarea=	map[TablesColumnFile.mfloorarea] as double;
    collateralobj.collateralREMlandandhouseBean.mdescofproperty=	map[TablesColumnFile.mdescofproperty] as String;
    collateralobj.collateralREMlandandhouseBean.msizeofproperty=	map[TablesColumnFile.msizeofproperty] as String;
    collateralobj.collateralREMlandandhouseBean.msizeofpropertyl=	map[TablesColumnFile.msizeofpropertyl] as String;
    collateralobj.collateralREMlandandhouseBean.msizeofpropertyh=	map[TablesColumnFile.msizeofpropertyh] as String;
    collateralobj.collateralREMlandandhouseBean.mtctno=	map[TablesColumnFile.mtctno] as int;
    collateralobj.collateralREMlandandhouseBean.msrno=	map[TablesColumnFile.msrno] as int;
    collateralobj.collateralREMlandandhouseBean.mregdate= (map[TablesColumnFile.mregdate]=="null"||map[TablesColumnFile.mregdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregdate]) as DateTime;
    collateralobj.collateralREMlandandhouseBean.mepebdate= (map[TablesColumnFile.mepebdate]=="null"||map[TablesColumnFile.mepebdate]==null)?null:DateTime.parse(map[TablesColumnFile.mepebdate]) as DateTime;
    collateralobj.collateralREMlandandhouseBean.mrescodeorremark=	map[TablesColumnFile.mrescodeorremark] as String;
    collateralobj.collateralREMlandandhouseBean.mepebno=	map[TablesColumnFile.mepebno] as int;
    collateralobj.collateralREMlandandhouseBean.mregofdeedslocation=	map[TablesColumnFile.mregofdeedslocation] as String;

    collateralobj.collateralREMlandandhouseBean.mcollno=	map[TablesColumnFile.mcollno] as int;
    collateralobj.collateralREMlandandhouseBean.mpriorsec=	map[TablesColumnFile.mpriorsec] as String;
    collateralobj.collateralREMlandandhouseBean.mcolltype=	map[TablesColumnFile.mcolltype] as String;
    collateralobj.collateralREMlandandhouseBean.mcollsubtype=	map[TablesColumnFile.mcollsubtype] as String;
    collateralobj.collateralREMlandandhouseBean.mtypeofproperty=	map[TablesColumnFile.mtypeofproperty] as String;
    collateralobj.collateralREMlandandhouseBean.mltypeofownercerti=	map[TablesColumnFile.mltypeofownercerti] as String;
    collateralobj.collateralREMlandandhouseBean.mhtypeofownercerti=	map[TablesColumnFile.mhtypeofownercerti] as String;
    collateralobj.collateralREMlandandhouseBean.mlissuednoprop=	map[TablesColumnFile.mlissuednoprop] as String;
    collateralobj.collateralREMlandandhouseBean.mhissuednoprop=	map[TablesColumnFile.mhissuednoprop] as String;
    collateralobj.collateralREMlandandhouseBean.mlissueby=	map[TablesColumnFile.mlissueby] as String;
    collateralobj.collateralREMlandandhouseBean.mhissueby=	map[TablesColumnFile.mhissueby] as String;
    collateralobj.collateralREMlandandhouseBean.mlsizeprop=	map[TablesColumnFile.mlsizeprop] as String;
    collateralobj.collateralREMlandandhouseBean.mhsizeprop=	map[TablesColumnFile.mhsizeprop] as String;
    collateralobj.collateralREMlandandhouseBean.mlnpropborder=	map[TablesColumnFile.mlnpropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mhnpropborder=	map[TablesColumnFile.mhnpropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mlspropborder=	map[TablesColumnFile.mlspropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mhspropborder=	map[TablesColumnFile.mhspropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mlwpropborder=	map[TablesColumnFile.mlwpropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mhwpropborder=	map[TablesColumnFile.mhwpropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mlepropborder=	map[TablesColumnFile.mlepropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mhepropborder=	map[TablesColumnFile.mhepropborder] as String;
    collateralobj.collateralREMlandandhouseBean.mllocprop=	map[TablesColumnFile.mllocprop] as String;
    collateralobj.collateralREMlandandhouseBean.mhlocprop=	map[TablesColumnFile.mhlocprop] as String;
    collateralobj.collateralREMlandandhouseBean.mltitleowener=	map[TablesColumnFile.mltitleowener] as String;
    collateralobj.collateralREMlandandhouseBean.mhtitleowener=	map[TablesColumnFile.mhtitleowener] as String;
    collateralobj.collateralREMlandandhouseBean.mllocalauthvalue=	map[TablesColumnFile.mllocalauthvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mhlocalauthvalue=	map[TablesColumnFile.mhlocalauthvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mlrealestatecmpnyvalue=	map[TablesColumnFile.mlrealestatecmpnyvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mhrealestatecmpnyvalue=	map[TablesColumnFile.mhrealestatecmpnyvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mlaskneighonvalue=	map[TablesColumnFile.mlaskneighonvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mhaskneighonvalue=	map[TablesColumnFile.mhaskneighonvalue] as double;
    collateralobj.collateralREMlandandhouseBean.mlsumonvalprop=	map[TablesColumnFile.mlsumonvalprop] as double;
    collateralobj.collateralREMlandandhouseBean.mhsumonvalprop=	map[TablesColumnFile.mhsumonvalprop] as double;
    collateralobj.collateralREMlandandhouseBean.mlissuedt=(map[TablesColumnFile.mlissuedt]=="null"||map[TablesColumnFile.mlissuedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlissuedt]) as DateTime;
    collateralobj.collateralREMlandandhouseBean.mhissuedt=(map[TablesColumnFile.mhissuedt]=="null"||map[TablesColumnFile.mhissuedt]==null)?null:DateTime.parse(map[TablesColumnFile.mhissuedt]) as DateTime;
  }

  void setVehValues(Map<String, dynamic> map) {
    collateralobj.collateralVehicleBean =  new CollateralVehicleBean();

    collateralobj.collateralVehicleBean.mbusinessname=	map[TablesColumnFile.mbusinessname] as String;
    collateralobj.collateralVehicleBean.mownername=	map[TablesColumnFile.mownername] as String;
    collateralobj.collateralVehicleBean.mtel=	map[TablesColumnFile.mtel] as String;
    collateralobj.collateralVehicleBean.maddress1=	map[TablesColumnFile.maddress1] as String;
    collateralobj.collateralVehicleBean.maddress2=	map[TablesColumnFile.maddress2] as String;
    collateralobj.collateralVehicleBean.mcountry=	map[TablesColumnFile.mcountry] as String;
    collateralobj.collateralVehicleBean.mstate=	map[TablesColumnFile.mstate] as String;
    collateralobj.collateralVehicleBean.mdist=	map[TablesColumnFile.mdist] as String;
    collateralobj.collateralVehicleBean.msubdist=	map[TablesColumnFile.msubdist] as String;
    collateralobj.collateralVehicleBean.marea=	map[TablesColumnFile.marea] as String;
    collateralobj.collateralVehicleBean.mvillage=	map[TablesColumnFile.mvillage] as String;
    collateralobj.collateralVehicleBean.mbrand=	map[TablesColumnFile.mbrand] as String;
    collateralobj.collateralVehicleBean.mnoofaxles=	map[TablesColumnFile.mnoofaxles] as int;
    collateralobj.collateralVehicleBean.mtype=	map[TablesColumnFile.mtype] as String;
    collateralobj.collateralVehicleBean.mnoofcylinder=	map[TablesColumnFile.mnoofcylinder] as int;
    collateralobj.collateralVehicleBean.mcolor=	map[TablesColumnFile.mcolor] as String;
    collateralobj.collateralVehicleBean.msizeofcylinder=	map[TablesColumnFile.msizeofcylinder] as int;
    collateralobj.collateralVehicleBean.mbodyno=	map[TablesColumnFile.mbodyno] as String;
    collateralobj.collateralVehicleBean.menginepower=	map[TablesColumnFile.menginepower] as double;
    collateralobj.collateralVehicleBean.mengineno=	map[TablesColumnFile.mengineno] as String;
    collateralobj.collateralVehicleBean.myearmade=	map[TablesColumnFile.myearmade] as int;
    collateralobj.collateralVehicleBean.mchassisno=	map[TablesColumnFile.mchassisno] as String;
    collateralobj.collateralVehicleBean.mmadeby=	map[TablesColumnFile.mmadeby] as String;
    collateralobj.collateralVehicleBean.midentitycarno=	map[TablesColumnFile.midentitycarno] as String;
    collateralobj.collateralVehicleBean.mcarpricing=	map[TablesColumnFile.mcarpricing] as double;
    collateralobj.collateralVehicleBean.mstdpricing=	map[TablesColumnFile.mstdpricing] as double;
    collateralobj.collateralVehicleBean.minsurancepricing=	map[TablesColumnFile.minsurancepricing] as double;
    collateralobj.collateralVehicleBean.mpriceafterevaluation=	map[TablesColumnFile.mpriceafterevaluation] as double;
    collateralobj.collateralVehicleBean.mltv=	map[TablesColumnFile.mltv] as double;
    collateralobj.collateralVehicleBean.mcartype=	map[TablesColumnFile.mcartype] as String;
    collateralobj.collateralVehicleBean.mltvdd=	map[TablesColumnFile.mltvdd] as String;
    collateralobj.collateralVehicleBean.mloantovalueltv=	map[TablesColumnFile.mloantovalueltv] as String;
    collateralobj.collateralVehicleBean.mwhobelongocarowner=	map[TablesColumnFile.mwhobelongocarowner] as String;
    collateralobj.collateralVehicleBean.mcarlegality=	map[TablesColumnFile.mcarlegality] as int;
    collateralobj.collateralVehicleBean.mreason=	map[TablesColumnFile.mreason] as String;
    collateralobj.collateralVehicleBean.mdescription=	map[TablesColumnFile.mdescription] as String;
    collateralobj.collateralVehicleBean.mcarcanbeused=	map[TablesColumnFile.mcarcanbeused] as String;
    collateralobj.collateralVehicleBean.mcredittenor=	map[TablesColumnFile.mcredittenor] as String;
    collateralobj.collateralVehicleBean.mdmirror=	map[TablesColumnFile.mdmirror] as String;
    collateralobj.collateralVehicleBean.mddoor=	map[TablesColumnFile.mddoor] as String;
    collateralobj.collateralVehicleBean.mdmirrorbacklock=	map[TablesColumnFile.mdmirrorbacklock] as String;
    collateralobj.collateralVehicleBean.mdcolororspot=	map[TablesColumnFile.mdcolororspot] as String;
    collateralobj.collateralVehicleBean.mfcolorandspot=	map[TablesColumnFile.mfcolorandspot] as String;
    collateralobj.collateralVehicleBean.mftireandyan=	map[TablesColumnFile.mftireandyan] as String;
    collateralobj.collateralVehicleBean.mfcapofsplatter=	map[TablesColumnFile.mfcapofsplatter] as String;
    collateralobj.collateralVehicleBean.mhmirror=	map[TablesColumnFile.mhmirror] as String;
    collateralobj.collateralVehicleBean.mhvent=	map[TablesColumnFile.mhvent] as String;
    collateralobj.collateralVehicleBean.mhlightfarl=	map[TablesColumnFile.mhlightfarl] as String;
    collateralobj.collateralVehicleBean.mhlightfarr=	map[TablesColumnFile.mhlightfarr] as String;
    collateralobj.collateralVehicleBean.mhsignal=	map[TablesColumnFile.mhsignal] as String;
    collateralobj.collateralVehicleBean.mhwincap=	map[TablesColumnFile.mhwincap] as String;
    collateralobj.collateralVehicleBean.mhheadcap=	map[TablesColumnFile.mhheadcap] as String;
    collateralobj.collateralVehicleBean.mpmirror=	map[TablesColumnFile.mpmirror] as String;
    collateralobj.collateralVehicleBean.mpdoor=	map[TablesColumnFile.mpdoor] as String;
    collateralobj.collateralVehicleBean.mpbackmirror=	map[TablesColumnFile.mpbackmirror] as String;
    collateralobj.collateralVehicleBean.mpcolororspot=	map[TablesColumnFile.mpcolororspot] as String;
    collateralobj.collateralVehicleBean.mftcolorandspot=	map[TablesColumnFile.mftcolorandspot] as String;
    collateralobj.collateralVehicleBean.mfttanandyan=	map[TablesColumnFile.mfttanandyan] as String;
    collateralobj.collateralVehicleBean.mftcap=	map[TablesColumnFile.mftcap] as String;
    collateralobj.collateralVehicleBean.mftsplattercap=	map[TablesColumnFile.mftsplattercap] as String;
    collateralobj.collateralVehicleBean.mbpmirror=	map[TablesColumnFile.mbpmirror] as String;
    collateralobj.collateralVehicleBean.mbpdoor=	map[TablesColumnFile.mbpdoor] as String;
    collateralobj.collateralVehicleBean.mbpcolorandspot=	map[TablesColumnFile.mbpcolorandspot] as String;
    collateralobj.collateralVehicleBean.mbtcolorandsport=	map[TablesColumnFile.mbtcolorandsport] as String;
    collateralobj.collateralVehicleBean.mbttanandyan=	map[TablesColumnFile.mbttanandyan] as String;
    collateralobj.collateralVehicleBean.mbtcap=	map[TablesColumnFile.mbtcap] as String;
    collateralobj.collateralVehicleBean.mbcbacklightr=	map[TablesColumnFile.mbcbacklightr] as String;
    collateralobj.collateralVehicleBean.mbcturnsignal=	map[TablesColumnFile.mbcturnsignal] as String;
    collateralobj.collateralVehicleBean.mbcmessagesignal=	map[TablesColumnFile.mbcmessagesignal] as String;
    collateralobj.collateralVehicleBean.mbcsignal=	map[TablesColumnFile.mbcsignal] as String;
    collateralobj.collateralVehicleBean.mbcbacklightl=	map[TablesColumnFile.mbcbacklightl] as String;
    collateralobj.collateralVehicleBean.mbcbackdoor=	map[TablesColumnFile.mbcbackdoor] as String;
    collateralobj.collateralVehicleBean.mbccranes=	map[TablesColumnFile.mbccranes] as String;
    collateralobj.collateralVehicleBean.mbctakelock=	map[TablesColumnFile.mbctakelock] as String;
    collateralobj.collateralVehicleBean.mbcholdlock=	map[TablesColumnFile.mbcholdlock] as String;
    collateralobj.collateralVehicleBean.mbchandcranes=	map[TablesColumnFile.mbchandcranes] as String;
    collateralobj.collateralVehicleBean.mbcreservetire=	map[TablesColumnFile.mbcreservetire] as String;
    collateralobj.collateralVehicleBean.mbcbackmirror=	map[TablesColumnFile.mbcbackmirror] as String;
    collateralobj.collateralVehicleBean.mbcantenna=	map[TablesColumnFile.mbcantenna] as String;
    collateralobj.collateralVehicleBean.mbtlcolororspot=	map[TablesColumnFile.mbtlcolororspot] as String;
    collateralobj.collateralVehicleBean.mbtltanandyan=	map[TablesColumnFile.mbtltanandyan] as String;
    collateralobj.collateralVehicleBean.mbtlcap=	map[TablesColumnFile.mbtlcap] as String;
    collateralobj.collateralVehicleBean.mbtlsplattercap=	map[TablesColumnFile.mbtlsplattercap] as String;
    collateralobj.collateralVehicleBean.mbtrcolororspot=	map[TablesColumnFile.mbtrcolororspot] as String;
    collateralobj.collateralVehicleBean.mbtrtireandyan=	map[TablesColumnFile.mbtrtireandyan] as String;
    collateralobj.collateralVehicleBean.mbtrcap=	map[TablesColumnFile.mbtrcap] as String;
    collateralobj.collateralVehicleBean.mbtrsplattercap=	map[TablesColumnFile.mbtrsplattercap] as String;
    collateralobj.collateralVehicleBean.mibarsun=	map[TablesColumnFile.mibarsun] as String;
    collateralobj.collateralVehicleBean.midescriptionbook=	map[TablesColumnFile.midescriptionbook] as String;
    collateralobj.collateralVehicleBean.miautosystem=	map[TablesColumnFile.miautosystem] as String;
    collateralobj.collateralVehicleBean.miairconditioner=	map[TablesColumnFile.miairconditioner] as String;
    collateralobj.collateralVehicleBean.mimirrorremote=	map[TablesColumnFile.mimirrorremote] as String;
    collateralobj.collateralVehicleBean.misafebell=	map[TablesColumnFile.misafebell] as String;
    collateralobj.collateralVehicleBean.mimiddlebox=	map[TablesColumnFile.mimiddlebox] as String;
    collateralobj.collateralVehicleBean.mregdate= (map[TablesColumnFile.mregdate]=="null"||map[TablesColumnFile.mregdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregdate]) as DateTime;
    collateralobj.collateralVehicleBean.mregexpdate= (map[TablesColumnFile.mregexpdate]=="null"||map[TablesColumnFile.mregexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregexpdate]) as DateTime;

  }

  void setDropDownValues() {

    List<String> tempDropDownValues = new List<String>();
    tempDropDownValues
        .add(collateralobj.mapplicanttype.toString());
    tempDropDownValues
        .add(collateralobj.mwthdrwcond.toString());
    tempDropDownValues
        .add(collateralobj.collatrlTyp.toString());
    tempDropDownValues
        .add(collateralobj.nametitle.toString());
    tempDropDownValues
        .add(collateralobj.mrelationwithcust.toString());
    tempDropDownValues
        .add(collateralobj.insurance .toString());
    tempDropDownValues
        .add(collateralobj.colltrltitle.toString());
    tempDropDownValues
        .add(collateralobj.misappctprimary.toString());

    tempDropDownValues
        .add(collateralobj.mislmap.toString());



    for (int k = 0;
    k < globals.dropdownCaptionsValuesCollateralsInfo.length;
    k++) {
      for (int i = 0;
      i < globals.dropdownCaptionsValuesCollateralsInfo[k].length;
      i++) {


        try{
          if (globals.dropdownCaptionsValuesCollateralsInfo[k][i].mcode.toString().trim() ==
              tempDropDownValues[k].toString().trim()) {

            //   print("Matched");

            setValue(k, globals.dropdownCaptionsValuesCollateralsInfo[k][i]);
          }
        }catch(_){
          print("Exception Occured in dropdown");

        }
      }
    }

  }

  Future<void> _successfulSubmitcollbasic() async {
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
                  Text('Plant and Machinary Submitted Successfully'),
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
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });}

        //Change this get fetch later direct frorm LOS
  void setCollT24Values(Map<String, dynamic> map) {
    collateralobj.collateralT24Bean=  new CollateralT24Bean();
    collateralobj.collateralT24Bean.mlbrcode=		map[TablesColumnFile.mlbrcode] as int;
    collateralobj.collateralT24Bean.mprdacctid=		map[TablesColumnFile.mprdacctid] as String;
    collateralobj.collateralT24Bean.mtitle=		map[TablesColumnFile.mtitle] as String;
    collateralobj.collateralT24Bean.mfname=		map[TablesColumnFile.mfname] as String;
    collateralobj.collateralT24Bean.mmname=		map[TablesColumnFile.mmname] as String;
    collateralobj.collateralT24Bean.mlname=		map[TablesColumnFile.mlname] as String;
    collateralobj.collateralT24Bean.maddress1=		map[TablesColumnFile.maddress1] as String;
    collateralobj.collateralT24Bean.maddress2=		map[TablesColumnFile.maddress2] as String;
    collateralobj.collateralT24Bean.mcountry=		map[TablesColumnFile.mcountry] as String;
    collateralobj.collateralT24Bean.mstate=		map[TablesColumnFile.mstate] as String;
    collateralobj.collateralT24Bean.mdist=		map[TablesColumnFile.mdist] as String;
    collateralobj.collateralT24Bean.msubdist=		map[TablesColumnFile.msubdist] as String;
    collateralobj.collateralT24Bean.marea=		map[TablesColumnFile.marea] as String;
    collateralobj.collateralT24Bean.mpoboxno=		map[TablesColumnFile.mpoboxno] as int;
    collateralobj.collateralT24Bean.mhousebuilttype=		map[TablesColumnFile.mhousebuilttype] as String;
    collateralobj.collateralT24Bean.menvdescription=		map[TablesColumnFile.menvdescription] as String;
    collateralobj.collateralT24Bean.mlotarea=		map[TablesColumnFile.mlotarea] as double;
    collateralobj.collateralT24Bean.mfloorarea=		map[TablesColumnFile.mfloorarea] as double;
    collateralobj.collateralT24Bean.mdescofproperty=		map[TablesColumnFile.mdescofproperty] as String;
    collateralobj.collateralT24Bean.msizeofproperty=		map[TablesColumnFile.msizeofproperty] as String;
    collateralobj.collateralT24Bean.msizeofpropertyl=		map[TablesColumnFile.msizeofpropertyl] as String;
    collateralobj.collateralT24Bean.msizeofpropertyh=		map[TablesColumnFile.msizeofpropertyh] as String;
    collateralobj.collateralT24Bean.mtctno=		map[TablesColumnFile.mtctno] as int;
    collateralobj.collateralT24Bean.msrno=		map[TablesColumnFile.msrno] as int;
    collateralobj.collateralT24Bean.mregdate=		(map[TablesColumnFile.mregdate]=="null"||map[TablesColumnFile.mregdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregdate]) as DateTime;
    collateralobj.collateralT24Bean.mepebdate=		(map[TablesColumnFile.mepebdate]=="null"||map[TablesColumnFile.mepebdate]==null)?null:DateTime.parse(map[TablesColumnFile.mepebdate]) as DateTime;
    collateralobj.collateralT24Bean.mrescodeorremark=		map[TablesColumnFile.mrescodeorremark] as String;
    collateralobj.collateralT24Bean.mepebno=		map[TablesColumnFile.mepebno] as int;
    collateralobj.collateralT24Bean.mregofdeedslocation=		map[TablesColumnFile.mregofdeedslocation] as String;
    collateralobj.collateralT24Bean.mcreateddt=		(map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime;
    collateralobj.collateralT24Bean.mcreatedby=		map[TablesColumnFile.mcreatedby] as String;
    collateralobj.collateralT24Bean.mlastupdatedt=		(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime;
    collateralobj.collateralT24Bean.mlastupdateby=		map[TablesColumnFile.mlastupdateby] as String;
    collateralobj.collateralT24Bean.mgeolocation=		map[TablesColumnFile.mgeolocation] as String;
    collateralobj.collateralT24Bean.mgeolatd=		map[TablesColumnFile.mgeolatd] as String;
    collateralobj.collateralT24Bean.mgeologd=		map[TablesColumnFile.mgeologd] as String;
    collateralobj.collateralT24Bean.mlastsynsdate=		(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime;
    collateralobj.collateralT24Bean.merrormessage=		map[TablesColumnFile.merrormessage] as String;
    collateralobj.collateralT24Bean.missynctocoresys=		map[TablesColumnFile.missynctocoresys] as int;
    collateralobj.collateralT24Bean.mprdofdpst=		map[TablesColumnFile.mprdofdpst] as int;
    collateralobj.collateralT24Bean.mpriorsec=		map[TablesColumnFile.mpriorsec] as String;
    collateralobj.collateralT24Bean.mcolltype=		map[TablesColumnFile.mcolltype] as String;
    collateralobj.collateralT24Bean.mcollsubtype=		map[TablesColumnFile.mcollsubtype] as String;
    collateralobj.collateralT24Bean.mtypeofproperty=		map[TablesColumnFile.mtypeofproperty] as String;
    collateralobj.collateralT24Bean.mtypeofownercerti=		map[TablesColumnFile.mtypeofownercerti] as String;
    collateralobj.collateralT24Bean.mhtypeofownercerti=		map[TablesColumnFile.mhtypeofownercerti] as String;
    collateralobj.collateralT24Bean.missuednoprop=		map[TablesColumnFile.missuednoprop] as String;
    collateralobj.collateralT24Bean.mhissuednoprop=		map[TablesColumnFile.mhissuednoprop] as String;
    collateralobj.collateralT24Bean.missueby=		map[TablesColumnFile.missueby] as String;
    collateralobj.collateralT24Bean.mhissueby=		map[TablesColumnFile.mhissueby] as String;
    collateralobj.collateralT24Bean.mcollrefno=		map[TablesColumnFile.mcollrefno] as String;
    collateralobj.collateralT24Bean.mhsizeprop=		map[TablesColumnFile.mhsizeprop] as String;
    collateralobj.collateralT24Bean.mcollrecpt=		map[TablesColumnFile.mcollrecpt] as String;
    collateralobj.collateralT24Bean.mhnpropborder=		map[TablesColumnFile.mhnpropborder] as String;
    collateralobj.collateralT24Bean.mlspropborder=		map[TablesColumnFile.mlspropborder] as String;
    collateralobj.collateralT24Bean.mhspropborder=		map[TablesColumnFile.mhspropborder] as String;
    collateralobj.collateralT24Bean.maccno=		map[TablesColumnFile.maccno] as String;
    collateralobj.collateralT24Bean.mhwpropborder=		map[TablesColumnFile.mhwpropborder] as String;
    collateralobj.collateralT24Bean.mcollownr=		map[TablesColumnFile.mcollownr] as String;
    collateralobj.collateralT24Bean.mhepropborder=		map[TablesColumnFile.mhepropborder] as String;
    collateralobj.collateralT24Bean.mhlocprop=		map[TablesColumnFile.mhlocprop] as String;
    collateralobj.collateralT24Bean.mltitleowener=		map[TablesColumnFile.mltitleowener] as String;
    collateralobj.collateralT24Bean.mhtitleowener=		map[TablesColumnFile.mhtitleowener] as String;
    collateralobj.collateralT24Bean.mexcvalue=		map[TablesColumnFile.mexcvalue] as double;
    collateralobj.collateralT24Bean.mhlocalauthvalue=		map[TablesColumnFile.mhlocalauthvalue] as double;
    collateralobj.collateralT24Bean.mprncplvlue=		map[TablesColumnFile.mprncplvlue] as double;
    collateralobj.collateralT24Bean.mhrealestatecmpnyvalue=		map[TablesColumnFile.mhrealestatecmpnyvalue] as double;
    collateralobj.collateralT24Bean.mnmnlvlue=		map[TablesColumnFile.mnmnlvlue] as double;
    collateralobj.collateralT24Bean.mhaskneighonvalue=		map[TablesColumnFile.mhaskneighonvalue] as double;
    collateralobj.collateralT24Bean.mcntrlbnkvlue=		map[TablesColumnFile.mcntrlbnkvlue] as double;
    collateralobj.collateralT24Bean.mmtrtyvlue=		map[TablesColumnFile.mmtrtyvlue] as double;
    collateralobj.collateralT24Bean.missuedt=		(map[TablesColumnFile.missuedt]=="null"||map[TablesColumnFile.missuedt]==null)?null:DateTime.parse(map[TablesColumnFile.missuedt]) as DateTime;
    collateralobj.collateralT24Bean.mmtrtydt=		(map[TablesColumnFile.mmtrtydt]=="null"||map[TablesColumnFile.mmtrtydt]==null)?null:DateTime.parse(map[TablesColumnFile.mmtrtydt]) as DateTime;
  }
}
