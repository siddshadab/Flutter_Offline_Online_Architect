import 'dart:async';
import 'dart:convert';
import 'package:eco_los/screens/LoanApplication/FullScreenDialogForProductSelection.dart';
import 'package:eco_los/screens/LoanApplication/FullScreenDialogForPurposeSelection.dart';
import 'package:eco_los/screens/LoanApplication/List/AccuntListForLoan.dart';
import 'package:eco_los/screens/LoanApplication/bean/PurposeOfLoan.dart';
import 'package:eco_los/screens/LoanApplication/bean/RepaymentFrequency.dart';
import 'package:eco_los/screens/LoanApplication/bean/TransactionMode.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationBusinessCashFlow3.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForMainOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/FullScreenDialogForSubOccupationSelection.dart';
import 'package:eco_los/screens/customerFormation/bean/CurrentAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/EquityBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FinancialStmntBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FixedAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/IncomeStatementBean.dart';
import 'package:eco_los/screens/customerFormation/bean/LongTermLiabilitiesBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ShortTermLiabilitiesBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import 'FullScreenDialogForHbsUsers.dart';
import 'bean/HbsUserBean.dart';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/helpers/ThemeDesign.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetails.dart';
import 'package:eco_los/screens/LoanApplication/List/CustomerLoanDetailsList.dart';
import 'package:eco_los/screens/LoanApplication/LoanLimitDetails.dart';
import 'package:eco_los/screens/LoanApplication/bean/CustomerLoanDetailsBean.dart';
import 'package:eco_los/screens/LoanApplication/bean/Product.dart';
import 'package:eco_los/screens/collateral/CollateralList.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/documentCollector/DocumetCollector.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/home/Menu_Dashboard.dart';
import 'package:eco_los/screens/home/side_drawer.dart';
import 'package:eco_los/screens/login/Login.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';



class LoanLimitDetails extends StatefulWidget {
  final laonLimitPassedObject;
  LoanLimitDetails({Key key, this.laonLimitPassedObject}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _LoanLimitDetailsState createState() => new _LoanLimitDetailsState();
}

class _LoanLimitDetailsState extends State<LoanLimitDetails> {

  static const JsonCodec JSON = const JsonCodec();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TabController _tabController;
  ProductBean prodObj = new ProductBean();
  SubLookupForSubPurposeOfLoan purposeObj = new SubLookupForSubPurposeOfLoan();
  TransactionMode transObj = new TransactionMode();
  RepaymentFrequency RepayFreqObj = new RepaymentFrequency();
  SystemParameterBean sysBean = new SystemParameterBean();
  List isMemberOfGroupListLoan = [0];
  String mIsGroupLendingNeeded = "Y";
  bool isMemeberOfGroupForLoan = true;
  String multiplePurposeDesc = "";
  String multiplePurposeCode = "";
  bool toShow=false;
  bool isTopUp=false;

  SubLookupForSubPurposeOfLoan mainOcc = new SubLookupForSubPurposeOfLoan();
  SubLookupForSubPurposeOfLoan subOcc = new SubLookupForSubPurposeOfLoan();
  final formatDouble = new NumberFormat("#,##0.00", "en_US");

  double rateOfInterest;
  String purposeName = "";
  int purposeId = null;
  String subPurposeName = "";
  String subPurposeId;
  String disbursmentMode = "";
  int disbursmentModeId = null;
  String collectionMode = "";
  int collectionModeId = null;
  double canApplyMaxAmount = 0.0;
  double canApplyMaxInst = 0.0;
  LookupBeanData frequency;
  LookupBeanData repaymentmode;
  LookupBeanData modeofdisb;
  LookupBeanData purpose;
  LookupBeanData typeOfLoan;
  LookupBeanData repaymentFreq;
  LookupBeanData securedYN;
  LookupBeanData investment;
  LookupBeanData rental;
  LookupBeanData oweneruse;
  LookupBeanData payoffreason;

  LookupBeanData crdtclsfcd;
  LookupBeanData crdtsbclsfcd;


  DateTime selectedDate = DateTime.now();
  //final dateFormat = DateFormat("EEEE, MMMM d, yyyy");
  DateTime date;
  TimeOfDay time;
  //final dateFormat = DateFormat("yyyy/MM/dd");
  var formatter = new DateFormat('dd-MM-yyyy');
  String tempDate = "----/--/--";
  String tempYear;
  String tempDay;
  String tempMonth;
  bool boolValidate = false;
  int loanCycle = 0;
  int loanNumber;
  int branch;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;
  String loanDisbDt = "__-__-____";
  String loaninstStrtDt = "__-__-____";
  FocusNode monthFocus;
  FocusNode yearFocus;
  FocusNode monthInstStrtFocus;
  FocusNode yearInstStrtFocus;
  String tempInstStrtDate = "----/--/--";
  String tempInstStrtYear;
  String tempInstStrtDay;
  String tempInstStrtMonth;
  int mgrpID;
  bool isEditAllowed = true;
  CustomerLoanDetailsBean cusLoanObj = new CustomerLoanDetailsBean();
  @override
  void initState() {
    super.initState();
    //select amout salb based on tier field from customer
    try {
      if (widget.laonLimitPassedObject != null) {
        isEditAllowed = widget.laonLimitPassedObject.isEditAllowed;
        cusLoanObj = widget.laonLimitPassedObject;
        loanDisbDt = cusLoanObj.mloandisbdt.toString();
        loaninstStrtDt = cusLoanObj.minststrtdt.toString();
        //getSubpurposeOnEditMode();
        if ((widget.laonLimitPassedObject.mmainoccupn.toString() == "4000" ||
            widget.laonLimitPassedObject.mmainoccupn.toString() == "2500" ||
            widget.laonLimitPassedObject.mmainoccupn.toString() == "6500")) {
          toShow = true;
        } else {
          toShow = false;
        }
      }
      else {
        cusLoanObj.mappliedasind = '0';
      }
      getSessionVariables();
      //bhawpriya

      monthFocus = new FocusNode();
      yearFocus = new FocusNode();
      monthInstStrtFocus = new FocusNode();
      yearInstStrtFocus = new FocusNode();
      List<String> tempDropDownValues = new List<String>();
      tempDropDownValues.add(cusLoanObj.mpurposeofLoan.toString());
      tempDropDownValues.add(cusLoanObj.mfrequency);
      tempDropDownValues.add(cusLoanObj.mrepaymentmode.toString());
      tempDropDownValues.add(cusLoanObj.mmodeofdisb.toString());
      tempDropDownValues.add(cusLoanObj.mtypeofloan);
      tempDropDownValues.add(cusLoanObj.missecuredloan);
      tempDropDownValues.add(cusLoanObj.mrepaymentfreq);
      tempDropDownValues.add(cusLoanObj.minvestment);
      tempDropDownValues.add(cusLoanObj.mrental);
      tempDropDownValues.add(cusLoanObj.mowneruse);
      tempDropDownValues.add(cusLoanObj.payoffreason);
      tempDropDownValues.add(cusLoanObj.mfacilitycd);
      tempDropDownValues.add(cusLoanObj.mcrdtsbclsfcd);


      if (!loanDisbDt.contains("_")) {
        try {
          DateTime formattedDate = DateTime.parse(loanDisbDt);
          tempDay = formattedDate.day.toString();
          tempMonth = formattedDate.month.toString();
          tempYear = formattedDate.year.toString();
          loanDisbDt = tempDay.toString() + "-" + tempMonth.toString() + "-" +
              tempYear.toString();
          setState(() {});
        } catch (e) {
          print("Exception Occupred");
        }
      }
      if (!loaninstStrtDt.contains("_")) {
        try {
          DateTime formattedDate = DateTime.parse(loaninstStrtDt);
          tempInstStrtDay = formattedDate.day.toString();
          tempInstStrtMonth = formattedDate.month.toString();
          tempInstStrtYear = formattedDate.year.toString();
          loaninstStrtDt =
              tempInstStrtDay.toString() + "-" + tempInstStrtMonth.toString() +
                  "-" + tempInstStrtYear.toString();
          setState(() {});
        } catch (e) {
          print("Exception Occupred");
        }
      }

      for (int k = 0;
      k < globals.dropdownCaptionsValuesCustLoanDetailsInfo.length;
      k++) {
        for (int i = 0;
        i < globals.dropdownCaptionsValuesCustLoanDetailsInfo[k].length;
        i++) {
          if (globals.dropdownCaptionsValuesCustLoanDetailsInfo[k][i].mcode ==
              tempDropDownValues[k]) {
            setValue(
                k, globals.dropdownCaptionsValuesCustLoanDetailsInfo[k][i]);
          }
        }
      }
      if (globals.applicationDate == null) {
        globals.applicationDate = DateTime.now();
      }
    }catch(_){}
    //  cusLoanObj.customerNumber = custListObj.customerNumber;
    if (widget.laonLimitPassedObject != null) {
      cusLoanObj = widget.laonLimitPassedObject;
    } else {

    }
  }


  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode);
      reportingUser = prefs.getString(TablesColumnFile.mreportinguser);
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.musrdesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.mgrpcd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation = prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();

      if (prefs.getString(TablesColumnFile.mIsGroupLendingNeeded) != null &&
          prefs.getString(TablesColumnFile.mIsGroupLendingNeeded).trim() !=
              "") {
        mIsGroupLendingNeeded =
            prefs.getString(TablesColumnFile.mIsGroupLendingNeeded);

        if (mIsGroupLendingNeeded != null &&
            mIsGroupLendingNeeded.trim().toUpperCase() == 'N') {
          isMemeberOfGroupForLoan = false;
        }
      }
      print(prefs.getString(TablesColumnFile.mIsGroupLendingNeeded));
    });
  }



  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesCustLoanDetailsInfo[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesCustLoanDetailsInfo[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();

    return _dropDownMenuItems1;
  }



  showDropDown(LookupBeanData selectedObj, int no) {

    if (selectedObj.mcodedesc.isEmpty) {

      switch (no) {
        case 0:
          purpose = blankBean;
          cusLoanObj.mpurposeofLoan = 0;
          break;
        case 1:
          frequency = blankBean;
          cusLoanObj.mfrequency = blankBean.mcode;
          break;
        case 2:
          repaymentmode = blankBean;
          cusLoanObj.mrepaymentmode = 0;
          break;
        case 3:
          modeofdisb = blankBean;
          cusLoanObj.mmodeofdisb = 0;
          break;
        case 4:
          typeOfLoan = blankBean;
          cusLoanObj.mtypeofloan = blankBean.mcode;
          break;
        case 5:
          securedYN = blankBean;
          cusLoanObj.missecuredloan = blankBean.mcode;
          break;
        case 6:
          repaymentFreq = blankBean;
          cusLoanObj.mrepaymentfreq = blankBean.mcode;
          break;
        case 7:
          investment = blankBean;
          cusLoanObj.minvestment = blankBean.mcode;
          break;
        case 8:
          rental = blankBean;
          cusLoanObj.mrental = blankBean.mcode;
          break;
        case 9:
          oweneruse = blankBean;
          cusLoanObj.mowneruse = blankBean.mcode;
          break;
        case 10:
          payoffreason = blankBean;
          cusLoanObj.payoffreason = blankBean.mcode;
          break;
        case 11:
          crdtclsfcd = blankBean;
          cusLoanObj.mfacilitycd = blankBean.mcode;
          break;
        case 12:
          crdtsbclsfcd = blankBean;
          cusLoanObj.mcrdtsbclsfcd = blankBean.mcode;
          break;
        default:
          break;
      }
      setState(() {});
    } else {
      bool isBreak = false;
      for (int k = 0;
      k < globals.dropdownCaptionsValuesCustLoanDetailsInfo[no].length;
      k++) {

        if (globals.dropdownCaptionsValuesCustLoanDetailsInfo[no][k].mcodedesc
            .trim() ==
            selectedObj.mcodedesc.trim()) {
          setValue(no, selectedObj);
          isBreak = true;
          break;
        }
        if (isBreak) {
          break;
        }
      }
    }
  }

  setValue(int no, LookupBeanData value) async{
    setState(() {

      switch (no) {
        case 0:

          purpose = value;
          cusLoanObj.mpurposeofLoan = int.parse(value.mcode);
          if(widget.laonLimitPassedObject==null) {

          }

          break;
        case 1:

          frequency = value;
          cusLoanObj.mfrequency = value.mcode;

          break;
        case 2:
          repaymentmode = value;
          cusLoanObj.mrepaymentmode = int.parse(value.mcode);
          break;
        case 3:
          modeofdisb = value;
          cusLoanObj.mmodeofdisb = int.parse(value.mcode);
          break;
        case 4:
          typeOfLoan = value;
          cusLoanObj.mtypeofloan = value.mcode;
          if(cusLoanObj.mtypeofloan=="4"){
            isTopUp=true;
          }else{

            isTopUp=false;

          }
          break;
        case 5:
          securedYN = value;
          cusLoanObj.missecuredloan = value.mcode;
          break;
        case 6:
          repaymentFreq = value;
          cusLoanObj.mrepaymentfreq = value.mcode;
          break;
        case 7:
          investment = value;
          cusLoanObj.minvestment = value.mcode;
          break;
        case 8:
          rental = value;
          cusLoanObj.mrental = value.mcode;
          break;
        case 9:
          oweneruse = value;
          cusLoanObj.mowneruse = value.mcode;
          break;
        case 10:
          payoffreason = value;
          cusLoanObj.payoffreason = value.mcode;
          break;
        case 11:
          crdtclsfcd = value;
          cusLoanObj.mfacilitycd= value.mcode;
          break;
        case 12:
          crdtsbclsfcd = value;
          cusLoanObj.mcrdtsbclsfcd = value.mcode;

          break;
        default:
          break;
      }
    });

    if (cusLoanObj.mprdcd != null && cusLoanObj.mloancycle !=null &&
        cusLoanObj.mfrequency != null && branch!=null&&branch > 0){


      await AppDatabase.get()
          .selectMaxLoanAmtCanApply(
          cusLoanObj.mprdcd.trim().toString(),
          cusLoanObj.mloancycle+1,
          branch,
          cusLoanObj.mfrequency)
          .then((onValue) {

        for(int secondLoanCycle = 0;secondLoanCycle<onValue.length;secondLoanCycle++){
          if(onValue[secondLoanCycle].mruletype ==1){
            canApplyMaxAmount = onValue[secondLoanCycle].mmaxamount;
          }else if(onValue[secondLoanCycle].mruletype ==2)
            canApplyMaxInst  = onValue[secondLoanCycle].mmaxamount;
        }
        setState(() {

        });
      });
    }
  }

  LookupBeanData blankBean =
  new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);

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
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        elevation: 1.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff07426A),
        brightness: Brightness.light,
        title: new Text(
          'Loan Application',
          //textDirection: TextDirection,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.normal),
        ),
        actions: <Widget>[
         isEditAllowed? new IconButton(
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
          await calculate();
          setState(() {});
        },
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            new Card(
              child: new ListTile(
                title: new Text(Translations.of(context).text('LnTabRefNo')),
                subtitle: new Text("${cusLoanObj.UUID}"),
              ),
            ),

            new Card(
              color: Constant.mandatoryColor,
              child: new ListTile(
                  title: new Text(Translations.of(context).text('customer_number_and_name')  ),
                  subtitle: cusLoanObj.mcustno == null
                      ? new Text("")
                      : new Text(
                      "${cusLoanObj.mcustno.toString() + " " + cusLoanObj.mcustname.toString()}"),
                  onTap: () => getCustomerNumber()),
            ),


            cusLoanObj !=null && cusLoanObj.CUSTUUID !=null ? new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  onPressed:  () async{
                    await addCashFlow(cusLoanObj);
                  },
                  child:  Text(Translations.of(context).text('AddCash')),
                  color: Colors.green,
                ),

              ],
            ):Container(),
            new Card(
              child: new DropdownButtonFormField(
                value: crdtclsfcd ,
                items:generateDropDown(11),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 11);
                },
                validator: (args) {},
                decoration: InputDecoration(
                  isDense: true,
                  labelText: Translations.of(context).text('facility_type'),
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
              ),
            ),


            new Card(
              color: Constant.mandatoryColor,
              child: new ListTile(
                title: new Text(Translations.of(context).text('PRODUCTS')),
                subtitle: cusLoanObj.mprdname == null && cusLoanObj.mprdcd == null && cusLoanObj.mcurcd == 'null'
                    ? new Text("")
                    : new Text("${cusLoanObj.mprdname == null || cusLoanObj.mprdname == 'null' ? "" : cusLoanObj.mprdname.trim()}${cusLoanObj.mprdcd == null || cusLoanObj.mprdcd == 'null' ? "" : "/"+cusLoanObj.mprdcd.trim()}${cusLoanObj.mcurcd == null || cusLoanObj.mcurcd== 'null' ? "" : "("+cusLoanObj.mcurcd.trim()+")"}"),
                onTap: getProduct,
              ),
            ),
            new Card(
              color: Constant.mandatoryColor,

              child: new ListTile(
                  title: new Text(Translations.of(context).text('purpose_of_loan')),
                  subtitle: cusLoanObj.msubpurposeofloandesc == null
                      ? new Text("")
                      : new Container (
                    // height: 75.0,
                    child: new Row (
                      children: [
                        new Expanded(
                          child: new Text (cusLoanObj.msubpurposeofloandesc.toString()!=null&& cusLoanObj.msubpurposeofloandesc.toString()!="" && cusLoanObj.msubpurposeofloandesc.toString()!="null"?cusLoanObj.msubpurposeofloandesc.toString():'',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    decoration: new BoxDecoration (
                      // backgroundColor: Colors.grey[300],
                    ),
                    width: 400.0,
                  ),
                  onTap: () => getPurpose("purpose",1)),
            ),

            new Card(
              color: Constant.mandatoryColor,

              child: new ListTile(
                  title: new Text(Translations.of(context).text('industry')),
                  subtitle: cusLoanObj.mmainoccupn == null
                      ? new Text("")
                      : new Text("Industry : ${cusLoanObj.mmainoccupndesc}   And Code : ${cusLoanObj.mmainoccupn}"),

                  onTap: () => getMainOccupation("Industry",0)),
            ),
            toShow?
            new Card(
              child: new DropdownButtonFormField(
                value: investment,
                items: generateDropDown(7),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 7);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('investment'),
                  labelText: Translations.of(context).text('investment'),
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
              ),
            ):new Container(),
            toShow?
            new Card(
              child: new DropdownButtonFormField(
                value: rental,
                items: generateDropDown(8),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 8);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('rental'),
                  labelText: Translations.of(context).text('rental'),
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
              ),
            ):new Container(),
            toShow?
            Container(
                color: Constant.mandatoryColor,
                child:
            new Card(
              child: new DropdownButtonFormField(
                value: oweneruse,
                items: generateDropDown(9),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 9);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('oweneruse'),
                  labelText: Translations.of(context).text('oweneruse'),
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
              ),
            )):new Container(),
            new Card(
              color: Constant.mandatoryColor,
              child: new ListTile(
                  title: new Text(Translations.of(context).text('sector')),
                  subtitle: cusLoanObj.msuboccupn == null
                      ? new Text("")
                      : new Text("Sector : ${cusLoanObj.msuboccupndesc}   And Code : ${cusLoanObj.msuboccupn}"),
                  onTap: () => getSubOccupation("Sector",
                      int.parse(cusLoanObj.mmainoccupn != null ? cusLoanObj.mmainoccupn : 0))),
            ),
            new Card(
              color: Constant.mandatoryColor,

              child: new ListTile(
                  title: new Text(Translations.of(context).text('hbs_usr')),
                  subtitle: cusLoanObj.mrouteto == null
                      ? new Text("")
                      : new Text("User Code : ${cusLoanObj.mrouteto}"),
                  onTap: () => getHbsUser()),
            ),
            new Card(
              color: Constant.mandatoryColor,

              child: new DropdownButtonFormField(
                value: frequency,
                items: generateDropDown(1),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 1);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('SlctRepayln'),
                  labelText: Translations.of(context).text('Replan'),
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
              ),

            ),
            new Column(
              children: <Widget>[
    Container(
    color: Constant.mandatoryColor,
    child:
                new TextFormField(
                    keyboardType: TextInputType.multiline,
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('Remarks'),
                      labelText: Translations.of(context).text('Remarks'),
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
                    inputFormatters: [new LengthLimitingTextInputFormatter(600),globals.onlyAphaNumeric],

                    initialValue: cusLoanObj.mremarks == null
                        ? ""
                        : cusLoanObj.mremarks.toString(),
                    onSaved: (String value) {

                      if (value.isNotEmpty &&
                          value != "" &&
                          value != null &&
                          value != 'null') {
                        cusLoanObj.mremarks = (value);
                      }
                      // cusLoanObj.mloanamtdisbd = cusLoanObj.mappldloanamt;
                      // cusLoanObj.mapprvdloanamt = cusLoanObj.mappldloanamt;
                    })),

                Container(
                  color: Constant.semiMandatoryColor ,
                  child:  new TextFormField(

                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration:  InputDecoration(
                      hintText: Translations.of(context).text('EntrApplAmt'),
                      labelText: Translations.of(context).text('ApplAmt'),
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
                    inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                    initialValue: cusLoanObj.mappldloanamt == null
                        ? ""
                        : cusLoanObj.mappldloanamt.toString(),
                    onSaved: (String value) {

                      if (value.isNotEmpty &&
                          value != "" &&
                          value != null &&
                          value != 'null') {
                        cusLoanObj.mappldloanamt = double.parse(value);
                      }
                      cusLoanObj.mloanamtdisbd = cusLoanObj.mappldloanamt;
                      cusLoanObj.mapprvdloanamt = cusLoanObj.mappldloanamt;
                    }),)

              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(),
              child: new Row(
                children: <Widget>[Text(Constant.loandisbdt)],
              ),
            ),
            new Container(
              color: Constant.mandatoryColor,
              child: new Row(
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    child: new TextField(
                        decoration: InputDecoration(hintText: Translations.of(context).text('DD')),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(2),
                          globals.onlyIntNumber
                        ],
                        controller: tempDay == null
                            ? null
                            : new TextEditingController(text: tempDay),
                        keyboardType: TextInputType.numberWithOptions(),
                        onChanged: (val) {
                          if (val != "0") {
                            tempDay = val;

                            if (int.parse(val) <= 31 && int.parse(val) > 0) {
                              if (val.length == 2) {
                                loanDisbDt = loanDisbDt.replaceRange(0, 2, val);
                                FocusScope.of(context).requestFocus(monthFocus);
                              } else {
                                loanDisbDt =
                                    loanDisbDt.replaceRange(0, 2, "0" + val);
                              }
                            } else {
                              setState(() {
                                tempDay = "";
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
                        hintText: Translations.of(context).text('MM'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      focusNode: monthFocus,
                      controller: tempMonth == null
                          ? null
                          : new TextEditingController(text: tempMonth),
                      onChanged: (val) {
                        if (val != "0") {
                          tempMonth = val;
                          if (int.parse(val) <= 12 && int.parse(val) > 0) {
                            if (val.length == 2) {
                              loanDisbDt = loanDisbDt.replaceRange(3, 5, val);

                              FocusScope.of(context).requestFocus(yearFocus);
                            } else {
                              loanDisbDt =
                                  loanDisbDt.replaceRange(3, 5, "0" + val);
                            }
                          } else {
                            setState(() {
                              tempMonth = "";
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
                        hintText: Translations.of(context).text('YYYY'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(4),
                        globals.onlyIntNumber
                      ],
                      focusNode: yearFocus,
                      controller: tempYear == null
                          ? null
                          : new TextEditingController(text: tempYear),
                      onChanged: (val) {
                        tempYear = val;
                        if (val.length == 4)
                          loanDisbDt = loanDisbDt.replaceRange(6, 10, val);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDisDtDate(context);
                      })
                ],
              ),
            ),
//loanstart dt
            SizedBox(height: 20.0,),
            Container(
              decoration: BoxDecoration(),
              child: new Row(
                children: <Widget>[Text(Constant.loaninstStrtDt)],
              ),
            ),
            new Container(
              color: Constant.mandatoryColor,
              child: new Row(
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    child: new TextField(
                        decoration: InputDecoration(hintText: Translations.of(context).text('DD')),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(2),
                          globals.onlyIntNumber
                        ],
                        controller: tempInstStrtDay == null
                            ? null
                            : new TextEditingController(text: tempInstStrtDay),
                        keyboardType: TextInputType.numberWithOptions(),
                        onChanged: (val) {
                          if (val != "0") {
                            tempInstStrtDay = val;

                            if (int.parse(val) <= 31 && int.parse(val) > 0) {
                              if (val.length == 2) {
                                loaninstStrtDt = loaninstStrtDt.replaceRange(0, 2, val);
                                FocusScope.of(context).requestFocus(monthInstStrtFocus);
                              } else {
                                loaninstStrtDt =
                                    loaninstStrtDt.replaceRange(0, 2, "0" + val);
                              }
                            } else {
                              setState(() {
                                tempInstStrtDay = "";
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
                        hintText: Translations.of(context).text('MM'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      focusNode: monthInstStrtFocus,
                      controller: tempInstStrtMonth == null
                          ? null
                          : new TextEditingController(text: tempInstStrtMonth),
                      onChanged: (val) {
                        if (val != "0") {
                          tempInstStrtMonth = val;
                          if (int.parse(val) <= 12 && int.parse(val) > 0) {
                            if (val.length == 2) {
                              loaninstStrtDt = loaninstStrtDt.replaceRange(3, 5, val);

                              FocusScope.of(context).requestFocus(yearInstStrtFocus);
                            } else {
                              loaninstStrtDt =
                                  loaninstStrtDt.replaceRange(3, 5, "0" + val);
                            }
                          } else {
                            setState(() {
                              tempInstStrtMonth = "";
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
                        hintText: Translations.of(context).text('YYYY'),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(4),
                        globals.onlyIntNumber
                      ],
                      focusNode: yearInstStrtFocus,
                      controller: tempInstStrtYear == null
                          ? null
                          : new TextEditingController(text: tempInstStrtYear),
                      onChanged: (val) {
                        tempInstStrtYear = val;
                        if (val.length == 4)
                          loaninstStrtDt =  loaninstStrtDt.replaceRange(6, 10, val);

                      },

                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectStrtDtDate(context);
                      })
                ],
              ),
            ),

    Container(
    color: Constant.semiMandatoryColor ,
    child:
            new TextFormField(
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: Translations.of(context).text('EntrTnrsInMnths'),
                  labelText: Translations.of(context).text('TnrsInMnths'),
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
                initialValue:
                cusLoanObj.mperiod == null ? "" : "${cusLoanObj.mperiod}",
                validator: (String value) {
                  if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                      .hasMatch(value)) {
                    return "no special character allowed";
                  } else
                    return null;
                },
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(3),
                  globals.onlyIntNumber
                ],
                onSaved: (String value) {
                  if (value.isNotEmpty &&
                      value != "" &&
                      value != null &&
                      value != 'null') {
                    cusLoanObj.mperiod = int.parse(value);
                  }
                })),


            new Card(
    color: Constant.mandatoryColor,

              child: new ListTile(
                title: new Text(Translations.of(context).text('labelRateOfInterest')),
                subtitle: cusLoanObj.mintrate == null
                    ? new Text("")
                    : new Text("${cusLoanObj.mintrate}"),
              ),
            ),

            new Card(
              child: new ListTile(
                  title: new Text(Translations.of(context).text('LnEndDt')),
                  subtitle: cusLoanObj.mexpdt == null
                      ? new Text("")
                      : new Text("${formatter.format(cusLoanObj.mexpdt)}")),
            ),
            new Card(
              child: new ListTile(
                title: new Text(Translations.of(context).text('interest_amount')),
                subtitle: cusLoanObj.minterestamount == null
                    ? new Text("")
                    : new Text("${formatDouble.format(cusLoanObj.minterestamount)}"),
              ),
            ),

            new Card(
              child: new ListTile(
                title: new Text(Translations.of(context).text('instalment_amount')),
                subtitle: cusLoanObj.minstamt == null
                    ? new Text("")
                    : new Text("${formatDouble.format(cusLoanObj.minstamt)}"),
              ),
            ),
            new Card(
              child: new ListTile(
                title: new Text(Translations.of(context).text('approved_amount')),
                subtitle: cusLoanObj.mapprvdloanamt == null
                    ? new Text("")
                    : new Text("${formatDouble.format(cusLoanObj.mapprvdloanamt)}"),
              ),
            ),
            new Card(
              child: new ListTile(
                title: new Text(Translations.of(context).text('disbursment_amount')),
                subtitle: cusLoanObj.mloanamtdisbd == null
                    ? new Text("")
                    : new Text("${formatDouble.format(cusLoanObj.mloanamtdisbd)}"),
              ),
            ),

            new Card(
    color: Constant.mandatoryColor,

              child: new DropdownButtonFormField(
                value: repaymentFreq,
                items: generateDropDown(6),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 6);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('SlctMdColl'),
                  labelText: Translations.of(context).text('RepayFreq'),
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
              ),
            ),


            new Card(
            color: Constant.mandatoryColor,
              child: new DropdownButtonFormField(
                value: typeOfLoan,
                items: generateDropDown(4),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 4);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('SlctMdColl'),
                  labelText: Translations.of(context).text('TypLn'),
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
              ),
            ),
            isTopUp? new Card(
              child: new DropdownButtonFormField(
                value: payoffreason,
                items: generateDropDown(10),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 10);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('payoffreason'),
                  labelText: Translations.of(context).text('payoffreason'),
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
              ),
            ):new Container(),
            isTopUp? new TextFormField(
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('preclosuredetails'),
                labelText: Translations.of(context).text('preclosuredetails'),
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff07426A),
                    )),
                contentPadding: EdgeInsets.all(20.0),
              ),
             /* controller: cusLoanObj.preclosuredetails != null
                  ? TextEditingController(text: cusLoanObj.preclosuredetails)
                  : TextEditingController(text: ""),*/
              initialValue:
              cusLoanObj.preclosuredetails == null ? "" : "${cusLoanObj.preclosuredetails}",
              inputFormatters: [new LengthLimitingTextInputFormatter(35),globals.onlyCharacter],
              onSaved: (val) {
                cusLoanObj.preclosuredetails = val;
                //}
              },
            ): new Container(),


            new Card(
              color: Constant.mandatoryColor,
              child: new DropdownButtonFormField(
                value: securedYN,
                items: generateDropDown(5),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 5);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('IsSecLn'),
                  labelText: Translations.of(context).text('IsSecLn'),
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
              ),
            ),

            new Card(
              color: Constant.mandatoryColor,
              child: new DropdownButtonFormField(
                value: repaymentmode,
                items: generateDropDown(2),
                onChanged: (LookupBeanData newValue) {
                  showDropDown(newValue, 2);
                },
                validator: (args) {

                },
                decoration:  InputDecoration(
                  isDense: true,
                  hintText: Translations.of(context).text('mode_of_collection'),
                  labelText: Translations.of(context).text('mode_of_collection'),
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
              ),
            ),
            new Card(
              child: new Card(
                color: Constant.mandatoryColor,
                child: new DropdownButtonFormField(
                  value: modeofdisb,
                  items: generateDropDown(3),
                  onChanged: (LookupBeanData newValue) {
                    showDropDown(newValue, 3);
                  },
                  validator: (args) {

                  },
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('select_mode_of_disbursment'),
                    labelText: Translations.of(context).text('mode_of_disbursment'),
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    isDense: true,
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
                ),
              ),
            ),

                  new Card(
    child: new ListTile(
    title: new Text(Translations.of(context).text('Dis_Acc')  ),
    subtitle: cusLoanObj.maccno == null
    ? new Text("")
        : new Text(
    "${cusLoanObj.maccno.toString()}"),
    onTap: () => getCustomerAccount(cusLoanObj.mcurcd,cusLoanObj.CUSTUUID)),
    ),

    new Container(
              height: 20.0,
            ),
            /*   FloatingActionButton.extended(
              icon: Icon(Icons.assignment_turned_in),
              backgroundColor: Color(0xff07426A),
              label: Text("Submit"),
              onPressed: proceed,
            ),*/
            new Container(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDisDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != cusLoanObj.mloandisbdt)
      setState(() {
        cusLoanObj.mloandisbdt = picked;
        tempDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempDay = "0" + picked.day.toString();
        } else
          tempDay = picked.day.toString();
        loanDisbDt = loanDisbDt.replaceRange(0, 2, tempDay);
        tempYear = picked.year.toString();
        loanDisbDt = loanDisbDt.replaceRange(6, 10, tempYear);
        if (picked.month.toString().length == 1) {
          tempMonth = "0" + picked.month.toString();
        } else
          tempMonth = picked.month.toString();
        loanDisbDt = loanDisbDt.replaceRange(3, 5, tempMonth);
      });
  }


  Future<Null> _selectStrtDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != cusLoanObj.minststrtdt)
      setState(() {
        cusLoanObj.minststrtdt = picked;
        tempInstStrtDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempInstStrtDay = "0" + picked.day.toString();
        } else
          tempInstStrtDay = picked.day.toString();
        loaninstStrtDt = loaninstStrtDt.replaceRange(0, 2, tempInstStrtDay);
        tempInstStrtYear = picked.year.toString();
        loaninstStrtDt = loaninstStrtDt.replaceRange(6, 10, tempInstStrtYear);
        if (picked.month.toString().length == 1) {
          tempInstStrtMonth = "0" + picked.month.toString();
        } else
          tempInstStrtMonth = picked.month.toString();
        loaninstStrtDt = loaninstStrtDt.replaceRange(3, 5, tempInstStrtMonth);
      });
    calculate();
    setState(() {

    });
  }


  Future getProduct() async {


    String divtype = "";
    print ("valueeee" + cusLoanObj.mtypeofloan.toString());
    divtype = cusLoanObj.mfacilitycd != null ? cusLoanObj.mfacilitycd : "";

    print(">>>>>"+ divtype.toString());
    prodObj = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForProductSelection(30,0,divtype),
          fullscreenDialog: true,
        ));
    if (prodObj != null) {

      cusLoanObj.mprdcd = prodObj.mprdCd;
      cusLoanObj.mprdname = prodObj.mname.trim();
      cusLoanObj.mcurcd = prodObj.mcurCd;
      print("cusLoanObj.mcurCd"+cusLoanObj.mcurcd);
      print("prodObj.mcurCd"+prodObj.mcurCd);
      if (cusLoanObj.mcustno > 0 || cusLoanObj.CUSTUUID !=null) {
        if (cusLoanObj.mprdcd != null && cusLoanObj.mloancycle !=null &&
            cusLoanObj.mfrequency != null && branch > 0){
          await AppDatabase.get()
              .selectMaxLoanAmtCanApply(
              cusLoanObj.mprdcd.trim().toString(),
              cusLoanObj.mloancycle+1,
              branch,
              cusLoanObj.mfrequency)
              .then((onValue) {

            for(int secondLoanCycle = 0;secondLoanCycle<onValue.length;secondLoanCycle++){
              if(onValue[secondLoanCycle].mruletype ==1){
                canApplyMaxAmount = onValue[secondLoanCycle].mmaxamount;
              }else if(onValue[secondLoanCycle].mruletype ==2)
                canApplyMaxInst  = onValue[secondLoanCycle].mmaxamount;
            }
            setState(() {

            });
          });
        }
      }
    }



  }

  Future getPurpose(String purposeMode, int selectedPosition) async {

    cusLoanObj.msubpurposeofloandesc ="";
    cusLoanObj.msubpurposeofloan ="";
    multiplePurposeDesc=null;
    multiplePurposeCode=null;
    purposeObj = (await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForPurposeSelection(position: selectedPosition),
          fullscreenDialog: true,
        )).then<List<SubLookupForSubPurposeOfLoan>>((purposeObjVal) {

      for(int itemsToAddOrRemove =0;itemsToAddOrRemove<purposeObjVal.length;itemsToAddOrRemove++) {
        if(purposeObjVal.length==4){
          return;
        }
        print("itemsToAddOrRemove"+itemsToAddOrRemove.toString());
        multiplePurposeDesc = multiplePurposeDesc!=null && multiplePurposeDesc!=""?multiplePurposeDesc +"~"+purposeObjVal[itemsToAddOrRemove].codeDesc:purposeObjVal[itemsToAddOrRemove].codeDesc;
        multiplePurposeCode = multiplePurposeCode!=null && multiplePurposeCode!=""?multiplePurposeCode +"~"+purposeObjVal[itemsToAddOrRemove].code:purposeObjVal[itemsToAddOrRemove].code;
      }

      cusLoanObj.msubpurposeofloandesc = multiplePurposeDesc;
      cusLoanObj.msubpurposeofloan = multiplePurposeCode;
    })) as SubLookupForSubPurposeOfLoan;

  }

  Future<Null> calculate() async {

    // DateTime formattedLoanDisbDtDate = loanDisbDt!=null?DateTime.parse(loanDisbDt):null;
    if (cusLoanObj.mprdcd != null &&  cusLoanObj.mloancycle !=null &&
        cusLoanObj.mfrequency != null && branch > 0){
      await AppDatabase.get()
          .selectMaxLoanAmtCanApply(
          cusLoanObj.mprdcd.trim().toString(),
          cusLoanObj.mloancycle+1,
          branch,
          cusLoanObj.mfrequency)
          .then((onValue) {

        for(int secondLoanCycle = 0;secondLoanCycle<onValue.length;secondLoanCycle++){
          if(onValue[secondLoanCycle].mruletype ==1){
            canApplyMaxAmount = onValue[secondLoanCycle].mmaxamount;
          }else if(onValue[secondLoanCycle].mruletype ==2)
            canApplyMaxInst  = onValue[secondLoanCycle].mmaxamount;
        }
        setState(() {

        });
      });
    }
    try {
      DateTime formattedLoanDisbDtDate = DateTime.parse(loanDisbDt.substring(6) +
          "-" +
          loanDisbDt.substring(3, 5) +
          "-" +
          loanDisbDt.substring(0, 2));
      cusLoanObj.mloandisbdt=formattedLoanDisbDtDate;

      DateTime formattedInstStrtDtDate = DateTime.parse(loaninstStrtDt.substring(6) +
          "-" +
          loaninstStrtDt.substring(3, 5) +
          "-" +
          loaninstStrtDt.substring(0, 2));
      cusLoanObj.minststrtdt=formattedInstStrtDtDate;
    } catch (e) {
      print("date Exception");
    }

    // cusLoanObj.mloandisbdt=formattedLoanDisbDtDate;;
    if (cusLoanObj.mprdcd != null &&
        cusLoanObj.mcurcd != null &&
        cusLoanObj.mappldloanamt != null &&
        branch != null &&
        cusLoanObj.mperiod != null &&
        cusLoanObj.mloancycle != null) {
      await AppDatabase.get()
          .selectSlabIntRate(
          cusLoanObj.mprdcd.trim().toString(),
          cusLoanObj.mcurcd.trim().toString(),
          cusLoanObj.mappldloanamt,
          branch,
          cusLoanObj.mperiod,
          cusLoanObj.mloancycle)
          .then((onValue) {
        // print("intrate "+ onValue.mintrate.toString());
        cusLoanObj.mintrate = onValue;

        if (cusLoanObj.mappldloanamt != null &&
            cusLoanObj.mintrate != null &&
            cusLoanObj.mperiod != null &&
            cusLoanObj.mloandisbdt != null &&
            cusLoanObj.mfrequency != null) {
          cusLoanObj.minterestamount = (cusLoanObj.mloanamtdisbd) *
              (cusLoanObj.mintrate) *
              (cusLoanObj.mperiod / 12.0) /
              100.0;

          double totalPayingAmount =
              cusLoanObj.mloanamtdisbd + cusLoanObj.minterestamount;
          cusLoanObj.minstamt = (totalPayingAmount / cusLoanObj.mperiod).roundToDouble();
          if(cusLoanObj.mfrequency.trim() == "A"){
            cusLoanObj.mexpdt=DateTime.now();
          }else  if (cusLoanObj.mfrequency.trim() == "M" || cusLoanObj.mfrequency.trim() == "B" ||
              cusLoanObj.mfrequency.trim() == "E" || cusLoanObj.mfrequency.trim() == "S"
              || cusLoanObj.mfrequency.trim() == "O") {
            cusLoanObj.mexpdt = new DateTime(
                cusLoanObj.minststrtdt.year,
                cusLoanObj.minststrtdt.month + cusLoanObj.mperiod,
                cusLoanObj.minststrtdt.day);

          } else if (cusLoanObj.mfrequency.trim() == "B") {
            if (cusLoanObj.mperiod.isOdd) {
              cusLoanObj.mexpdt = new DateTime(
                  cusLoanObj.minststrtdt.year,
                  cusLoanObj.minststrtdt.month +
                      ((cusLoanObj.mperiod - 1) / 2).round(),
                  cusLoanObj.minststrtdt.day + 15);

            } else if (cusLoanObj.mperiod.isEven) {
              cusLoanObj.mexpdt = new DateTime(
                  cusLoanObj.minststrtdt.year,
                  cusLoanObj.minststrtdt.month +
                      (cusLoanObj.mperiod / 2).round(),
                  cusLoanObj.minststrtdt.day);

            }
          }else if (cusLoanObj.mfrequency.trim() == "L") {
            cusLoanObj.mexpdt = new DateTime(
                cusLoanObj.minststrtdt.year,
                cusLoanObj.minststrtdt.month ,
                cusLoanObj.minststrtdt.day + (cusLoanObj.mperiod * 28));

          }else if (cusLoanObj.mfrequency.trim() == "F") {
            cusLoanObj.mexpdt = new DateTime(
                cusLoanObj.minststrtdt.year,
                cusLoanObj.minststrtdt.month ,
                cusLoanObj.minststrtdt.day + (cusLoanObj.mperiod * 14));

          }
          else if (cusLoanObj.mfrequency.trim() == "Q") {
            cusLoanObj.mexpdt = new DateTime(
                cusLoanObj.minststrtdt.year,
                cusLoanObj.minststrtdt.month +(cusLoanObj.mperiod * 3),
                cusLoanObj.minststrtdt.day );
          }
          else if (cusLoanObj.mfrequency.trim() == "W") {

            cusLoanObj.mexpdt = new DateTime(
                cusLoanObj.minststrtdt.year,
                cusLoanObj.minststrtdt.month,
                cusLoanObj.minststrtdt.day + (cusLoanObj.mperiod * 7));

          }
        }

      });
    }


  }

  Future getCustomerNumber() async {
    var customerdata;
    customerdata = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
                CustomerList(null,"Loan Application")));

    print("customerdata.UUID");
    print(customerdata.UUID);
    await getChildEntitys(customerdata);
    bool isValidated = await validateTabs(customerdata);
    if (customerdata != null && isValidated) {
      cusLoanObj.mcustno =
      customerdata.mcustno != null ? customerdata.mcustno : 0;
      cusLoanObj.CUSTUUID =customerdata.UUID;
      cusLoanObj.mcustname = customerdata.mlongname;
      cusLoanObj.mloancycle = customerdata.mtier != null  ? customerdata.mtier : 0;
      loanCycle = customerdata.mtier != null  ? customerdata.mtier : 0;
      setState(() {});
    }
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
                  Text('Loan Created '),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
                  // CustomerLoanDetailsList.count = 1;
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  proceed() async {
    if (!validateSubmit()) {
      return;
    }


    cusLoanObj.mlastupdateby = username;
    if(cusLoanObj.mcreateddt == null) {
      cusLoanObj.mcreatedby = username;
      cusLoanObj.mcreateddt = DateTime.now();
    }

    cusLoanObj.mlastupdatedt = DateTime.now();
    cusLoanObj.mgeolocation = geoLocation;
    cusLoanObj.mgeologd = geoLongitude;
    cusLoanObj.mgeolatd = geoLatitude;

   if(cusLoanObj.UUID!=null){
       //Update here
     Map loanJsonData =  await CustomerLoanDetailsBean.toLoanJson(cusLoanObj);
     String loanData = JSON.encode(loanJsonData).toString();
     await AppdatabaseV2.get().updateLoan(cusLoanObj,loanData,cusLoanObj.UUID)
         .then((onValue) {
     });
     _successfulSubmit();
     }else{
      var uuid = Uuid();
      cusLoanObj.UUID=uuid.v4();
      Map loanJsonData =  await CustomerLoanDetailsBean.toLoanJson(cusLoanObj);
      String loanData = JSON.encode(loanJsonData).toString();
      await AppdatabaseV2.get().insertLoanMaster(cusLoanObj,loanData)
          .then((onValue) {
      });
      _successfulSubmit();
    }


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


    if ((cusLoanObj.CUSTUUID ==  null || cusLoanObj.CUSTUUID == 0) && (cusLoanObj.CUSTUUID == null)) {
          _showAlert("Please Select Customer Once Again", "It is Mandatory");    //
          return false;
    }

    if (cusLoanObj.mprdname == "" || cusLoanObj.mprdname == null) {
      _showAlert("Product Name", "It is Mandatory");
      //
      return false;
    }
    if (cusLoanObj.msubpurposeofloandesc == "" ||
        cusLoanObj.msubpurposeofloandesc == null) {
      _showAlert(" Purpose Of Loan", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }

    if (cusLoanObj.mmainoccupndesc == "" ||
        cusLoanObj.mmainoccupndesc == null) {
      _showAlert(" Industry", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }
  /*  if (cusLoanObj.mrouteto == "" ||
        cusLoanObj.mrouteto == null) {
      _showAlert(" HBS Users", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }*/
    if (cusLoanObj.mfrequency == "" ||
        cusLoanObj.mfrequency == null) {
      _showAlert(" Repayment Type of Loan", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }

    if (cusLoanObj.mappldloanamt == "" ||
        cusLoanObj.mappldloanamt == null) {
      _showAlert(" Applied Amount", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }

    if (cusLoanObj.mperiod == "" ||
        cusLoanObj.mperiod == null) {
      _showAlert(" Tenor", "It is Mandatory");
      //_tabController.animateTo(0);
      return false;
    }

    if (cusLoanObj.mintrate == "" || cusLoanObj.mintrate == null) {
      _showAlert("R.O.I", "It is Mandatory");
      //
      return false;
    }
    if (cusLoanObj.mfrequency == "" || cusLoanObj.mfrequency == null) {
      _showAlert("Repayment Type Of Loan", "It is Mandatory");
      //
      return false;
    }

    if(cusLoanObj.minststrtdt!=null){
      if (cusLoanObj.minststrtdt==DateTime.now() || cusLoanObj.minststrtdt.isBefore(DateTime.now())) {
        print("minststrtdt"+cusLoanObj.minststrtdt.toString()
        );
        _showAlert("Tentative Installment Start   Date", "It should be greater than Current Date");
        _tabController.animateTo(8);
        return false;
      }}
    print("minststrtdt----------"+cusLoanObj.minststrtdt.toString()
    );
    if(cusLoanObj.minststrtdt!=null&&cusLoanObj.mloandisbdt!=null){

      int diff;
      diff=cusLoanObj.minststrtdt.difference(cusLoanObj.mloandisbdt).inDays;
      if(diff>45){
        _showAlert("Tentative Installment start date ", "It should not be more that 45 days from Disbursement date");
        return false;
      }}


    if (cusLoanObj.mrepaymentfreq == "" || cusLoanObj.mrepaymentfreq == null ) {
      _showAlert("Repayment frequency", "It is Mandatory");
      //
      return false;
    }

    if (cusLoanObj.mtypeofloan == "" || cusLoanObj.mtypeofloan == null  ) {
      _showAlert("Type of loan", "It is Mandatory");
      //
      return false;
    }

    if (cusLoanObj.missecuredloan == "" || cusLoanObj.missecuredloan == null ) {
      _showAlert("Is secured loan", "It is Mandatory");
      //
      return false;
    }

    if (cusLoanObj.mrepaymentmode == "" || cusLoanObj.mrepaymentmode == null || cusLoanObj.mrepaymentmode == 0 ) {
      _showAlert("Mode Of Collection", "It is Mandatory");
      //
      return false;
    }
    if (cusLoanObj.mmodeofdisb == "" || cusLoanObj.mmodeofdisb == null || cusLoanObj.mrepaymentmode == 0) {
      _showAlert("Mode Of Disbursment", "It is Mandatory");
      //
      return false;
    }
    if(isTopUp==true){
      if (cusLoanObj.mmodeofdisb == "" || cusLoanObj.mmodeofdisb == null || cusLoanObj.mrepaymentmode == 0) {
        _showAlert("Mode Of Disbursment", "It is Mandatory");
        //
        return false;
      }
      if (cusLoanObj.payoffreason == "" || cusLoanObj.payoffreason == null || cusLoanObj.payoffreason == "null") {
        _showAlert("Reason of Payoff ", "It is Mandatory");
        //
        return false;
      }
      if (cusLoanObj.preclosuredetails == "" || cusLoanObj.preclosuredetails == null || cusLoanObj.preclosuredetails == "null") {
        _showAlert("Details of Pre Close ", "It is Mandatory");
        //
        return false;
      }
    }



    return true;
  }

  Future<Null> addCashFlow(CustomerLoanDetailsBean bean) async{
    CustomerListBean custBean = new CustomerListBean();
    custBean.fixedAssetsList =   new FixedAssetsBean();
    custBean.currentAssetsList =    new CurrentAssetsBean();
    custBean.longTermLiabilitiesList =   new LongTermLiabilitiesBean();
    custBean.shortTermLiabilitiesList =     new ShortTermLiabilitiesBean();
    custBean.equityList =     new EquityBean();
    custBean.financialStmntList =     new FinancialStmntBean();
    custBean.incomeStatementList =     new IncomeStatementBean();

    await routeToCustomerCashFlowScreenForModificationOfData(custBean);
  }

  routeToCustomerCashFlowScreenForModificationOfData(CustomerListBean bean) {
    Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
          new CustomerFormationBusinessCashFlow3(customerObject: bean,isEditAllowed:isEditAllowed),
        ));
  }

  Future getMainOccupation(String purposeMode, int selectedPosition) async {
    mainOcc = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForMainOccupationSelection(position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      //subPurposeName=purposeObjVal.codeDesc;
      //subPurposeId = purposeObjVal.code;
      cusLoanObj.mmainoccupndesc = purposeObjVal.codeDesc;

      cusLoanObj.mmainoccupn = (purposeObjVal.code.trim());
      print("here");
      print(cusLoanObj.mmainoccupn);
      if((purposeObjVal.code.toString()== "4000"||purposeObjVal.code.toString()=="2500"||purposeObjVal.code.toString()=="6500")){
        print(cusLoanObj.mmainoccupn.trim());
        print(toShow);
        toShow=true;
      }else{
        toShow=false;

      }

    });

  }

  Future getSubOccupation(String purposeMode, int selectedPosition) async {
    mainOcc = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForSubOccupationSelection(type: "Sector Selection List",basicCode: 1800000,position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {

      cusLoanObj.msuboccupndesc = purposeObjVal.codeDesc;
      cusLoanObj.msuboccupn = (purposeObjVal.code.trim());
    });
  }


  Future getHbsUser() async {
    await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForHbsUsers(),
          fullscreenDialog: true,
        )).then<HbsUserBean>((hbsUsers) {
      //Set Super USer here on selection
      cusLoanObj.mrouteto = hbsUsers.musrcode;
    });

  }


  Future<bool> validateTabs(CustomerListBean custListBean) async {
    String error = "";
    bool isMaxLengthExceed = false;

    // if(custListBean.imageMaster!=null) {
    //   if (custListBean.imageMaster[0].imgString == "" ||
    //       custListBean.imageMaster[0].imgString == null) {
    //     _showAlert("Customer Picture", "It is Mandatory");
    //     return false;
    //   }
    // }
   /* if (custListBean.mcusttype == "" || custListBean.mcusttype == null || custListBean.mcusttype == "null" || custListBean.mcusttype.length == 0) {

      _showAlert("Customer Type", "Field is mandatory");
      return false;
    }
    if (custListBean.mnationality == "" || custListBean.mnationality == null) {

      _showAlert("Nationality", "Field is mandatory");
      return false;
    }
    if (custListBean.mnametitle == "" || custListBean.mnametitle == null) {

      _showAlert("Title", "Field is mandatory");
      return false;
    }
    Utility ut = new Utility();
    error = ut.validateOnlyCharacterField(custListBean.mfname);
    if (error != null) {
      _showAlert("Surname", error);

      return false;
    }
    error = ut.validateOnlyCharacterField(custListBean.mlname);
    if (error != null) {
      //showInSnackBar("Last name has $error ",context);
      _showAlert("Last Name", error);

      return false;
    }
    error = ut.validateOnlyCharacterFieldKhmer(custListBean.mfname2);
    if (error != null) {
      _showAlert("Surname Khmer", error);

      return false;
    }

    error = ut.validateOnlyCharacterFieldKhmer(custListBean.mlname2);
    if (error != null) {
      _showAlert("Last Name Khmer", error);

      return false;
    }
    if ((custListBean.mcusttype != "" || custListBean.mcusttype != null)&&custListBean.mcusttype != "1") {
      try {
        int age = DateTime
            .now()
            .year - custListBean.mdob.year;
        print("custListBean.mdob.year" + age.toString());
        if (age < 18) {
          _showAlert("Date Of birth", "It should be greater than 18");

        return false;
      }
    } catch (e) {
      _showAlert("Applicant DOB", "It is Mandatory");

      return false;
    }
    if (custListBean.mgender == "" || custListBean.mgender == null) {

      _showAlert("Gender", "Field is mandatory");
      return false;
    }

    if (custListBean.mmaritialStatus == "" ||
        custListBean.mmaritialStatus == null) {

      _showAlert("Marital Status", "Field is mandatory");
      return false;
    }
    if(custListBean.mmaritialStatus!=null &&custListBean.mmaritialStatus=="2"){
      _showAlert("Spouse Name", "It is Mandatory");

      return false;
    }
    if (custListBean.mresstatus == "" ||
        custListBean.mresstatus == null) {

      _showAlert("Resedence Status", "Field is mandatory");
      return false;
    }
    if (custListBean.mrelegion == "" || custListBean.mrelegion == null) {

      _showAlert("Religion", "Field is mandatory");
      return false;
    }
    if (custListBean.mlangofcust == "" || custListBean.mlangofcust == null) {

      _showAlert("Language", "Field is mandatory");
      return false;
    }
    if (custListBean.moccupation == "" || custListBean.moccupation == null) {

      _showAlert("Occupation", "Field is mandatory");
      return false;
    }
    if (custListBean.miscpemp == "" || custListBean.miscpemp == null) {

      _showAlert("Is CPBank Employee", "Field is mandatory");
      return false;
    }
    }
    if (custListBean.mtarget == "" || custListBean.mtarget == null) {

      _showAlert("Target", "Field is mandatory");
      return false;
    }
    //TODO undone this

    if (custListBean.mownership == "" || custListBean.mownership == null) {

      _showAlert("Ownership", "Field is mandatory");
      return false;
    }
    if (custListBean.addressDetails == null ||
        custListBean.addressDetails == [] ||
        custListBean.addressDetails.length == 0) {

      _showAlert("Adress Detail", "Atleast one address is mandatory");

      return false;
    }
    bool isContain5 =false;
    for (int i = 0; i < custListBean.addressDetails.length; i++) {
      if(custListBean.addressDetails[i].maddrType ==5){
        isContain5 =true;
        break;
      }
    }

    if(!isContain5){

      _showAlert("Place Of Birth", "Place Of Birth Address Type is mandatory");
      isContain5 =false;
      return false;
    }
    bool isContain6 =false;
    for (int i = 0; i < custListBean.addressDetails.length; i++) {
      if(custListBean.addressDetails[i].maddrType ==6){
        isContain6 =true;
        break;
      }
    }

    if(!isContain6){

      _showAlert("NID Address", "NID Address is mandatory");
      isContain6 =false;
      return false;
    }
    bool isContain1 =false;
    for (int i = 0; i < custListBean.addressDetails.length; i++) {
      if(custListBean.addressDetails[i].maddrType ==1){
        isContain1 =true;
        break;
      }
    }

    if(!isContain1){
      _showAlert("Residential Address", "Residential Address Type is mandatory");
      isContain1 =false;
      return false;
    }
    if (custListBean.customerBusinessDetailsBean == null ||
        custListBean.customerBusinessDetailsBean == [] ||
        custListBean.customerBusinessDetailsBean.length == 0) {

      _showAlert("Employment/Business Detail", "Atleast one Employment/Business is mandatory");

      return false;
    }
    if (custListBean.mpanno == "" || custListBean.mpanno == null) {

      _showAlert(Translations.of(context).text('idtype1'), "Field is mandatory");
      return false;
    }
    if (custListBean.mpannodesc == "" || custListBean.mpannodesc == null) {

      _showAlert(Translations.of(context).text('idtype1desc'), "Field is mandatory");
      return false;
    }else   if (custListBean.mpannodesc.length<8 ) {

      _showAlert(Translations.of(context).text('idtype1desc'), "Should not be less than 9 Char");
      return false;
    }
    if (custListBean.missngautryt1 == "" || custListBean.missngautryt1 == null) {

      _showAlert(Translations.of(context).text('idtype1issuing'), "Field is mandatory");
      return false;
    }


    try {

      try {
        if (DateTime.now().isBefore(custListBean.mid1issuedate)) {
          _showAlert("Id 1 Issue Date", "Cannot be Future Date");
        }
      }catch(_){
        _showAlert("Id 1 Issue Date", "Cannot be Future Date");
      }
    } catch (e) {
      _showAlert("Id 1 Issue Date", "It is Mandatory");

      return false;
    }


    try {

      if (custListBean.mid1expdate==DateTime.now() || custListBean.mid1expdate.isBefore(DateTime.now())) {
        _showAlert("Id 1 Expiry Date", "It should be greater than Current Date");

        return false;
      }
    } catch (e) {
      _showAlert("Id 1 Expiry Date", "It is Mandatory");

      return false;
    }

    if (custListBean.mTypeOfId == "" || custListBean.mTypeOfId == null) {

      _showAlert(Translations.of(context).text('idtype2'), "Field is mandatory");
      return false;
    }


    if (custListBean.mIdDesc == "" || custListBean.mIdDesc == null) {

      _showAlert(Translations.of(context).text('idtype2desc'), "Field is mandatory");
      return false;
    }


    if (custListBean.missngautryt2 == "" || custListBean.missngautryt2 == null) {

      _showAlert(Translations.of(context).text('idtype2issuing'), "Field is mandatory");
      return false;
    }

    try {

      try {
        if (DateTime.now().isBefore(custListBean.mid2issuedate)) {
          _showAlert("Id 2 Issue Date", "Cannot be Future Date");
        }
      }catch(_){
        _showAlert("Id 2 Issue Date", "Cannot be Future Date");
      }
    } catch (e) {
      _showAlert("Id 2 Issue Date", "It is Mandatory");

      return false;
    }

    try {

      if (custListBean.mid2expdate==DateTime.now() || custListBean.mid2expdate.isBefore(DateTime.now())) {
        _showAlert("Id 2 Expiry Date", "It should be greater than Current Date");

        return false;
      }
    } catch (e) {
      _showAlert("Id 2 Expiry Date", "It is Mandatory");

      return false;
    }

    if (custListBean.mtypeofid3 == "" || custListBean.mtypeofid3 == null) {

      _showAlert(Translations.of(context).text('idtype3'), "Field is mandatory");
      return false;
    }

    if (custListBean.middesc3 == "" || custListBean.middesc3 == null) {

      _showAlert(Translations.of(context).text('idtype3desc'), "Field is mandatory");
      return false;
    }

    if (custListBean.missngautryt3 == "" || custListBean.missngautryt3 == null) {

      _showAlert(Translations.of(context).text('idtype3issuing'), "Field is mandatory");
      return false;
    }

    try {

      try {
        if (DateTime.now().isBefore(custListBean.mid3issuedate)) {
          _showAlert("Id 3 Issue Date", "Cannot be Future Date");
        }
      }catch(_){
        _showAlert("Id 3 Issue Date", "Cannot be Future Date");
      }
    } catch (e) {
      _showAlert("Id 3 Issue Date", "It is Mandatory");

      return false;
    }
    if(custListBean.mid3expdate!=null) {

      try {

        if (custListBean.mid3expdate==DateTime.now() || custListBean.mid3expdate.isBefore(DateTime.now())) {
          _showAlert("Id 3 Expiry Date", "It should be greater than Current Date");

          return false;
        }

      } catch (e) {
        //  _showAlert("Id 3 Expiry Date", "It is Mandatory");

        return false;
      }}
    SystemParameterBean sysBean =
    await AppDatabase.get().getSystemParameter('11', 0);


    if (custListBean.imageMaster[11].imgString == null ||
        custListBean.imageMaster[11].imgString == "" ) {
      _showAlert("Customer Signature",
          "It is Mandatory");

      return false;
    }
    if (custListBean.imageMaster[12].imgString == null ||
        custListBean.imageMaster[12].imgString == "" ) {
      _showAlert("Spouse Signature",
          "It is Mandatory");

      return false;
    }
*/

    return true;
  }

  getChildEntitys(CustomerListBean bean)async{

  }


  Future getCustomerAccount(String CUSTUUID,  String mcurcd) async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AccuntListForLoan(mcurcd,CUSTUUID))).then((onValue){
        if (onValue != null) {
          cusLoanObj.maccno =
          onValue.maccno != null ? onValue.maccno : 0;

        }

      });


  }

  Future getCreditSubClassification(String purposeMode, int selectedPosition) async {
    mainOcc = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
              FullScreenDialogForSubOccupationSelection(type: "Credit Sub Classification List",basicCode: 1000,position: selectedPosition),
          fullscreenDialog: true,
        )).then<SubLookupForSubPurposeOfLoan>((purposeObjVal) {
      cusLoanObj.mcrdtsbclsfcd = (purposeObjVal.code.trim());
    });

  }

}
