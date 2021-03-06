import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationAddressDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBussinessDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/CountryDropDownBean.dart';
import 'package:eco_los/systems/address/beans/DistrictDropDownBean.dart';
import 'package:eco_los/systems/address/beans/StateDropDownBean.dart';
import 'package:eco_los/systems/address/beans/SubDistrictDropDownBean.dart';

import 'package:eco_los/systems/address/FullScreenDialogForAreaSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForCountrySelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForDistrictSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForStateSelection.dart';
import 'package:eco_los/systems/address/FullScreenDialogForSubDistrictSelection.dart';



class CustomerFormationContactDetails extends StatefulWidget {
  CustomerFormationContactDetails({Key key}) : super(key: key);

  @override
  _CustomerFormationContactDetailsState createState() =>
      new _CustomerFormationContactDetailsState();
}

class _CustomerFormationContactDetailsState
    extends State<CustomerFormationContactDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FullScreenDialogForCountrySelection _myCountryDialog =
  new FullScreenDialogForCountrySelection();
  FullScreenDialogForStateSelection _myStateDialog =
  new FullScreenDialogForStateSelection();
  FullScreenDialogForDistrictSelection _myDistrictDialog =
  new FullScreenDialogForDistrictSelection();
  FullScreenDialogForSubDistrictSelection _mySubDistrictDialog =
  new FullScreenDialogForSubDistrictSelection();
  FullScreenDialogForAreaSelection _myAreaDialog =
  new FullScreenDialogForAreaSelection();
  final TextEditingController _controller = new TextEditingController();
  static bool isSubmitClicked = false;
  var _focusNode = new FocusNode();
  AddressDetailsBean addressBean = new AddressDetailsBean();
  final List<AddressDetailsBean> addressDetailsList = new List<
      AddressDetailsBean>();
  LookupBeanData addressType;
  LookupBeanData mownership;
  CountryDropDownBean tempContrybean = new CountryDropDownBean();
  StateDropDownList tempStateBean = new StateDropDownList();
  SubDistrictDropDownList tempSubDistrictBean = new SubDistrictDropDownList();
  DistrictDropDownList tempDistrictBean = new DistrictDropDownList();
  AreaDropDownList tempAreaDistrict = new AreaDropDownList();
  SharedPreferences prefs;
  String geoLatitude;
  String geoLongitude;
  int Cdone;
  int Ndone;
  int Bdone;
  int Rdone;
  int Udone;
  int Wdone;
  bool forEdit = false;
  String countryName = "";
  String stateName = "";
  String districtName = "";
  String subDistrictName = "";
  String areaName = "";


  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
    });
    if (CustomerFormationMasterTabsState.addressBean
        .mcountryCd != null) {
      await AppDatabase.get().getCountryNameViaCountryCode(
          CustomerFormationMasterTabsState.addressBean.mcountryCd).then((onValue) {
        setState(() {
          if (onValue.countryName != null) {
            countryName = onValue.countryName;
          }
        });
      });
    }
    if (CustomerFormationMasterTabsState.addressBean
        .mState != null) {
      await AppDatabase.get().getStateNameViaStateCode(
          CustomerFormationMasterTabsState.addressBean.mState).then((onValue) {
        setState(() {
          if (onValue.stateDesc != null) {
            stateName = onValue.stateDesc;
          }
        });
      });
    }
    if (CustomerFormationMasterTabsState.addressBean
        .mDistCd != null) {
      await AppDatabase.get().getDistrictNameViaDistrictCode(
          CustomerFormationMasterTabsState.addressBean.mDistCd.toString()).then((
          onValue) {
        setState(() {
          if (onValue.distDesc != null) {
            districtName = onValue.distDesc;
          }
        });
      });
    }

    if (CustomerFormationMasterTabsState.addressBean
        .mcityCd != null) {
      await AppDatabase.get().getPlaceNameViaPlaceCode(
          CustomerFormationMasterTabsState.addressBean.mcityCd).then((onValue) {
        setState(() {
          if (onValue.placeCdDesc != null) {
            subDistrictName = onValue.placeCdDesc;
          }
        });
      });
    }

    if (CustomerFormationMasterTabsState.addressBean
        .marea != null) {
      await AppDatabase.get().getAreaNameViaAreaCode(
          CustomerFormationMasterTabsState.addressBean.marea.toString()).then((
          onValue) {
        setState(() {
          if (onValue.areaDesc != null) {
            areaName = onValue.areaDesc;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSessionVariables();

    if (CustomerFormationMasterTabsState.addressBean != null) {
      print(CustomerFormationMasterTabsState.addressBean.maddrType);
      for (int k = 0; k < globals.dropdownCaptionsValuesKycDetails2.length;
      k++) {
        for (int i = 0;
        i < globals.dropdownCaptionsValuesKycDetails2[k].length;
        i++) {
          if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode ==
              CustomerFormationMasterTabsState.addressBean.maddrType
                  .toString()) {
            print("matched value is ${globals
                .dropdownCaptionsValuesKycDetails2[k][i].mcode}");
            setValue(k, globals.dropdownCaptionsValuesKycDetails2[k][i]);
          } else if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode ==
              CustomerFormationMasterTabsState.addressBean.mownership
                  .toString()) {
            print("matched value is ${globals
                .dropdownCaptionsValuesKycDetails2[k][i].mcode}");
            setValue(k, globals.dropdownCaptionsValuesKycDetails2[k][i]);
          }
        }
      }
    }
    else {
      CustomerFormationMasterTabsState.addressBean = new AddressDetailsBean();
    }
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    //print("caption value : " + globals.dropdownCaptionsKycDetails2[no]);

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesKycDetails2[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesKycDetails2[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      print("data here is of adress Type dropdownwale biayajai " +
          value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();

    return _dropDownMenuItems1;
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

  LookupBeanData blankBean = new LookupBeanData(
      mcodedesc: "", mcode: "", mcodetype: 0);


  showDropDown(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          addressType = blankBean;

          CustomerFormationMasterTabsState.addressBean.maddrType = 0;
          break;
        case 1:
          mownership = blankBean;
          CustomerFormationMasterTabsState.addressBean.mownership =
              blankBean.mcode;
          break;
      }
      setState(() {

      });
    } else {
      for (int k = 0;
      k < globals.dropdownCaptionsValuesKycDetails2[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesKycDetails2[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesKycDetails2[no][k]);
        }
      }
    }
  }

  setValue(int no, LookupBeanData value) {
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          addressType = value;
          CustomerFormationMasterTabsState.addressBean.maddrType =
              int.parse(value.mcode);
          if (CustomerFormationMasterTabsState.custListBean.addressDetails
              .length > 0) {
            LookupBeanData tempBean = new LookupBeanData(
                mcodedesc: "", mcode: "", mcodetype: 0);
            for (int k = 0;
            k < globals.dropdownCaptionsValuesKycDetails2[no].length;
            k++) {
              if (globals.dropdownCaptionsValuesKycDetails2[no][k].mcode
                  .trim() ==
                  CustomerFormationMasterTabsState.custListBean
                      .addressDetails[CustomerFormationMasterTabsState
                      .custListBean.addressDetails.length - 1].maddrType
                      .toString()) {
                tempBean.mcodedesc =
                    globals.dropdownCaptionsValuesKycDetails2[no][k].mcodedesc;
                break;
              }
            }
forEdit?"":
            onSelectAddress(context, "Address",
                "Is this address is same as previous address  which is ${tempBean
                    .mcodedesc}");
          }
          break;
        case 1:
          mownership = value;
          CustomerFormationMasterTabsState.addressBean.mownership = value.mcode;
          break;
        default:
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            autovalidate: false,
            onWillPop: () {
              return Future(() => true);
            },
            onChanged: () {
              final FormState form = _formKey.currentState;
              form.save();
            },
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  color: Constant.mandatoryColor,
                  child: new DropdownButtonFormField(
                    value: addressType,
                    items: generateDropDown(0),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 0);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(
                        labelText: Translations.of(context).text('AddTyp')),
                  ),),

                SizedBox(
                  height: 16.0,
                ),
                Container(
                  color: Constant.mandatoryColor,
                  child: new DropdownButtonFormField(
                    isExpanded: true,
                    value: mownership,
                    items: generateDropDown(1),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 1);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(
                        labelText: Translations.of(context).text('HmOwnrshp')),
                  ),),

                SizedBox(height: 16.0),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new ListTile(
                    title: new Text(Translations.of(context).text('Country')),
                    subtitle: countryName == null ||
                        countryName == "null"
                        ? new Text("")
                        : new Text("${countryName}"),
                    onTap: () async {
                      getCountryName();
                    },
                  ),
                ),
                new Divider(), //),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new ListTile(

                    title: new Text(Translations.of(context).text('State')),
                    subtitle:
                    stateName == null || stateName == "null"
                        ? new Text("")
                        : new Text("${stateName} "),
                    onTap: () async {
                      getStateName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),


                Container(
                  color: Constant.semiMandatoryColor,
                  child: new ListTile(

                    title: new Text(Translations.of(context).text('District')),
                    subtitle:
                    districtName == null || districtName == "null"
                        ? new Text("")
                        : new Text("${districtName}"),
                    onTap: () async {
                      getDistrictName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.mandatoryColor,
                  child: new ListTile(

                    title: new Text(
                        Translations.of(context).text('SubDistrict')),
                    subtitle: subDistrictName == null ||
                        subDistrictName == "null"
                        ? new Text("")
                        : new Text("${subDistrictName} "),
                    onTap: () async {
                      getSubDistrictName();
                    },
                  ),
                ),

                new Divider(),
                SizedBox(height: 16.0),
                Container(
                  color: Constant.mandatoryColor,
                  child: new ListTile(
                    title: new Text(Translations.of(context).text('Area')),
                    subtitle:
                    areaName == null || areaName == "null"
                        ? new Text("")
                        : new Text("${areaName}"),
                    onTap: () async {
                      getArea();
                    },
                  ),
                ),


                new Divider(),

                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('AddrLine1Hint'),
                      labelText: Translations.of(context).text('AddrLine1'),
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
                    controller: CustomerFormationMasterTabsState.addressBean
                        .maddr1 != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .maddr1)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(50) /*,
                    globals.onlyCharacter*/
                    ],
                    onSaved: (val) {

                        CustomerFormationMasterTabsState.addressBean.maddr1 = val;


                      // }
                    },
                  ),
                ), Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('AddrLine2Hint'),
                      labelText: Translations.of(context).text('AddrLine2'),
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
                    controller: CustomerFormationMasterTabsState.addressBean
                        .maddr2 != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .maddr2)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(35) /*,
                    globals.onlyCharacter*/
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.addressBean.maddr2 = val;
                      // }
                    },
                  ),
                ), new TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    hintText: Translations.of(context).text('EntrAddrsslnhr'),
                    labelText: Translations.of(context).text('AddLn'),
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
                  controller: CustomerFormationMasterTabsState.addressBean
                      .maddr3 != null
                      ? TextEditingController(
                      text: CustomerFormationMasterTabsState.addressBean.maddr3)
                      : TextEditingController(text: ""),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(50) /*,
                    globals.onlyCharacter*/
                  ],
                  onSaved: (val) {
                    //  if(val!=null) {
                    CustomerFormationMasterTabsState.addressBean.maddr3 = val;
                    // }
                  },
                )

                /* ,new TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Thana here',
                    labelText: 'Thana',
                    hintStyle: TextStyle(color: Colors.grey),
                    */ /*labelStyle: TextStyle(color: Colors.grey),*/ /*
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
                  controller: CustomerFormationMasterTabsState.addressBean.mThana != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.addressBean.mThana)
                      : TextEditingController(text: ""),
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(30),
                    globals.onlyCharacter
                  ],
                  onSaved: (val) {
                    //  if(val!=null) {
                    CustomerFormationMasterTabsState.addressBean.mThana = val;
                    // }
                  },
                )*/, Container(
                  color: Constant.semiMandatoryColor,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('EntryrOfstyhr'),
                      labelText: Translations.of(context).text('YrofSty'),
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
                    keyboardType: TextInputType.number,
                    controller: CustomerFormationMasterTabsState.addressBean
                        .mYearStay != null &&
                        CustomerFormationMasterTabsState.addressBean
                            .mYearStay != 0
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .mYearStay.toString())
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(2),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      if (val != null && val != "") {
                        try {
                          CustomerFormationMasterTabsState.addressBean
                              .mYearStay = int.parse(val);
                        } catch (e) {

                        }
                      }
                    },
                  ),
                ),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('EntrMobNohr'),
                      labelText: Translations.of(context).text('mobileno'),
                      prefixText: "+855",
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
                    controller: CustomerFormationMasterTabsState.addressBean
                        .mMobile != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .mMobile)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(10),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.addressBean.mMobile =
                          val;
                      // }
                    },
                  ),
                ),
                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('email'),
                      labelText: Translations.of(context).text('email'),

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
                    controller: CustomerFormationMasterTabsState.addressBean
                        .memail != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .memail)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(50),

                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.addressBean.memail = val;
                      // }
                    },
                  ),
                ),

                Container(
                  color: Constant.semiMandatoryColor,
                  child: new TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: Translations.of(context).text('EntrTelNohr'),
                      labelText: Translations.of(context).text('TelNo'),
                      prefixText: "+855",
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
                    controller: CustomerFormationMasterTabsState.addressBean
                        .mtel1 != null
                        ? TextEditingController(
                        text: CustomerFormationMasterTabsState.addressBean
                            .mtel1)
                        : TextEditingController(text: ""),
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(10),
                      globals.onlyIntNumber
                    ],
                    onSaved: (val) {
                      //  if(val!=null) {
                      CustomerFormationMasterTabsState.addressBean.mtel1 = val;
                      // }
                    },
                  ),
                ),


                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: new IconButton(
                        icon: new Icon(
                          Icons.format_list_bulleted,
                          color: Color(0xff07426A),
                          size: 50.0,
                        ),
                        onPressed: () {
                          _navigateAndDisplaySelection(context);
                        },
                      ),
                    ),
                    Flexible(
                        child: new IconButton(
                            padding: EdgeInsets.only(right: 30.0),
                            icon: new Icon(
                              Icons.add,
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            splashColor: Colors.red,
                            onPressed: () {
                              if (forEdit) {
                                try {
                                 /* AppDatabase.get().deleAddDetails(
                                    CustomerFormationMasterTabsState.addressBean
                                        .mrefno,
                                    CustomerFormationMasterTabsState.addressBean
                                        .trefno,
                                  );*/
                                } catch (_) {}
                                print(
                                    "CustomerFormationMasterTabsState.addressBean.positionindex1 ${CustomerFormationMasterTabsState
                                        .addressBean
                                        .positionindex}");
                                CustomerFormationMasterTabsState.custListBean
                                    .addressDetails.removeAt(
                                    CustomerFormationMasterTabsState.addressBean
                                        .positionindex);

                                forEdit = false;
                              }


                              if (CustomerFormationMasterTabsState.addressBean
                                  .maddrType == "" ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .maddrType == null) {
                                _showAlert(
                                    Translations.of(context).text('AddTyp'),
                                    Translations.of(context).text(
                                        'MstBeSpcfd'));
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mownership == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mownership == "") {
                                _showAlert(
                                    Translations.of(context).text('HmOwnrshp'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mcountryCd == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mcountryCd.toString().trim() == "") {
                                _showAlert(
                                    Translations.of(context).text('Country'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mState == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mState.trim() == "") {
                                _showAlert(
                                    Translations.of(context).text('State'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mDistCd == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mDistCd.toString().trim() == "") {
                                _showAlert(
                                    Translations.of(context).text('District'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mcityCd == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mcityCd.toString().trim() == "") {
                                _showAlert(Translations.of(context).text(
                                    'SubDistrict'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .marea == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .marea.toString().trim() == "") {
                                _showAlert(
                                    Translations.of(context).text('Area'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (checkIfEnglish(CustomerFormationMasterTabsState.addressBean
                                  .maddr1) && CustomerFormationMasterTabsState.addressBean
                                  .maddr1 == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .maddr1.length < 2) {
                                _showAlert(
                                    Translations.of(context).text('AddrLine1'),
                                    Translations.of(context).text(
                                        'Mustbemorethenchar'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .maddr2 == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .maddr2.length < 2) {
                                _showAlert(
                                    Translations.of(context).text('add2'),
                                    Translations.of(context).text(
                                        'Mustbemorethenchar'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mYearStay == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mYearStay.toString().trim() == "") {
                                _showAlert(
                                    Translations.of(context).text('YrsOfSty'),
                                    Translations.of(context).text(
                                        'CnntbeEmpty'));
                                return;
                              }
                              else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mMobile == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mMobile.length < 9 ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mMobile.length > 10) {
                                _showAlert(
                                    Translations.of(context).text('mobileno'),
                                    Translations.of(context).text(
                                        'Mustbecharlong'));
                                return;
                              } else
                              if (CustomerFormationMasterTabsState.addressBean
                                  .mtel1 == null ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mtel1.length < 9 ||
                                  CustomerFormationMasterTabsState.addressBean
                                      .mtel1.length > 10) {
                                _showAlert(
                                    Translations.of(context).text('TelNo'),
                                    Translations.of(context).text(
                                        'Mustbecharlong'));
                                return;
                              }
                              else
                                addToList();
                            })),
                  ],
                ),


                SizedBox(height: 30.0,)
              ],
            )));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
          new ViewCustomerFormationAddressDetails(),
          fullscreenDialog: true,
        )).then<AddressDetailsBean>((addressDetailsBean) {
      setState(() {});
      if (addressDetailsBean == null) {
        return;
      } else {
        forEdit = true;
        CustomerFormationMasterTabsState.addressBean = addressDetailsBean;
        getSessionVariables();

        List tempDropDownValues = new List();
        tempDropDownValues.add(
            CustomerFormationMasterTabsState.addressBean.maddrType.toString());
        tempDropDownValues.add(
            CustomerFormationMasterTabsState.addressBean.mownership);
        for (int k = 0;
        k < globals.dropdownCaptionsValuesKycDetails2.length;
        k++) {
          for (int i = 0;
          i < globals.dropdownCaptionsValuesKycDetails2[k].length;
          i++) {
            // print("k and i is $k $i");
            print(globals.dropdownCaptionsValuesKycDetails2[k][i].mcode.length);

            try {
              if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode
                  .toString() ==
                  tempDropDownValues[k].toString().trim()) {
                print("matched $k");
                setValue(k, globals.dropdownCaptionsValuesKycDetails2[k][i]);
              }
            } catch (_) {
              print("Exception in dropdown");
            }
          }
        }


        /*        for (int k = 0; k < globals.dropdownCaptionsValuesKycDetails2.length; k++) {
          for (int i = 0;
          i < globals.dropdownCaptionsValuesKycDetails2[k].length;
          i++) {
            if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode ==
                CustomerFormationMasterTabsState.addressBean.maddrType.toString()) {

              print("matched value is ${globals.dropdownCaptionsValuesKycDetails2[k][i].mcode}");
              setValue(k, globals.dropdownCaptionsValuesKycDetails2[k][i]);
            }else  if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode ==
                CustomerFormationMasterTabsState.addressBean.mownership.toString()) {

              print("matched value is ${globals.dropdownCaptionsValuesKycDetails2[k][i].mcode}");
              setValue(k, globals.dropdownCaptionsValuesKycDetails2[k][i]);
            }
          }
        }*/
      }
    });
  }

  void addToList() {
    /* for (var items in globals.addressDetailsList) {
      print(items);
    }
*/
    print("CustomerFormationMasterTabsState.addressBean.maddrType" +
        CustomerFormationMasterTabsState.addressBean.maddrType.toString());
    if (CustomerFormationMasterTabsState.addressBean.maddrType != "" ||
        CustomerFormationMasterTabsState.addressBean.maddrType != null) {
      print("Inside");
      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 1

      ) {
        Rdone = 1;
      }

      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 2

      ) {
        Udone = 1;
      }
      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 3

      ) {
        Wdone = 1;
      }
      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 4

      ) {
        Cdone = 1;
      }
      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 5

      ) {
        Bdone = 1;
      }
      if (
      CustomerFormationMasterTabsState.addressBean.maddrType == 6

      ) {
        print("Inside Ndone");
        Ndone = 1;
      }
    }
    if (CustomerFormationMasterTabsState.custListBean.addressDetails == null) {
      CustomerFormationMasterTabsState.custListBean.addressDetails =
      new List<AddressDetailsBean>();
    }

        CustomerFormationMasterTabsState.custListBean.addressDetails.length + 1;
    CustomerFormationMasterTabsState.addressBean.mgeolatd = geoLatitude;
    CustomerFormationMasterTabsState.addressBean.mgeologd = geoLongitude;

print("CustomerFormationMasterTabsState.addressBean"+(CustomerFormationMasterTabsState.addressBean).toString());
    CustomerFormationMasterTabsState.custListBean.addressDetails
        .add(CustomerFormationMasterTabsState.addressBean);

    print("adding");
    addressType = blankBean;
    mownership = blankBean;
    setState(() {
      CustomerFormationMasterTabsState.addressBean = new AddressDetailsBean();
    });


    print("local");
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


  Future<void> _showSpecialAlert(arg, error) async {
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<bool> onSelectAddress(BuildContext context, String agrs1,
      String args2) {
    return showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text(agrs1),
        content: new Text(args2),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => checkduplicate(),
            child: new Text(Translations.of(context).text('No')),
          ),
          new FlatButton(
            onPressed: () => setAddress(),
            child: new Text(Translations.of(context).text('Yes')),
          ),
        ],
      ),
    ) ??
        false;
  }

  checkduplicate() {
    print("Inside checkduplicate");
    print("Ndone" + Ndone.toString());
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 1 &&
        Rdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 6 &&
        Ndone == 1) {
      print("Inside Ndone---------");
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 2 &&
        Udone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 3 &&
        Wdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 4 &&
        Cdone == 1) {
      print("Inside Cdone");
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 5 &&
        Bdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    else {
      Navigator.of(context).pop();
    }
  }

  setAddress() {
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 1 &&
        Rdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 6 &&
        Ndone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 2 &&
        Udone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 3 &&
        Wdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 4 &&
        Cdone == 1) {
      print("Inside Cdone");
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    if (CustomerFormationMasterTabsState.addressBean.maddrType == 5 &&
        Bdone == 1) {
      _showSpecialAlert(Translations.of(context).text('AddTyp'),
          Translations.of(context).text('Cntbeysagn'));
      return;
    }
    int addressListFrom = CustomerFormationMasterTabsState.custListBean
        .addressDetails.length - 1;
    CustomerFormationMasterTabsState.addressBean.maddr1 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].maddr1;
    CustomerFormationMasterTabsState.addressBean.maddr2 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].maddr2;
    CustomerFormationMasterTabsState.addressBean.maddr3 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].maddr3;
    CustomerFormationMasterTabsState.addressBean.mpinCd =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mpinCd;
    CustomerFormationMasterTabsState.addressBean.mtel1 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mtel1;
    CustomerFormationMasterTabsState.addressBean.mtel2 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mtel2;

    CustomerFormationMasterTabsState.addressBean.mfax1 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mfax1;
    CustomerFormationMasterTabsState.addressBean.mfax2 =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mfax2;


    CustomerFormationMasterTabsState.addressBean.mcountryCd =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mcountryCd;
    CustomerFormationMasterTabsState.addressBean.marea =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].marea;
    CustomerFormationMasterTabsState.addressBean.mHouseType =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mHouseType;
    CustomerFormationMasterTabsState.addressBean.mRntLeasAmt =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mRntLeasAmt;
    CustomerFormationMasterTabsState.addressBean.mRntLeasDep =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mRntLeasDep;
    CustomerFormationMasterTabsState.addressBean.mContLeasExp =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mContLeasExp;
    CustomerFormationMasterTabsState.addressBean.mRoofCond =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mRoofCond;


    CustomerFormationMasterTabsState.addressBean.mUtils =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mUtils;
    CustomerFormationMasterTabsState.addressBean.mAreaType =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mAreaType;
    CustomerFormationMasterTabsState.addressBean.mState =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mState;
    CustomerFormationMasterTabsState.addressBean.mYearStay =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mYearStay;
    CustomerFormationMasterTabsState.addressBean.mWardNo =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mWardNo;
    CustomerFormationMasterTabsState.addressBean.mMobile =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mMobile;
    CustomerFormationMasterTabsState.addressBean.mEmail =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mEmail;


    CustomerFormationMasterTabsState.addressBean.mDistCd =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mDistCd;
    CustomerFormationMasterTabsState.addressBean.mcityCd =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mcityCd;

    CustomerFormationMasterTabsState.addressBean.mvillage =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mvillage;
    CustomerFormationMasterTabsState.addressBean.mSecMobile =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mSecMobile;
    CustomerFormationMasterTabsState.addressBean.mcountryname =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mcountryname;
    CustomerFormationMasterTabsState.addressBean.mstatedesc =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mstatedesc;
    CustomerFormationMasterTabsState.addressBean.mdistdesc =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mdistdesc;
 /*   CustomerFormationMasterTabsState.addressBean.mplacecd =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mplacecd;*/

    CustomerFormationMasterTabsState.addressBean.mplacedesc =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mplacedesc;
    CustomerFormationMasterTabsState.addressBean.mareadesc =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mareadesc;
    CustomerFormationMasterTabsState.addressBean.mownership =
        CustomerFormationMasterTabsState.custListBean
            .addressDetails[addressListFrom].mownership;

    addToList();
    Navigator.of(context).pop(true);
  }


  Future getCountryName() async {
    tempContrybean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myCountryDialog,
          fullscreenDialog: true,
        ));
    if (tempContrybean != null) {
      CustomerFormationMasterTabsState.addressBean
          .mcountryCd = tempContrybean.cntryCd;
      AppDatabase.get().getCountryNameViaCountryCode(
          tempContrybean.cntryCd.toString()).then((onValue) {
        countryName = onValue.countryName;
        print("onValue.countryName" + onValue.countryName);
        print("countryName" + countryName);
      });
    }
  }

  Future getStateName() async {
    tempStateBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myStateDialog,
          fullscreenDialog: true,
        ));
    if (tempStateBean != null) {
      CustomerFormationMasterTabsState.addressBean
          .mState = tempStateBean.stateCd;
      AppDatabase.get().getStateNameViaStateCode(
          tempStateBean.stateCd.toString()).then((onValue) {
        stateName = onValue.stateDesc;
      });
    }
  }

  Future getDistrictName() async {
    tempDistrictBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myDistrictDialog,
          fullscreenDialog: true,
        ));
    if (tempDistrictBean != null) {
      CustomerFormationMasterTabsState.addressBean
          .mDistCd = tempDistrictBean.distCd;
      AppDatabase.get().getDistrictNameViaDistrictCode(
          tempDistrictBean.distCd.toString()).then((onValue) {
        districtName = onValue.distDesc;
      });
    }
  }

  Future getSubDistrictName() async {
    tempSubDistrictBean = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _mySubDistrictDialog,
          fullscreenDialog: true,
        ));
    if (tempSubDistrictBean != null) {
      CustomerFormationMasterTabsState.addressBean
          .mcityCd = tempSubDistrictBean.placeCd;
      AppDatabase.get().getPlaceNameViaPlaceCode(
          tempSubDistrictBean.placeCd.toString()).then((onValue) {
        subDistrictName = onValue.placeCdDesc;
      });
    }
  }

  Future getArea() async {
    tempAreaDistrict = await
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => _myAreaDialog,
          fullscreenDialog: true,
        ));
    if(tempAreaDistrict!=null) {
      CustomerFormationMasterTabsState.addressBean
          .marea = tempAreaDistrict.areaCd;
      AppDatabase.get().getAreaNameViaAreaCode(
          tempAreaDistrict.areaCd.toString()).then((onValue) {
        areaName = onValue.areaDesc;

      });
    }
  }

  bool checkIfEnglish(String input){
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9]*$");
    return regex.hasMatch(input);
  }
}
