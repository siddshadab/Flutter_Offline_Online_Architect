import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationBusinessDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationCenterAndGroupDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationContactDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationDeclarationForm.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationFamilyDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationLoanDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationPersonalInfo.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationRiskRatings.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationSocialFinancialDetails.dart';
import 'package:eco_los/screens/customerFormation/CustomerTotalExpenditureDetails.dart';
import 'package:eco_los/screens/customerFormation/ESMS.dart';
import 'package:eco_los/screens/customerFormation/ESMS2.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/AssetDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BorrowingDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BusinessExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FamilyDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FinancialStmntBean.dart';
import 'package:eco_los/screens/customerFormation/bean/HouseholdExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:eco_los/screens/customerFormation/bean/IncomeStatementBean.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/home/Home_Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'dart:async';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'dart:convert';
import 'package:uuid/uuid.dart';



class CustomerFormationMasterTabs extends StatefulWidget {
  var cameras;
  final CustomerListBean customerObject;

  CustomerFormationMasterTabs(this.cameras, this.customerObject);

  @override
  CustomerFormationMasterTabsState createState() =>
      new CustomerFormationMasterTabsState();
}

class CustomerFormationMasterTabsState
    extends State<CustomerFormationMasterTabs>
    with SingleTickerProviderStateMixin {
  static CustomerListBean custListBean = new CustomerListBean();
  //static CustomerBusinessDetailsBean bussBean = new CustomerBusinessDetailsBean();
  static AddressDetailsBean addressBean = new AddressDetailsBean();
  static FamilyDetailsBean fdb = new FamilyDetailsBean();
  static SocialFinancialDetailsBean sfb = new SocialFinancialDetailsBean();
  static CustomerBusinessDetailsBean cbdb = new CustomerBusinessDetailsBean();
  static BorrowingDetailsBean borrowingDetailsBean = new BorrowingDetailsBean();
  static BusinessExpenditureDetailsBean busiExpnBean =
  new BusinessExpenditureDetailsBean();
  static HouseholdExpenditureDetailsBean hhExpnBean =
  new HouseholdExpenditureDetailsBean();
  static AssetDetailsBean assetBean = new AssetDetailsBean();

  static IncomeStatementBean incomeStatementBean = new IncomeStatementBean();
  static FinancialStmntBean financialStmntBean = new FinancialStmntBean();
  static String applicantDob = "__-__-____";
  static String incoDate = "__-__-____";
  static String regDate = "__-__-____";
  static String repDOB = "__-__-____";
  static String buscomDOB= "__-__-____";
  static String loanDate = "__-__-____";
  static String famDob = "__-__-____";
  static String repaymentDate = "__-__-____";
  static String husDob = "__-__-____";
  static String id1IssueDate = "__-__-____";
  static String id1ExpDate = "__-__-____";
  static String id2IssueDate = "__-__-____";
  static String id2ExpDate = "__-__-____";
  static String id3IssueDate = "__-__-____";
  static String id3ExpDate = "__-__-____";
  static String EmpFromDate = "__-__-____";
  static String EmpToDate = "__-__-____";
  static String signDate = "__-__-____";
  static String EmpDateOfImcorp = "__-__-____";
  static List<int> personalInfoRadios = new List<int>(5);
  static List<int> socialFinancialRadios = new List<int>(1);
  static List<int> businessDetailRadios = new List<int>(4);
  static List<int> businessCashFlowRadios = new List<int>(12);
  static List<int> familyDependantRadio = new List<int>(4);
  String maxLengthExceedFieldName = "";
  String globError = "";
  TabController _tabController;
  int tabState = 13;
  SharedPreferences prefs;
  String username;
  String usrGrpCode;
  String resedencyCode;

  static const JsonCodec JSON = const JsonCodec();

  static const List<String> tabNames = const <String>[
    'Profile',
    'Personal Information',
    'Contact details',
    "Family Details",
    'Social Financial',
    'Loan Details',
    'Employment Details',
    "Expenditure Details",
    "ESMS",
    "ESMS Details",
    "Risk Ratings",
    "Declaration Form"
  ];

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
        vsync: this, initialIndex: 0, length: tabNames.length);
    getSessionVariables();




    if (widget.customerObject == null ) {
      if (custListBean.familyDetailsList == null) {
        custListBean.familyDetailsList = new List<FamilyDetailsBean>();
      }
      if (custListBean.socialFinancialList == null) {
        custListBean.socialFinancialList =
        new List<SocialFinancialDetailsBean>();
      }
      if (custListBean.borrowingDetailsBean == null) {
        custListBean.borrowingDetailsBean = new List<BorrowingDetailsBean>();
      }

      if (custListBean.addressDetails == null) {
        custListBean.addressDetails = new List<AddressDetailsBean>();
      }
      if (custListBean.customerBusinessDetailsBean == null) {
        custListBean.customerBusinessDetailsBean =
        new List<CustomerBusinessDetailsBean>();
      }
    }



    if (widget.customerObject != null) {
      
      if (widget.customerObject.mdob != null &&
          widget.customerObject.mdob != 'null' &&
          widget.customerObject.mdob != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mdob.day.toString().length == 1)
          tempDay = "0" + widget.customerObject.mdob.day.toString();
        else
          tempDay = widget.customerObject.mdob.day.toString();

        if (widget.customerObject.mdob.month.toString().length == 1)
          tempMonth = "0" + widget.customerObject.mdob.month.toString();
        else
          tempMonth = widget.customerObject.mdob.month.toString();

        CustomerFormationMasterTabsState.applicantDob =
            CustomerFormationMasterTabsState.applicantDob
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.applicantDob =
            CustomerFormationMasterTabsState.applicantDob
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.applicantDob =
            CustomerFormationMasterTabsState.applicantDob.replaceRange(
                6, 10, widget.customerObject.mdob.year.toString());
      }

      if (widget.customerObject.mhusdob != null &&
          widget.customerObject.mhusdob != 'null' &&
          widget.customerObject.mhusdob != '') {
        String tempDayH;
        String tempMonthH;
        if (widget.customerObject.mhusdob.day.toString().length == 1)
          tempDayH = "0" + widget.customerObject.mhusdob.day.toString();
        else
          tempDayH = widget.customerObject.mhusdob.day.toString();

        if (widget.customerObject.mhusdob.month.toString().length == 1)
          tempMonthH = "0" + widget.customerObject.mhusdob.month.toString();
        else
          tempMonthH = widget.customerObject.mhusdob.month.toString();

        CustomerFormationMasterTabsState.husDob =
            CustomerFormationMasterTabsState.husDob
                .replaceRange(0, 2, tempDayH);

        CustomerFormationMasterTabsState.husDob
            .replaceRange(3, 5, tempMonthH);

        CustomerFormationMasterTabsState.husDob =
            CustomerFormationMasterTabsState.husDob.replaceRange(
                6, 10, widget.customerObject.mhusdob.year.toString());
      }
    }


    if (widget.customerObject != null) {
      if (widget.customerObject.mid1issuedate != null &&
          widget.customerObject.mid1issuedate != 'null' &&
          widget.customerObject.mid1issuedate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid1issuedate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid1issuedate.day.toString();
        else
          tempDay = widget.customerObject.mid1issuedate.day.toString();

        if (widget.customerObject.mid1issuedate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid1issuedate.month.toString();
        else
          tempMonth = widget.customerObject.mid1issuedate.month.toString();

        CustomerFormationMasterTabsState.id1IssueDate =
            CustomerFormationMasterTabsState.id1IssueDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id1IssueDate =
            CustomerFormationMasterTabsState.id1IssueDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id1IssueDate =
            CustomerFormationMasterTabsState.id1IssueDate.replaceRange(
                6, 10, widget.customerObject.mid1issuedate.year.toString());
      }
    }


    if (widget.customerObject != null) {
      if (widget.customerObject.mid1expdate != null &&
          widget.customerObject.mid1expdate != 'null' &&
          widget.customerObject.mid1expdate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid1expdate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid1expdate.day.toString();
        else
          tempDay = widget.customerObject.mid1expdate.day.toString();

        if (widget.customerObject.mid1expdate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid1expdate.month.toString();
        else
          tempMonth = widget.customerObject.mid1expdate.month.toString();

        CustomerFormationMasterTabsState.id1ExpDate =
            CustomerFormationMasterTabsState.id1ExpDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id1ExpDate =
            CustomerFormationMasterTabsState.id1ExpDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id1ExpDate =
            CustomerFormationMasterTabsState.id1ExpDate.replaceRange(
                6, 10, widget.customerObject.mid1expdate.year.toString());
      }
    }

    if (widget.customerObject != null) {
      if (widget.customerObject.mid2issuedate != null &&
          widget.customerObject.mid2issuedate != 'null' &&
          widget.customerObject.mid2issuedate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid2issuedate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid2issuedate.day.toString();
        else
          tempDay = widget.customerObject.mid2issuedate.day.toString();

        if (widget.customerObject.mid2issuedate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid2issuedate.month.toString();
        else
          tempMonth = widget.customerObject.mid2issuedate.month.toString();

        CustomerFormationMasterTabsState.id2IssueDate =
            CustomerFormationMasterTabsState.id2IssueDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id2IssueDate =
            CustomerFormationMasterTabsState.id2IssueDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id2IssueDate =
            CustomerFormationMasterTabsState.id2IssueDate.replaceRange(
                6, 10, widget.customerObject.mid2issuedate.year.toString());
      }
    }

    if (widget.customerObject != null) {
      if (widget.customerObject.mid2expdate != null &&
          widget.customerObject.mid2expdate != 'null' &&
          widget.customerObject.mid2expdate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid2expdate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid2expdate.day.toString();
        else
          tempDay = widget.customerObject.mid2expdate.day.toString();

        if (widget.customerObject.mid2expdate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid2expdate.month.toString();
        else
          tempMonth = widget.customerObject.mid2expdate.month.toString();

        CustomerFormationMasterTabsState.id2ExpDate =
            CustomerFormationMasterTabsState.id2ExpDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id2ExpDate =
            CustomerFormationMasterTabsState.id2ExpDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id2ExpDate =
            CustomerFormationMasterTabsState.id2ExpDate.replaceRange(
                6, 10, widget.customerObject.mid2expdate.year.toString());
      }
    }



    if (widget.customerObject != null) {
      if (widget.customerObject.mid3issuedate != null &&
          widget.customerObject.mid3issuedate != 'null' &&
          widget.customerObject.mid3issuedate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid3issuedate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid3issuedate.day.toString();
        else
          tempDay = widget.customerObject.mid3issuedate.day.toString();

        if (widget.customerObject.mid3issuedate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid3issuedate.month.toString();
        else
          tempMonth = widget.customerObject.mid3issuedate.month.toString();

        CustomerFormationMasterTabsState.id3IssueDate =
            CustomerFormationMasterTabsState.id3IssueDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id3IssueDate =
            CustomerFormationMasterTabsState.id3IssueDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id3IssueDate =
            CustomerFormationMasterTabsState.id3IssueDate.replaceRange(
                6, 10, widget.customerObject.mid3issuedate.year.toString());
      }
    }

    if (widget.customerObject != null) {
      if (widget.customerObject.mid3expdate != null &&
          widget.customerObject.mid3expdate != 'null' &&
          widget.customerObject.mid3expdate != '') {
        String tempDay;
        String tempMonth;
        if (widget.customerObject.mid3expdate.day
            .toString()
            .length == 1)
          tempDay = "0" + widget.customerObject.mid3expdate.day.toString();
        else
          tempDay = widget.customerObject.mid3expdate.day.toString();

        if (widget.customerObject.mid3expdate.month
            .toString()
            .length == 1)
          tempMonth = "0" + widget.customerObject.mid3expdate.month.toString();
        else
          tempMonth = widget.customerObject.mid3expdate.month.toString();

        CustomerFormationMasterTabsState.id3ExpDate =
            CustomerFormationMasterTabsState.id3ExpDate
                .replaceRange(0, 2, tempDay);

        CustomerFormationMasterTabsState.id3ExpDate =
            CustomerFormationMasterTabsState.id3ExpDate
                .replaceRange(3, 5, tempMonth);

        CustomerFormationMasterTabsState.id3ExpDate =
            CustomerFormationMasterTabsState.id3ExpDate.replaceRange(
                6, 10, widget.customerObject.mid3expdate.year.toString());
      }
    }
    if (widget.customerObject != null) {
      if (widget.customerObject.esmsentity != null &&
          widget.customerObject.esmsentity.date != null &&
          widget.customerObject.esmsentity.date!= 'null' &&
          widget.customerObject.esmsentity.date != '') {
        String tempDay;
        String tempMonth;
        try{


          if (widget.customerObject.esmsentity.date.day
              .toString()
              .length == 1)
            tempDay = "0" + widget.customerObject.esmsentity.date.day.toString();
          else
            tempDay = widget.customerObject.esmsentity.date.day.toString();

          if (widget.customerObject.esmsentity.date.month
              .toString()
              .length == 1)
            tempMonth = "0" + widget.customerObject.esmsentity.date.month.toString();
          else
            tempMonth = widget.customerObject.esmsentity.date.month.toString();

          CustomerFormationMasterTabsState.signDate =
              CustomerFormationMasterTabsState.signDate
                  .replaceRange(0, 2, tempDay);

          CustomerFormationMasterTabsState.signDate =
              CustomerFormationMasterTabsState.signDate
                  .replaceRange(3, 5, tempMonth);

          CustomerFormationMasterTabsState.signDate =
              CustomerFormationMasterTabsState.signDate.replaceRange(
                  6, 10, widget.customerObject.mid2expdate.year.toString());
        }catch(_){

        }
      }
      custListBean = widget.customerObject;

    }
    getsharedPreferences();
  }

  getsharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString(TablesColumnFile.RESEDENCYADDRESSMCODE) != null &&
        prefs.getString(TablesColumnFile.RESEDENCYADDRESSMCODE).trim() != "")
      resedencyCode = prefs.getString(TablesColumnFile.RESEDENCYADDRESSMCODE).trim();

  }

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString(TablesColumnFile.musrcode);


    });
  }





  Future<bool> callDialog() {
    globals.Dialog.onPop(
        context,
        Translations.of(context).text('rusre'),
        Translations.of(context).text('Custgoback'),
        "CustomerFormationMaster");
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        callDialog();
      },
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Customer Information",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 3.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              callDialog();
              //Navigator.of(context).pop();
            },
          ),
          backgroundColor: Color(0xff07426A),
          brightness: Brightness.light,
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: new List.generate(tabNames.length, (index) {
              return new Tab(text: tabNames[index].toUpperCase());
            }),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.save,
                color: Colors.white,
                size: 40.0,
              ),
              onPressed: () async {
                /* CustomerFormationDeclarationFormState obj = new CustomerFormationDeclarationFormState();
                obj.submit();*/
               // submit();

                if(!isCustFoundInDedup) {
                  submit();
                }else{
                  _showAlert(Translations.of(context).text('Cannot_Create_Customer'), "");
                  _tabController.animateTo(0);
                  return ;
                }
              },
            ),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CustomerFormationCenterAndGroupDetails(widget.cameras),
            new CustomerFormationPersonalInfo(),
            new CustomerFormationContactDetails(),
            new CustomerFormationFamilyDetails(),
            new CustomerFormationSocialFinancialDetails(),
            new CustomerFormationLoanDetails(),
            new CustomerFormationBusinessDetails(),
            new CustomerTotalExpenditureDetails(),
            new ESMS(),
            new ESMS2(),
            new CustomerFormationRiskRatings(),
            new CustomerFormationDeclarationForm(),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value, context, [Color color]) {
    final snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(context).showSnackBar(snackBar);
  }

  submit() async {
    int customerNumberValue;
    if (!globals.accepted) {
      globals.Dialog.alertPopup(
          context, "Alert", "Please select Terms and condtion", "Same");
      _tabController.animateTo(11);
    } else {
      bool isValidated = await validateTabs();
      if (isValidated) {
        int id;
        CustomerListBean bean = new CustomerListBean();



        if (custListBean.mcreateddt == null) {
          custListBean.mcreatedby = username;
          custListBean.mcreateddt = DateTime.now();
        }
        custListBean.mlastupdateby = username;
        custListBean.mlastupdatedt = DateTime.now();

        try {
          custListBean.mdob = DateTime.parse(applicantDob.substring(6) +
              "-" +
              applicantDob.substring(3, 5) +
              "-" +
              applicantDob.substring(0, 2));
        } catch (e) {
          print("date Exception");
        }

        try {
          custListBean.mhusdob = DateTime.parse(husDob.substring(6) +
              "-" +
              husDob.substring(3, 5) +
              "-" +
              husDob.substring(0, 2));
        } catch (e) {
          print("date Exception");
        }
        try {
          custListBean.mmobno = custListBean.addressDetails[0].mMobile;
          custListBean.mlongname = custListBean.mfname.toString() +
              " " +
              custListBean.mmname.toString() +
              " " +
              custListBean.mlname.toString();
        } catch (_) {}

        try {
          try {
            CustomerFormationMasterTabsState.custListBean.esmsentity.date= DateTime.parse(signDate.substring(6) +
                "-" +
                signDate.substring(3, 5) +
                "-" +
                signDate.substring(0, 2));
          } catch (e) {
            print("Sign date expdate Exception");
          }

        } catch (_) {}



        if(custListBean.UUID!=null){
          //TODO UPDATE IN THIS CASE AND IN NEW ITEM CREATION MAKE UUID NULL BEFOR INITIALIZING CUST OBJ
          print("custListBean.mfname");
          print(custListBean.mfname);
          Map custJsonData =  await CustomerListBean.toCustomerJson(custListBean);
          String custData = JSON.encode(custJsonData).toString();
          print("custData.mfname");
          print(custData);
          await AppdatabaseV2.get().updateCustomer(custListBean,custData,custListBean.UUID)
              .then((onValue) {
            customerNumberValue = onValue;
          });

          success(
              'Customer is Updated sucessfully'
                  'Table refrence Number is :  ${custListBean.UUID.toString()} for getting Core ',
              context);
        }else{
          var uuid = Uuid();
          custListBean.UUID=uuid.v4();
          //custListBean.riskratingsentity=null;
         Map custJsonData =  await CustomerListBean.toCustomerJson(custListBean);
         String custData = JSON.encode(custJsonData).toString();
          await AppdatabaseV2.get().insertCustomerMaster(custListBean,custData)
              .then((onValue) {
            customerNumberValue = onValue;
          });
          success(
              'Customer is created sucessfully'
                  'Table refrence Number is :  ${custListBean.UUID.toString()} for getting Core ',
              context);
        }

      }
    }
  }



  Future<bool> validateTabs() async {
    String error = "";
    bool isMaxLengthExceed = false;


    if (custListBean.mcusttype == "" || custListBean.mcusttype == null|| custListBean.mcusttype == "null"|| custListBean.mcusttype.length == 0) {
      _tabController.animateTo(1);
      _showAlert("Customer Type", "Field is mandatory");
      return false;
    }
    if(!globals.isDedupDone){
      _showAlert(Translations.of(context).text('Dedup'), Translations.of(context).text("itIsMand"));
      _tabController.animateTo(0);
      return false;
    }

    if (custListBean.mnationality == "" || custListBean.mnationality == null) {
      _tabController.animateTo(0);
      _showAlert("Nationality", "Field is mandatory");
      return false;
    }
    if (custListBean.mnametitle == "" || custListBean.mnametitle == null) {
      _tabController.animateTo(1);
      _showAlert("Title", "Field is mandatory");
      return false;
    }
    Utility ut = new Utility();
    error = ut.validateOnlyCharacterField(custListBean.mfname);
    if (error != null) {
      _showAlert("Surname", error);
      _tabController.animateTo(1);
      return false;
    }
    error = ut.validateOnlyCharacterField(custListBean.mlname);
    if (error != null) {
      _showAlert("Last Name", error);
      _tabController.animateTo(1);
      return false;
    }
    error = ut.validateOnlyCharacterFieldKhmer(custListBean.mfname2);
    if (error != null) {
      _showAlert("Surname Khmer", error);
      _tabController.animateTo(1);
      return false;
    }

    error = ut.validateOnlyCharacterFieldKhmer(custListBean.mlname2);
    if (error != null) {
      _showAlert("Last Name Khmer", error);
      _tabController.animateTo(1);
      return false;
    }
    if ((custListBean.mcusttype != "" || custListBean.mcusttype != null)&&custListBean.mcusttype != "1") {

      try {
        custListBean.mdob = DateTime.parse(applicantDob.substring(6) +
            "-" +
            applicantDob.substring(3, 5) +
            "-" +
            applicantDob.substring(0, 2));

        int age = DateTime.now().year-custListBean.mdob.year;
        print("custListBean.mdob.year"+age.toString());
        if (age < 18) {
          _showAlert("Date Of birth", "It should be greater than 18");
          _tabController.animateTo(1);
          return false;
        }
      } catch (e) {
        _showAlert("Applicant DOB", "It is Mandatory");
        _tabController.animateTo(1);
        return false;
      }
      if (custListBean.mgender == "" || custListBean.mgender == null) {
        _tabController.animateTo(1);
        _showAlert("Gender", "Field is mandatory");
        return false;
      }

      if (custListBean.mmaritialStatus == "" ||
          custListBean.mmaritialStatus == null) {
        _tabController.animateTo(1);
        _showAlert("Marital Status", "Field is mandatory");
        return false;
      }
      if(custListBean.mmaritialStatus!=null &&custListBean.mmaritialStatus=="2"){
        _showAlert("Spouse Name", "It is Mandatory");
        _tabController.animateTo(1);
        return false;
      }
      if (custListBean.mresstatus == "" ||
          custListBean.mresstatus == null) {
        _tabController.animateTo(1);
        _showAlert("Resedence Status", "Field is mandatory");
        return false;
      }
      if (custListBean.mrelegion == "" || custListBean.mrelegion == null) {
        _tabController.animateTo(1);
        _showAlert("Religion", "Field is mandatory");
        return false;
      }
      if (custListBean.mqualification == "" || custListBean.mqualification == null) {
        _tabController.animateTo(1);
        _showAlert("qualification", "Field is mandatory");
        return false;
      }
      if (custListBean.misearngmembr == "" || custListBean.misearngmembr == null) {
        _tabController.animateTo(1);
        _showAlert("Earning Member", "Field is mandatory");
        return false;
      }
      if (custListBean.misstudyingmembr == "" || custListBean.misstudyingmembr == null) {
        _tabController.animateTo(1);
        _showAlert("Studying Member", "Field is mandatory");
        return false;
      }
      if (custListBean.mmemberno == "" || custListBean.mmemberno == null) {
        _tabController.animateTo(1);
        _showAlert("Dependent", "Field is mandatory");
        return false;
      }
      if (custListBean.mischldrn == "" || custListBean.mischldrn == null) {
        _tabController.animateTo(1);
        _showAlert("Children", "Field is mandatory");
        return false;
      }
      if (custListBean.mlangofcust == "" || custListBean.mlangofcust == null) {
        _tabController.animateTo(1);
        _showAlert("Language", "Field is mandatory");
        return false;
      }
      if (custListBean.moccupation == "" || custListBean.moccupation == null) {
        _tabController.animateTo(1);
        _showAlert("Occupation", "Field is mandatory");
        return false;
      }
      if (custListBean.miscpemp == "" || custListBean.miscpemp == null) {
        _tabController.animateTo(1);
        _showAlert("Is CPBank Employee", "Field is mandatory");
        return false;
      }}
      else if ((custListBean.mcusttype != "" || custListBean.mcusttype != null)&&custListBean.mcusttype == "1") {
      if (custListBean.mnationalid.length<9 ) {
        _tabController.animateTo(1);
        _showAlert(Translations.of(context).text('NtID'), "Should not be less than 9 Char");
        return false;
      }
    }

    if (custListBean.mtarget == "" || custListBean.mtarget == null) {
      _tabController.animateTo(1);
      _showAlert("Target", "Field is mandatory");
      return false;
    }
    //TODO undone this
    if (custListBean.mmainoccupn == "" || custListBean.mmainoccupn == null) {
      _tabController.animateTo(1);
      _showAlert("Industry", "Field is mandatory");
      return false;
    }
    if (custListBean.msuboccupn == "" || custListBean.msuboccupn == null) {
      _tabController.animateTo(1);
      _showAlert("Sector", "Field is mandatory");
      return false;
    }
    if (custListBean.mownership == "" || custListBean.mownership == null) {
      _tabController.animateTo(1);
      _showAlert("Ownership", "Field is mandatory");
      return false;
    }
    if (custListBean.addressDetails == null ||
        custListBean.addressDetails == [] ||
        custListBean.addressDetails.length == 0) {
      _tabController.animateTo(2);
      _showAlert("Adress Detail", "Atleast one address is mandatory");

      return false;
    }


    for(int addressRecedence=0;addressRecedence<custListBean.addressDetails.length;addressRecedence++){
      if (custListBean.addressDetails == resedencyCode) {
        _tabController.animateTo(2);
        _showAlert("Adress Detail", "Resedent address is mandatory");

        return false;
      }
    }

    bool isContain1 =false;
    for (int i = 0; i < custListBean.addressDetails.length; i++) {
      if(custListBean.addressDetails[i].maddrType ==1){
        isContain1 =true;
        break;
      }
    }

    if(!isContain1){
      _tabController.animateTo(2);
      _showAlert("Residential Address", "Residential Address Type is mandatory");
      isContain1 =false;
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
      _tabController.animateTo(2);
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
      _tabController.animateTo(2);
      _showAlert("NID Address", "NID Address is mandatory");
      isContain6 =false;
      return false;
    }

    if (custListBean.customerBusinessDetailsBean == null ||
        custListBean.customerBusinessDetailsBean == [] ||
        custListBean.customerBusinessDetailsBean.length == 0) {
      _tabController.animateTo(6);
      _showAlert("Employment/Business Detail", "Atleast one Employment/Business is mandatory");

      return false;
    }
    int isYes=0;
    for (int i = 0; i < custListBean.customerBusinessDetailsBean.length; i++) {
      print("Here in b uss");
      if(custListBean.customerBusinessDetailsBean[i].misprimarysrcincome =="1"){
        continue;
      }
      if(custListBean.customerBusinessDetailsBean[i].misprimarysrcincome =="2"){
        isYes++;
        print(isYes);
      }

    }
    if(isYes==0){
      _showAlert("Is Primary source of income", "Atlest one yes record is needeed");
      return false;

    }

    if (globals.accepted == false) {
      _tabController.animateTo(11);
      _showAlert("Declaration Check Box", "Select to Create a Customer");
      return false;
    }
    return true;
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

  success(String message, BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.offline_pin,
              color: Colors.green,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(message)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  custListBean = new CustomerListBean();
                  addressBean = new AddressDetailsBean();
                  fdb = new FamilyDetailsBean();
                  sfb=new SocialFinancialDetailsBean();
                  borrowingDetailsBean = new BorrowingDetailsBean();
                  cbdb = new CustomerBusinessDetailsBean();
                  busiExpnBean = new BusinessExpenditureDetailsBean();
                  hhExpnBean = new HouseholdExpenditureDetailsBean();
                  applicantDob = "__-__-____";
                  loanDate = "__-__-____";
                  famDob = "__-__-____";
                  repaymentDate = "__-__-____";
                  EmpFromDate = "__-__-____";
                  EmpToDate = "__-__-____";
                  EmpDateOfImcorp= "__-__-____";
                  husDob = "__-__-____";
                  id1IssueDate ="__-__-____";
                  id1ExpDate ="__-__-____";
                  id2IssueDate ="__-__-____";
                  id2ExpDate ="__-__-____";
                  id3IssueDate ="__-__-____";
                  id3ExpDate ="__-__-____";
                  personalInfoRadios = new List<int>(5);
                  socialFinancialRadios = new List<int>(3);
                  businessDetailRadios = new List<int>(4);
                  businessCashFlowRadios = new List<int>(12);
                  familyDependantRadio = new List<int>(4);
                  socialFinancialRadios= new List<int>(1);
                  globals.isDedupDone=false;
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new HomeDashboard()), //When Authorized Navigate to the next screen
                  );
                },
              ),
            ],
          );
        });
  }



}
