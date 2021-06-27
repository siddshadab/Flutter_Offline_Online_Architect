import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBankDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'CustomerFormationMasterTabs.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'bean/ESMSBean.dart';

class ESMS2 extends StatefulWidget {
  static Container _get(Widget child,
          [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _ESMS2State createState() => new _ESMS2State();
}

class _ESMS2State extends State<ESMS2> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var formatter = new DateFormat('dd-MM-yyyy');
  String tempSignDate = "----/--/--";
  String tempSignYear;
  String tempSignDay;
  String tempSignMonth;
  FocusNode yearSignFocus;
  FocusNode monthSignFocus;
  LookupBeanData mdecision;
  LookupBeanData mdsitrequiretorefroff;
  bool issueWithNuisance=true;
  LookupBeanData blankBean =
      new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);

  showDropDown(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      print("inside code Desc is null");
      switch (no) {
        case 0:
          mdecision = blankBean;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision =
              blankBean.mcode;
          break;
        case 1:
          mdsitrequiretorefroff = blankBean;
          CustomerFormationMasterTabsState
              .custListBean.esmsentity.mdsitrequiretorefroff = blankBean.mcode;
          break;
        default:
          break;
      }
      setState(() {});
    } else {
      bool isBreak = false;
      for (int k = 0; k < globals.dropdownCaptionsValuesESMS2[no].length; k++) {
        if (globals.dropdownCaptionsValuesESMS2[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesESMS2[no][k]);
          isBreak = true;
          break;
        }
        if (isBreak) {
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
          mdecision = value;
          CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision = value.mcode;
          break;
        case 1:
          mdsitrequiretorefroff = value;
          CustomerFormationMasterTabsState
              .custListBean.esmsentity.mdsitrequiretorefroff = value.mcode;
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
    for (int k = 0; k < globals.dropdownCaptionsValuesESMS2[no].length; k++) {
      mapData.add(globals.dropdownCaptionsValuesESMS2[no][k]);
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
    if (CustomerFormationMasterTabsState.custListBean.esmsentity != null) {
      if (CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance ==
          "1") {
        print(
            "CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance-------------" +
                CustomerFormationMasterTabsState.custListBean.esmsentity
                    .mnuisance.toString());
        print("issueWithNuisance" + issueWithNuisance.toString());
        issueWithNuisance = true;
      } else
      if (CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance ==
          "2") {
        print(
            "CustomerFormationMasterTabsState.custListBean.esmsentity.mnuisance" +
                CustomerFormationMasterTabsState.custListBean.esmsentity
                    .mnuisance.toString());
        issueWithNuisance = false;
      }
    }
    print("issueWithNuisance 1"+issueWithNuisance.toString());

    if (CustomerFormationMasterTabsState.custListBean.esmsentity == null) {
      CustomerFormationMasterTabsState.custListBean.esmsentity = new ESMSBean();
    }
    List<String> tempDropDownValues = new List<String>();
    print("CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision"+CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision.toString());
    print("CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision"+CustomerFormationMasterTabsState.custListBean.esmsentity.mdsitrequiretorefroff.toString());
    tempDropDownValues.add(
        CustomerFormationMasterTabsState.custListBean.esmsentity.mdecision);
    tempDropDownValues.add(CustomerFormationMasterTabsState
        .custListBean.esmsentity.mdsitrequiretorefroff);

    for (int k = 0; k < globals.dropdownCaptionsValuesESMS2.length; k++) {
      for (int i = 0; i < globals.dropdownCaptionsValuesESMS2[k].length; i++) {
       // try {
          if (globals.dropdownCaptionsValuesESMS2[k][i].mcode
                  .toString()
                  .trim() ==
              tempDropDownValues[k].toString().trim()) {
            print("Matched esms");

            setValue(k, globals.dropdownCaptionsValuesESMS2[k][i]);
          }
       /* } catch (_) {
          print("Exception Occured");
        }*/
      }
    }
    monthSignFocus = new FocusNode();
    yearSignFocus = new FocusNode();

    if (!CustomerFormationMasterTabsState.signDate.contains("_")) {
      try {
        print("inside try");

        String tempDate = CustomerFormationMasterTabsState.signDate;

        print(tempDate);
         print(tempDate.substring(6)+"-"+tempDate.substring(3,5)+"-"+tempDate.substring(0,2));
        DateTime formattedDate = DateTime.parse(tempDate.substring(6) +
            "-" +
            tempDate.substring(3, 5) +
            "-" +
            tempDate.substring(0, 2));
        print(formattedDate);
        tempSignDay = formattedDate.day.toString();
        // print(tempDayH);
        tempSignMonth = formattedDate.month.toString();
        //print(tempMonthH);
        tempSignYear = formattedDate.year.toString();
        //print(tempYearH);
        setState(() {});
      } catch (e) {
        print("Exception Occupred");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        key: _formKey,
        autovalidate: false,
        onChanged: () {
          final FormState form = _formKey.currentState;
          form.save();
        },
        child: Container(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                children: <Widget>[
              new Text(""),
              issueWithNuisance?
              Container(
                color: Colors.blueAccent,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      Translations.of(context).text('NsnceTyps'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ):Container(),
              issueWithNuisance?
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Card(
                        child: new Table(children: [
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mdust ??
                                    false,
                                title: new Text(Translations.of(context).text('Dust')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mdust = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mtrafficcongandobs ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('TrffcCngtnObstrctn')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mtrafficcongandobs = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mvibration ??
                                    false,
                                title: new Text(Translations.of(context).text('Vib')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mvibration = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mfumes ??
                                    false,
                                title: new Text(Translations.of(context).text('Fumes')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mfumes = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.modours ??
                                    false,
                                title: new Text(Translations.of(context).text('Odurs')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.modours = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnoise ??
                                    false,
                                title: new Text(Translations.of(context).text('noise')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnoise = val;
                                  });
                                })
                          ]),
                    ])),
                  ],
                ),
              ):Container(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.blueAccent,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      Translations.of(context).text('CmmntyIntrctns'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Card(
                        child: new Table(children: [
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnodesigperson ??
                                    false,
                                title: new Text(Translations.of(context).text('NoDsgntdPrsn')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnodesigperson = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnocomissue ??
                                    false,
                                title: new Text(Translations.of(context).text('NoCmmntyIss')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnocomissue = val;
                                  });
                                })
                          ]),
                    ])),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.blueAccent,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      Translations.of(context).text('SclIss'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Card(
                        child: new Table(children: [
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mdispandressetle ??
                                    false,
                                title:
                                    new Text(Translations.of(context).text('DsplcmntRsttlmnt')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mdispandressetle = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mlandacqreq ??
                                    false,
                                title: new Text(Translations.of(context).text('LndAcqReq')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mlandacqreq = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnoissue ??
                                    false,
                                title: new Text(Translations.of(context).text('NoIsse')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnoissue = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.marchimp ??
                                    false,
                                title: new Text(Translations.of(context).text('ArchImp')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.marchimp = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .msiteofcultural ??
                                    false,
                                title: new Text(Translations.of(context).text('SteOfCltrl')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .msiteofcultural = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mcomplaintsfromneig ??
                                    false,
                                title: new Text(Translations.of(context).text('CmplntsFrmNghbr')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mcomplaintsfromneig = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mimpactofindgenous ??
                                    false,
                                title: new Text(Translations.of(context).text('ImpctindgnsPpl')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mimpactofindgenous = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mimpactonlocal ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('ImpctLclSttlmntslvlhd')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mimpactonlocal = val;
                                  });
                                })
                          ]),
                    ])),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.blueAccent,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      Translations.of(context).text('LbrIss'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Card(
                        child: new Table(children: [
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnorecognitionofemp ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('NoRcgntnEmpOrgnstn')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnorecognitionofemp = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mlabourunion ??
                                    false,
                                title: new Text(Translations.of(context).text('LbrUn')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mlabourunion = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnolabissue ??
                                    false,
                                title: new Text(Translations.of(context).text('NoLbrIs')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnolabissue = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnopersonalprotectiveEquip ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('NoPrsnlProtEqpmntProv')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnopersonalprotectiveEquip = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnoprocessforemployees ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('NoprcfrempvceCompl')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnoprocessforemployees = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mchildoffrcdlabour ??
                                    false,
                                title: new Text(Translations.of(context).text('ChldFrcdLbr')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mchildoffrcdlabour = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mpayblwminwage ??
                                    false,
                                title: new Text(Translations.of(context).text('Pymntblwminwge')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mpayblwminwage = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mempblwminage ??
                                    false,
                                title: new Text(Translations.of(context).text('Empblwminage')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mempblwminage = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.munequalOpp ??
                                    false,
                                title: new Text(
                                    Translations.of(context).text('Uneqlempopp')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .munequalOpp = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .minadequatetermsofemp ??
                                    false,
                                title:
                                    new Text(Translations.of(context).text('IndqteTrmsofEmp')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .minadequatetermsofemp = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .minediquateworkingcond ??
                                    false,
                                title:
                                    new Text(Translations.of(context).text('IndquteWrkngCond')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .minediquateworkingcond = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .muinadequateemployeehealth ??
                                    false,
                                title: new Text(Translations.of(context).text('InedEmpHlth')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .muinadequateemployeehealth = val;
                                  });
                                })
                          ]),
                    ])),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.blueAccent,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      Translations.of(context).text('BorCat'),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    )
                  ],
                ),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Card(
                        child: new Table(children: [
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mnontarget ??
                                    false,
                                title: new Text(Translations.of(context).text('NTrgt')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mnontarget = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mcategoryc ??
                                    false,
                                title: new Text(Translations.of(context).text('CatVryLwRsk')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mcategoryc = val;
                                  });
                                })
                          ]),
                      new TableRow(
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.1),
                          ),
                          children: [
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mcategoryb ??
                                    false,
                                title: new Text(Translations.of(context).text('CatLwRsk')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mcategoryb = val;
                                  });
                                }),
                            new CheckboxListTile(
                                value: CustomerFormationMasterTabsState
                                        .custListBean.esmsentity.mcategorya ??
                                    false,
                                title: new Text(Translations.of(context).text('CatHghRsk')),
                                onChanged: (val) {
                                  setState(() {
                                    CustomerFormationMasterTabsState
                                        .custListBean
                                        .esmsentity
                                        .mcategorya = val;
                                  });
                                })
                          ]),
                    ])),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child:
                  new DropdownButtonFormField(
                    value:mdsitrequiretorefroff,
                    items: generateDropDown(1),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 1);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: Translations.of(context).text('Dsreqrfroff')),
                  )),

              Card(
                //color: Constant.mandatoryColor

                child:
                new IgnorePointer(
                  ignoring: true,
                  child:new DropdownButtonFormField(
                    value: mdecision,
                    items: generateDropDown(0),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 0);
                    },
                    validator: (args) {
                      print(args);
                    },
                    //  isExpanded: true,
                    //hint:Text("Select"),
                    decoration: InputDecoration(labelText: Translations.of(context).text('Dec')),
                    // style: TextStyle(color: Colors.grey),
                  ),),),

           /*   Container(
                  decoration: BoxDecoration(color: Constant.mandatoryColor),
                  child:
                  new DropdownButtonFormField(
                    value:mdecision,
                    items: generateDropDown(0),
                    onChanged: (LookupBeanData newValue) {
                      showDropDown(newValue, 0);
                    },
                    validator: (args) {
                      print(args);
                    },
                    decoration: InputDecoration(labelText: "Decision"),
                  )),*/
              new TextFormField(
                enabled: false,
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('ComFrmOff'),
                  labelText: Translations.of(context).text('ComFrmOff'),
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
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(20),
                  globals.onlyCharacter
                ],
                // validator: (arg)=>Utility.validateOnlyNumberField(arg),
                initialValue: CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mcomntfrmoff ==
                            0 ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mcomntfrmoff ==
                            null ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mcomntfrmoff ==
                            "null"
                    ? ""
                    : CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mcomntfrmoff
                        .toString(),
                onSaved: (val) {
                  if (val != null && val != "")
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mcomntfrmoff = val;
                  else
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mcomntfrmoff = "";
                },
              ),
              new TextFormField(
                enabled: false,
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('Sign'),
                  labelText: Translations.of(context).text('Sign'),
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
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(20),
                  globals.onlyCharacter
                ],
                // validator: (arg)=>Utility.validateOnlyNumberField(arg),
                initialValue: CustomerFormationMasterTabsState
                                .custListBean.esmsentity.msign ==
                            0 ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.msign ==
                            null ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.msign ==
                            "null"
                    ? ""
                    : CustomerFormationMasterTabsState
                        .custListBean.esmsentity.msign
                        .toString(),
                onSaved: (val) {
                  if (val != null && val != "")
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.msign = val;
                  else
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.msign = "";
                },
              ),
              new TextFormField(
                enabled: false,
                textCapitalization: TextCapitalization.characters,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('NmEAOff'),
                  labelText: Translations.of(context).text('NmEAOff'),
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
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(20),
                  globals.onlyCharacter
                ],
                // validator: (arg)=>Utility.validateOnlyNumberField(arg),
                initialValue: CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mnameofoff ==
                            0 ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mnameofoff ==
                            null ||
                        CustomerFormationMasterTabsState
                                .custListBean.esmsentity.mnameofoff ==
                            "null"
                    ? ""
                    : CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mnameofoff
                        .toString(),
                onSaved: (val) {
                  if (val != null && val != "")
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mnameofoff = val;
                  else
                    CustomerFormationMasterTabsState
                        .custListBean.esmsentity.mnameofoff = "";
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                //decoration: BoxDecoration(color: Constant.mandatoryColor),
                child: new Row(
                  children: <Widget>[
                    Text(Translations.of(context).text('Date'))
                  ],
                ),
              ),
              new Container(
                //decoration: BoxDecoration(color: Constant.mandatoryColor,),

                child: new Row(
                  children: <Widget>[
                    new Container(
                      width: 50.0,
                      child: new TextField(
                        enabled: false,
                          decoration: InputDecoration(hintText: Translations.of(context).text('DD')),
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(2),
                            globals.onlyIntNumber
                          ],
                          controller: tempSignDay == null
                              ? null
                              : new TextEditingController(text: tempSignDay),
                          keyboardType: TextInputType.numberWithOptions(),
                          onChanged: (val) {
                            if (val != "0") {
                              tempSignDay = val;

                              if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                if (val.length == 2) {
                                  CustomerFormationMasterTabsState.signDate =
                                      CustomerFormationMasterTabsState.signDate
                                          .replaceRange(0, 2, val);
                                  FocusScope.of(context)
                                      .requestFocus(monthSignFocus);
                                } else {
                                  CustomerFormationMasterTabsState.signDate =
                                      CustomerFormationMasterTabsState.signDate
                                          .replaceRange(0, 2, "0" + val);
                                }
                              } else {
                                setState(() {
                                  tempSignDay = "";
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
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: Translations.of(context).text('MM'),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(2),
                          globals.onlyIntNumber
                        ],
                        focusNode: monthSignFocus,
                        controller: tempSignMonth == null
                            ? null
                            : new TextEditingController(text: tempSignMonth),
                        onChanged: (val) {
                          if (val != "0") {
                            tempSignMonth = val;
                            if (int.parse(val) <= 12 && int.parse(val) > 0) {
                              if (val.length == 2) {
                                CustomerFormationMasterTabsState.signDate =
                                    CustomerFormationMasterTabsState.signDate
                                        .replaceRange(3, 5, val);

                                FocusScope.of(context)
                                    .requestFocus(yearSignFocus);
                              } else {
                                CustomerFormationMasterTabsState.signDate =
                                    CustomerFormationMasterTabsState.signDate
                                        .replaceRange(3, 5, "0" + val);
                              }
                            } else {
                              setState(() {
                                tempSignMonth = "";
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
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: Translations.of(context).text('YYYY'),
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(4),
                          globals.onlyIntNumber
                        ],
                        focusNode: yearSignFocus,
                        controller: tempSignYear == null
                            ? null
                            : new TextEditingController(text: tempSignYear),
                        onChanged: (val) {
                          tempSignYear = val;
                          if (val.length == 4)
                            CustomerFormationMasterTabsState.signDate =
                                CustomerFormationMasterTabsState.signDate
                                    .replaceRange(6, 10, val);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                  /*  IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectSignDate(context);
                        })*/
                  ],
                ),
              ),
            ])));
  }

  Future<Null> _selectSignDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime.now());
    if (picked != null &&
        picked != CustomerFormationMasterTabsState.custListBean.esmsentity.date)
      setState(() {
        CustomerFormationMasterTabsState.custListBean.esmsentity.date = picked;
        tempSignDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempSignDay = "0" + picked.day.toString();
        } else
          tempSignDay = picked.day.toString();
        CustomerFormationMasterTabsState.signDate =
            CustomerFormationMasterTabsState.signDate
                .replaceRange(0, 2, tempSignDay);
        tempSignYear = picked.year.toString();
        CustomerFormationMasterTabsState.signDate =
            CustomerFormationMasterTabsState.signDate
                .replaceRange(6, 10, tempSignYear);
        if (picked.month.toString().length == 1) {
          tempSignMonth = "0" + picked.month.toString();
        } else
          tempSignMonth = picked.month.toString();
        CustomerFormationMasterTabsState.signDate =
            CustomerFormationMasterTabsState.signDate
                .replaceRange(3, 5, tempSignMonth);
      });
  }
}
