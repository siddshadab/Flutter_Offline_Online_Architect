import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/bean/CurrentAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/customerFormation/bean/EquityBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FixedAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/LongTermLiabilitiesBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ShortTermLiabilitiesBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'bean/FinancialStmntBean.dart';
import 'bean/IncomeStatementBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;

class CustomerFormationBusinessCashFlow3 extends StatefulWidget {
  final CustomerListBean customerObject;
  final bool isEditAllowed;
  CustomerFormationBusinessCashFlow3({this.customerObject,this.isEditAllowed});

  @override
  _CustomerFormationBusinessCashFlow3State createState() =>
      new _CustomerFormationBusinessCashFlow3State();
}

class _CustomerFormationBusinessCashFlow3State
    extends State<CustomerFormationBusinessCashFlow3> {
  bool showAdvance = false;
  bool showAssets = false;
  bool showIncome = false;
  bool showStatement = false;
  bool finalStatment = false;

  var dateformatter = new DateFormat('dd-MM-yyyy HH:mm:ss');
  String loanBalFrmDt = "__-__-____";
  FocusNode monthBalFrmFocus;
  FocusNode yearBalFrmFocus;
  String tempBalFrmDate = "----/--/--";
  String tempBalFrmYear;
  String tempBalFrmDay;
  String tempBalFrmMonth;

  String loanBalToDt = "__-__-____";
  FocusNode monthBalToFocus;
  FocusNode yearBalToFocus;
  String tempBalToDate = "----/--/--";
  String tempBalToYear;
  String tempBalToDay;
  String tempBalToMonth;

  String loanIncmFrmDt = "__-__-____";
  FocusNode monthIncmFrmFocus;
  FocusNode yearIncmFrmFocus;
  String tempIncmFrmDate = "----/--/--";
  String tempIncmFrmYear;
  String tempIncmFrmDay;
  String tempIncmFrmMonth;

  String loanIncmToDt = "__-__-____";
  FocusNode monthIncmToFocus;
  FocusNode yearIncmToFocus;
  String tempIncmToDate = "----/--/--";
  String tempIncmToYear;
  String tempIncmToDay;
  String tempIncmToMonth;

  LookupBeanData blankBean =
      new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);
  List<FilterChip> filterChip = new List<FilterChip>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CustomerListBean custBean;
  LookupBeanData fixedAssets;
  LookupBeanData currentAssets;
  LookupBeanData longTermLiabilities;
  LookupBeanData shortTermLiabilities;
  LookupBeanData equity;
  double totalPrsntShrtLongLiabAndEquity = 0.0;
  double totalNxtShrtLongLiabAndEquity = 0.0;
  double totalPrsntfxdAndCurr = 0.0;
  double totalNxtfxdAndCurr = 0.0;
  double totalPrsntlib = 0.0;
  double totalNxtlib = 0.0;

  final formatDouble = new NumberFormat("#,##0.00", "en_US");

  bool ifNullCheck(String value) {
    bool isNull = false;
    try {
      if (value == null || value == 'null' || value.trim() == '') {
        isNull = true;
      }
    } catch (_) {
      isNull = true;
    }
    return isNull;
  }

  // List<BalSheetItem> itemList =null;
  @override
  void initState()  {
    if (widget.customerObject != null) {
      custBean = widget.customerObject;
    } else {
      custBean = new CustomerListBean();
    }

    if (custBean.fixedAssetsList == null) {
      custBean.fixedAssetsList = new FixedAssetsBean();
    }else{
      loanBalFrmDt =custBean.fixedAssetsList.mfromdate.toString();
      loanBalToDt =custBean.fixedAssetsList.mtodate.toString();
      loanIncmFrmDt =custBean.incomeStatementList.mfromdate.toString();
      loanIncmToDt =custBean.incomeStatementList.mtodate.toString();
    }
    if (custBean.currentAssetsList == null) {
      custBean.currentAssetsList = new CurrentAssetsBean();
    }
    if (custBean.longTermLiabilitiesList == null) {
      custBean.longTermLiabilitiesList = new LongTermLiabilitiesBean();
    }
    if (custBean.shortTermLiabilitiesList == null) {
      custBean.shortTermLiabilitiesList = new ShortTermLiabilitiesBean();
    }
    if (custBean.equityList == null) {
      custBean.equityList = new EquityBean();
    }

    if (custBean.financialStmntList == null) {
      custBean.financialStmntList = new FinancialStmntBean();
    }
    if (custBean.incomeStatementList == null) {
      custBean.incomeStatementList = new IncomeStatementBean();
    }
    calculatelongTermShortTermLiabilitiesAndEquitySum();
    calculatetotlCrrAndFxdAssetsSum();
    calculatetotlLibSum();

    monthBalFrmFocus = new FocusNode();
    yearBalFrmFocus = new FocusNode();
    monthBalToFocus = new FocusNode();
    yearBalToFocus = new FocusNode();

    monthIncmFrmFocus = new FocusNode();
    yearIncmFrmFocus = new FocusNode();
    monthIncmToFocus = new FocusNode();
    yearIncmToFocus = new FocusNode();

      if (!loanBalFrmDt.contains("_")) {
        try {
          DateTime formattedDate = DateTime.parse(loanBalFrmDt);
          tempBalFrmDay = formattedDate.day.toString();
          tempBalFrmMonth = formattedDate.month.toString();
          tempBalFrmYear = formattedDate.year.toString();
          loanBalFrmDt = tempBalFrmDay.toString() +"-"+tempBalFrmMonth.toString()+"-"+tempBalFrmYear.toString();
          setState(() {});
        } catch (e) {
          print("Exception Occupred");
        }
      }

      if (!loanBalToDt.contains("_")) {
        try {
          DateTime formattedDate = DateTime.parse(loanBalToDt);
          tempBalToDay = formattedDate.day.toString();
          tempBalToMonth = formattedDate.month.toString();
          tempBalToYear = formattedDate.year.toString();
          loanBalToDt = tempBalToDay.toString() +"-"+tempBalToMonth.toString()+"-"+tempBalToYear.toString();
          setState(() {});
        } catch (e) {
          print("Exception Occupred");
        }
      }


    if (!loanIncmFrmDt.contains("_")) {
      try {
        DateTime formattedDate = DateTime.parse(loanIncmFrmDt);
        tempIncmFrmDay = formattedDate.day.toString();
        tempIncmFrmMonth = formattedDate.month.toString();
        tempIncmFrmYear = formattedDate.year.toString();
        loanIncmFrmDt = tempIncmFrmDay.toString() +"-"+tempIncmFrmMonth.toString()+"-"+tempIncmFrmYear.toString();
        setState(() {});
      } catch (e) {
        print("Exception Occupred");
      }
    }

    if (!loanIncmToDt.contains("_")) {
      try {
        DateTime formattedDate = DateTime.parse(loanIncmToDt);
        tempIncmToDay = formattedDate.day.toString();
        tempIncmToMonth = formattedDate.month.toString();
        tempIncmToYear = formattedDate.year.toString();
        loanIncmToDt = tempIncmToDay.toString() +"-"+tempIncmToMonth.toString()+"-"+tempIncmToYear.toString();
        setState(() {});
      } catch (e) {
        print("Exception Occupred");
      }
    }
  }

  calculateValuesForFinancialStatement() {
    print("calculateValuesForFinancialStatement");
    double grossProfit = 0.0;
    double revenue = 0.0;
    double A_B=0.0;
    double a1_a3_A3=0.0;
    print("GROSS PROFIT MARGIN = ( GROSS PROFIT / REVENUE)*100");
    if (custBean.incomeStatementList.mnetincomep != null) {
      grossProfit = custBean.incomeStatementList.mnetincomep;
    }

    if (custBean.incomeStatementList.mtotalrevenuep != null&& custBean.incomeStatementList.mtotalopexpp!= null) {
      A_B = custBean.incomeStatementList.mtotalrevenuep-custBean.incomeStatementList.mtotalopexpp;
    }
    if (custBean.incomeStatementList.mrevenuefirstp != null&& custBean.incomeStatementList.mgoodcostfirstp!= null&& custBean.incomeStatementList.mrevenuesecondp!= null) {
      a1_a3_A3 = custBean.incomeStatementList.mrevenuefirstp+custBean.incomeStatementList.mrevenuesecondp+custBean.incomeStatementList.motherrevenuep;
    }

    if (custBean.incomeStatementList.mrevenuefirstp != null) {
      revenue = revenue + custBean.incomeStatementList.mrevenuefirstp;
    }

    if (custBean.incomeStatementList.mrevenuesecondp != null) {
      revenue = revenue + custBean.incomeStatementList.mrevenuesecondp;
    }

    if (custBean.incomeStatementList.motherrevenuep != null) {
      revenue = revenue + custBean.incomeStatementList.motherrevenuep;
    }

    if (A_B > 0.0 && a1_a3_A3 > 0.0) {
      custBean.financialStmntList.mgrossprofitmargin =
          double.parse(((A_B / a1_a3_A3)*100).toStringAsFixed(2));
    }

    double currentAsset = 0.0;
    double currentLiability = 0.0;
    print(custBean.currentAssetsList.msumpresentamt);
    if (custBean.currentAssetsList.msumpresentamt != null) {
      currentAsset = custBean.currentAssetsList.msumpresentamt;
    }
    print(custBean.shortTermLiabilitiesList.msumpresentamt);
    if (custBean.shortTermLiabilitiesList.msumpresentamt != null) {
      currentLiability = custBean.shortTermLiabilitiesList.msumpresentamt;
    }

    if (currentAsset > 0.0 && currentLiability > 0.0) {
      custBean.financialStmntList.mcurrentratio =
          double.parse((currentAsset / currentLiability).toStringAsFixed(2));
      print("ratiooooo");
      print(custBean.financialStmntList.mcurrentratio);
    }

    print("DEBT RATIO=(TOTAL DEBT/TOTAL EQUITY)*100");
    double totalDebt = 0.0;
    double totalEquity = 0.0;
    if (custBean.longTermLiabilitiesList.msumpresentamt != null) {
      totalDebt = custBean.longTermLiabilitiesList.msumpresentamt;
    }
    if (custBean.equityList.msumpresentamt != null) {
      totalEquity = custBean.equityList.msumpresentamt;
    }
    if (totalPrsntlib > 0.0 && totalEquity > 0.0) {
      custBean.financialStmntList.mdebtratio =
          double.parse(((totalPrsntlib / totalEquity)*100).toStringAsFixed(2));
    }
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
              'Cash Flow',
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
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (showAssets == false) {
                        setState(() {
                          showAssets = true;
                        });
                      } else if (showAssets == true) {
                        setState(() {
                          showAssets = false;
                        });
                      }
                    },
                    child: new Form(
                        key: _formKey,
                        autovalidate: false,
                        onWillPop: () {
                          return Future(() => true);
                        },
                        onChanged: () async {
                          final FormState form = _formKey.currentState;
                          calculateEquitySum();
                          //calculateshortTermLiabilitiesAssetSum();
                          calculatelongTermLiabilitiesAssetSum();
                          calculateCurrentAssetSum();
                          calculateFixedAssetSum();
                          calculateValuesForFinancialStatement();
                          calculatelongTermShortTermLiabilitiesAndEquitySum();
                          calculatetotlCrrAndFxdAssetsSum();
                          calculatetotlLibSum();
                          form.save();
                        },
                        child: new Column(children: <Widget>[
                          new Card(
                            child: new ListTile(
                              title: new Text(
                                Translations.of(context).text('BalSht'),
                                style: TextStyle(fontSize: 25.0),
                              ),
                              subtitle: showAssets == false
                                  ? null
                                  : new Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              Text(Translations.of(context).text('AsOfDt')),
                                           //   Text("To ")
                                            ],
                                          ),
                                        ),
                                        new Container(
                                          decoration: BoxDecoration(),
                                          child: new Row(
                                            children: <Widget>[
                                              new Container(
                                                width: 20.0,
                                                child: new TextField(
                                                    decoration: InputDecoration(hintText: "DD"),
                                                    inputFormatters: [
                                                      new LengthLimitingTextInputFormatter(2),
                                                      globals.onlyIntNumber
                                                    ],
                                                    controller: tempBalFrmDay == null
                                                        ? null
                                                        : new TextEditingController(text: tempBalFrmDay),
                                                    keyboardType: TextInputType.numberWithOptions(),
                                                    onChanged: (val) {
                                                      if (val != "0") {
                                                        tempBalFrmDay = val;

                                                        if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                                          if (val.length == 2) {
                                                            loanBalFrmDt = loanBalFrmDt.replaceRange(0, 2, val);
                                                            FocusScope.of(context).requestFocus(monthBalFrmFocus);
                                                          } else {
                                                            loanBalFrmDt =
                                                                loanBalFrmDt.replaceRange(0, 2, "0" + val);
                                                          }
                                                        } else {
                                                          setState(() {
                                                            tempBalFrmDay = "";
                                                          });
                                                        }
                                                      }
                                                    }),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: new Text("/"),
                                              ),
                                              new Container(
                                                width: 20.0,
                                                child: new TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "MM",
                                                  ),
                                                  keyboardType: TextInputType.numberWithOptions(),
                                                  inputFormatters: [
                                                    new LengthLimitingTextInputFormatter(2),
                                                    globals.onlyIntNumber
                                                  ],
                                                  focusNode: monthBalFrmFocus,
                                                  controller: tempBalFrmMonth == null
                                                      ? null
                                                      : new TextEditingController(text: tempBalFrmMonth),
                                                  onChanged: (val) {
                                                    if (val != "0") {
                                                      tempBalFrmMonth = val;
                                                      if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                                        if (val.length == 2) {
                                                          loanBalFrmDt = loanBalFrmDt.replaceRange(3, 5, val);

                                                          FocusScope.of(context).requestFocus(yearBalFrmFocus);
                                                        } else {
                                                          loanBalFrmDt =
                                                              loanBalFrmDt.replaceRange(3, 5, "0" + val);
                                                        }
                                                      } else {
                                                        setState(() {
                                                          tempBalFrmMonth = "";
                                                        });
                                                      }
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: new Text("/"),
                                              ),
                                              Container(
                                                width: 35,
                                                child: new TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "YYYY",
                                                  ),
                                                  keyboardType: TextInputType.numberWithOptions(),
                                                  inputFormatters: [
                                                    new LengthLimitingTextInputFormatter(4),
                                                    globals.onlyIntNumber
                                                  ],
                                                  focusNode: yearBalFrmFocus,
                                                  controller: tempBalFrmYear == null
                                                      ? null
                                                      : new TextEditingController(text: tempBalFrmYear),
                                                  onChanged: (val) {
                                                    tempBalFrmYear = val;
                                                    if (val.length == 4)
                                                      loanBalFrmDt =  loanBalFrmDt.replaceRange(6, 10, val);

                                                  },

                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
                                              IconButton(
                                                  icon: Icon(Icons.calendar_today),
                                                  onPressed: () {
                                                    _selectBalFrmDate(context);
                                                  }),

                                              IconButton(
                                                  icon: Icon(Icons.calendar_today),
                                                  onPressed: () {
                                                    _selectBalToDate(context);
                                                  })
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                            child: Column(
                                          children: <Widget>[


                                            Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      Constant.mandatoryColor),
                                              child: new Row(
                                                children: <Widget>[
                                                  Text(
                                                    Translations.of(context).text('FixAsst'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Lnd'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mlandpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mlandpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mland = 1110;
                                                        custBean.fixedAssetsList
                                                                .mlandpresentamt =
                                                            double.parse(value);
                                                        //addToList(context,0);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mlandnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mlandnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mland = 110;
                                                        custBean.fixedAssetsList
                                                                .mlandnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Buldng'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mbuildngpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mbuildngpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mbuildng = 1120;
                                                        custBean.fixedAssetsList
                                                                .mbuildngpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mbuildngnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mbuildngnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mbuildng = 1120;
                                                        custBean.fixedAssetsList
                                                                .mbuildngnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('Mchnryandothrseqpmnt'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mmachnryorequppresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mmachnryorequppresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                                .mmachnryorequp =
                                                            1130;
                                                        custBean.fixedAssetsList
                                                                .mmachnryorequppresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mmachnryorequpnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mmachnryorequpnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                                .mmachnryorequp =
                                                            1130;
                                                        custBean.fixedAssetsList
                                                                .mmachnryorequpnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('MnsnTrnsprt'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mmeansandtransprtpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mmeansandtransprtpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                                .mmeansandtransprt =
                                                            1140;
                                                        custBean.fixedAssetsList
                                                                .mmeansandtransprtpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mmeansandtransprtnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mmeansandtransprtnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                                .mmeansandtransprt =
                                                            1140;
                                                        custBean.fixedAssetsList
                                                                .mmeansandtransprtnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Others'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mothrspresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mothrspresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mothrs = 1150;
                                                        custBean.fixedAssetsList
                                                                .mothrspresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .fixedAssetsList !=
                                                                null &&
                                                            custBean.fixedAssetsList
                                                                    .mothrsnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .fixedAssetsList
                                                                    .mothrsnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.fixedAssetsList
                                                            .mothrs = 1150;
                                                        custBean.fixedAssetsList
                                                                .mothrsnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmPrnt')),
                                                      subtitle: custBean
                                                                  .fixedAssetsList
                                                                  .msumpresentamt ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.fixedAssetsList.msumpresentamt)}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmNxtMnth')),
                                                      subtitle: custBean
                                                                  .fixedAssetsList
                                                                  .msumnextmonthamount ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.fixedAssetsList.msumnextmonthamount)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                            child: Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      Constant.mandatoryColor),
                                              child: new Row(
                                                children: <Widget>[
                                                  Text(
                                                    Translations.of(context).text('EntrPreAmtHr'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Cash'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mcashpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mcashpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mcash = 1210;
                                                        custBean.currentAssetsList
                                                                .mcashpresentamt =
                                                            double.parse(value);
                                                        //addToList(context,0);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mcashnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mcashnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mcash = 1210;
                                                        custBean.currentAssetsList
                                                                .mcashnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('Acc_Rec'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .maccntrecvblpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .maccntrecvblpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .maccntrecvbl = 1220;
                                                        custBean.currentAssetsList
                                                                .maccntrecvblpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .maccntrecvblnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .maccntrecvblnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .maccntrecvbl = 1220;
                                                        custBean.currentAssetsList
                                                                .maccntrecvblnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Inventory'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .minventrypresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .minventrypresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .minventry = 1230;
                                                        custBean.currentAssetsList
                                                                .minventrypresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .minventrynextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .minventrynextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .minventry = 1230;
                                                        custBean.currentAssetsList
                                                                .minventrynextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text("Prepaid",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mprepaidpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mprepaidpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mprepaid = 1240;
                                                        custBean.currentAssetsList
                                                                .mprepaidpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mprepaidnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mprepaidnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mprepaid = 1240;
                                                        custBean.currentAssetsList
                                                                .mprepaidnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('Others'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mothrspresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mothrspresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mothrs = 1250;
                                                        custBean.currentAssetsList
                                                                .mothrspresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .currentAssetsList !=
                                                                null &&
                                                            custBean.currentAssetsList
                                                                    .mothrsnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .currentAssetsList
                                                                    .mothrsnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .currentAssetsList
                                                            .mothrs = 1250;
                                                        custBean.currentAssetsList
                                                                .mothrsnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmPrnt')),
                                                      subtitle: custBean
                                                                  .currentAssetsList
                                                                  .msumpresentamt ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.currentAssetsList.msumpresentamt)}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmNxtMnth')),
                                                      subtitle: custBean
                                                                  .currentAssetsList
                                                                  .msumnextmonthamount ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.currentAssetsList.msumnextmonthamount)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                            child:
                                                new Column(children: <Widget>[
                                          new Container(
                                            decoration: BoxDecoration(
                                                color: Constant.mandatoryColor),
                                            child: new Row(
                                              children: <Widget>[
                                                Text(
                                                  Translations.of(context).text('Tot_As'),
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 25.0),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            width: 300.0,
                                            height: 10.0,
                                          ),
                                          new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              new Container(
                                                width: 100.0,
                                                child: new Text(Translations.of(context).text('Tot_As'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 18.0)),
                                              ),
                                              new Container(
                                                color: Constant.calculatedColor,
                                                width: 100.0,
                                                child: new Card(
                                                  child: new ListTile(
                                                    title: new Text(Translations.of(context).text('Prsnt')),
                                                    subtitle:
                                                        totalPrsntfxdAndCurr ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(totalPrsntfxdAndCurr)}"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Container(
                                                color: Constant.calculatedColor,
                                                width: 100.0,
                                                child: new Card(
                                                  child: new ListTile(
                                                    title:
                                                        new Text(Translations.of(context).text('NxtMnth')),
                                                    subtitle: totalNxtfxdAndCurr ==
                                                            null
                                                        ? new Text("")
                                                        : new Text(
                                                            "${formatDouble.format(totalNxtfxdAndCurr)}"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ])),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                          child: new Column(children: <Widget>[
                                            new Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      Constant.mandatoryColor),
                                              child: new Row(
                                                children: <Widget>[
                                                  Text(
                                                    Translations.of(context).text('LngTrmLblts'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('OthrLn'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .longTermLiabilitiesList !=
                                                                null &&
                                                            custBean.longTermLiabilitiesList
                                                                    .mcashpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .longTermLiabilitiesList
                                                                    .mcashpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .longTermLiabilitiesList
                                                            .mcash = 2111;
                                                        custBean.longTermLiabilitiesList
                                                                .mcashpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .longTermLiabilitiesList !=
                                                                null &&
                                                            custBean.longTermLiabilitiesList
                                                                    .mcashnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .longTermLiabilitiesList
                                                                    .mcashnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .longTermLiabilitiesList
                                                            .mcash = 2111;
                                                        custBean.longTermLiabilitiesList
                                                                .mcashnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('LnsFrmbnks'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .longTermLiabilitiesList !=
                                                                null &&
                                                            custBean.longTermLiabilitiesList
                                                                    .maccntrecvblpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .longTermLiabilitiesList
                                                                    .maccntrecvblpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .longTermLiabilitiesList
                                                            .maccntrecvbl = 2112;
                                                        custBean.longTermLiabilitiesList
                                                                .maccntrecvblpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .longTermLiabilitiesList !=
                                                                null &&
                                                            custBean.longTermLiabilitiesList
                                                                    .maccntrecvblnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .longTermLiabilitiesList
                                                                    .maccntrecvblnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .longTermLiabilitiesList
                                                            .maccntrecvbl = 2112;
                                                        custBean.longTermLiabilitiesList
                                                                .maccntrecvblnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmPrnt')),
                                                      subtitle: custBean
                                                                  .longTermLiabilitiesList
                                                                  .msumpresentamt ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.longTermLiabilitiesList.msumpresentamt)}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmNxtMnth')),
                                                      subtitle: custBean
                                                                  .longTermLiabilitiesList
                                                                  .msumnextmonthamount ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.longTermLiabilitiesList.msumnextmonthamount)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                          child: new Column(children: <Widget>[
                                            new Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      Constant.mandatoryColor),
                                              child: new Row(
                                                children: <Widget>[
                                                  Text(
                                                    Translations.of(context).text('ShrtTrmLblt'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(Translations.of(context).text('OthrsLn'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mcashpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mcashpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mcash = 2121;
                                                        custBean.shortTermLiabilitiesList
                                                                .mcashpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mcashnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mcashnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mcash = 2121;
                                                        custBean.shortTermLiabilitiesList
                                                                .mcashnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('LnfrmBnk'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .maccntrecvblpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .maccntrecvblpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .maccntrecvbl = 2122;
                                                        custBean.shortTermLiabilitiesList
                                                                .maccntrecvblpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .maccntrecvblnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .maccntrecvblnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .maccntrecvbl = 2122;
                                                        custBean.shortTermLiabilitiesList
                                                                .maccntrecvblnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('AcctPybl'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mfield3presentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mfield3presentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mfield3 = 2123;
                                                        custBean.shortTermLiabilitiesList
                                                                .mfield3presentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mfield3nextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mfield3nextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mfield3 = 2123;
                                                        custBean.shortTermLiabilitiesList
                                                                .mfield3nextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('UnrndRvn'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mfield4presentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mfield4presentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mfield4 = 2124;
                                                        custBean.shortTermLiabilitiesList
                                                                .mfield4presentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .shortTermLiabilitiesList !=
                                                                null &&
                                                            custBean.shortTermLiabilitiesList
                                                                    .mfield4nextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .shortTermLiabilitiesList
                                                                    .mfield4nextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean
                                                            .shortTermLiabilitiesList
                                                            .mfield4 = 2124;
                                                        custBean.shortTermLiabilitiesList
                                                                .mfield4nextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmPrnt')),
                                                      subtitle: custBean
                                                                  .shortTermLiabilitiesList
                                                                  .msumpresentamt ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.shortTermLiabilitiesList.msumpresentamt)}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmNxtMnth')),
                                                      subtitle: custBean
                                                                  .shortTermLiabilitiesList
                                                                  .msumnextmonthamount ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.shortTermLiabilitiesList.msumnextmonthamount)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            //new Row(children: filterChip),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                            child:
                                            new Column(children: <Widget>[
                                              new Container(
                                                decoration: BoxDecoration(
                                                    color: Constant.mandatoryColor),
                                                child: new Row(
                                                  children: <Widget>[
                                                    Text(
                                                      Translations.of(context).text('TtlLblts'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 25.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text( Translations.of(context).text('TtlLblts'),
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontSize: 18.0)),
                                                  ),
                                                  new Container(
                                                    color: Constant.calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle:
                                                        totalPrsntlib ==
                                                            null
                                                            ? new Text("")
                                                            : new Text(
                                                            "${formatDouble.format(totalPrsntlib)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant.calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                        new Text(Translations.of(context).text('NxtMnth')),
                                                        subtitle: totalNxtlib ==
                                                            null
                                                            ? new Text("")
                                                            : new Text(
                                                            "${formatDouble.format(totalNxtlib)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ])),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                          child: new Column(children: <Widget>[
                                            new Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      Constant.mandatoryColor),
                                              child: new Row(
                                                children: <Widget>[
                                                  Text(
                                                    Translations.of(context).text('Eqty'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 25.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('ShrCptl'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .equityList !=
                                                                null &&
                                                            custBean.equityList
                                                                    .mcashpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .equityList
                                                                    .mcashpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.equityList
                                                            .mcash = 2210;
                                                        custBean.equityList
                                                                .mcashpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .equityList !=
                                                                null &&
                                                            custBean.equityList
                                                                    .mcashnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .equityList
                                                                    .mcashnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.equityList
                                                            .mcash = 2210;
                                                        custBean.equityList
                                                                .mcashnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 100.0,
                                                  child: new Text(
                                                      Translations.of(context).text('RtndErnng'),
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 18.0)),
                                                ),
                                                new Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .equityList !=
                                                                null &&
                                                            custBean.equityList
                                                                    .maccntrecvblpresentamt !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .equityList
                                                                    .maccntrecvblpresentamt))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.equityList
                                                                .maccntrecvbl =
                                                            2220;
                                                        custBean.equityList
                                                                .maccntrecvblpresentamt =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrPreAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('PrsntAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  width: 100.0,
                                                  child: new TextFormField(
                                                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                    controller: custBean
                                                                    .equityList !=
                                                                null &&
                                                            custBean.equityList
                                                                    .maccntrecvblnextmonthamount !=
                                                                null
                                                        ? TextEditingController(
                                                            text: formatDouble
                                                                .format(custBean
                                                                    .equityList
                                                                    .maccntrecvblnextmonthamount))
                                                        : TextEditingController(
                                                            text: ""),
                                                    onSaved: (String value) {
                                                      try {
                                                        custBean.equityList
                                                                .maccntrecvbl =
                                                            2220;
                                                        custBean.equityList
                                                                .maccntrecvblnextmonthamount =
                                                            double.parse(value);
                                                      } catch (_) {}
                                                    },
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(decimal: true),
                                                    decoration: new InputDecoration(
                                                        border: new OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                        hintText:
                                                        Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                        labelText:
                                                        Translations.of(context).text('NxtMnthAmt'),
                                                        prefixText: '',
                                                        suffixText: '',
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .green)),
                                                  ),
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10.0,
                                            ),

                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmPrnt')),
                                                      subtitle: custBean
                                                                  .equityList
                                                                  .msumpresentamt ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.equityList.msumpresentamt)}"),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 150.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(
                                                          Translations.of(context).text('SmNxtMnth')),
                                                      subtitle: custBean
                                                                  .equityList
                                                                  .msumnextmonthamount ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.equityList.msumnextmonthamount)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ), //new Row(children: filterChip),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        new Container(
                                            child:
                                                new Column(children: <Widget>[
                                          new Container(
                                            decoration: BoxDecoration(
                                                color: Constant.mandatoryColor),
                                            child: new Row(
                                              children: <Widget>[
                                                Text(
                                                  Translations.of(context).text('LbltsEqty'),
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 25.0),
                                                )
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            width: 300.0,
                                            height: 10.0,
                                          ),
                                          new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              new Container(
                                                width: 100.0,
                                                child: new Text(
                                                    Translations.of(context).text('LbltsEqty'),
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 18.0)),
                                              ),
                                              new Container(
                                                color: Constant.calculatedColor,
                                                width: 100.0,
                                                child: new Card(
                                                  child: new ListTile(
                                                    title: new Text(Translations.of(context).text('Prsnt')),
                                                    subtitle:
                                                        totalPrsntShrtLongLiabAndEquity ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(totalPrsntShrtLongLiabAndEquity)}"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Container(
                                                color: Constant.calculatedColor,
                                                width: 100.0,
                                                child: new Card(
                                                  child: new ListTile(
                                                    title:
                                                        new Text(Translations.of(context).text('NxtMnth')),
                                                    subtitle:
                                                        totalNxtShrtLongLiabAndEquity ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(totalNxtShrtLongLiabAndEquity)}"),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ])),
                                      ],
                                    ),
                            ),
                          ),

                          //new Card(child: new Text("Income"),)
                          GestureDetector(
                            onTap: () {
                              if (showIncome == false) {
                                setState(() {
                                  showIncome = true;
                                });
                              } else if (showIncome == true) {
                                setState(() {
                                  showIncome = false;
                                });
                              }
                            },
                            child: new Card(
                              child: new ListTile(
                                title: new Text(
                                  Translations.of(context).text('IncStat'),
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                subtitle: showIncome == true
                                    ? new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(),
                                            child: new Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                Text(Translations.of(context).text('Frm')),
                                                Text(Translations.of(context).text('To'))
                                              ],
                                            ),
                                          ),
                                          new Container(
                                            decoration: BoxDecoration(),
                                            child: new Row(
                                              children: <Widget>[
                                                new Container(
                                                  width: 20.0,
                                                  child: new TextField(
                                                      decoration: InputDecoration(hintText: "DD"),
                                                      inputFormatters: [
                                                        new LengthLimitingTextInputFormatter(2),
                                                        globals.onlyIntNumber
                                                      ],
                                                      controller: tempIncmFrmDay == null
                                                          ? null
                                                          : new TextEditingController(text: tempIncmFrmDay),
                                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                                      onChanged: (val) {
                                                        if (val != "0") {
                                                          tempIncmFrmDay = val;

                                                          if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                                            if (val.length == 2) {
                                                              loanIncmFrmDt = loanIncmFrmDt.replaceRange(0, 2, val);
                                                              FocusScope.of(context).requestFocus(monthIncmFrmFocus);
                                                            } else {
                                                              loanIncmFrmDt =
                                                                  loanIncmFrmDt.replaceRange(0, 2, "0" + val);
                                                            }
                                                          } else {
                                                            setState(() {
                                                              tempIncmFrmDay = "";
                                                            });
                                                          }
                                                        }
                                                      }),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: new Text("/"),
                                                ),
                                                new Container(
                                                  width: 20.0,
                                                  child: new TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "MM",
                                                    ),
                                                    keyboardType: TextInputType.numberWithOptions(),
                                                    inputFormatters: [
                                                      new LengthLimitingTextInputFormatter(2),
                                                      globals.onlyIntNumber
                                                    ],
                                                    focusNode: monthIncmFrmFocus,
                                                    controller: tempIncmFrmMonth == null
                                                        ? null
                                                        : new TextEditingController(text: tempIncmFrmMonth),
                                                    onChanged: (val) {
                                                      if (val != "0") {
                                                        tempIncmFrmMonth = val;
                                                        if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                                          if (val.length == 2) {
                                                            loanIncmFrmDt = loanIncmFrmDt.replaceRange(3, 5, val);

                                                            FocusScope.of(context).requestFocus(yearIncmFrmFocus);
                                                          } else {
                                                            loanIncmFrmDt =
                                                                loanIncmFrmDt.replaceRange(3, 5, "0" + val);
                                                          }
                                                        } else {
                                                          setState(() {
                                                            tempIncmFrmMonth = "";
                                                          });
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: new Text("/"),
                                                ),
                                                Container(
                                                  width: 35,
                                                  child: new TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "YYYY",
                                                    ),
                                                    keyboardType: TextInputType.numberWithOptions(),
                                                    inputFormatters: [
                                                      new LengthLimitingTextInputFormatter(4),
                                                      globals.onlyIntNumber
                                                    ],
                                                    focusNode: yearIncmFrmFocus,
                                                    controller: tempIncmFrmYear == null
                                                        ? null
                                                        : new TextEditingController(text: tempIncmFrmYear),
                                                    onChanged: (val) {
                                                      tempIncmFrmYear = val;
                                                      if (val.length == 4)
                                                        loanIncmFrmDt =  loanIncmFrmDt.replaceRange(6, 10, val);

                                                    },

                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                                IconButton(
                                                    icon: Icon(Icons.calendar_today),
                                                    onPressed: () {
                                                      _selectIncmFrmDate(context);
                                                    }),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                new Container(
                                                  width: 20.0,
                                                  child: new TextField(
                                                      decoration: InputDecoration(hintText: "DD"),
                                                      inputFormatters: [
                                                        new LengthLimitingTextInputFormatter(2),
                                                        globals.onlyIntNumber
                                                      ],
                                                      controller: tempIncmToDay == null
                                                          ? null
                                                          : new TextEditingController(text: tempIncmToDay),
                                                      keyboardType: TextInputType.numberWithOptions(),
                                                      onChanged: (val) {
                                                        if (val != "0") {
                                                          tempIncmToDay = val;

                                                          if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                                            if (val.length == 2) {
                                                              loanIncmToDt = loanIncmToDt.replaceRange(0, 2, val);
                                                              FocusScope.of(context).requestFocus(monthIncmToFocus);
                                                            } else {
                                                              loanIncmToDt =
                                                                  loanIncmToDt.replaceRange(0, 2, "0" + val);
                                                            }
                                                          } else {
                                                            setState(() {
                                                              tempIncmToDay = "";
                                                            });
                                                          }
                                                        }
                                                      }),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: new Text("/"),
                                                ),
                                                new Container(
                                                  width: 20.0,
                                                  child: new TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "MM",
                                                    ),
                                                    keyboardType: TextInputType.numberWithOptions(),
                                                    inputFormatters: [
                                                      new LengthLimitingTextInputFormatter(2),
                                                      globals.onlyIntNumber
                                                    ],
                                                    focusNode: monthIncmToFocus,
                                                    controller: tempIncmToMonth == null
                                                        ? null
                                                        : new TextEditingController(text: tempIncmToMonth),
                                                    onChanged: (val) {
                                                      if (val != "0") {
                                                        tempIncmToMonth = val;
                                                        if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                                          if (val.length == 2) {
                                                            loanIncmToDt = loanIncmToDt.replaceRange(3, 5, val);

                                                            FocusScope.of(context).requestFocus(yearIncmToFocus);
                                                          } else {
                                                            loanIncmToDt =
                                                                loanIncmToDt.replaceRange(3, 5, "0" + val);
                                                          }
                                                        } else {
                                                          setState(() {
                                                            tempIncmToMonth = "";
                                                          });
                                                        }
                                                      }
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(2.0),
                                                  child: new Text("/"),
                                                ),
                                                Container(
                                                  width: 35,
                                                  child: new TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "YYYY",
                                                    ),
                                                    keyboardType: TextInputType.numberWithOptions(),
                                                    inputFormatters: [
                                                      new LengthLimitingTextInputFormatter(4),
                                                      globals.onlyIntNumber
                                                    ],
                                                    focusNode: yearIncmToFocus,
                                                    controller: tempIncmToYear == null
                                                        ? null
                                                        : new TextEditingController(text: tempIncmToYear),
                                                    onChanged: (val) {
                                                      tempIncmToYear = val;
                                                      if (val.length == 4)
                                                        loanIncmToDt =  loanIncmToDt.replaceRange(6, 10, val);

                                                    },

                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.0,
                                                ),
                                                IconButton(
                                                    icon: Icon(Icons.calendar_today),
                                                    onPressed: () {
                                                      _selectIncmToDate(context);
                                                    })
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          new Card(
                                            child:
                                                new Column(children: <Widget>[
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('TtlRvnA123')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                        .incomeStatementList ==
                                                                    null ||
                                                                custBean.incomeStatementList
                                                                        .mtotalrevenuep ==
                                                                    null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mtotalrevenuep)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mtotalrevenuenm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mtotalrevenuenm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('A1GrssPrftFrmBusa12')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mgrossprofitfirstp ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mgrossprofitfirstp)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mgrossprofitfirstnm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mgrossprofitfirstnm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('a1RvnuFrmBuss')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mrevenuefirstp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mrevenuefirstp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mrevenuefirstp =
                                                              double.parse(
                                                                  value);
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mrevenuefirstnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mrevenuefirstnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mrevenuefirstnm =
                                                              double.parse(
                                                                  value);
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('a2CstofGdsSld')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgoodcostfirstp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgoodcostfirstp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgoodcostfirstp =
                                                              double.parse(
                                                                  value);
                                                          if (custBean
                                                                  .incomeStatementList
                                                                  .mrevenuefirstp !=
                                                              null) {
                                                            custBean
                                                                .incomeStatementList
                                                                .mgrossprofitfirstp = custBean
                                                                    .incomeStatementList
                                                                    .mrevenuefirstp -
                                                                custBean
                                                                    .incomeStatementList
                                                                    .mgoodcostfirstp;
                                                          }
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgoodcostfirstnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgoodcostfirstnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgoodcostfirstnm =
                                                              double.parse(
                                                                  value);
                                                          if (custBean
                                                                  .incomeStatementList
                                                                  .mrevenuefirstnm !=
                                                              null) {
                                                            custBean
                                                                .incomeStatementList
                                                                .mgrossprofitfirstnm = custBean
                                                                    .incomeStatementList
                                                                    .mrevenuefirstnm -
                                                                custBean
                                                                    .incomeStatementList
                                                                    .mgoodcostfirstnm;
                                                          }
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('A2GrssPrftFrmBussa3a4')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mgrossprofitsecondp ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mgrossprofitsecondp)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mgrossprofitsecondnm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mgrossprofitsecondnm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('a3RvnFrmBuss')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mrevenuesecondp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mrevenuesecondp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mrevenuesecondp =
                                                              double.parse(
                                                                  value);
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mrevenuesecondnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mrevenuesecondnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mrevenuesecondnm =
                                                              double.parse(
                                                                  value);
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('a4CstOfGdsSld')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgoodcostsecondp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgoodcostsecondp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgoodcostsecondp =
                                                              double.parse(
                                                                  value);
                                                          if (custBean
                                                                  .incomeStatementList
                                                                  .mrevenuesecondp !=
                                                              null) {
                                                            custBean
                                                                .incomeStatementList
                                                                .mgrossprofitsecondp = custBean
                                                                    .incomeStatementList
                                                                    .mrevenuesecondp -
                                                                custBean
                                                                    .incomeStatementList
                                                                    .mgoodcostsecondp;
                                                          }
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgoodcostsecondnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgoodcostsecondnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgoodcostsecondnm =
                                                              double.parse(
                                                                  value);
                                                          if (custBean
                                                                  .incomeStatementList
                                                                  .mrevenuesecondnm !=
                                                              null) {
                                                            custBean
                                                                .incomeStatementList
                                                                .mgrossprofitsecondnm = custBean
                                                                    .incomeStatementList
                                                                    .mrevenuesecondnm -
                                                                custBean
                                                                    .incomeStatementList
                                                                    .mgoodcostsecondnm;
                                                          }
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('A3OthrRvn')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherrevenuep !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherrevenuep))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherrevenuep =
                                                              double.parse(
                                                                  value);
                                                          custBean
                                                              .incomeStatementList
                                                              .mtotalrevenuep = custBean
                                                                  .incomeStatementList
                                                                  .mgrossprofitfirstp +
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mgrossprofitsecondp +
                                                              custBean
                                                                  .incomeStatementList
                                                                  .motherrevenuep;
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherrevenuenm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherrevenuenm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherrevenuenm =
                                                              double.parse(
                                                                  value);
                                                          custBean
                                                              .incomeStatementList
                                                              .mtotalrevenuenm = custBean
                                                                  .incomeStatementList
                                                                  .mgrossprofitfirstnm +
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mgrossprofitsecondnm +
                                                              custBean
                                                                  .incomeStatementList
                                                                  .motherrevenuenm;
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('BTtlOprtngExpB12')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mtotalopexpp ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mtotalopexpp)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mtotalopexpnm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mtotalopexpnm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('B1OpExpFrBussb123')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mopexpfirstp ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mopexpfirstp)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mopexpfirstnm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mopexpfirstnm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b1PrsnlExp')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mpersonalexpfirstp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mpersonalexpfirstp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mpersonalexpfirstp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstp();
                                                          CalculateMtotalopexpp();

                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mpersonalexpfirstnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mpersonalexpfirstnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mpersonalexpfirstnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstnm();
                                                          CalculateMtotalopexpnm();
                                                          /*        if(custBean.incomeStatementList.mpersonalexpfirstnm != null) {
                                                        custBean.incomeStatementList.mopexpfirstnm =
                                                            custBean.incomeStatementList.mpersonalexpfirstnm;
                                                        if(custBean.incomeStatementList.mgeneralexpfirstnm != null) {
                                                            custBean.incomeStatementList.mopexpfirstnm =
                                                                custBean.incomeStatementList.mopexpfirstnm +
                                                                    custBean.incomeStatementList.mgeneralexpfirstnm;
                                                        }
                                                        if(custBean.incomeStatementList.motherexpfirstnm != null) {
                                                          custBean.incomeStatementList.mopexpfirstnm =
                                                              custBean.incomeStatementList.mopexpfirstnm +
                                                                  custBean.incomeStatementList.motherexpfirstnm;
                                                        }
                                                      }
                                                      if(custBean.incomeStatementList.mopexpfirstnm != null) {
                                                        custBean.incomeStatementList.mtotalopexpnm =
                                                            custBean.incomeStatementList.mopexpfirstnm;
                                                        if(custBean.incomeStatementList.mopexpsecondnm != null){
                                                          custBean.incomeStatementList.mtotalopexpnm =
                                                              custBean.incomeStatementList.mtotalopexpnm +
                                                                  custBean.incomeStatementList.mopexpsecondnm;
                                                        }
                                                      }*/
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b2GnrlnAdmnExp')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgeneralexpfirstp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgeneralexpfirstp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgeneralexpfirstp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstp();
                                                          CalculateMtotalopexpp();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgeneralexpfirstnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgeneralexpfirstnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgeneralexpfirstnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstnm();
                                                          CalculateMtotalopexpnm();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b3OthrExp')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherexpfirstp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherexpfirstp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherexpfirstp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstp();
                                                          CalculateMtotalopexpp();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherexpfirstnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherexpfirstnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherexpfirstnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpfirstnm();
                                                          CalculateMtotalopexpnm();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('B2OprExpFrBusb456')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mopexpsecondp ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mopexpsecondp)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mopexpsecondnm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mopexpsecondnm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b4PrsnlExpnss')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mpersonalexpsecondp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mpersonalexpsecondp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mpersonalexpsecondp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondp();
                                                          CalculateMtotalopexpp();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mpersonalexpsecondnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mpersonalexpsecondnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mpersonalexpsecondnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondnm();
                                                          CalculateMtotalopexpnm();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b5GnrlnAdmnExp')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgeneralexpsecondp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgeneralexpsecondp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgeneralexpsecondp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondp();
                                                          CalculateMtotalopexpp();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mgeneralexpsecondnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mgeneralexpsecondnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mgeneralexpsecondnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondnm();
                                                          CalculateMtotalopexpnm();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('b6OthrExpns')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherexpsecondp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherexpsecondp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherexpsecondp =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondp();
                                                          CalculateMtotalopexpp();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .motherexpsecondnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .motherexpsecondnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .motherexpsecondnm =
                                                              double.parse(
                                                                  value);
                                                          CalculateMopexpsecondnm();
                                                          CalculateMtotalopexpnm();
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('CTaxExp')),
                                                  ),
                                                  new Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mtaxexpp !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mtaxexpp))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mtaxexpp =
                                                              double.parse(
                                                                  value);
                                                          custBean
                                                              .incomeStatementList
                                                              .mnetincomep = custBean
                                                                  .incomeStatementList
                                                                  .mtotalrevenuep -
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mtotalopexpp -
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mtaxexpp;
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrPreAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('PrsntAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    width: 100.0,
                                                    child: new TextFormField(
                                                      inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                      controller: custBean
                                                                  .incomeStatementList
                                                                  .mtaxexpnm !=
                                                              null
                                                          ? TextEditingController(
                                                              text: formatDouble
                                                                  .format(custBean
                                                                      .incomeStatementList
                                                                      .mtaxexpnm))
                                                          : TextEditingController(
                                                              text: "0.0"),
                                                      onSaved: (String value) {
                                                        try {
                                                          custBean.incomeStatementList
                                                                  .mtaxexpnm =
                                                              double.parse(
                                                                  value);
                                                          custBean
                                                              .incomeStatementList
                                                              .mnetincomenm = custBean
                                                                  .incomeStatementList
                                                                  .mtotalrevenuenm -
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mtotalopexpnm -
                                                              custBean
                                                                  .incomeStatementList
                                                                  .mtaxexpnm;
                                                        } catch (_) {}
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(decimal: true),
                                                      decoration: new InputDecoration(
                                                          border: new OutlineInputBorder(
                                                              borderSide:
                                                                  new BorderSide(
                                                                      color: Colors
                                                                          .teal)),
                                                          hintText:
                                                          Translations.of(context).text('EntrNxtMnthAmtHr'),
                                                          labelText:
                                                          Translations.of(context).text('NxtMnthAmt'),
                                                          prefixText: '',
                                                          suffixText: '',
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  new Container(
                                                    width: 100.0,
                                                    child: new Text(
                                                        Translations.of(context).text('DNtIncmLsABC')),
                                                  ),
                                                  new Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title:
                                                            new Text(Translations.of(context).text('Prsnt')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mnetincomep ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mnetincomep)}"),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Container(
                                                    color: Constant
                                                        .calculatedColor,
                                                    width: 100.0,
                                                    child: new Card(
                                                      child: new ListTile(
                                                        title: new Text(
                                                            Translations.of(context).text('NxtMnth')),
                                                        subtitle: custBean
                                                                    .incomeStatementList
                                                                    .mnetincomenm ==
                                                                null
                                                            ? new Text("")
                                                            : new Text(
                                                                "${formatDouble.format(custBean.incomeStatementList.mnetincomenm)}"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              new Container(
                                                width: 300.0,
                                                height: 10.0,
                                              ),
                                            ]),
                                          ),
                                        ],
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          //    GestureDetector(

                          new Card(
                            child: new ListTile(
                              onTap: () {
                                if (showStatement == false) {
                                  setState(() {
                                    showStatement = true;
                                  });
                                } else if (showStatement == true) {
                                  setState(() {
                                    showStatement = false;
                                  });
                                }
                              },
                              title: new Text(
                                Translations.of(context).text('FinStat'),
                                style: TextStyle(fontSize: 25.0),
                              ),
                              subtitle: showStatement == true
                                  ? new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Card(
                                          child: new Column(children: <Widget>[
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 160.0,
                                                  child: new Text(
                                                      Translations.of(context).text('GrssPrftMrgnGrssPrftRvnue')),
                                                ),
                                                new Container(
                                                  width: 40.0,
                                                  child: new Text(">=5"),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 100.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(""),
                                                      subtitle: custBean
                                                                  .financialStmntList
                                                                  .mgrossprofitmargin ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.financialStmntList.mgrossprofitmargin)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 160.0,
                                                  child: new Text(
                                                      Translations.of(context).text('CurrRtCrrntAsstCrrntLblty')),
                                                ),
                                                new Container(
                                                  width: 40.0,
                                                  child: new Text(">=3"),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 100.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(""),
                                                      subtitle: custBean
                                                                  .financialStmntList
                                                                  .mcurrentratio ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.financialStmntList.mcurrentratio)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                            new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                new Container(
                                                  width: 150.0,
                                                  child: new Text(
                                                      Translations.of(context).text('DbtRtTtlDbtTtlEqty')),
                                                ),
                                                new Container(
                                                  width: 50.0,
                                                  child: new Text("<=30%"),
                                                ),
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                Container(
                                                  color:
                                                      Constant.calculatedColor,
                                                  width: 100.0,
                                                  child: new Card(
                                                    child: new ListTile(
                                                      title: new Text(""),
                                                      subtitle: custBean
                                                                  .financialStmntList
                                                                  .mdebtratio ==
                                                              null
                                                          ? new Text("")
                                                          : new Text(
                                                              "${formatDouble.format(custBean.financialStmntList.mdebtratio)}"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            new Container(
                                              width: 300.0,
                                              height: 10.0,
                                            ),
                                          ]),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              if (finalStatment == false) {
                                setState(() {
                                  finalStatment = true;
                                });
                              } else if (finalStatment == true) {
                                setState(() {
                                  finalStatment = false;
                                });
                              }
                            },
                            child: new Card(
                              child: new ListTile(
                                  title: new Text(
                                    Translations.of(context).text('FnlIncm'),
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  subtitle: finalStatment == true
                                      ? new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Card(
                                                child: new Column(
                                                    children: <Widget>[
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[

                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('TtlCrrntAsst')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean ==null || custBean.financialStmntList ==null || custBean.financialStmntList
                                                                    .mtotcurasset == null || custBean.financialStmntList
                                                                    .mtotcurasset == 'null'
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mtotcurasset)}"),
                                                              ),
                                                            ),
                                                          ),


                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[

                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('TtlCurrLblts')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle:custBean ==null || custBean.financialStmntList ==null || custBean.financialStmntList
                                                                    .mtotcurliabilities == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mtotcurliabilities)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('WrkngCptlRq')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean ==null || custBean.financialStmntList ==null || custBean.financialStmntList
                                                                    .mworkngcapital == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mworkngcapital)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('AvgInv')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              enabled: false,
                                                              controller:
                                                              custBean !=null && custBean.currentAssetsList !=null && custBean
                                                                  .currentAssetsList.minventrypresentamt != null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.currentAssetsList.minventrypresentamt
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList
                                                                      .mavginventory =
                                                                      double.parse(value);
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EntrAvgInvntryHr'),
                                                                  labelText: Translations.of(context).text('AvgInv'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('COGS')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              controller:
                                                              custBean !=null && custBean.financialStmntList !=null && custBean
                                                                  .financialStmntList.mcogs != null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.financialStmntList.mcogs
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList.mcogs =
                                                                      double.parse(value);
                                                                  custBean.financialStmntList
                                                                      .minvconperiod =
                                                                      double.parse(
                                                                          (custBean.financialStmntList
                                                                              .mavginventory /
                                                                              custBean
                                                                                  .financialStmntList.mcogs /
                                                                              365).toStringAsFixed(2));
                                                                  CalculateWorkingCapitalCycle();
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EntrCOGSHr'),
                                                                  labelText: Translations.of(context).text('COGS'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('InvntryCnvrsnPrd')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean.financialStmntList==null || custBean.financialStmntList
                                                                    .minvconperiod == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .minvconperiod)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('AvgAcctRcvbls')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              controller:
                                                              custBean !=null && custBean.financialStmntList !=null && custBean
                                                                  .financialStmntList.mavgaccreceivables !=
                                                                  null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.financialStmntList
                                                                      .mavgaccreceivables
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList
                                                                      .mavgaccreceivables =
                                                                      double.parse(value);
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EntrAvgAcctRcvblsHr'),
                                                                  labelText: Translations.of(context).text('AvgAcctRcvbls'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('Sls')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              controller:
                                                              custBean.financialStmntList !=null && custBean
                                                                  .financialStmntList.msales != null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.financialStmntList.msales
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList
                                                                      .msales =
                                                                      double.parse(value);
                                                                  custBean.financialStmntList
                                                                      .mrecconperiod =
                                                                      double.parse(
                                                                          (custBean.financialStmntList
                                                                              .mavgaccreceivables /
                                                                              custBean
                                                                                  .financialStmntList.msales /
                                                                              365).toStringAsFixed(2));
                                                                  CalculateWorkingCapitalCycle();
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EtSlsHr'),
                                                                  labelText: Translations.of(context).text('Sls'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('RcvblCnvrsnPrd')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean.financialStmntList==null || custBean.financialStmntList
                                                                    .mrecconperiod == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mrecconperiod)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('AgAccntPybls')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              controller:
                                                              custBean.financialStmntList!=null && custBean
                                                                  .financialStmntList.mavgaccpayables != null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.financialStmntList
                                                                      .mavgaccpayables
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList
                                                                      .mavgaccpayables =
                                                                      double.parse(value);
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EtrAvgAccPyblsHr'),
                                                                  labelText: Translations.of(context).text('AgAccntPybls'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('Prchss')),
                                                          ),
                                                          new Container(
                                                            width: 150.0,
                                                            child: new TextFormField(
                                                              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
                                                              controller:
                                                              custBean.financialStmntList !=null && custBean
                                                                  .financialStmntList.mpurchases != null
                                                                  ? TextEditingController(
                                                                  text: formatDouble.format(custBean.financialStmntList
                                                                      .mpurchases
                                                                  ))
                                                                  : TextEditingController(
                                                                  text: ""),
                                                              onSaved: (String value) {
                                                                try {
                                                                  custBean.financialStmntList
                                                                      .mpurchases =
                                                                      double.parse(value);
                                                                  custBean.financialStmntList
                                                                      .mpayconperiod =
                                                                      double.parse(
                                                                          (custBean.financialStmntList
                                                                              .mavgaccpayables /
                                                                              custBean
                                                                                  .financialStmntList
                                                                                  .mpurchases / 365)
                                                                              .toStringAsFixed(2));
                                                                  CalculateWorkingCapitalCycle();
                                                                } catch (_) {}
                                                              },
                                                              keyboardType: TextInputType
                                                                  .numberWithOptions(decimal: true),
                                                              decoration: new InputDecoration(
                                                                  border: new OutlineInputBorder(
                                                                      borderSide: new BorderSide(
                                                                          color: Colors.teal)),
                                                                  hintText:
                                                                  Translations.of(context).text('EntrPurHr'),
                                                                  labelText: Translations.of(context).text('Prchss'),
                                                                  prefixText: '',
                                                                  suffixText: '',
                                                                  suffixStyle: const TextStyle(
                                                                      color: Colors.green)),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(Translations.of(context).text('PyblsConvrsinPrd')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean.financialStmntList ==null || custBean.financialStmntList
                                                                    .mpayconperiod == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mpayconperiod)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),
                                                      new Container(
                                                        width: 300.0,
                                                        height: 10.0,
                                                      ),
                                                      new Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          new Container(
                                                            width: 150.0,
                                                            child: new Text(
                                                                Translations.of(context).text('WrkngCptlCyclCshCnvrsnCycle')),
                                                          ),
                                                          new Container(
                                                            color: Constant.calculatedColor,
                                                            width: 150.0,
                                                            child: new Card(
                                                              child: new ListTile(
                                                                title: new Text(""),
                                                                subtitle: custBean.financialStmntList==null || custBean.financialStmntList
                                                                    .mworkngcapitalcycle == null
                                                                    ? new Text("")
                                                                    : new Text(
                                                                    "${formatDouble.format(custBean.financialStmntList
                                                                        .mworkngcapitalcycle)}"),
                                                              ),
                                                            ),
                                                          ),

                                                        ],
                                                      ),



                                                    ]))
                                          ],
                                        )
                                      : null),
                            ),
                          ),

                          //   ),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  calculateFixedAssetSum() {
    custBean.fixedAssetsList.msumpresentamt = 0.0;
    custBean.fixedAssetsList.msumnextmonthamount = 0.0;


    if (custBean.fixedAssetsList != null) {
      if (custBean.fixedAssetsList.mlandpresentamt != null) {
        custBean.fixedAssetsList.msumpresentamt =
            custBean.fixedAssetsList.msumpresentamt +
                custBean.fixedAssetsList.mlandpresentamt;
      }
      if (custBean.fixedAssetsList.mlandnextmonthamount != null) {
        custBean.fixedAssetsList.msumnextmonthamount =
            custBean.fixedAssetsList.msumnextmonthamount +
                custBean.fixedAssetsList.mlandnextmonthamount;
      }

      if (custBean.fixedAssetsList != null &&
          custBean.fixedAssetsList.mbuildngpresentamt != null) {
        custBean.fixedAssetsList.msumpresentamt =
            custBean.fixedAssetsList.msumpresentamt +
                custBean.fixedAssetsList.mbuildngpresentamt;
      }
      if (custBean.fixedAssetsList.mbuildngnextmonthamount != null) {
        custBean.fixedAssetsList.msumnextmonthamount =
            custBean.fixedAssetsList.msumnextmonthamount +
                custBean.fixedAssetsList.mbuildngnextmonthamount;
      }

      if (custBean.fixedAssetsList != null &&
          custBean.fixedAssetsList.mmachnryorequppresentamt != null) {
        custBean.fixedAssetsList.msumpresentamt =
            custBean.fixedAssetsList.msumpresentamt +
                custBean.fixedAssetsList.mmachnryorequppresentamt;
      }
      if (custBean.fixedAssetsList.mmachnryorequpnextmonthamount != null) {
        custBean.fixedAssetsList.msumnextmonthamount =
            custBean.fixedAssetsList.msumnextmonthamount +
                custBean.fixedAssetsList.mmachnryorequpnextmonthamount;
      }

      if (custBean.fixedAssetsList != null &&
          custBean.fixedAssetsList.mmeansandtransprtpresentamt != null) {
        custBean.fixedAssetsList.msumpresentamt =
            custBean.fixedAssetsList.msumpresentamt +
                custBean.fixedAssetsList.mmeansandtransprtpresentamt;
      }
      if (custBean.fixedAssetsList.mmeansandtransprtnextmonthamount != null) {
        custBean.fixedAssetsList.msumnextmonthamount =
            custBean.fixedAssetsList.msumnextmonthamount +
                custBean.fixedAssetsList.mmeansandtransprtnextmonthamount;
      }

      if (custBean.fixedAssetsList != null &&
          custBean.fixedAssetsList.mothrspresentamt != null) {
        custBean.fixedAssetsList.msumpresentamt =
            custBean.fixedAssetsList.msumpresentamt +
                custBean.fixedAssetsList.mothrspresentamt;
      }
      if (custBean.fixedAssetsList.mothrsnextmonthamount != null) {
        custBean.fixedAssetsList.msumnextmonthamount =
            custBean.fixedAssetsList.msumnextmonthamount +
                custBean.fixedAssetsList.mothrsnextmonthamount;
      }
    }
  }

  calculateCurrentAssetSum() {
    custBean.currentAssetsList.msumpresentamt = 0.0;
    custBean.currentAssetsList.msumnextmonthamount = 0.0;

    if (custBean.currentAssetsList != null) {
      if (custBean.currentAssetsList != null &&
          custBean.currentAssetsList.mcashpresentamt != null) {
        custBean.currentAssetsList.msumpresentamt =
            custBean.currentAssetsList.msumpresentamt +
                custBean.currentAssetsList.mcashpresentamt;
      }
      if (custBean.currentAssetsList.mcashnextmonthamount != null) {
        custBean.currentAssetsList.msumnextmonthamount =
            custBean.currentAssetsList.msumnextmonthamount +
                custBean.currentAssetsList.mcashnextmonthamount;
      }

      if (custBean.currentAssetsList != null &&
          custBean.currentAssetsList.maccntrecvblpresentamt != null) {
        custBean.currentAssetsList.msumpresentamt =
            custBean.currentAssetsList.msumpresentamt +
                custBean.currentAssetsList.maccntrecvblpresentamt;
      }
      if (custBean.currentAssetsList.maccntrecvblnextmonthamount != null) {
        custBean.currentAssetsList.msumnextmonthamount =
            custBean.currentAssetsList.msumnextmonthamount +
                custBean.currentAssetsList.maccntrecvblnextmonthamount;
      }

      if (custBean.currentAssetsList != null &&
          custBean.currentAssetsList.minventrypresentamt != null) {
        custBean.currentAssetsList.msumpresentamt =
            custBean.currentAssetsList.msumpresentamt +
                custBean.currentAssetsList.minventrypresentamt;
      }
      if (custBean.currentAssetsList.minventrynextmonthamount != null) {
        custBean.currentAssetsList.msumnextmonthamount =
            custBean.currentAssetsList.msumnextmonthamount +
                custBean.currentAssetsList.minventrynextmonthamount;
      }

      if (custBean.currentAssetsList != null &&
          custBean.currentAssetsList.mprepaidpresentamt != null) {
        custBean.currentAssetsList.msumpresentamt =
            custBean.currentAssetsList.msumpresentamt +
                custBean.currentAssetsList.mprepaidpresentamt;
      }
      if (custBean.currentAssetsList.mprepaidnextmonthamount != null) {
        custBean.currentAssetsList.msumnextmonthamount =
            custBean.currentAssetsList.msumnextmonthamount +
                custBean.currentAssetsList.mprepaidnextmonthamount;
      }

      if (custBean.currentAssetsList != null &&
          custBean.currentAssetsList.mothrspresentamt != null) {
        custBean.currentAssetsList.msumpresentamt =
            custBean.currentAssetsList.msumpresentamt +
                custBean.currentAssetsList.mothrspresentamt;
      }
      if (custBean.currentAssetsList.mothrsnextmonthamount != null) {
        custBean.currentAssetsList.msumnextmonthamount =
            custBean.currentAssetsList.msumnextmonthamount +
                custBean.currentAssetsList.mothrsnextmonthamount;
      }

      custBean.financialStmntList.mtotcurasset =
          custBean.currentAssetsList.msumpresentamt +
              custBean.currentAssetsList.msumnextmonthamount;
    }
  }

  calculatelongTermShortTermLiabilitiesAndEquitySum() {
    totalPrsntShrtLongLiabAndEquity = 0.0;
    totalNxtShrtLongLiabAndEquity = 0.0;

    if (custBean.shortTermLiabilitiesList != null &&
        custBean.shortTermLiabilitiesList.msumpresentamt != null) {
      totalPrsntShrtLongLiabAndEquity +=
          custBean.shortTermLiabilitiesList.msumpresentamt;
    }

    if (custBean.longTermLiabilitiesList != null &&
        custBean.longTermLiabilitiesList.msumpresentamt != null) {
      totalPrsntShrtLongLiabAndEquity +=
          custBean.longTermLiabilitiesList.msumpresentamt;
    }

    if (custBean.equityList != null &&
        custBean.equityList.msumpresentamt != null) {
      totalPrsntShrtLongLiabAndEquity += custBean.equityList.msumpresentamt;
    }

    if (custBean.shortTermLiabilitiesList != null &&
        custBean.shortTermLiabilitiesList.msumnextmonthamount != null) {
      totalNxtShrtLongLiabAndEquity +=
          custBean.shortTermLiabilitiesList.msumnextmonthamount;
    }

    if (custBean.longTermLiabilitiesList != null &&
        custBean.longTermLiabilitiesList.msumnextmonthamount != null) {
      totalNxtShrtLongLiabAndEquity +=
          custBean.longTermLiabilitiesList.msumnextmonthamount;
    }

    if (custBean.equityList != null &&
        custBean.equityList.msumnextmonthamount != null) {
      totalNxtShrtLongLiabAndEquity += custBean.equityList.msumnextmonthamount;
    }
  }

  calculatetotlCrrAndFxdAssetsSum() {
    totalPrsntfxdAndCurr = 0.0;
    totalNxtfxdAndCurr = 0.0;

    if (custBean.fixedAssetsList != null &&
        custBean.fixedAssetsList.msumpresentamt != null) {
      totalPrsntfxdAndCurr += custBean.fixedAssetsList.msumpresentamt;
    }

    if (custBean.currentAssetsList != null &&
        custBean.currentAssetsList.msumpresentamt != null) {
      totalPrsntfxdAndCurr += custBean.currentAssetsList.msumpresentamt;
    }

    if (custBean.currentAssetsList != null &&
        custBean.currentAssetsList.msumnextmonthamount != null) {
      totalNxtfxdAndCurr += custBean.currentAssetsList.msumnextmonthamount;
    }

    if (custBean.fixedAssetsList != null &&
        custBean.fixedAssetsList.msumnextmonthamount != null) {
      totalNxtfxdAndCurr += custBean.fixedAssetsList.msumnextmonthamount;
    }
  }

  calculatetotlLibSum() {
    totalPrsntlib = 0.0;
    totalNxtlib = 0.0;

    if (custBean.longTermLiabilitiesList != null &&
        custBean.longTermLiabilitiesList.msumpresentamt != null) {
      totalPrsntlib += custBean.longTermLiabilitiesList.msumpresentamt;
    }

    if (custBean.shortTermLiabilitiesList != null &&
        custBean.shortTermLiabilitiesList.msumpresentamt != null) {
      totalPrsntlib += custBean.shortTermLiabilitiesList.msumpresentamt;
    }

    if (custBean.longTermLiabilitiesList != null &&
        custBean.longTermLiabilitiesList.msumnextmonthamount != null) {
      totalNxtlib += custBean.longTermLiabilitiesList.msumnextmonthamount;
    }

    if (custBean.shortTermLiabilitiesList != null &&
        custBean.shortTermLiabilitiesList.msumnextmonthamount != null) {
      totalNxtlib += custBean.shortTermLiabilitiesList.msumnextmonthamount;
    }
  }


  calculatelongTermLiabilitiesAssetSum() {
    custBean.longTermLiabilitiesList.msumpresentamt = 0.0;
    custBean.longTermLiabilitiesList.msumnextmonthamount = 0.0;

    if (custBean.longTermLiabilitiesList != null) {
      if (custBean.longTermLiabilitiesList != null &&
          custBean.longTermLiabilitiesList.mcashpresentamt != null) {
        custBean.longTermLiabilitiesList.msumpresentamt =
            custBean.longTermLiabilitiesList.msumpresentamt +
                custBean.longTermLiabilitiesList.mcashpresentamt;
      }
      if (custBean.longTermLiabilitiesList.mcashnextmonthamount != null) {
        custBean.longTermLiabilitiesList.msumnextmonthamount =
            custBean.longTermLiabilitiesList.msumnextmonthamount +
                custBean.longTermLiabilitiesList.mcashnextmonthamount;
      }

      if (custBean.longTermLiabilitiesList != null &&
          custBean.longTermLiabilitiesList.maccntrecvblpresentamt != null) {
        custBean.longTermLiabilitiesList.msumpresentamt =
            custBean.longTermLiabilitiesList.msumpresentamt +
                custBean.longTermLiabilitiesList.maccntrecvblpresentamt;
      }
      if (custBean.longTermLiabilitiesList.maccntrecvblnextmonthamount !=
          null) {
        custBean.longTermLiabilitiesList.msumnextmonthamount =
            custBean.longTermLiabilitiesList.msumnextmonthamount +
                custBean.longTermLiabilitiesList.maccntrecvblnextmonthamount;
      }
    }

    custBean.shortTermLiabilitiesList.msumpresentamt = 0.0;
    custBean.shortTermLiabilitiesList.msumnextmonthamount = 0.0;

    if (custBean.shortTermLiabilitiesList != null) {
      if (custBean.shortTermLiabilitiesList != null &&
          custBean.shortTermLiabilitiesList.mcashpresentamt != null) {
        custBean.shortTermLiabilitiesList.msumpresentamt =
            custBean.shortTermLiabilitiesList.msumpresentamt +
                custBean.shortTermLiabilitiesList.mcashpresentamt;
      }
      if (custBean.shortTermLiabilitiesList.mcashnextmonthamount != null) {
        custBean.shortTermLiabilitiesList.msumnextmonthamount =
            custBean.shortTermLiabilitiesList.msumnextmonthamount +
                custBean.shortTermLiabilitiesList.mcashnextmonthamount;
      }

      if (custBean.shortTermLiabilitiesList != null &&
          custBean.shortTermLiabilitiesList.maccntrecvblpresentamt != null) {
        custBean.shortTermLiabilitiesList.msumpresentamt =
            custBean.shortTermLiabilitiesList.msumpresentamt +
                custBean.shortTermLiabilitiesList.maccntrecvblpresentamt;
      }
      if (custBean.shortTermLiabilitiesList.maccntrecvblnextmonthamount !=
          null) {
        custBean.shortTermLiabilitiesList.msumnextmonthamount =
            custBean.shortTermLiabilitiesList.msumnextmonthamount +
                custBean.shortTermLiabilitiesList.maccntrecvblnextmonthamount;
      }

      ////////////////////////////////

      if (custBean.shortTermLiabilitiesList != null &&
          custBean.shortTermLiabilitiesList.mfield3presentamt != null) {
        custBean.shortTermLiabilitiesList.msumpresentamt =
            custBean.shortTermLiabilitiesList.msumpresentamt +
                custBean.shortTermLiabilitiesList.mfield3presentamt;
      }
      if (custBean.shortTermLiabilitiesList.mfield3nextmonthamount != null) {
        custBean.shortTermLiabilitiesList.msumnextmonthamount =
            custBean.shortTermLiabilitiesList.msumnextmonthamount +
                custBean.shortTermLiabilitiesList.mfield3nextmonthamount;
      }

      if (custBean.shortTermLiabilitiesList != null &&
          custBean.shortTermLiabilitiesList.mfield4presentamt != null) {
        custBean.shortTermLiabilitiesList.msumpresentamt =
            custBean.shortTermLiabilitiesList.msumpresentamt +
                custBean.shortTermLiabilitiesList.mfield4presentamt;
      }
      if (custBean.shortTermLiabilitiesList.mfield4nextmonthamount != null) {
        custBean.shortTermLiabilitiesList.msumnextmonthamount =
            custBean.shortTermLiabilitiesList.msumnextmonthamount +
                custBean.shortTermLiabilitiesList.mfield4nextmonthamount;
      }
    }

    custBean.financialStmntList.mtotcurliabilities = 0.0;

    if (custBean.longTermLiabilitiesList.msumpresentamt != null) {
      custBean.financialStmntList.mtotcurliabilities =
          custBean.longTermLiabilitiesList.msumpresentamt;
    }
    if (custBean.longTermLiabilitiesList.msumnextmonthamount != null) {
      custBean.financialStmntList.mtotcurliabilities +=
          custBean.longTermLiabilitiesList.msumnextmonthamount;
    }

    if (custBean.shortTermLiabilitiesList.msumpresentamt != null) {
      custBean.financialStmntList.mtotcurliabilities +=
          custBean.shortTermLiabilitiesList.msumpresentamt;
    }

    if (custBean.shortTermLiabilitiesList.msumnextmonthamount != null) {
      custBean.financialStmntList.mtotcurliabilities +=
          custBean.shortTermLiabilitiesList.msumnextmonthamount;
    }
    custBean.financialStmntList.mworkngcapital=0.0;
    if (custBean.financialStmntList.mtotcurasset != null) {
      custBean.financialStmntList.mworkngcapital =
          custBean.financialStmntList.mtotcurasset;
    }
    if (custBean.financialStmntList.mtotcurliabilities != null) {
      custBean.financialStmntList.mworkngcapital =
          custBean.financialStmntList.mtotcurliabilities;
    }

    if (custBean.financialStmntList.mtotcurasset != null && custBean.financialStmntList.mtotcurliabilities != null) {
      custBean.financialStmntList.mworkngcapital =
          custBean.financialStmntList.mtotcurasset-custBean.financialStmntList.mtotcurliabilities;
    }

  }


  calculateEquitySum() {
    custBean.equityList.msumpresentamt = 0.0;
    custBean.equityList.msumnextmonthamount = 0.0;

    if (custBean.equityList != null) {
      if (custBean.equityList != null &&
          custBean.equityList.mcashpresentamt != null) {
        custBean.equityList.msumpresentamt =
            custBean.equityList.msumpresentamt +
                custBean.equityList.mcashpresentamt;
      }
      if (custBean.equityList != null &&
          custBean.equityList.mcashnextmonthamount != null) {
        custBean.equityList.msumnextmonthamount =
            custBean.equityList.msumnextmonthamount +
                custBean.equityList.mcashnextmonthamount;
      }

      if (custBean.equityList != null &&
          custBean.equityList.maccntrecvblpresentamt != null) {
        custBean.equityList.msumpresentamt =
            custBean.equityList.msumpresentamt +
                custBean.equityList.maccntrecvblpresentamt;
      }
      if (custBean.equityList != null &&
          custBean.equityList.maccntrecvblnextmonthamount != null) {
        custBean.equityList.msumnextmonthamount =
            custBean.equityList.msumnextmonthamount +
                custBean.equityList.maccntrecvblnextmonthamount;
      }
    }
  }

  CalculateMopexpfirstp() {
    print("CalculateMopexpfirstpAndMtotalopexpp");
    if (custBean.incomeStatementList.mpersonalexpfirstp != null) {
      custBean.incomeStatementList.mopexpfirstp =
          custBean.incomeStatementList.mpersonalexpfirstp;
      if (custBean.incomeStatementList.mgeneralexpfirstp != null) {
        custBean.incomeStatementList.mopexpfirstp =
            custBean.incomeStatementList.mopexpfirstp +
                custBean.incomeStatementList.mgeneralexpfirstp;
      }
      if (custBean.incomeStatementList.motherexpfirstp != null) {
        custBean.incomeStatementList.mopexpfirstp =
            custBean.incomeStatementList.mopexpfirstp +
                custBean.incomeStatementList.motherexpfirstp;
      }
    }
  }

  CalculateMtotalopexpp() {
    if (custBean.incomeStatementList.mopexpfirstp != null) {
      custBean.incomeStatementList.mtotalopexpp =
          custBean.incomeStatementList.mopexpfirstp;
      if (custBean.incomeStatementList.mopexpsecondp != null) {
        custBean.incomeStatementList.mtotalopexpp =
            custBean.incomeStatementList.mtotalopexpp +
                custBean.incomeStatementList.mopexpsecondp;
      }
    }
  }

  CalculateMopexpfirstnm() {
    print("CalculateMopexpfirstnmAndMtotalopexpnm");
    if (custBean.incomeStatementList.mpersonalexpfirstnm != null) {
      custBean.incomeStatementList.mopexpfirstnm =
          custBean.incomeStatementList.mpersonalexpfirstnm;
      if (custBean.incomeStatementList.mgeneralexpfirstnm != null) {
        custBean.incomeStatementList.mopexpfirstnm =
            custBean.incomeStatementList.mopexpfirstnm +
                custBean.incomeStatementList.mgeneralexpfirstnm;
      }
      if (custBean.incomeStatementList.motherexpfirstnm != null) {
        custBean.incomeStatementList.mopexpfirstnm =
            custBean.incomeStatementList.mopexpfirstnm +
                custBean.incomeStatementList.motherexpfirstnm;
      }
    }
  }

  CalculateMtotalopexpnm() {
    if (custBean.incomeStatementList.mopexpfirstnm != null) {
      custBean.incomeStatementList.mtotalopexpnm =
          custBean.incomeStatementList.mopexpfirstnm;
      if (custBean.incomeStatementList.mopexpsecondnm != null) {
        custBean.incomeStatementList.mtotalopexpnm =
            custBean.incomeStatementList.mtotalopexpnm +
                custBean.incomeStatementList.mopexpsecondnm;
      }
    }
  }

  CalculateMopexpsecondp() {
    if (custBean.incomeStatementList.mpersonalexpsecondp != null) {
      custBean.incomeStatementList.mopexpsecondp =
          custBean.incomeStatementList.mpersonalexpsecondp;
      if (custBean.incomeStatementList.mgeneralexpsecondp != null) {
        custBean.incomeStatementList.mopexpsecondp =
            custBean.incomeStatementList.mopexpsecondp +
                custBean.incomeStatementList.mgeneralexpsecondp;
      }
      if (custBean.incomeStatementList.motherexpsecondp != null) {
        custBean.incomeStatementList.mopexpsecondp =
            custBean.incomeStatementList.mopexpsecondp +
                custBean.incomeStatementList.motherexpsecondp;
      }
    }
  }

  CalculateMopexpsecondnm() {
    if (custBean.incomeStatementList.mpersonalexpsecondnm != null) {
      custBean.incomeStatementList.mopexpsecondnm =
          custBean.incomeStatementList.mpersonalexpsecondnm;
      if (custBean.incomeStatementList.mgeneralexpsecondnm != null) {
        custBean.incomeStatementList.mopexpsecondnm =
            custBean.incomeStatementList.mopexpsecondnm +
                custBean.incomeStatementList.mgeneralexpsecondnm;
      }
      if (custBean.incomeStatementList.motherexpsecondnm != null) {
        custBean.incomeStatementList.mopexpsecondnm =
            custBean.incomeStatementList.mopexpsecondnm +
                custBean.incomeStatementList.motherexpsecondnm;
      }
    }
  }

  CalculateWorkingCapitalCycle() {
    double workingCapitalCycle = 0.0;
    if (custBean.financialStmntList.minvconperiod != null) {
      workingCapitalCycle =
          workingCapitalCycle + custBean.financialStmntList.minvconperiod;
    }
    if (custBean.financialStmntList.mrecconperiod != null) {
      workingCapitalCycle =
          workingCapitalCycle + custBean.financialStmntList.mrecconperiod;
    }
    if (custBean.financialStmntList.mpayconperiod != null) {
      workingCapitalCycle =
          workingCapitalCycle - custBean.financialStmntList.mpayconperiod;
    }
    custBean.financialStmntList.mworkngcapitalcycle =
        double.parse((workingCapitalCycle).toStringAsFixed(2));
  }

  proceed() async {
    if (!validateSubmit()) {
      return;
    }
    int id = 0;
    try {
      if (custBean.fixedAssetsList != null) {

      }

    } catch (_) {}

    try {
      print("custBean.currentAssetsList " +
          custBean.currentAssetsList.toString());
      if (custBean.currentAssetsList != null) {


      }
      print("Customer current asset detail update complete");
    } catch (_) {}

    try {
      if (custBean.longTermLiabilitiesList != null) {


      }
      print("Customer long term liability detail update complete");
    } catch (_) {}

    try {
      if (custBean.shortTermLiabilitiesList != null) {


      }
      print("Customer short term liability detail update complete");
    } catch (_) {}
    try {
      if (custBean.equityList != null) {


      }
    } catch (_) {}

    try {
      print("Customer equity detail update complete");

      if (custBean.incomeStatementList == null) {
        custBean.incomeStatementList = new IncomeStatementBean();
      }



      print("Customer income statement detail update complete");
    } catch (_) {}

    try {
      if (custBean.financialStmntList == null) {
        custBean.financialStmntList = new FinancialStmntBean();
      }

      print("Customer financial statement detail update complete");
    } catch (_) {}


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
                  Text('Done'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<bool> callBackDialog(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content:
                new Text('Do you want to Go To Loan List without saving data'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  custBean = new CustomerListBean();
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
//
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }


  Future<Null> _selectBalFrmDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != custBean.fixedAssetsList.mfromdate)
      setState(() {
        custBean.fixedAssetsList.mfromdate = picked;
        tempBalFrmDate = dateformatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempBalFrmDay = "0" + picked.day.toString();
        } else
          tempBalFrmDay = picked.day.toString();
        loanBalFrmDt = loanBalFrmDt.replaceRange(0, 2, tempBalFrmDay);
        tempBalFrmYear = picked.year.toString();
        loanBalFrmDt = loanBalFrmDt.replaceRange(6, 10, tempBalFrmYear);
        if (picked.month.toString().length == 1) {
          tempBalFrmMonth = "0" + picked.month.toString();
        } else
          tempBalFrmMonth = picked.month.toString();
        loanBalFrmDt = loanBalFrmDt.replaceRange(3, 5, tempBalFrmMonth);
      });
  }


  Future<Null> _selectBalToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != custBean.fixedAssetsList.mtodate)
      setState(() {
        custBean.fixedAssetsList.mtodate = picked;
        tempBalToDate = dateformatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempBalToDay = "0" + picked.day.toString();
        } else
          tempBalToDay = picked.day.toString();
        loanBalToDt = loanBalToDt.replaceRange(0, 2, tempBalToDay);
        tempBalToYear = picked.year.toString();
        loanBalToDt = loanBalToDt.replaceRange(6, 10, tempBalToYear);
        if (picked.month.toString().length == 1) {
          tempBalToMonth = "0" + picked.month.toString();
        } else
          tempBalToMonth = picked.month.toString();
        loanBalToDt = loanBalToDt.replaceRange(3, 5, tempBalToMonth);
      });
  }

  Future<Null> _selectIncmFrmDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != custBean.incomeStatementList.mfromdate)
      setState(() {
        custBean.incomeStatementList.mfromdate = picked;
        tempIncmFrmDate = dateformatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempIncmFrmDay = "0" + picked.day.toString();
        } else
          tempIncmFrmDay = picked.day.toString();
        loanIncmFrmDt = loanIncmFrmDt.replaceRange(0, 2, tempIncmFrmDay);
        tempIncmFrmYear = picked.year.toString();
        loanIncmFrmDt = loanIncmFrmDt.replaceRange(6, 10, tempIncmFrmYear);
        if (picked.month.toString().length == 1) {
          tempIncmFrmMonth = "0" + picked.month.toString();
        } else
          tempIncmFrmMonth = picked.month.toString();
        loanIncmFrmDt = loanIncmFrmDt.replaceRange(3, 5, tempIncmFrmMonth);
      });
  }


  Future<Null> _selectIncmToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != custBean.incomeStatementList.mtodate)
      setState(() {
        custBean.incomeStatementList.mtodate = picked;
        tempIncmToDate = dateformatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempIncmToDay = "0" + picked.day.toString();
        } else
          tempIncmToDay = picked.day.toString();
        loanIncmToDt = loanIncmToDt.replaceRange(0, 2, tempIncmToDay);
        tempIncmToYear = picked.year.toString();
        loanIncmToDt = loanIncmToDt.replaceRange(6, 10, tempIncmToYear);
        if (picked.month.toString().length == 1) {
          tempIncmToMonth = "0" + picked.month.toString();
        } else
          tempIncmToMonth = picked.month.toString();
        loanIncmToDt = loanIncmToDt.replaceRange(3, 5, tempIncmToMonth);
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
              child: Text('ok'),
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
    String error = "";
print("totalPrsntfxdAndCurr"+totalPrsntfxdAndCurr.toString());
print("totalPrsntShrtLongLiabAndEquity"+totalPrsntShrtLongLiabAndEquity.toString());
    print("totalNxtfxdAndCurr"+totalNxtfxdAndCurr.toString());
if(totalPrsntfxdAndCurr!=0.0||totalPrsntShrtLongLiabAndEquity!=0.0){
    if (totalPrsntfxdAndCurr !=totalPrsntShrtLongLiabAndEquity ) {
      _showAlert("Total Present liablities and Asset", "It must match");
      //
      return false;
    }}
    if(totalNxtfxdAndCurr!=0.0||totalNxtShrtLongLiabAndEquity!=0.0){
double tomatch=double.parse(totalNxtfxdAndCurr.toStringAsFixed(2));
double tomatch2=double.parse(totalNxtShrtLongLiabAndEquity.toStringAsFixed(2));
      if (tomatch!=tomatch2) {
      _showAlert("Total Next Month liablities and Asset", "It must match");
      //
      return false;
    }}


    return true;
  }


}
