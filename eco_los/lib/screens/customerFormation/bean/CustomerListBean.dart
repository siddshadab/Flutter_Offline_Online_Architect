import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/bean/AddressDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/AssetDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BorrowingDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/BusinessExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CurrentAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerBusinessDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ESMSBean.dart';
import 'package:eco_los/screens/customerFormation/bean/EquityBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FamilyDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FinancialStmntBean.dart';
import 'package:eco_los/screens/customerFormation/bean/FixedAssetsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/HouseholdExpenditureDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:eco_los/screens/customerFormation/bean/LongTermLiabilitiesBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ShortTermLiabilitiesBean.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'IncomeStatementBean.dart';
import 'RiskRatingsBean.dart';
import 'TotalExpenditureDetailsBean.dart';
import 'dart:convert';
import 'package:eco_los/helpers/app_constant.dart';

class CustomerListBean {
  //extends BaseBean{

  static const JsonCodec JSON = const JsonCodec();

  String UUID;
   //numeric(8)
  int mcustno;
  //numeric(8)
  int mlbrcode;
  //nvarchar(4)
  String mnametitle;
  //nvarchar(250)
  String mlongname;
  //nvarchar(4)
  String mfathertitle;
  //nvarchar(100)
  String mfatherfname;
  String mfathermname;
  String mfatherlname;

  //nvarchar(4)
  String mspousetitle;

  //nvarchar(100)
  String mhusbandname;
  DateTime mdob;

  //numeric(2)
  int mage;

  //make this string as this is navarchar in middleware
  //nvarchar(20)
  String mbankacno;

  //nvarchar(1)
  String mbankacyn;

  //nvarchar(10)
  String mbankifsc;

  //nvarchar(25)
  String mbanknamelk;

  //nvarchar(25)
  String mbankbranch;

  //numeric(1)
  int mcuststatus;
  DateTime mdropoutdate;

  //nvarchar(12)
  String mmobno;

  //numeric(2)
  int mpanno;

  //nvarchar(25)
  String mpannodesc;

  //nvarchar(1)
  String mtdsyn;

  //numeric (2)
  int mtdsreasoncd;
  DateTime mtdsfrm15subdt;

  //nvarchar(50)
  String memailId;

  //numeric(2)
  String mcustcategory;

  //numeric(1)
  int mtier;

  //nvarchar(75)
  String mAdd1;

  //nvarchar(75)
  String mAdd2;

  //nvarchar(75)
  String mAdd3;

  //numeric(6)
  int mArea;

  //nvarchar(8)
  String mPinCode;

  //nvarchar(3)
  String mCounCd;

  //nvarchar(15)
  String mCityCd;

  //nvarchar(50)
  String mfname;

  //nvarchar(50)
  String mmname;

  //nvarchar(50)
  String mlname;

  //nvarchar(1)
  String mgender;

  //nvarchar(1)
  String mrelegion;

  //numeric(2)
  String mRuralUrban;

  //nvarchar(4)
  String mcaste;

  //nvarchar(15)
  String mqualification;

  //numeric(4)
  int moccupation;

  //nvarchar(4)
  String mLandType;

  //nvarchar(4)
  String mLandMeasurement;

  //numeric(2)
  int mmaritialStatus;

  //numeric(1)
  int mTypeOfId;

  //nvarchar(25)
  String mIdDesc;

  //nvarchar(1)
  String mInsuranceCovYN;

  //numeric(4)
  int mTypeofCoverage;

  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  int missynctocoresys;
  DateTime mlastsynsdate;

  String missngautryt1;

  String missngautryt2;

  String missngautryt3;

  int mtypeofid3;

  String middesc3;

  DateTime mid3issuedate;
  DateTime mid3expdate;


  //List<CustomModel> assetDetailsList;
  //List<CustomModel> savingDetailsList;
  String mcentername;
  String mgroupname;

  String ifYesThen;

  //String mifyesthen;
  //String mOccBuisness;
  String mShopName;
  String mShpAdd;
  int mYrsInBz;
  String mregNum;

  //String mid1;
  //String mid2;
  String mHouse;
  String mAgricultureType;
  int mIsMbrGrp;

  //nvarchar(1)
  int mLoanAgreed;

  //nvarchar(1)
  int mGend;

  //nvarchar(1)
  int mInsurance;

  //int mRegion;
  int mConstruct;
  int mToilet;

  //int mBankAccYN;
  int mhousBizSp;
  int mBzRegs;
  int mBzTrnd;
  int misCbCheckDone;
  String merrormessage;
  double mexpsramt;
  DateTime mcbcheckrprtdt;
  String motpvrfdno;
  String mprofileind;
  DateTime mhusdob;
  String mlangofcust;
  String mmainoccupn;
  String msuboccupn;
  int msecoccupatn;
  String mmainoccupndesc;
  String msuboccupndesc;
  String mnationality;
  String mnametitle2;
  String mlongname2;
  String mfname2;
  String mmname2;
  String mlname2;
  DateTime mid1issuedate;
  DateTime mid1expdate;
  DateTime mid2issuedate;
  DateTime mid2expdate;
  double macctbal = 0.0;
  String misstudyingmembr;
  String misearngmembr;
  String mmemberno;
  String mischldrn;
  String mbusinessname;
  String mtarget;
  String mownership;
  String mresstatus;
  //String mdedupnationalid;
  String miscpemp;
  String mrankofemp;
  String mcusttype;
  String mempid;
  String mnameoforg;
  String msnameoforg;
  String morgtitle;
  String mnameoforgk;
  String morgtitlek;
  String msnameoforgk;
  String mregno;
  DateTime mregdatae;
  String mtaxregno;
  DateTime mtaxregdatae;
  String mcomecoindicator;
  String mnation;
  String mnationalid;
  DateTime mregdob;
  String missuingauth;
  String mcomtype;
  String mdefalultlanguage;
  DateTime mbusinesscommncmntdate;
  String mcompanystatus;
  String mregcountryname;
  String mdefaultcurrency;
  String mbusinessdesc;
//here
  List<FamilyDetailsBean> familyDetailsList;
  List<SocialFinancialDetailsBean> socialFinancialList;
  List<BorrowingDetailsBean> borrowingDetailsBean;
  List<AddressDetailsBean> addressDetails;

  List<CustomerBusinessDetailsBean> customerBusinessDetailsBean;
  List<AssetDetailsBean> assetDetailsList;
  FixedAssetsBean fixedAssetsList;
  CurrentAssetsBean currentAssetsList;
  LongTermLiabilitiesBean longTermLiabilitiesList;
  ShortTermLiabilitiesBean shortTermLiabilitiesList;
  EquityBean equityList;
  IncomeStatementBean incomeStatementList;
  FinancialStmntBean financialStmntList;
  TotalExpenditureDetailsBean totalExpenditureDetailsBean;
  CustomerListBean customerListBean;
  RiskRatingsBean riskratingsentity;
  ESMSBean esmsentity;


  CustomerListBean({
    this.UUID,
    this.mcustno,
    this.mlbrcode,
    this.mnametitle,
    this.mlongname,
    this.mfathertitle,
    this.mfatherfname,
    this.mfathermname,
    this.mfatherlname,
    this.mspousetitle,
    this.mhusbandname,
    this.mdob,
    this.mage,
    this.mbankacno,
    this.mbankacyn,
    this.mbankifsc,
    this.mbanknamelk,
    this.mbankbranch,
    this.mcuststatus,
    this.mdropoutdate,
    this.mmobno,
    this.mpanno,
    this.mpannodesc,
    this.mtdsyn,
    this.mtdsreasoncd,
    this.mtdsfrm15subdt,
    this.memailId,
    this.mcustcategory,
    this.mtier,
    this.mAdd1,
    this.mAdd2,
    this.mAdd3,
    this.mArea,
    this.mPinCode,
    this.mCounCd,
    this.mCityCd,
    this.mfname,
    this.mmname,
    this.mlname,
    this.mgender,
    this.mrelegion,
    this.mRuralUrban,
    this.mcaste,
    this.mqualification,
    this.moccupation,
    this.mLandType,
    this.mLandMeasurement,
    this.mmaritialStatus,
    this.mTypeOfId,
    this.mIdDesc,
    this.mInsuranceCovYN,
    this.mTypeofCoverage,
    this.mcreateddt,
    this.mcreatedby,
    this.mlastupdatedt,
    this.mlastupdateby,
    this.mgeolocation,
    this.mgeolatd,
    this.mgeologd,
    this.missynctocoresys,
    this.mlastsynsdate,
    this.familyDetailsList,
    this.socialFinancialList,
    this.borrowingDetailsBean,
    this.addressDetails,

    this.customerBusinessDetailsBean,
    this.mcentername,
    this.mgroupname,
    this.ifYesThen,
    this.mShopName,
    this.mShpAdd,
    this.mYrsInBz,
    this.mregNum,
    this.mHouse,
    this.mAgricultureType,
    this.mIsMbrGrp,
    this.mLoanAgreed,
    this.mGend,
    this.mInsurance,
    this.mConstruct,
    this.mToilet,
    this.mhousBizSp,
    this.mBzRegs,
    this.mBzTrnd,
    this.misCbCheckDone,
    this.merrormessage,
    this.assetDetailsList,
    this.mexpsramt,
    this.mcbcheckrprtdt,
    this.motpvrfdno,
    this.mhusdob,
    this.mprofileind,
    this.mlangofcust,
    this.mmainoccupn,
    this.msecoccupatn,
    this.msuboccupn,
    this.mmainoccupndesc,
    this.msuboccupndesc,
    this.fixedAssetsList,
    this.currentAssetsList,
    this.longTermLiabilitiesList,
    this.shortTermLiabilitiesList,
    this.equityList,

    this.incomeStatementList,
    this.financialStmntList,

    this.mnametitle2,
    this.mlongname2,
    this.mfname2,
    this.mmname2,
    this.mlname2,
    this.mnationality,
    this.mid1issuedate,
    this.mid1expdate,
    this.mid2issuedate,
    this.mid2expdate,
    this.totalExpenditureDetailsBean,

    this.missngautryt1,
    this.missngautryt2,
    this.missngautryt3,
    this.mtypeofid3,
    this.middesc3,
    this.mid3issuedate,
    this.mid3expdate,
    this.macctbal,
    this.mmemberno,
    this.misearngmembr,
    this.misstudyingmembr,
    this.mischldrn,
    this.mbusinessname,
    this.mtarget,
    this.mownership,
    this.esmsentity,
    this.mresstatus,
    //this.mdedupnationalid,
    this.miscpemp,
    this.mrankofemp,
    this.mempid,
    this.mcusttype,
    this.riskratingsentity,
    this.mnameoforg,
    this.msnameoforg,
    this.morgtitle,
    this.mnameoforgk,
    this.msnameoforgk,
    this.morgtitlek,
    this.mregno,
    this.mregdatae,
    this.mtaxregno,
    this.mtaxregdatae,
    this.mcomecoindicator,
    this.mnation,
    this.mnationalid,
    this.mregdob,
    this.missuingauth,
    this.mcomtype,
    this.mdefalultlanguage,
    this.mbusinesscommncmntdate,
    this.mcompanystatus,
    this.mregcountryname,
    this.mdefaultcurrency,
    this.mbusinessdesc,
    this.customerListBean
  });


  static Future<Map> toCustomerJson(CustomerListBean customerListBean) async {
    var mapData = new Map();
    mapData[TablesColumnFile.mcustno] = customerListBean.mcustno != null ? customerListBean.mcustno : 0;
    mapData[TablesColumnFile.mlbrcode] = customerListBean.mlbrcode != null ? customerListBean.mlbrcode : 0;

    mapData[TablesColumnFile.mnametitle] =  Constant.ifNullCheck(customerListBean.mnametitle);
    mapData[TablesColumnFile.mlongname] = Constant.ifNullCheck(customerListBean.mlongname);
    mapData[TablesColumnFile.mfathertitle] =
        Constant.ifNullCheck(customerListBean.mfathertitle);
    mapData[TablesColumnFile.mfatherfname] =
        Constant.ifNullCheck(customerListBean.mfatherfname);
    mapData[TablesColumnFile.mfathermname] =
        Constant.ifNullCheck(customerListBean.mfathermname);
    mapData[TablesColumnFile.mfatherlname] =
        Constant.ifNullCheck(customerListBean.mfatherlname);
    mapData[TablesColumnFile.mspousetitle] =
        Constant.ifNullCheck(customerListBean.mspousetitle);
    mapData[TablesColumnFile.mhusbandname] =
        Constant.ifNullCheck(customerListBean.mhusbandname);
    mapData[TablesColumnFile.mdob] = customerListBean.mdob != null
        ? customerListBean.mdob.toIso8601String()
        : null;
    mapData[TablesColumnFile.mage] =
    customerListBean.mage != null ? customerListBean.mage : 0;
    mapData[TablesColumnFile.mbankacno] = customerListBean.mbankacno.toString();
    mapData[TablesColumnFile.mbankacyn] = Constant.ifNullCheck(customerListBean.mbankacyn);
    mapData[TablesColumnFile.mbankifsc] = Constant.ifNullCheck(customerListBean.mbankifsc);
    mapData[TablesColumnFile.mbanknamelk] =
        Constant.ifNullCheck(customerListBean.mbanknamelk);
    mapData[TablesColumnFile.mbankbranch] =
        Constant.ifNullCheck(customerListBean.mbankbranch);
    mapData[TablesColumnFile.mcuststatus] =
    customerListBean.mcuststatus != null ? customerListBean.mcuststatus : 0;
    mapData[TablesColumnFile.mdropoutdate] = customerListBean.mdropoutdate != null
        ? customerListBean.mdropoutdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mmobno] = Constant.ifNullCheck(customerListBean.mmobno);
    mapData[TablesColumnFile.mpanno] =
    customerListBean.mpanno != null ? customerListBean.mpanno : 0;
    mapData[TablesColumnFile.mpannodesc] =
        Constant.ifNullCheck(customerListBean.mpannodesc);
    mapData[TablesColumnFile.mtdsyn] = Constant.ifNullCheck(customerListBean.mtdsyn);
    mapData[TablesColumnFile.mtdsreasoncd] =
    customerListBean.mtdsreasoncd != null ? customerListBean.mtdsreasoncd : 0;
    mapData[TablesColumnFile.mtdsfrm15subdt] =
    customerListBean.mtdsfrm15subdt != null
        ? customerListBean.mtdsfrm15subdt.toIso8601String()
        : null;
    mapData[TablesColumnFile.memailId] = Constant.ifNullCheck(customerListBean.memailId);
    mapData[TablesColumnFile.mcustcategory] =
        Constant.ifNullCheck(customerListBean.mcustcategory);

    mapData[TablesColumnFile.mtier] =
    customerListBean.mtier != null ? customerListBean.mtier : 0;
    mapData[TablesColumnFile.mAdd1] = Constant.ifNullCheck(customerListBean.mAdd1);
    mapData[TablesColumnFile.mAdd2] = Constant.ifNullCheck(customerListBean.mAdd2);
    mapData[TablesColumnFile.mAdd3] = Constant.ifNullCheck(customerListBean.mAdd3);
    mapData[TablesColumnFile.marea] =
    customerListBean.mArea != null ? customerListBean.mArea : 0;
    mapData[TablesColumnFile.mPinCode] = Constant.ifNullCheck(customerListBean.mPinCode);
    mapData[TablesColumnFile.mCounCd] = Constant.ifNullCheck(customerListBean.mCounCd);
    mapData[TablesColumnFile.mCityCd] = Constant.ifNullCheck(customerListBean.mCityCd);
    mapData[TablesColumnFile.mfname] = Constant.ifNullCheck(customerListBean.mfname);
    mapData[TablesColumnFile.mmname] = Constant.ifNullCheck(customerListBean.mmname);
    mapData[TablesColumnFile.mlname] = Constant.ifNullCheck(customerListBean.mlname);
    print("Gender");
    print(customerListBean.mgender);
    mapData[TablesColumnFile.mgender] = Constant.ifNullCheck(customerListBean.mgender);
    mapData[TablesColumnFile.mrelegion] = Constant.ifNullCheck(customerListBean.mrelegion);
    mapData[TablesColumnFile.mRuralUrban] =
    customerListBean.mRuralUrban != null ? customerListBean.mRuralUrban : 0;
    mapData[TablesColumnFile.mcaste] = Constant.ifNullCheck(customerListBean.mcaste);
    mapData[TablesColumnFile.mqualification] =
        Constant.ifNullCheck(customerListBean.mqualification);
    mapData[TablesColumnFile.moccupation] =
    customerListBean.moccupation != null ? customerListBean.moccupation : 0;
    mapData[TablesColumnFile.mLandType] = Constant.ifNullCheck(customerListBean.mLandType);
    mapData[TablesColumnFile.mLandMeasurement] =
        Constant.ifNullCheck(customerListBean.mLandMeasurement);
    mapData[TablesColumnFile.mmaritialStatus] =
    customerListBean.mmaritialStatus != null
        ? customerListBean.mmaritialStatus
        : 0;
    mapData[TablesColumnFile.mTypeOfId] =
    customerListBean.mTypeOfId != null ? customerListBean.mTypeOfId : 0;
    mapData[TablesColumnFile.mIdDesc] = Constant.ifNullCheck(customerListBean.mIdDesc);
    mapData[TablesColumnFile.mInsuranceCovYN] =
        Constant.ifNullCheck(customerListBean.mInsuranceCovYN);
    mapData[TablesColumnFile.mTypeofCoverage] =
    customerListBean.mTypeofCoverage != null
        ? customerListBean.mTypeofCoverage
        : 0;
    mapData[TablesColumnFile.mcreateddt] = customerListBean.mcreateddt != null
        ? customerListBean.mcreateddt.toIso8601String()
        : null;
    mapData[TablesColumnFile.mcreatedby] =
        Constant.ifNullCheck(customerListBean.mcreatedby);
    mapData[TablesColumnFile.mlastupdatedt] =
    customerListBean.mlastupdatedt != null
        ? customerListBean.mlastupdatedt.toIso8601String()
        : null;
    mapData[TablesColumnFile.mlastupdateby] =
        Constant.ifNullCheck(customerListBean.mlastupdateby);
    mapData[TablesColumnFile.mgeolocation] =
        Constant.ifNullCheck(customerListBean.mgeolocation);
    mapData[TablesColumnFile.mgeolatd] = Constant.ifNullCheck(customerListBean.mgeolatd);
    mapData[TablesColumnFile.mgeologd] = Constant.ifNullCheck(customerListBean.mgeologd);
    mapData[TablesColumnFile.misCbCheckDone] =
    customerListBean.misCbCheckDone != null
        ? customerListBean.misCbCheckDone
        : 0;
    mapData[TablesColumnFile.mcbcheckrprtdt] =
    customerListBean.mcbcheckrprtdt != null
        ? customerListBean.mcbcheckrprtdt.toIso8601String()
        : null;

    mapData[TablesColumnFile.merrormessage] =
        Constant.ifNullCheck(customerListBean.merrormessage);
    mapData[TablesColumnFile.missynctocoresys] =
    customerListBean.missynctocoresys != null
        ? customerListBean.missynctocoresys
        : 0;
    mapData[TablesColumnFile.mlastsynsdate] =
    customerListBean.mlastsynsdate != null
        ? customerListBean.mlastsynsdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mloanagreed] =
    customerListBean.mLoanAgreed != null ? customerListBean.mLoanAgreed : 0;

    mapData[TablesColumnFile.mhusdob] = customerListBean.mhusdob != null
        ? customerListBean.mhusdob.toIso8601String()
        : null;
    mapData[TablesColumnFile.mprofileind] =
        Constant.ifNullCheck(customerListBean.mprofileind);

    mapData[TablesColumnFile.mlangofcust] =
        Constant.ifNullCheck(customerListBean.mlangofcust);
    mapData[TablesColumnFile.mcusttype] = Constant.ifNullCheck(customerListBean.mcusttype);
    mapData[TablesColumnFile.mmainoccupn] =
        Constant.ifNullCheck(customerListBean.mmainoccupn);
    mapData[TablesColumnFile.msuboccupn] =
        Constant.ifNullCheck(customerListBean.msuboccupn);
    mapData[TablesColumnFile.mmainoccupndesc] =
        Constant.ifNullCheck(customerListBean.mmainoccupndesc);
    mapData[TablesColumnFile.msuboccupndesc] =
        Constant.ifNullCheck(customerListBean.msuboccupndesc);
    mapData[TablesColumnFile.msecoccupatn] =
    customerListBean.msecoccupatn != null ? customerListBean.msecoccupatn : 0;

    mapData[TablesColumnFile.mnametitle] =
        Constant.ifNullCheck(customerListBean.mnametitle2);
    mapData[TablesColumnFile.mlongname] =
        Constant.ifNullCheck(customerListBean.mlongname2);
    mapData[TablesColumnFile.mfname2] = Constant.ifNullCheck(customerListBean.mfname2);
    mapData[TablesColumnFile.mmname2] = Constant.ifNullCheck(customerListBean.mmname2);
    mapData[TablesColumnFile.mlname2] = Constant.ifNullCheck(customerListBean.mlname2);

    mapData[TablesColumnFile.mid1issuedate] =
    customerListBean.mid1issuedate != null
        ? customerListBean.mid1issuedate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mid2issuedate] =
    customerListBean.mid2issuedate != null
        ? customerListBean.mid2issuedate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mid1expdate] = customerListBean.mid1expdate != null
        ? customerListBean.mid1expdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mid2expdate] = customerListBean.mid2expdate != null
        ? customerListBean.mid2expdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mnationality] =
        Constant.ifNullCheck(customerListBean.mnationality);

    mapData[TablesColumnFile.mid3expdate] = customerListBean.mid3expdate != null
        ? customerListBean.mid3expdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mid3issuedate] =
    customerListBean.mid3issuedate != null
        ? customerListBean.mid3issuedate.toIso8601String()
        : null;
    mapData[TablesColumnFile.missngautryt1] =
        Constant.ifNullCheck(customerListBean.missngautryt1);
    mapData[TablesColumnFile.missngautryt2] =
        Constant.ifNullCheck(customerListBean.missngautryt2);
    mapData[TablesColumnFile.missngautryt3] =
        Constant.ifNullCheck(customerListBean.missngautryt3);

    mapData[TablesColumnFile.mtypeofid3] =
    customerListBean.mtypeofid3 != null ? customerListBean.mtypeofid3 : 0;
    mapData[TablesColumnFile.macctbal] =
    customerListBean.macctbal != null ? customerListBean.macctbal : 0.0;

    mapData[TablesColumnFile.middesc3] = Constant.ifNullCheck(customerListBean.middesc3);

    mapData[TablesColumnFile.misearngmembr] =
        Constant.ifNullCheck(customerListBean.misearngmembr);
    mapData[TablesColumnFile.misstudyingmembr] =
        Constant.ifNullCheck(customerListBean.misstudyingmembr);
    mapData[TablesColumnFile.mmemberno] = Constant.ifNullCheck(customerListBean.mmemberno);
    mapData[TablesColumnFile.mischldrn] = Constant.ifNullCheck(customerListBean.mischldrn);
    mapData[TablesColumnFile.mbusinessname] =
        Constant.ifNullCheck(customerListBean.mbusinessname);
    mapData[TablesColumnFile.mtarget] = Constant.ifNullCheck(customerListBean.mtarget);
    mapData[TablesColumnFile.mownership] =
        Constant.ifNullCheck(customerListBean.mownership);
    mapData[TablesColumnFile.mresstatus] =
        Constant.ifNullCheck(customerListBean.mresstatus);

    mapData[TablesColumnFile.miscpemp] = Constant.ifNullCheck(customerListBean.miscpemp);
    mapData[TablesColumnFile.mrankofemp] =
        Constant.ifNullCheck(customerListBean.mrankofemp);
    mapData[TablesColumnFile.mempid] = Constant.ifNullCheck(customerListBean.mempid);
    mapData[TablesColumnFile.mnameoforg] =
        Constant.ifNullCheck(customerListBean.mnameoforg);
    mapData[TablesColumnFile.msnameoforg] =
        Constant.ifNullCheck(customerListBean.msnameoforg);
    mapData[TablesColumnFile.morgtitle] = Constant.ifNullCheck(customerListBean.morgtitle);
    mapData[TablesColumnFile.mnameoforgk] =
        Constant.ifNullCheck(customerListBean.mnameoforgk);
    mapData[TablesColumnFile.msnameoforgk] =
        Constant.ifNullCheck(customerListBean.msnameoforgk);
    mapData[TablesColumnFile.morgtitlek] =
        Constant.ifNullCheck(customerListBean.morgtitlek);
    mapData[TablesColumnFile.mregno] = Constant.ifNullCheck(customerListBean.mregno);
    mapData[TablesColumnFile.mregdatae] = customerListBean.mregdatae != null
        ? customerListBean.mregdatae.toIso8601String()
        : null;
    mapData[TablesColumnFile.mtaxregno] = Constant.ifNullCheck(customerListBean.mtaxregno);
    mapData[TablesColumnFile.mtaxregdatae] = customerListBean.mtaxregdatae != null
        ? customerListBean.mtaxregdatae.toIso8601String()
        : null;
    mapData[TablesColumnFile.mcomecoindicator] =
        Constant.ifNullCheck(customerListBean.mcomecoindicator);
    mapData[TablesColumnFile.mnationalid] =
        Constant.ifNullCheck(customerListBean.mnationalid);
    mapData[TablesColumnFile.mregdob] = customerListBean.mregdob != null
        ? customerListBean.mregdob.toIso8601String()
        : null;
    mapData[TablesColumnFile.missuingauth] =
        Constant.ifNullCheck(customerListBean.missuingauth);
    mapData[TablesColumnFile.mcomtype] = Constant.ifNullCheck(customerListBean.mcomtype);
    mapData[TablesColumnFile.mdefalultlanguage] =
        Constant.ifNullCheck(customerListBean.mdefalultlanguage);
    mapData[TablesColumnFile.mbusinesscommncmntdate] =
    customerListBean.mbusinesscommncmntdate != null
        ? customerListBean.mbusinesscommncmntdate.toIso8601String()
        : null;
    mapData[TablesColumnFile.mcompanystatus] =
        Constant.ifNullCheck(customerListBean.mcompanystatus);
    mapData[TablesColumnFile.mregcountryname] =
        Constant.ifNullCheck(customerListBean.mregcountryname);
    mapData[TablesColumnFile.mdefaultcurrency] =
        Constant.ifNullCheck(customerListBean.mdefaultcurrency);
    mapData[TablesColumnFile.mbusinessdesc] =
        Constant.ifNullCheck(customerListBean.mbusinessdesc);

    var mapDataFamily;
    var famiDetList = List();

    if(customerListBean.familyDetailsList!=null) {
      for (int famDetList = 0;
      famDetList < customerListBean.familyDetailsList.length;
      famDetList++) {
        mapDataFamily = new Map();

        mapDataFamily[TablesColumnFile.mcustno] =
        customerListBean.familyDetailsList[famDetList].mcustno != null
            ? customerListBean.familyDetailsList[famDetList].mcustno
            : 0;

        mapDataFamily[TablesColumnFile.mnicno] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList].mnicno);
        mapDataFamily[TablesColumnFile.mdob] =
        customerListBean.familyDetailsList[famDetList].mdob != null
            ? customerListBean.familyDetailsList[famDetList].mdob
            .toIso8601String()
            : null;
        mapDataFamily[TablesColumnFile.mage] =
        customerListBean.familyDetailsList[famDetList].mage != null
            ? customerListBean.familyDetailsList[famDetList].mage
            : 0;
        mapDataFamily[TablesColumnFile.meducation] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].meducation);
        mapDataFamily[TablesColumnFile.mmemberno] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].mmemberno);
        mapDataFamily[TablesColumnFile.moccuptype] =
        customerListBean.familyDetailsList[famDetList].moccuptype != null
            ? customerListBean.familyDetailsList[famDetList].moccuptype
            : 0;
        mapDataFamily[TablesColumnFile.mincome] =
        customerListBean.familyDetailsList[famDetList].mincome != null
            ? customerListBean.familyDetailsList[famDetList].mincome
            : 0.0;
        mapDataFamily[TablesColumnFile.mhealthstatus] =
        customerListBean.familyDetailsList[famDetList].mhealthstatus != null
            ? customerListBean.familyDetailsList[famDetList].mhealthstatus
            : 0;
        mapDataFamily[TablesColumnFile.mrelationwithcust] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList]
                .mrelationwithcust);
        mapDataFamily[TablesColumnFile.maritalstatus] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].maritalstatus);
        mapDataFamily[TablesColumnFile.mcontrforhouseexp] =
        customerListBean.familyDetailsList[famDetList].mcontrforhouseexp != null
            ? customerListBean.familyDetailsList[famDetList].mcontrforhouseexp
            : 0.0;
        mapDataFamily[TablesColumnFile.macidntlinsurance] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList]
                .macidntlinsurance);
        mapDataFamily[TablesColumnFile.mnomineeyn] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].mnomineeyn);

        mapDataFamily[TablesColumnFile.mnametitle] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].mnametitle);
        mapDataFamily[TablesColumnFile.mlongname] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].mlongname);
        mapDataFamily[TablesColumnFile.mfname] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList].mfname);
        mapDataFamily[TablesColumnFile.mmname] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList].mmname);
        mapDataFamily[TablesColumnFile.mlname] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList].mlname);
        mapDataFamily[TablesColumnFile.mdesignation] =
            Constant.ifNullCheck(
                customerListBean.familyDetailsList[famDetList].mdesignation);
        //mapDataFamily[TablesColumnFile.mprofession] = Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList].mprofession);
        mapDataFamily[TablesColumnFile.misstudyingmembr] =
        customerListBean.familyDetailsList[famDetList].misstudyingmembr != null
            ? customerListBean.familyDetailsList[famDetList].misstudyingmembr
            : 0;
        mapDataFamily[TablesColumnFile.misearngmembr] =
        customerListBean.familyDetailsList[famDetList].misearngmembr != null
            ? customerListBean.familyDetailsList[famDetList].misearngmembr
            : 0;
        mapDataFamily[TablesColumnFile.misleavingwithappcnt] =
        customerListBean.familyDetailsList[famDetList].misleavingwithappcnt !=
            null
            ? customerListBean.familyDetailsList[famDetList]
            .misleavingwithappcnt
            : 0;
        mapDataFamily[TablesColumnFile.mreverseRelationship] =
            Constant.ifNullCheck(customerListBean.familyDetailsList[famDetList]
                .mreverseRelationship);

        famiDetList.add(mapDataFamily);
      }
    }

    var mapDataBank;
    var bankDetailList = List();
    for (int bankDetList = 0;
    bankDetList < customerListBean.socialFinancialList.length;
    bankDetList++) {
      mapDataBank = new Map();


      mapDataBank[TablesColumnFile.maccno] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].maccno);

      mapDataBank[TablesColumnFile.mcreatedby] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].mcreatedby);
      mapDataBank[TablesColumnFile.maccstatus] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].maccstatus);
      mapDataBank[TablesColumnFile.migyn] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].migyn);
      mapDataBank[TablesColumnFile.mcurcode] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].mcurcode);

      mapDataBank[TablesColumnFile.mbankname] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].mbankname);

      mapDataBank[TablesColumnFile.mbranch] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].mbranch);

      mapDataBank[TablesColumnFile.maccbal] =
      customerListBean.socialFinancialList[bankDetList].maccbal != null
          ? customerListBean.socialFinancialList[bankDetList].maccbal
          : 0.0;

      mapDataBank[TablesColumnFile.misusefordis] =
          Constant.ifNullCheck(customerListBean.socialFinancialList[bankDetList].misusefordis);

      bankDetailList.add(mapDataBank);
    }

    var mapDataAdd;
    var addDetailsList = new List();
    for (int addDetList = 0; addDetList < customerListBean.addressDetails.length; addDetList++) {
      mapDataAdd = new Map();
      mapDataAdd[TablesColumnFile.taddrefno] =

      mapDataAdd[TablesColumnFile.mcustno] =
      customerListBean.addressDetails[addDetList].mcustno != null
          ? customerListBean.addressDetails[addDetList].mcustno
          : 0;
      mapDataAdd[TablesColumnFile.maddrType] =
      customerListBean.addressDetails[addDetList].maddrType != null
          ? customerListBean.addressDetails[addDetList].maddrType
          : 0;
      mapDataAdd[TablesColumnFile.maddr1] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].maddr1);
      mapDataAdd[TablesColumnFile.maddr2] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].maddr2);
      mapDataAdd[TablesColumnFile.maddr3] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].maddr3);
      mapDataAdd[TablesColumnFile.mpinCd] =
      customerListBean.addressDetails[addDetList].mpinCd != null
          ? customerListBean.addressDetails[addDetList].mpinCd
          : 0;
      mapDataAdd[TablesColumnFile.mtel1] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mtel1);
      mapDataAdd[TablesColumnFile.memail] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].memail);
      mapDataAdd[TablesColumnFile.mtel2] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mtel2);
      mapDataAdd[TablesColumnFile.mcityCd] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mcityCd);
      mapDataAdd[TablesColumnFile.mfax1] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mfax1);
      mapDataAdd[TablesColumnFile.mfax2] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mfax2);
      mapDataAdd[TablesColumnFile.mcountryCd] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mcountryCd);
      mapDataAdd[TablesColumnFile.marea] =
      customerListBean.addressDetails[addDetList].marea != null
          ? customerListBean.addressDetails[addDetList].marea
          : 0;
      /*mapDataAdd[TablesColumnFile.mHouseType] =
      customerListBean.addressDetails[addDetList].mHouseType != null
          ? customerListBean.addressDetails[addDetList].mHouseType
          : 0;*/
      print(customerListBean.mHouse);
      mapDataAdd[TablesColumnFile.mHouseType] =
      customerListBean.mHouse != "null" ? customerListBean.mHouse : 0;
      mapDataAdd[TablesColumnFile.mRntLeasAmt] =
      customerListBean.addressDetails[addDetList].mRntLeasAmt != null
          ? customerListBean.addressDetails[addDetList].mRntLeasAmt
          : 0.0;
      mapDataAdd[TablesColumnFile.mRntLeasDep] =
      customerListBean.addressDetails[addDetList].mRntLeasDep != null
          ? customerListBean.addressDetails[addDetList].mRntLeasDep
          : 0;
      mapDataAdd[TablesColumnFile.mContLeasExp] =
      customerListBean.addressDetails[addDetList].mContLeasExp != null
          ? customerListBean.addressDetails[addDetList].mContLeasExp.toIso8601String()
          : null;
      print("no of room/post");
      print(customerListBean.addressDetails[addDetList].mNoOfRooms);
      mapDataAdd[TablesColumnFile.mNoOfRooms] =
      customerListBean.addressDetails[addDetList].mNoOfRooms != null
          ? customerListBean.addressDetails[addDetList].mNoOfRooms
          : 0;
      print(customerListBean.mConstruct);
      mapDataAdd[TablesColumnFile.mRoofCond] =
      customerListBean.mConstruct != null ? customerListBean.mConstruct : 0;
      mapDataAdd[TablesColumnFile.mUtils] =
      customerListBean.addressDetails[addDetList].mUtils != null
          ? customerListBean.addressDetails[addDetList].mUtils
          : 0;
      mapDataAdd[TablesColumnFile.mAreaType] =
      customerListBean.addressDetails[addDetList].mAreaType != null
          ? customerListBean.addressDetails[addDetList].mAreaType
          : 0;
      mapDataAdd[TablesColumnFile.mLandmark] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mLandmark);
      mapDataAdd[TablesColumnFile.mstate] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mState);
      mapDataAdd[TablesColumnFile.mYearStay] =
      customerListBean.addressDetails[addDetList].mYearStay != null &&
          customerListBean.addressDetails[addDetList].mYearStay != 'null'
          ? customerListBean.addressDetails[addDetList].mYearStay
          : 0;
      mapDataAdd[TablesColumnFile.mWardNo] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mWardNo);
      mapDataAdd[TablesColumnFile.mMobile] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mMobile);
      mapDataAdd[TablesColumnFile.mEmail] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mEmail);
      mapDataAdd[TablesColumnFile.mPattaName] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mPattaName);
      mapDataAdd[TablesColumnFile.mRelationship] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mRelationship);
      mapDataAdd[TablesColumnFile.mSourceOfDep] =
      customerListBean.addressDetails[addDetList].mSourceOfDep != null
          ? customerListBean.addressDetails[addDetList].mSourceOfDep
          : 0;
      mapDataAdd[TablesColumnFile.mInstAmount] =
      customerListBean.addressDetails[addDetList].mInstAmount != null
          ? customerListBean.addressDetails[addDetList].mInstAmount
          : 0.0;
      mapDataAdd[TablesColumnFile.mToietYN] =
      customerListBean.mToilet != "null" ? customerListBean.mToilet : 0;
      mapDataAdd[TablesColumnFile.mNoOfRooms] =
      customerListBean.addressDetails[addDetList].mNoOfRooms != null
          ? customerListBean.addressDetails[addDetList].mNoOfRooms
          : 0;
      mapDataAdd[TablesColumnFile.mSpouseYearsStay] =
      customerListBean.addressDetails[addDetList].mSpouseYearsStay != null
          ? customerListBean.addressDetails[addDetList].mSpouseYearsStay
          : 0;
      mapDataAdd[TablesColumnFile.mDistCd] =
      customerListBean.addressDetails[addDetList].mDistCd != null
          ? customerListBean.addressDetails[addDetList].mDistCd
          : 0;

      mapDataAdd[TablesColumnFile.mvillage] =
      customerListBean.addressDetails[addDetList].mvillage != null
          ? customerListBean.addressDetails[addDetList].mvillage
          : 0;
      mapDataAdd[TablesColumnFile.mplacecd] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mplacecd);
      mapDataAdd[TablesColumnFile.mCookFuel] =
      customerListBean.addressDetails[addDetList].mCookFuel != null
          ? customerListBean.addressDetails[addDetList].mCookFuel
          : 0;
      mapDataAdd[TablesColumnFile.mSecMobile] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mSecMobile);
      mapDataAdd[TablesColumnFile.mgeolatd] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mgeolatd);
      mapDataAdd[TablesColumnFile.mgeologd] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mgeologd);
      mapDataAdd[TablesColumnFile.mownership] =
          Constant.ifNullCheck(customerListBean.addressDetails[addDetList].mownership);

      addDetailsList.add(mapDataAdd);
    }

    var mapDataBorr;
    var borrDetailsList = new List();
    for (int borrDetList = 0;
    borrDetList < customerListBean.borrowingDetailsBean.length;
    borrDetList++) {
      mapDataBorr = new Map();

      mapDataBorr[TablesColumnFile.mcustno] =
      customerListBean.borrowingDetailsBean[borrDetList].mcustno != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mcustno
          : 0;
      mapDataBorr[TablesColumnFile.mnameofborrower] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mnameofborrower);
      mapDataBorr[TablesColumnFile.msource] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].msource);
      mapDataBorr[TablesColumnFile.mpurpose] =
          customerListBean.borrowingDetailsBean[borrDetList].mpurpose;
      mapDataBorr[TablesColumnFile.mamount] =
      customerListBean.borrowingDetailsBean[borrDetList].mamount != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mamount
          : 0.0;
      mapDataBorr[TablesColumnFile.mintrate] =
      customerListBean.borrowingDetailsBean[borrDetList].mintrate != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mintrate
          : 0.0;
      mapDataBorr[TablesColumnFile.memiamt] =
      customerListBean.borrowingDetailsBean[borrDetList].memiamt != null
          ? customerListBean.borrowingDetailsBean[borrDetList].memiamt
          : 0.0;
      mapDataBorr[TablesColumnFile.moutstandingamt] =
      customerListBean.borrowingDetailsBean[borrDetList].moutstandingamt != null
          ? customerListBean.borrowingDetailsBean[borrDetList].moutstandingamt
          : 0.0;
      mapDataBorr[TablesColumnFile.mmemberno] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mmemberno);
      mapDataBorr[TablesColumnFile.mloancycle] =
      customerListBean.borrowingDetailsBean[borrDetList].mloancycle != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mloancycle
          : 0.0;

      mapDataBorr[TablesColumnFile.macctno] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].macctno);

      mapDataBorr[TablesColumnFile.mperiod] =
      customerListBean.borrowingDetailsBean[borrDetList].mperiod != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mperiod
          : 0;
      mapDataBorr[TablesColumnFile.mfrequency] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mfrequency);
      mapDataBorr[TablesColumnFile.mcurcd] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mcurcd);

      mapDataBorr[TablesColumnFile.mrestructrdloan] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mrestructrdloan);
      mapDataBorr[TablesColumnFile.msvngamount] =
      customerListBean.borrowingDetailsBean[borrDetList].msvngamount != null
          ? customerListBean.borrowingDetailsBean[borrDetList].msvngamount
          : 0.0;
      mapDataBorr[TablesColumnFile.mremark] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mremark);
      mapDataBorr[TablesColumnFile.mmodeofdisb] =
          Constant.ifNullCheck(customerListBean.borrowingDetailsBean[borrDetList].mmodeofdisb);

      mapDataBorr[TablesColumnFile.mloanDate] =
      customerListBean.borrowingDetailsBean[borrDetList].mloanDate != null
          ? customerListBean.borrowingDetailsBean[borrDetList].mloanDate.toIso8601String()
          : null;
      borrDetailsList.add(mapDataBorr);
    }

    //business data error
    //laterOnset this thig

    var mapDataBuss;
    var busDetsList = List();
    for (int busDetList = 0;
    busDetList < customerListBean.customerBusinessDetailsBean.length;
    busDetList++) {
      mapDataBuss = new Map();

      mapDataBuss[TablesColumnFile.mcusactivitytype] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mcusactivitytype);
      mapDataBuss[TablesColumnFile.mbusstype] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusstype);
      mapDataBuss[TablesColumnFile.mbusinessname] =Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusinessname);
      mapDataBuss[TablesColumnFile.mbuslocownership] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbuslocownership != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbuslocownership
          : 0;
      mapDataBuss[TablesColumnFile.misselfemp] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].misselfemp);
      mapDataBuss[TablesColumnFile.mbusaddress1] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusaddress1);
      mapDataBuss[TablesColumnFile.mbusaddress2] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusaddress2);
      mapDataBuss[TablesColumnFile.mbusaddress3] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusaddress3);
      mapDataBuss[TablesColumnFile.mbusaddress4] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusaddress4);
      mapDataBuss[TablesColumnFile.mbuscity] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbuscity);
      mapDataBuss[TablesColumnFile.mdistcd] =
      customerListBean.customerBusinessDetailsBean[busDetList].mdistcd != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mdistcd
          : 0;
      mapDataBuss[TablesColumnFile.mbusstate] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusstate);
      mapDataBuss[TablesColumnFile.mbuscountry] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbuscountry);
      mapDataBuss[TablesColumnFile.mbusarea] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusarea != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusarea
          : 0;
      mapDataBuss[TablesColumnFile.mbusvillage] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusvillage != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusvillage
          : 0;
      mapDataBuss[TablesColumnFile.mbuslandmark] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbuslandmark);
      mapDataBuss[TablesColumnFile.mbuspin] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbuspin != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbuspin
          : 0;
      mapDataBuss[TablesColumnFile.mbusyrsmnths] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusyrsmnths != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusyrsmnths
          : 0;
      mapDataBuss[TablesColumnFile.mregisteredyn] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mregisteredyn);
      mapDataBuss[TablesColumnFile.mregistrationno] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mregistrationno);
      mapDataBuss[TablesColumnFile.mbusothtomanageabsyn] = Constant.ifNullCheck(
          customerListBean.customerBusinessDetailsBean[busDetList].mbusothtomanageabsyn);
      mapDataBuss[TablesColumnFile.mbusothmanagername] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusothmanagername);
      mapDataBuss[TablesColumnFile.mbusothmanagerrel] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusothmanagerrel != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusothmanagerrel
          : 0;
      mapDataBuss[TablesColumnFile.mbusmonthlyincome] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlyincome != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlyincome
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusseasonalityjan] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityjan);
      mapDataBuss[TablesColumnFile.mbusseasonalityfeb] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityfeb);
      mapDataBuss[TablesColumnFile.mbusseasonalitymar] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalitymar);
      mapDataBuss[TablesColumnFile.mbusseasonalityapr] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityapr);
      mapDataBuss[TablesColumnFile.mbusseasonalitymay] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalitymay);
      mapDataBuss[TablesColumnFile.mbusseasonalityjun] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityjun);
      mapDataBuss[TablesColumnFile.mbusseasonalityjul] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityjul);
      mapDataBuss[TablesColumnFile.mbusseasonalityaug] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityaug);
      mapDataBuss[TablesColumnFile.mbusseasonalitysep] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalitysep);
      mapDataBuss[TablesColumnFile.mbusseasonalityoct] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalityoct);
      mapDataBuss[TablesColumnFile.mbusseasonalitynov] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalitynov);
      mapDataBuss[TablesColumnFile.mbusseasonalitydec] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusseasonalitydec);
      mapDataBuss[TablesColumnFile.mbushighsales] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbushighsales != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbushighsales
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusmediumsales] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusmediumsales != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusmediumsales
          : 0.0;
      mapDataBuss[TablesColumnFile.mbuslowsales] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbuslowsales != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbuslowsales
          : 0.0;
      mapDataBuss[TablesColumnFile.mbushighincome] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbushighincome != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbushighincome
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusmediumincom] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusmediumincom != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusmediumincom
          : 0.0;
      mapDataBuss[TablesColumnFile.mbuslowincome] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbuslowincome != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbuslowincome
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusmonthlytotaleval] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlytotaleval != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlytotaleval
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusmonthlytotalverif] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlytotalverif != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusmonthlytotalverif
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusincludesurcalcyn] = Constant.ifNullCheck(
          customerListBean.customerBusinessDetailsBean[busDetList].mbusincludesurcalcyn);
      mapDataBuss[TablesColumnFile.mbusnhousesameplaceyn] = Constant.ifNullCheck(
          customerListBean.customerBusinessDetailsBean[busDetList].mbusnhousesameplaceyn);
      mapDataBuss[TablesColumnFile.mbusinesstrend] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbusinesstrend);

      mapDataBuss[TablesColumnFile.mmonthlyincome] =
      customerListBean.customerBusinessDetailsBean[busDetList].mmonthlyincome != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mmonthlyincome
          : 0.0;
      mapDataBuss[TablesColumnFile.mtotalmonthlyincome] =
      customerListBean.customerBusinessDetailsBean[busDetList].mtotalmonthlyincome != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mtotalmonthlyincome
          : 0.0;
      mapDataBuss[TablesColumnFile.mbusinessexpense] =
      customerListBean.customerBusinessDetailsBean[busDetList].mbusinessexpense != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mbusinessexpense
          : 0.0;
      mapDataBuss[TablesColumnFile.mhousehldexpense] =
      customerListBean.customerBusinessDetailsBean[busDetList].mhousehldexpense != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mhousehldexpense
          : 0.0;
      mapDataBuss[TablesColumnFile.mmonthlyemi] =
      customerListBean.customerBusinessDetailsBean[busDetList].mmonthlyemi != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mmonthlyemi
          : 0.0;
      mapDataBuss[TablesColumnFile.mincomeemiratio] =
      customerListBean.customerBusinessDetailsBean[busDetList].mincomeemiratio != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mincomeemiratio
          : 0.0;
      mapDataBuss[TablesColumnFile.mnetamount] =
      customerListBean.customerBusinessDetailsBean[busDetList].mnetamount != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mnetamount
          : 0.0;
      mapDataBuss[TablesColumnFile.mpercentage] =
      customerListBean.customerBusinessDetailsBean[busDetList].mpercentage != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mpercentage
          : 0.0;

      mapDataBuss[TablesColumnFile.mposition] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mposition);
      mapDataBuss[TablesColumnFile.mdepartment] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mdepartment);
      mapDataBuss[TablesColumnFile.mincomefromothrsrc] =
      customerListBean.customerBusinessDetailsBean[busDetList].mincomefromothrsrc != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mincomefromothrsrc
          : 0.0;

      mapDataBuss[TablesColumnFile.mempfrom] =
      customerListBean.customerBusinessDetailsBean[busDetList].mempfrom != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mempfrom.toIso8601String()
          : null;
      mapDataBuss[TablesColumnFile.mempto] =
      customerListBean.customerBusinessDetailsBean[busDetList].mempto != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mempto.toIso8601String()
          : null;

      mapDataBuss[TablesColumnFile.mdateofincorporation] =
      customerListBean.customerBusinessDetailsBean[busDetList].mdateofincorporation != null
          ? customerListBean.customerBusinessDetailsBean[busDetList]
          .mdateofincorporation
          .toIso8601String()
          : null;
      mapDataBuss[TablesColumnFile.mtotalmanpower] =
      customerListBean.customerBusinessDetailsBean[busDetList].mtotalmanpower != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mtotalmanpower
          : 0;
      mapDataBuss[TablesColumnFile.mtotalman] =
      customerListBean.customerBusinessDetailsBean[busDetList].mtotalman != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mtotalman
          : 0;
      mapDataBuss[TablesColumnFile.mtotalwomen] =
      customerListBean.customerBusinessDetailsBean[busDetList].mtotalwomen != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mtotalwomen
          : 0;

      mapDataBuss[TablesColumnFile.mcompanycategory] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mcompanycategory);
      mapDataBuss[TablesColumnFile.mmanagerdetails] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mmanagerdetails);

      mapDataBuss[TablesColumnFile.mbusinessownerandshareholdingpercentage] =
      customerListBean.customerBusinessDetailsBean[busDetList]
          .mbusinessownerandshareholdingpercentage !=
          null
          ? customerListBean.customerBusinessDetailsBean[busDetList]
          .mbusinessownerandshareholdingpercentage
          : 0.0;
      mapDataBuss[TablesColumnFile.mcapital] =
      customerListBean.customerBusinessDetailsBean[busDetList].mcapital != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mcapital
          : 0.0;
      mapDataBuss[TablesColumnFile.mcostofgoodssold] =
      customerListBean.customerBusinessDetailsBean[busDetList].mcostofgoodssold != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mcostofgoodssold
          : 0.0;
      mapDataBuss[TablesColumnFile.moperationexpenditure] =
      customerListBean.customerBusinessDetailsBean[busDetList].moperationexpenditure != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].moperationexpenditure
          : 0.0;
      mapDataBuss[TablesColumnFile.mnetprofit] =
      customerListBean.customerBusinessDetailsBean[busDetList].mnetprofit != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mnetprofit
          : 0.0;

////////////////  /
      mapDataBuss[TablesColumnFile.msrcname] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].msrcname);
      mapDataBuss[TablesColumnFile.mprofession] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mprofession);
      mapDataBuss[TablesColumnFile.mnoofempincmpny] =
      customerListBean.customerBusinessDetailsBean[busDetList].mnoofempincmpny != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].mnoofempincmpny
          : 0;
      mapDataBuss[TablesColumnFile.myrsofexpinyrs] =
      customerListBean.customerBusinessDetailsBean[busDetList].myrsofexpinyrs != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].myrsofexpinyrs
          : 0.0;
      mapDataBuss[TablesColumnFile.myrsofexpinmnths] =
      customerListBean.customerBusinessDetailsBean[busDetList].myrsofexpinmnths != null
          ? customerListBean.customerBusinessDetailsBean[busDetList].myrsofexpinmnths
          : 0.0;
      mapDataBuss[TablesColumnFile.mmobile] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mmobile);
      mapDataBuss[TablesColumnFile.mstatusofemp] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mstatusofemp);
      mapDataBuss[TablesColumnFile.mtagtmrkt] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mtagtmrkt);
      mapDataBuss[TablesColumnFile.mstrtgy] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mstrtgy);
      mapDataBuss[TablesColumnFile.mbussprocss] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbussprocss);
      mapDataBuss[TablesColumnFile.mcomptrmekt] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mcomptrmekt);

      mapDataBuss[TablesColumnFile.miscpemp] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].miscpemp);
      mapDataBuss[TablesColumnFile.mrankofemp] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mrankofemp);
      mapDataBuss[TablesColumnFile.misprimarysrcincome] = Constant.ifNullCheck(
          customerListBean.customerBusinessDetailsBean[busDetList].misprimarysrcincome);
      mapDataBuss[TablesColumnFile.mcompanyname] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mcompanyname);
      mapDataBuss[TablesColumnFile.mbussstatus] =
          Constant.ifNullCheck(customerListBean.customerBusinessDetailsBean[busDetList].mbussstatus);
      busDetsList.add(mapDataBuss);
    }

    var mapDataAsset;
    var assetDetailList = List();

    if(customerListBean.assetDetailsList!=null) {
      for (int assetDetList = 0;
      assetDetList < customerListBean.assetDetailsList.length;
      assetDetList++) {
        mapDataAsset = new Map();

        mapDataAsset[TablesColumnFile.mcustno] =
        customerListBean.assetDetailsList[assetDetList].mcustno != null
            ? customerListBean.assetDetailsList[assetDetList].mcustno
            : 0.0;
        mapDataAsset[TablesColumnFile.mitem] =
        customerListBean.assetDetailsList[assetDetList].mitem != null
            ? customerListBean.assetDetailsList[assetDetList].mitem
            : 0.0;
        assetDetailList.add(mapDataAsset);
      }
    }
    var mapDataFixedAssets = new Map();
    if (customerListBean.fixedAssetsList != null) {

      mapDataFixedAssets[TablesColumnFile.mland] =
      customerListBean.fixedAssetsList.mland != null ? customerListBean.fixedAssetsList.mland : 0.0;
      mapDataFixedAssets[TablesColumnFile.mlandpresentamt] =
      customerListBean.fixedAssetsList.mlandpresentamt != null
          ? customerListBean.fixedAssetsList.mlandpresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mlandnextmonthamount] =
      customerListBean.fixedAssetsList.mlandnextmonthamount != null
          ? customerListBean.fixedAssetsList.mlandnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.mbuildng] =
      customerListBean.fixedAssetsList.mbuildng != null ? customerListBean.fixedAssetsList.mbuildng : 0.0;
      mapDataFixedAssets[TablesColumnFile.mbuildngpresentamt] =
      customerListBean.fixedAssetsList.mbuildngpresentamt != null
          ? customerListBean.fixedAssetsList.mbuildngpresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mbuildngnextmonthamount] =
      customerListBean.fixedAssetsList.mbuildngnextmonthamount != null
          ? customerListBean.fixedAssetsList.mbuildngnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.mmachnryorequp] =
      customerListBean.fixedAssetsList.mmachnryorequp != null
          ? customerListBean.fixedAssetsList.mmachnryorequp
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mmachnryorequppresentamt] =
      customerListBean.fixedAssetsList.mmachnryorequppresentamt != null
          ? customerListBean.fixedAssetsList.mmachnryorequppresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mmachnryorequpnextmonthamount] =
      customerListBean.fixedAssetsList.mmachnryorequpnextmonthamount != null
          ? customerListBean.fixedAssetsList.mmachnryorequpnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.mmeansandtransprt] =
      customerListBean.fixedAssetsList.mmeansandtransprt != null
          ? customerListBean.fixedAssetsList.mmeansandtransprt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mmeansandtransprtpresentamt] =
      customerListBean.fixedAssetsList.mmeansandtransprtpresentamt != null
          ? customerListBean.fixedAssetsList.mmeansandtransprtpresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mmeansandtransprtnextmonthamount] =
      customerListBean.fixedAssetsList.mmeansandtransprtnextmonthamount != null
          ? customerListBean.fixedAssetsList.mmeansandtransprtnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.mothrs] =
      customerListBean.fixedAssetsList.mothrs != null ? customerListBean.fixedAssetsList.mothrs : 0.0;
      mapDataFixedAssets[TablesColumnFile.mothrspresentamt] =
      customerListBean.fixedAssetsList.mothrspresentamt != null
          ? customerListBean.fixedAssetsList.mothrspresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.mothrsnextmonthamount] =
      customerListBean.fixedAssetsList.mothrsnextmonthamount != null
          ? customerListBean.fixedAssetsList.mothrsnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.msumpresentamt] =
      customerListBean.fixedAssetsList.msumpresentamt != null
          ? customerListBean.fixedAssetsList.msumpresentamt
          : 0.0;
      mapDataFixedAssets[TablesColumnFile.msumnextmonthamount] =
      customerListBean.fixedAssetsList.msumnextmonthamount != null
          ? customerListBean.fixedAssetsList.msumnextmonthamount
          : 0.0;

      mapDataFixedAssets[TablesColumnFile.mfromdate] =
      customerListBean.fixedAssetsList.mfromdate != null
          ? customerListBean.fixedAssetsList.mfromdate.toIso8601String()
          : null;
      mapDataFixedAssets[TablesColumnFile.mtodate] =
      customerListBean.fixedAssetsList.mtodate != null
          ? customerListBean.fixedAssetsList.mtodate.toIso8601String()
          : null;
    }

    var mapDataCurrentAssets = new Map();
    if (customerListBean.currentAssetsList != null) {
      mapDataCurrentAssets[TablesColumnFile.tcurrentassetrefno] =

      mapDataCurrentAssets[TablesColumnFile.mcash] =
      customerListBean.currentAssetsList.mcash != null ? customerListBean.currentAssetsList.mcash : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mcashpresentamt] =
      customerListBean.currentAssetsList.mcashpresentamt != null
          ? customerListBean.currentAssetsList.mcashpresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mcashnextmonthamount] =
      customerListBean.currentAssetsList.mcashnextmonthamount != null
          ? customerListBean.currentAssetsList.mcashnextmonthamount
          : 0.0;

      mapDataCurrentAssets[TablesColumnFile.maccntrecvbl] =
      customerListBean.currentAssetsList.maccntrecvbl != null
          ? customerListBean.currentAssetsList.maccntrecvbl
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.maccntrecvblpresentamt] =
      customerListBean.currentAssetsList.maccntrecvblpresentamt != null
          ? customerListBean.currentAssetsList.maccntrecvblpresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.maccntrecvblnextmonthamount] =
      customerListBean.currentAssetsList.maccntrecvblnextmonthamount != null
          ? customerListBean.currentAssetsList.maccntrecvblnextmonthamount
          : 0.0;

      mapDataCurrentAssets[TablesColumnFile.minventry] =
      customerListBean.currentAssetsList.minventry != null ? customerListBean.currentAssetsList.minventry : 0.0;
      mapDataCurrentAssets[TablesColumnFile.minventrypresentamt] =
      customerListBean.currentAssetsList.minventrypresentamt != null
          ? customerListBean.currentAssetsList.minventrypresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.minventrynextmonthamount] =
      customerListBean.currentAssetsList.minventrynextmonthamount != null
          ? customerListBean.currentAssetsList.minventrynextmonthamount
          : 0.0;

      mapDataCurrentAssets[TablesColumnFile.mprepaid] =
      customerListBean.currentAssetsList.mprepaid != null ? customerListBean.currentAssetsList.mprepaid : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mprepaidpresentamt] =
      customerListBean.currentAssetsList.mprepaidpresentamt != null
          ? customerListBean.currentAssetsList.mprepaidpresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mprepaidnextmonthamount] =
      customerListBean.currentAssetsList.mprepaidnextmonthamount != null
          ? customerListBean.currentAssetsList.mprepaidnextmonthamount
          : 0.0;

      mapDataCurrentAssets[TablesColumnFile.mothrs] =
      customerListBean.currentAssetsList.mothrs != null ? customerListBean.currentAssetsList.mothrs : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mothrspresentamt] =
      customerListBean.currentAssetsList.mothrspresentamt != null
          ? customerListBean.currentAssetsList.mothrspresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.mothrsnextmonthamount] =
      customerListBean.currentAssetsList.mothrsnextmonthamount != null
          ? customerListBean.currentAssetsList.mothrsnextmonthamount
          : 0.0;

      mapDataCurrentAssets[TablesColumnFile.msumpresentamt] =
      customerListBean.currentAssetsList.msumpresentamt != null
          ? customerListBean.currentAssetsList.msumpresentamt
          : 0.0;
      mapDataCurrentAssets[TablesColumnFile.msumnextmonthamount] =
      customerListBean.currentAssetsList.msumnextmonthamount != null
          ? customerListBean.currentAssetsList.msumnextmonthamount
          : 0.0;
    }

    var mapDatalongTermLiabilities = new Map();
    if (customerListBean.longTermLiabilitiesList != null) {


      mapDatalongTermLiabilities[TablesColumnFile.mcash] =
      customerListBean.longTermLiabilitiesList.mcash != null
          ? customerListBean.longTermLiabilitiesList.mcash
          : 0.0;
      mapDatalongTermLiabilities[TablesColumnFile.mcashpresentamt] =
      customerListBean.longTermLiabilitiesList.mcashpresentamt != null
          ? customerListBean.longTermLiabilitiesList.mcashpresentamt
          : 0.0;
      mapDatalongTermLiabilities[TablesColumnFile.mcashnextmonthamount] =
      customerListBean.longTermLiabilitiesList.mcashnextmonthamount != null
          ? customerListBean.longTermLiabilitiesList.mcashnextmonthamount
          : 0.0;

      mapDatalongTermLiabilities[TablesColumnFile.maccntrecvbl] =
      customerListBean.longTermLiabilitiesList.maccntrecvbl != null
          ? customerListBean.longTermLiabilitiesList.maccntrecvbl
          : 0.0;
      mapDatalongTermLiabilities[TablesColumnFile.maccntrecvblpresentamt] =
      customerListBean.longTermLiabilitiesList.maccntrecvblpresentamt != null
          ? customerListBean.longTermLiabilitiesList.maccntrecvblpresentamt
          : 0.0;
      mapDatalongTermLiabilities[TablesColumnFile.maccntrecvblnextmonthamount] =
      customerListBean.longTermLiabilitiesList.maccntrecvblnextmonthamount != null
          ? customerListBean.longTermLiabilitiesList.maccntrecvblnextmonthamount
          : 0.0;

      mapDatalongTermLiabilities[TablesColumnFile.msumpresentamt] =
      customerListBean.longTermLiabilitiesList.msumpresentamt != null
          ? customerListBean.longTermLiabilitiesList.msumpresentamt
          : 0.0;
      mapDatalongTermLiabilities[TablesColumnFile.msumnextmonthamount] =
      customerListBean.longTermLiabilitiesList.msumnextmonthamount != null
          ? customerListBean.longTermLiabilitiesList.msumnextmonthamount
          : 0.0;
    }

    var mapDatashortTermLiabilities = new Map();
    if (customerListBean.shortTermLiabilitiesList != null) {
      mapDatashortTermLiabilities[TablesColumnFile.tshrttrmliabiltyrefno] =

      mapDatashortTermLiabilities[TablesColumnFile.mcash] =
      customerListBean.shortTermLiabilitiesList.mcash != null
          ? customerListBean.shortTermLiabilitiesList.mcash
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mcashpresentamt] =
      customerListBean.shortTermLiabilitiesList.mcashpresentamt != null
          ? customerListBean.shortTermLiabilitiesList.mcashpresentamt
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mcashnextmonthamount] =
      customerListBean.shortTermLiabilitiesList.mcashnextmonthamount != null
          ? customerListBean.shortTermLiabilitiesList.mcashnextmonthamount
          : 0.0;

      mapDatashortTermLiabilities[TablesColumnFile.maccntrecvbl] =
      customerListBean.shortTermLiabilitiesList.maccntrecvbl != null
          ? customerListBean.shortTermLiabilitiesList.maccntrecvbl
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.maccntrecvblpresentamt] =
      customerListBean.shortTermLiabilitiesList.maccntrecvblpresentamt != null
          ? customerListBean.shortTermLiabilitiesList.maccntrecvblpresentamt
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.maccntrecvblnextmonthamount] =
      customerListBean.shortTermLiabilitiesList.maccntrecvblnextmonthamount != null
          ? customerListBean.shortTermLiabilitiesList.maccntrecvblnextmonthamount
          : 0.0;

      mapDatashortTermLiabilities[TablesColumnFile.mfield3] =
      customerListBean.shortTermLiabilitiesList.mfield3 != null
          ? customerListBean.shortTermLiabilitiesList.mfield3
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mfield3presentamt] =
      customerListBean.shortTermLiabilitiesList.mfield3presentamt != null
          ? customerListBean.shortTermLiabilitiesList.mfield3presentamt
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mfield3nextmonthamount] =
      customerListBean.shortTermLiabilitiesList.mfield3nextmonthamount != null
          ? customerListBean.shortTermLiabilitiesList.mfield3nextmonthamount
          : 0.0;

      mapDatashortTermLiabilities[TablesColumnFile.mfield4] =
      customerListBean.shortTermLiabilitiesList.mfield4 != null
          ? customerListBean.shortTermLiabilitiesList.mfield4
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mfield4presentamt] =
      customerListBean.shortTermLiabilitiesList.mfield4presentamt != null
          ? customerListBean.shortTermLiabilitiesList.mfield4presentamt
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.mfield4nextmonthamount] =
      customerListBean.shortTermLiabilitiesList.mfield4nextmonthamount != null
          ? customerListBean.shortTermLiabilitiesList.mfield4nextmonthamount
          : 0.0;

      mapDatashortTermLiabilities[TablesColumnFile.msumpresentamt] =
      customerListBean.shortTermLiabilitiesList.msumpresentamt != null
          ? customerListBean.shortTermLiabilitiesList.msumpresentamt
          : 0.0;
      mapDatashortTermLiabilities[TablesColumnFile.msumnextmonthamount] =
      customerListBean.shortTermLiabilitiesList.msumnextmonthamount != null
          ? customerListBean.shortTermLiabilitiesList.msumnextmonthamount
          : 0.0;
    }

    var mapDataEquity = new Map();
    if (customerListBean.equityList != null) {

      mapDataEquity[TablesColumnFile.mcash] =
      customerListBean.equityList.mcash != null ? customerListBean.equityList.mcash : 0;
      mapDataEquity[TablesColumnFile.mcashpresentamt] =
      customerListBean.equityList.mcashpresentamt != null ? customerListBean.equityList.mcashpresentamt : 0.0;
      mapDataEquity[TablesColumnFile.mcashnextmonthamount] =
      customerListBean.equityList.mcashnextmonthamount != null
          ? customerListBean.equityList.mcashnextmonthamount
          : 0.0;

      mapDataEquity[TablesColumnFile.maccntrecvbl] =
      customerListBean.equityList.maccntrecvbl != null ? customerListBean.equityList.maccntrecvbl : 0.0;
      mapDataEquity[TablesColumnFile.maccntrecvblpresentamt] =
      customerListBean.equityList.maccntrecvblpresentamt != null
          ? customerListBean.equityList.maccntrecvblpresentamt
          : 0.0;
      mapDataEquity[TablesColumnFile.maccntrecvblnextmonthamount] =
      customerListBean.equityList.maccntrecvblnextmonthamount != null
          ? customerListBean.equityList.maccntrecvblnextmonthamount
          : 0.0;

      mapDataEquity[TablesColumnFile.msumpresentamt] =
      customerListBean.equityList.msumpresentamt != null ? customerListBean.equityList.msumpresentamt : 0.0;
      mapDataEquity[TablesColumnFile.msumnextmonthamount] =
      customerListBean.equityList.msumnextmonthamount != null
          ? customerListBean.equityList.msumnextmonthamount
          : 0.0;
    }

    //ends here this

    var mapDataIncmSt = new Map();
    if (customerListBean.incomeStatementList != null) {

      mapDataIncmSt[TablesColumnFile.mcustno] =
      customerListBean.incomeStatementList.mcustno != null ? customerListBean.incomeStatementList.mcustno : 0;
      mapDataIncmSt[TablesColumnFile.mtotalrevenuep] =
      customerListBean.incomeStatementList.mtotalrevenuep != null
          ? customerListBean.incomeStatementList.mtotalrevenuep
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mtotalrevenuenm] =
      customerListBean.incomeStatementList.mtotalrevenuenm != null
          ? customerListBean.incomeStatementList.mtotalrevenuenm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgrossprofitfirstp] =
      customerListBean.incomeStatementList.mgrossprofitfirstp != null
          ? customerListBean.incomeStatementList.mgrossprofitfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgrossprofitfirstnm] =
      customerListBean.incomeStatementList.mgrossprofitfirstnm != null
          ? customerListBean.incomeStatementList.mgrossprofitfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mrevenuefirstp] =
      customerListBean.incomeStatementList.mrevenuefirstp != null
          ? customerListBean.incomeStatementList.mrevenuefirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mrevenuefirstnm] =
      customerListBean.incomeStatementList.mrevenuefirstnm != null
          ? customerListBean.incomeStatementList.mrevenuefirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgoodcostfirstp] =
      customerListBean.incomeStatementList.mgoodcostfirstp != null
          ? customerListBean.incomeStatementList.mgoodcostfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgoodcostfirstnm] =
      customerListBean.incomeStatementList.mgoodcostfirstnm != null
          ? customerListBean.incomeStatementList.mgoodcostfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgrossprofitsecondp] =
      customerListBean.incomeStatementList.mgrossprofitsecondp != null
          ? customerListBean.incomeStatementList.mgrossprofitsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgrossprofitsecondnm] =
      customerListBean.incomeStatementList.mgrossprofitsecondnm != null
          ? customerListBean.incomeStatementList.mgrossprofitsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mrevenuesecondp] =
      customerListBean.incomeStatementList.mrevenuesecondp != null
          ? customerListBean.incomeStatementList.mrevenuesecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mrevenuesecondnm] =
      customerListBean.incomeStatementList.mrevenuesecondnm != null
          ? customerListBean.incomeStatementList.mrevenuesecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgoodcostsecondp] =
      customerListBean.incomeStatementList.mgoodcostsecondp != null
          ? customerListBean.incomeStatementList.mgoodcostsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgoodcostsecondnm] =
      customerListBean.incomeStatementList.mgoodcostsecondnm != null
          ? customerListBean.incomeStatementList.mgoodcostsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherrevenuep] =
      customerListBean.incomeStatementList.motherrevenuep != null
          ? customerListBean.incomeStatementList.motherrevenuep
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherrevenuenm] =
      customerListBean.incomeStatementList.motherrevenuenm != null
          ? customerListBean.incomeStatementList.motherrevenuenm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mtotalopexpp] =
      customerListBean.incomeStatementList.mtotalopexpp != null
          ? customerListBean.incomeStatementList.mtotalopexpp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mtotalopexpnm] =
      customerListBean.incomeStatementList.mtotalopexpnm != null
          ? customerListBean.incomeStatementList.mtotalopexpnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mopexpfirstp] =
      customerListBean.incomeStatementList.mopexpfirstp != null
          ? customerListBean.incomeStatementList.mopexpfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mopexpfirstnm] =
      customerListBean.incomeStatementList.mopexpfirstnm != null
          ? customerListBean.incomeStatementList.mopexpfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mpersonalexpfirstp] =
      customerListBean.incomeStatementList.mpersonalexpfirstp != null
          ? customerListBean.incomeStatementList.mpersonalexpfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mpersonalexpfirstnm] =
      customerListBean.incomeStatementList.mpersonalexpfirstnm != null
          ? customerListBean.incomeStatementList.mpersonalexpfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgeneralexpfirstp] =
      customerListBean.incomeStatementList.mgeneralexpfirstp != null
          ? customerListBean.incomeStatementList.mgeneralexpfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgeneralexpfirstnm] =
      customerListBean.incomeStatementList.mgeneralexpfirstnm != null
          ? customerListBean.incomeStatementList.mgeneralexpfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherexpfirstp] =
      customerListBean.incomeStatementList.motherexpfirstp != null
          ? customerListBean.incomeStatementList.motherexpfirstp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherexpfirstnm] =
      customerListBean.incomeStatementList.motherexpfirstnm != null
          ? customerListBean.incomeStatementList.motherexpfirstnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mopexpsecondp] =
      customerListBean.incomeStatementList.mopexpsecondp != null
          ? customerListBean.incomeStatementList.mopexpsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mopexpsecondnm] =
      customerListBean.incomeStatementList.mopexpsecondnm != null
          ? customerListBean.incomeStatementList.mopexpsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mpersonalexpsecondp] =
      customerListBean.incomeStatementList.mpersonalexpsecondp != null
          ? customerListBean.incomeStatementList.mpersonalexpsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mpersonalexpsecondnm] =
      customerListBean.incomeStatementList.mpersonalexpsecondnm != null
          ? customerListBean.incomeStatementList.mpersonalexpsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgeneralexpsecondp] =
      customerListBean.incomeStatementList.mgeneralexpsecondp != null
          ? customerListBean.incomeStatementList.mgeneralexpsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mgeneralexpsecondnm] =
      customerListBean.incomeStatementList.mgeneralexpsecondnm != null
          ? customerListBean.incomeStatementList.mgeneralexpsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherexpsecondp] =
      customerListBean.incomeStatementList.motherexpsecondp != null
          ? customerListBean.incomeStatementList.motherexpsecondp
          : 0.0;
      mapDataIncmSt[TablesColumnFile.motherexpsecondnm] =
      customerListBean.incomeStatementList.motherexpsecondnm != null
          ? customerListBean.incomeStatementList.motherexpsecondnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mtaxexpp] =
      customerListBean.incomeStatementList.mtaxexpp != null ? customerListBean.incomeStatementList.mtaxexpp : 0.0;
      mapDataIncmSt[TablesColumnFile.mtaxexpnm] =
      customerListBean.incomeStatementList.mtaxexpnm != null
          ? customerListBean.incomeStatementList.mtaxexpnm
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mnetincomep] =
      customerListBean.incomeStatementList.mnetincomep != null
          ? customerListBean.incomeStatementList.mnetincomep
          : 0.0;
      mapDataIncmSt[TablesColumnFile.mnetincomenm] =
      customerListBean.incomeStatementList.mnetincomenm != null
          ? customerListBean.incomeStatementList.mnetincomenm
          : 0.0;

      mapDataIncmSt[TablesColumnFile.mfromdate] =
      customerListBean.incomeStatementList.mfromdate != null
          ? customerListBean.incomeStatementList.mfromdate.toIso8601String()
          : null;
      mapDataIncmSt[TablesColumnFile.mtodate] =
      customerListBean.incomeStatementList.mtodate != null
          ? customerListBean.incomeStatementList.mtodate.toIso8601String()
          : null;
    }

    var mapDataFinSt = new Map();
    if (customerListBean.financialStmntList != null) {

      mapDataFinSt[TablesColumnFile.mcustno] =
      customerListBean.financialStmntList.mcustno != null ? customerListBean.financialStmntList.mcustno : 0;
      mapDataFinSt[TablesColumnFile.mgrossprofitmargin] =
      customerListBean.financialStmntList.mgrossprofitmargin != null
          ? customerListBean.financialStmntList.mgrossprofitmargin
          : 0.0;
      mapDataFinSt[TablesColumnFile.mcurrentratio] =
      customerListBean.financialStmntList.mcurrentratio != null
          ? customerListBean.financialStmntList.mcurrentratio
          : 0.0;
      mapDataFinSt[TablesColumnFile.mdebtratio] =
      customerListBean.financialStmntList.mdebtratio != null
          ? customerListBean.financialStmntList.mdebtratio
          : 0.0;
      mapDataFinSt[TablesColumnFile.mtotcurasset] =
      customerListBean.financialStmntList.mtotcurasset != null
          ? customerListBean.financialStmntList.mtotcurasset
          : 0.0;
      mapDataFinSt[TablesColumnFile.mtotcurliabilities] =
      customerListBean.financialStmntList.mtotcurliabilities != null
          ? customerListBean.financialStmntList.mtotcurliabilities
          : 0.0;
      mapDataFinSt[TablesColumnFile.mworkngcapital] =
      customerListBean.financialStmntList.mworkngcapital != null
          ? customerListBean.financialStmntList.mworkngcapital
          : 0.0;
      mapDataFinSt[TablesColumnFile.mavginventory] =
      customerListBean.financialStmntList.mavginventory != null
          ? customerListBean.financialStmntList.mavginventory
          : 0.0;
      mapDataFinSt[TablesColumnFile.mavgaccreceivables] =
      customerListBean.financialStmntList.mavgaccreceivables != null
          ? customerListBean.financialStmntList.mavgaccreceivables
          : 0.0;
      mapDataFinSt[TablesColumnFile.mavgaccpayables] =
      customerListBean.financialStmntList.mavgaccpayables != null
          ? customerListBean.financialStmntList.mavgaccpayables
          : 0.0;
      mapDataFinSt[TablesColumnFile.mcogs] =
      customerListBean.financialStmntList.mcogs != null ? customerListBean.financialStmntList.mcogs : 0.0;
      mapDataFinSt[TablesColumnFile.msales] =
      customerListBean.financialStmntList.msales != null ? customerListBean.financialStmntList.msales : 0.0;
      mapDataFinSt[TablesColumnFile.mpurchases] =
      customerListBean.financialStmntList.mpurchases != null
          ? customerListBean.financialStmntList.mpurchases
          : 0.0;
      mapDataFinSt[TablesColumnFile.minvconperiod] =
      customerListBean.financialStmntList.minvconperiod != null
          ? customerListBean.financialStmntList.minvconperiod
          : 0.0;
      mapDataFinSt[TablesColumnFile.mrecconperiod] =
      customerListBean.financialStmntList.mrecconperiod != null
          ? customerListBean.financialStmntList.mrecconperiod
          : 0.0;
      mapDataFinSt[TablesColumnFile.mpayconperiod] =
      customerListBean.financialStmntList.mpayconperiod != null
          ? customerListBean.financialStmntList.mpayconperiod
          : 0.0;
      mapDataFinSt[TablesColumnFile.mworkngcapitalcycle] =
      customerListBean.financialStmntList.mworkngcapitalcycle != null
          ? customerListBean.financialStmntList.mworkngcapitalcycle
          : 0.0;
    }

    var mapDataTotlExpndtr = new Map();
    if (customerListBean.totalExpenditureDetailsBean != null) {

      mapDataTotlExpndtr[TablesColumnFile.mcustno] =
      customerListBean.totalExpenditureDetailsBean.mcustno != null
          ? customerListBean.totalExpenditureDetailsBean.mcustno
          : 0;
      mapDataTotlExpndtr[TablesColumnFile.mlivngexpns] =
      customerListBean.totalExpenditureDetailsBean.mlivngexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mlivngexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mtotlcommexpns] =
      customerListBean.totalExpenditureDetailsBean.mtotlcommexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mtotlcommexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.meduexpns] =
      customerListBean.totalExpenditureDetailsBean.meduexpns != null
          ? customerListBean.totalExpenditureDetailsBean.meduexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mmedexpns] =
      customerListBean.totalExpenditureDetailsBean.mmedexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mmedexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mtotlfamexpns] =
      customerListBean.totalExpenditureDetailsBean.mtotlfamexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mtotlfamexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mloanservexpns] =
      customerListBean.totalExpenditureDetailsBean.mloanservexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mloanservexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mcredcrdexpns] =
      customerListBean.totalExpenditureDetailsBean.mcredcrdexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mcredcrdexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mrntlexpns] =
      customerListBean.totalExpenditureDetailsBean.mrntlexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mrntlexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mlghtwtrexpns] =
      customerListBean.totalExpenditureDetailsBean.mlghtwtrexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mlghtwtrexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mvechtrnsprtexpns] =
      customerListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mothrexpns] =
      customerListBean.totalExpenditureDetailsBean.mothrexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mothrexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mothrdebtrepymntexpns] =
      customerListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns
          : 0.0;
      mapDataTotlExpndtr[TablesColumnFile.mtotldebtexpns] =
      customerListBean.totalExpenditureDetailsBean.mtotldebtexpns != null
          ? customerListBean.totalExpenditureDetailsBean.mtotldebtexpns
          : 0.0;
    }
    var mapDataImg;

//-----------------------ESMS JSON MAPPING---------------------------------------------
    var mapESMS = new Map();
    if (customerListBean.esmsentity != null) {
      mapESMS[TablesColumnFile.tesmsrefno] =
      mapESMS[TablesColumnFile.mexclistchecked] =
          Constant.ifNullCheck(customerListBean.esmsentity.mexclistchecked);
      mapESMS[TablesColumnFile.misbrwrinlist] =
          Constant.ifNullCheck(customerListBean.esmsentity.misbrwrinlist);
      mapESMS[TablesColumnFile.mnontrgtcust] =
          Constant.ifNullCheck(customerListBean.esmsentity.mnontrgtcust);
      mapESMS[TablesColumnFile.misbrwrinnontrgt] =
          Constant.ifNullCheck(customerListBean.esmsentity.misbrwrinnontrgt);
      mapESMS[TablesColumnFile.mairemssn] = Constant.ifNullCheck(customerListBean.esmsentity.mairemssn);
      mapESMS[TablesColumnFile.maeapplglrequire] =
          Constant.ifNullCheck(customerListBean.esmsentity.maeapplglrequire);
      mapESMS[TablesColumnFile.maecmplncstatus] =
          Constant.ifNullCheck(customerListBean.esmsentity.maecmplncstatus);
      mapESMS[TablesColumnFile.maeevediance] =
          Constant.ifNullCheck(customerListBean.esmsentity.maeevediance);
      mapESMS[TablesColumnFile.mwastewater] = Constant.ifNullCheck(customerListBean.esmsentity.mwastewater);
      mapESMS[TablesColumnFile.mwwapplglrequire] =
          Constant.ifNullCheck(customerListBean.esmsentity.mwwapplglrequire);
      mapESMS[TablesColumnFile.mwwcmplncstatus] =
          Constant.ifNullCheck(customerListBean.esmsentity.mwwcmplncstatus);
      mapESMS[TablesColumnFile.mwwevediance] =
          Constant.ifNullCheck(customerListBean.esmsentity.mwwevediance);
      mapESMS[TablesColumnFile.msolidnhrdauswaste] =
          Constant.ifNullCheck(customerListBean.esmsentity.msolidnhrdauswaste);
      mapESMS[TablesColumnFile.mshapplglrequire] =
          Constant.ifNullCheck(customerListBean.esmsentity.mshapplglrequire);
      mapESMS[TablesColumnFile.mshcmplncstatus] =
          Constant.ifNullCheck(customerListBean.esmsentity.mshcmplncstatus);
      mapESMS[TablesColumnFile.mshevediance] =
          Constant.ifNullCheck(customerListBean.esmsentity.mshevediance);
      mapESMS[TablesColumnFile.mhrdzchemnfule] =
          Constant.ifNullCheck(customerListBean.esmsentity.mhrdzchemnfule);
      mapESMS[TablesColumnFile.mhcapplglrequire] =
          Constant.ifNullCheck(customerListBean.esmsentity.mhcapplglrequire);
      mapESMS[TablesColumnFile.mhccmplncstatus] =
          Constant.ifNullCheck(customerListBean.esmsentity.mhccmplncstatus);
      mapESMS[TablesColumnFile.mhcevediance] =
          Constant.ifNullCheck(customerListBean.esmsentity.mhcevediance);
      mapESMS[TablesColumnFile.mrescnsmpt] = Constant.ifNullCheck(customerListBean.esmsentity.mrescnsmpt);
      mapESMS[TablesColumnFile.mnuisance] = Constant.ifNullCheck(customerListBean.esmsentity.mnuisance);

      mapESMS[TablesColumnFile.mdust] = Constant.ifBoolNullCheck(customerListBean.esmsentity.mdust);
      mapESMS[TablesColumnFile.mtrafficcongandobs] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mtrafficcongandobs);
      mapESMS[TablesColumnFile.mvibration] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mvibration);
      mapESMS[TablesColumnFile.mfumes] = Constant.ifBoolNullCheck(customerListBean.esmsentity.mfumes);
      mapESMS[TablesColumnFile.modours] = Constant.ifBoolNullCheck(customerListBean.esmsentity.modours);
      mapESMS[TablesColumnFile.mnoise] = Constant.ifBoolNullCheck(customerListBean.esmsentity.mnoise);
      mapESMS[TablesColumnFile.mnocomissue] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnocomissue);
      mapESMS[TablesColumnFile.mnodesigperson] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnodesigperson);
      mapESMS[TablesColumnFile.mdispandressetle] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mdispandressetle);
      mapESMS[TablesColumnFile.mlandacqreq] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mlandacqreq);
      mapESMS[TablesColumnFile.mnoissue] = Constant.ifBoolNullCheck(customerListBean.esmsentity.mnoissue);
      mapESMS[TablesColumnFile.marchimp] = Constant.ifBoolNullCheck(customerListBean.esmsentity.marchimp);
      mapESMS[TablesColumnFile.msiteofcultural] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.msiteofcultural);
      mapESMS[TablesColumnFile.mcomplaintsfromneig] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mcomplaintsfromneig);
      mapESMS[TablesColumnFile.mimpactofindgenous] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mimpactofindgenous);
      mapESMS[TablesColumnFile.mimpactonlocal] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mimpactonlocal);
      mapESMS[TablesColumnFile.mnorecognitionofemp] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnorecognitionofemp);
      mapESMS[TablesColumnFile.mlabourunion] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mlabourunion);
      mapESMS[TablesColumnFile.mnolabissue] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnolabissue);
      mapESMS[TablesColumnFile.mnopersonalprotectiveEquip] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnopersonalprotectiveEquip);
      mapESMS[TablesColumnFile.mnoprocessforemployees] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnoprocessforemployees);
      mapESMS[TablesColumnFile.mchildoffrcdlabour] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mchildoffrcdlabour);
      mapESMS[TablesColumnFile.mempblwminage] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mempblwminage);
      mapESMS[TablesColumnFile.mpayblwminwage] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mpayblwminwage);
      mapESMS[TablesColumnFile.munequalOpp] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.munequalOpp);
      mapESMS[TablesColumnFile.minadequatetermsofemp] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.minadequatetermsofemp);
      mapESMS[TablesColumnFile.minediquateworkingcond] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.minediquateworkingcond);
      mapESMS[TablesColumnFile.muinadequateemployeehealth] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.muinadequateemployeehealth);
      mapESMS[TablesColumnFile.mnontarget] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mnontarget);
      mapESMS[TablesColumnFile.mcategoryc] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mcategoryc);
      mapESMS[TablesColumnFile.mcategoryb] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mcategoryb);
      mapESMS[TablesColumnFile.mcategorya] =
          Constant.ifBoolNullCheck(customerListBean.esmsentity.mcategorya);
      mapESMS[TablesColumnFile.mcomntfrmoff] =
          Constant.ifNullCheck(customerListBean.esmsentity.mcomntfrmoff);
      mapESMS[TablesColumnFile.mdecision] = Constant.ifNullCheck(customerListBean.esmsentity.mdecision);
      mapESMS[TablesColumnFile.msign] = Constant.ifNullCheck(customerListBean.esmsentity.msign);
      mapESMS[TablesColumnFile.mnameofoff] = Constant.ifNullCheck(customerListBean.esmsentity.mnameofoff);
      mapESMS[TablesColumnFile.mdsitrequiretorefroff] =
          Constant.ifNullCheck(customerListBean.esmsentity.mdsitrequiretorefroff);
      mapESMS[TablesColumnFile.date] =
      customerListBean.esmsentity.date != null ? customerListBean.esmsentity.date.toIso8601String() : null;

      //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxESMS JSON MAPPINGxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    }

//-----------------------Risk JSON MAPPING---------------------------------------------
    var mapRiskRatings = new Map();
    if (customerListBean.riskratingsentity != null) {

      mapRiskRatings[TablesColumnFile.mcountryrisk] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mcountryrisk);
      mapRiskRatings[TablesColumnFile.mtypeofaccount] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mtypeofaccount);
      mapRiskRatings[TablesColumnFile.macctno] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.macctno);
      mapRiskRatings[TablesColumnFile.mcifno] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mcifno);
      mapRiskRatings[TablesColumnFile.mvisaperiod] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mvisaperiod);
      mapRiskRatings[TablesColumnFile.mvisavalid] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mvisavalid);
      mapRiskRatings[TablesColumnFile.mvisatype] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mvisatype);
      mapRiskRatings[TablesColumnFile.mnatureofbuss] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mnatureofbuss);
      mapRiskRatings[TablesColumnFile.mhwwsacctopn] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mhwwsacctopn);
      mapRiskRatings[TablesColumnFile.mnetwrth] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mnetwrth);
      mapRiskRatings[TablesColumnFile.mexpectedvalue] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mexpectedvalue);
      mapRiskRatings[TablesColumnFile.mnooftransmnthly] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mnooftransmnthly);
      mapRiskRatings[TablesColumnFile.mhighnetwrth] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mhighnetwrth);
      mapRiskRatings[TablesColumnFile.mprcdservrskque1] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.mprcdservrskque1);
      mapRiskRatings[TablesColumnFile.vmpurposeofacct] =
          Constant.ifNullCheck(customerListBean.riskratingsentity.vmpurposeofacct);
      //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxriSk Ratings JSON MAPPINGxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    }

    mapData[TablesColumnFile.familyDetails] = famiDetList;
    mapData[TablesColumnFile.bankDetails] = bankDetailList;
    mapData[TablesColumnFile.addressDetails] = addDetailsList;
    mapData[TablesColumnFile.borrowingDetails] = borrDetailsList;
    mapData[TablesColumnFile.assetDetailsList] = assetDetailList;

    mapData[TablesColumnFile.customerBussDetails] = busDetsList;
    mapData[TablesColumnFile.fixedAssetsList] = mapDataFixedAssets;
    mapData[TablesColumnFile.currentAssetsList] = mapDataCurrentAssets;
    mapData[TablesColumnFile.longTermLiabilitiesList] =
        mapDatalongTermLiabilities;
    mapData[TablesColumnFile.shortTermLiabilitiesList] =
        mapDatashortTermLiabilities;
    mapData[TablesColumnFile.equityList] = mapDataEquity;
    mapData[TablesColumnFile.incomeStatementList] = mapDataIncmSt;
    mapData[TablesColumnFile.financialStmntList] = mapDataFinSt;
    mapData[TablesColumnFile.totalExpenditureDetailsBean] = mapDataTotlExpndtr;
    mapData[TablesColumnFile.esmsentity] = mapESMS;
    mapData[TablesColumnFile.riskratingsentity] = mapRiskRatings;
    mapData["paymentDetailsDetails"] = List();
    return mapData;
  }
  factory CustomerListBean.fromCustomerJson(Map<String, dynamic> map,bool isFromMiddleware) {

    return CustomerListBean(
      UUID: map[TablesColumnFile.UUID] as String,
      mcustno: map[TablesColumnFile.mcustno] as int,
      mlbrcode: map[TablesColumnFile.mlbrcode] as int,
      mnametitle: map[TablesColumnFile.mnametitle] as String,
      mlongname: map[TablesColumnFile.mlongname] as String,
      mfathertitle: map[TablesColumnFile.mfathertitle] as String,
      mfatherfname: map[TablesColumnFile.mfatherfname] as String,
      mfathermname: map[TablesColumnFile.mfathermname] as String,
      mfatherlname: map[TablesColumnFile.mfatherlname] as String,
      mspousetitle: map[TablesColumnFile.mspousetitle] as String,
      mhusbandname: map[TablesColumnFile.mhusbandname] as String,
      mdob: (map[TablesColumnFile.mdob]=="null"||map[TablesColumnFile.mdob]==null)?null:DateTime.parse(map[TablesColumnFile.mdob]) as DateTime,
      mage: map[TablesColumnFile.mage] as int,
      mbankacno: map[TablesColumnFile.mbankacno] as String,
      mbankacyn: map[TablesColumnFile.mbankacyn] as String,
      mbankifsc: map[TablesColumnFile.mbankifsc] as String,
      mbanknamelk: map[TablesColumnFile.mbanknamelk] as String,
      mbankbranch: map[TablesColumnFile.mbankbranch] as String,
      mcuststatus: map[TablesColumnFile.mcuststatus] as int,
      mdropoutdate:  (map[TablesColumnFile.mdropoutdate]=="null"||map[TablesColumnFile.mdropoutdate]==null)?null:DateTime.parse(map[TablesColumnFile.mdropoutdate]) as DateTime,
      mmobno: map[TablesColumnFile.mmobno] as String,
      mpanno: map[TablesColumnFile.mpanno] as int,
      mpannodesc: map[TablesColumnFile.mpannodesc] as String,
      mtdsyn: map[TablesColumnFile.mtdsyn] as String,
      mtdsreasoncd: map[TablesColumnFile.mtdsreasoncd] as int,
      mtdsfrm15subdt:  (map[TablesColumnFile.mtdsfrm15subdt]=="null"||map[TablesColumnFile.mtdsfrm15subdt]==null)?null:DateTime.parse(map[TablesColumnFile.mtdsfrm15subdt]) as DateTime,
      memailId: map[TablesColumnFile.memailId] as String,
      mcustcategory: map[TablesColumnFile.mcustcategory] as String,
      mtier: map[TablesColumnFile.mtier] as int,
      mAdd1: map[TablesColumnFile.mAdd1] as String,
      mAdd2: map[TablesColumnFile.mAdd2] as String,
      mAdd3: map[TablesColumnFile.mAdd3] as String,
      mArea: map[TablesColumnFile.marea] as int,
      mPinCode: map[TablesColumnFile.mPinCode] as String,
      mCounCd: map[TablesColumnFile.mCounCd] as String,
      mCityCd: map[TablesColumnFile.mCityCd] as String,
      mfname: map[TablesColumnFile.mfname] as String,
      mmname: map[TablesColumnFile.mmname] as String,
      mlname: map[TablesColumnFile.mlname] as String,
      mgender: map[TablesColumnFile.mgender] as String,
      mrelegion: map[TablesColumnFile.mrelegion] as String,
     // mRuralUrban: map[TablesColumnFile.mRuralUrban] as String,
      mcaste: map[TablesColumnFile.mcaste] as String,
      mqualification: map[TablesColumnFile.mqualification] as String,
      moccupation: map[TablesColumnFile.moccupation] as int,
      mLandType: map[TablesColumnFile.mLandType] as String,
      mLandMeasurement: map[TablesColumnFile.mLandMeasurement] as String,
      mmaritialStatus: map[TablesColumnFile.mmaritialStatus] as int,
      mTypeOfId: map[TablesColumnFile.mTypeOfId] as int,
      mIdDesc: map[TablesColumnFile.mIdDesc] as String,
      mInsuranceCovYN: map[TablesColumnFile.mInsuranceCovYN] as String,
      mTypeofCoverage: map[TablesColumnFile.mTypeofCoverage] as int,

      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      missynctocoresys:(map[TablesColumnFile.missynctocoresys]=="null"||map[TablesColumnFile.missynctocoresys]==null)?0:map[TablesColumnFile.missynctocoresys] as int,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,


      ifYesThen:			map[TablesColumnFile.ifYesThen] as String,

      mShopName:			map[TablesColumnFile.mShopName] as String,
      mShpAdd:			map[TablesColumnFile.mShpAdd] as String,
      mYrsInBz:			map[TablesColumnFile.mYrsInBz] as int,
      mregNum:			map[TablesColumnFile.mregNum] as String,
      mHouse:			map[TablesColumnFile.mhouse] as String,
      mAgricultureType:			map[TablesColumnFile.mAgricultureType] as String,
      mIsMbrGrp:			map[TablesColumnFile.mIsMbrGrp] as int,
      mLoanAgreed:			map[TablesColumnFile.mLoanAgreed] as int,
      mGend:			map[TablesColumnFile.mGend] as int,
      mInsurance:			map[TablesColumnFile.mInsurance] as int,
      mConstruct:			map[TablesColumnFile.mConstruct] as int,
      mToilet:			map[TablesColumnFile.mToilet] as int,
      mhousBizSp:			map[TablesColumnFile.mhousBizSp] as int,
      mBzRegs:			map[TablesColumnFile.mBzRegs] as int,
      mBzTrnd:			map[TablesColumnFile.mBzTrnd] as int,
      misCbCheckDone:			map[TablesColumnFile.misCbCheckDone] as int,
      merrormessage:			map[TablesColumnFile.merrormessage] as String,
      mcentername : map[TablesColumnFile.mcentername] as String,
      mgroupname : map[TablesColumnFile.mgroupname] as String,
      mexpsramt : map[TablesColumnFile.mexpsramt] as double,
      mcbcheckrprtdt:(map[TablesColumnFile.mcbcheckrprtdt]=="null"||map[TablesColumnFile.mcbcheckrprtdt]==null)?null:DateTime.parse(map[TablesColumnFile.mcbcheckrprtdt]) as DateTime,
      // : map[TablesColumnFile.mcbcheckrprtdt] as DateTime,
      motpvrfdno:map[TablesColumnFile.motpvrfdno] as String,
      mhusdob:(map[TablesColumnFile.mhusdob]=="null"||map[TablesColumnFile.mhusdob]==null)?null:DateTime.parse(map[TablesColumnFile.mhusdob]) as DateTime,
      mprofileind : map[TablesColumnFile.mprofileind] as String,
      mlangofcust : map[TablesColumnFile.mlangofcust] as String,
      mmainoccupn : map[TablesColumnFile.mmainoccupn] as String,
      msuboccupn : map[TablesColumnFile.msuboccupn] as String,
      msecoccupatn : map[TablesColumnFile.msecoccupatn] as int,
      mmainoccupndesc : map[TablesColumnFile.mmainoccupndesc] as String,
      msuboccupndesc : map[TablesColumnFile.msuboccupndesc] as String,
      familyDetailsList:map[TablesColumnFile.familyDetails].map<FamilyDetailsBean>((i) =>
          FamilyDetailsBean.fromMap(i))
          .toList(),
      socialFinancialList:map[TablesColumnFile.bankDetails].map<SocialFinancialDetailsBean>((i) =>
          SocialFinancialDetailsBean.fromMap(i))
          .toList(),
      borrowingDetailsBean: map[TablesColumnFile.borrowingDetails].map<BorrowingDetailsBean>((i) => BorrowingDetailsBean.fromMap(i))
          .toList(),

      addressDetails : map[TablesColumnFile.addressDetails].map<AddressDetailsBean>((i) => AddressDetailsBean.fromMap(i))
          .toList(),
      customerBusinessDetailsBean: map[TablesColumnFile.customerBussDetails].map<CustomerBusinessDetailsBean>((i) => CustomerBusinessDetailsBean.fromMap(i))
          .toList(),

      assetDetailsList: map[TablesColumnFile.assetDetailsList].map<AssetDetailsBean>((i) => AssetDetailsBean.fromMap(i))
          .toList(),
      fixedAssetsList:map[TablesColumnFile.fixedAssetsList]==null?null:FixedAssetsBean.fromMapMiddleware(map[TablesColumnFile.fixedAssetsList]),
      currentAssetsList:map[TablesColumnFile.currentAssetsList]==null?null:CurrentAssetsBean.fromMapMiddleware(map[TablesColumnFile.currentAssetsList]),
      longTermLiabilitiesList:map[TablesColumnFile.longTermLiabilitiesList]==null?null:LongTermLiabilitiesBean.fromMapMiddleware(map[TablesColumnFile.longTermLiabilitiesList]),
      shortTermLiabilitiesList:map[TablesColumnFile.shortTermLiabilitiesList]==null?null:ShortTermLiabilitiesBean.fromMapMiddleware(map[TablesColumnFile.shortTermLiabilitiesList]),
      equityList:map[TablesColumnFile.equityList]==null?null:EquityBean.fromMapMiddleware(map[TablesColumnFile.equityList]),
      esmsentity: map[TablesColumnFile.esmsentity]==null?null:ESMSBean.fromMapMiddleware(map[TablesColumnFile.esmsentity]),
      riskratingsentity: map[TablesColumnFile.riskratingsentity]==null?null:RiskRatingsBean.fromMapMiddleware(map[TablesColumnFile.riskratingsentity]),
      incomeStatementList:map[TablesColumnFile.incomeStatementList]==null?null:IncomeStatementBean.fromMapMiddleware(map[TablesColumnFile.incomeStatementList]),
      financialStmntList:map[TablesColumnFile.financialStmntList]==null?null:FinancialStmntBean.fromMapMiddleware(map[TablesColumnFile.financialStmntList]),
      mnametitle2: map[TablesColumnFile.mnametitle2] as String,
      mlongname2: map[TablesColumnFile.mlongname2] as String,
      mfname2: map[TablesColumnFile.mfname2] as String,
      mmname2: map[TablesColumnFile.mmname2] as String,
      mlname2: map[TablesColumnFile.mlname2] as String,
      mnationality: map[TablesColumnFile.mnationality] as String,
      mid1issuedate: (map[TablesColumnFile.mid1issuedate]=="null"||map[TablesColumnFile.mid1issuedate]==null)?null:DateTime.parse(map[TablesColumnFile.mid1issuedate]) as DateTime,
      mid2issuedate: (map[TablesColumnFile.mid2issuedate]=="null"||map[TablesColumnFile.mid2issuedate]==null)?null:DateTime.parse(map[TablesColumnFile.mid2issuedate]) as DateTime,
      mid1expdate: (map[TablesColumnFile.mid1expdate]=="null"||map[TablesColumnFile.mid1expdate]==null)?null:DateTime.parse(map[TablesColumnFile.mid1expdate]) as DateTime,
      mid2expdate: (map[TablesColumnFile.mid2expdate]=="null"||map[TablesColumnFile.mid2expdate]==null)?null:DateTime.parse(map[TablesColumnFile.mid2expdate]) as DateTime,
      totalExpenditureDetailsBean:map[TablesColumnFile.totalExpenditureDetailsBean]==null?null:TotalExpenditureDetailsBean.fromMap(map[TablesColumnFile.totalExpenditureDetailsBean]),
      mid3issuedate: (map[TablesColumnFile.mid3issuedate]=="null"||map[TablesColumnFile.mid3issuedate]==null)?null:DateTime.parse(map[TablesColumnFile.mid3issuedate]) as DateTime,
      mid3expdate: (map[TablesColumnFile.mid3expdate]=="null"||map[TablesColumnFile.mid3expdate]==null)?null:DateTime.parse(map[TablesColumnFile.mid3expdate]) as DateTime,
      missngautryt1: map[TablesColumnFile.missngautryt1] as String,
      missngautryt2: map[TablesColumnFile.missngautryt2] as String,
      missngautryt3: map[TablesColumnFile.missngautryt3] as String,
      mtypeofid3: map[TablesColumnFile.mtypeofid3] as int,
      middesc3: map[TablesColumnFile.middesc3] as String,
      macctbal : map[TablesColumnFile.macctbal] as double,
      misearngmembr:map[TablesColumnFile.misearngmembr] as String,
      misstudyingmembr:map[TablesColumnFile.misstudyingmembr] as String,
      mmemberno: map[TablesColumnFile.mmemberno]as String,
      mischldrn: map[TablesColumnFile.mischldrn]as String,
      mbusinessname: map[TablesColumnFile.mbusinessname]as String,
      mtarget: map[TablesColumnFile.mtarget]as String,
      mownership: map[TablesColumnFile.mownership]as String,
      mresstatus: map[TablesColumnFile.mresstatus]as String,
      //mdedupnationalid: map[TablesColumnFile.mdedupnationalid]as String,
      miscpemp: map[TablesColumnFile.miscpemp]as String,
      mcusttype: map[TablesColumnFile.mcusttype]as String,

      mrankofemp: map[TablesColumnFile.mrankofemp]as String,
      mempid: map[TablesColumnFile.mempid]as String,
      mnameoforg:	map[TablesColumnFile.mnameoforg]as String,
      msnameoforg:	map[TablesColumnFile.msnameoforg]as String,
      morgtitle:	map[TablesColumnFile.morgtitle]as String,
      mnameoforgk:	map[TablesColumnFile.mnameoforgk]as String,
      msnameoforgk:	map[TablesColumnFile.msnameoforgk]as String,
      morgtitlek:	map[TablesColumnFile.morgtitlek]as String,
      mregno:	map[TablesColumnFile.mregno]as String,
      mregdatae: (map[TablesColumnFile.mregdatae]=="null"||map[TablesColumnFile.mregdatae]==null)?null:DateTime.parse(map[TablesColumnFile.mregdatae]) as DateTime,
      mtaxregno:	map[TablesColumnFile.mtaxregno]as String,
      mtaxregdatae: (map[TablesColumnFile.mtaxregdatae]=="null"||map[TablesColumnFile.mtaxregdatae]==null)?null:DateTime.parse(map[TablesColumnFile.mtaxregdatae]) as DateTime,
      mcomecoindicator:	map[TablesColumnFile.mcomecoindicator]as String,
      mnation:	map[TablesColumnFile.mnation]as String,
      mnationalid:	map[TablesColumnFile.mnationalid]as String,
      mregdob: (map[TablesColumnFile.mregdob]=="null"||map[TablesColumnFile.mregdob]==null)?null:DateTime.parse(map[TablesColumnFile.mregdob]) as DateTime,
      missuingauth:	map[TablesColumnFile.missuingauth]as String,
      mcomtype:	map[TablesColumnFile.mcomtype]as String,
      mdefalultlanguage:	map[TablesColumnFile.mdefalultlanguage]as String,
      mbusinesscommncmntdate: (map[TablesColumnFile.mbusinesscommncmntdate]=="null"||map[TablesColumnFile.mbusinesscommncmntdate]==null)?null:DateTime.parse(map[TablesColumnFile.mbusinesscommncmntdate]) as DateTime,
      mcompanystatus:	map[TablesColumnFile.mcompanystatus]as String,
      mregcountryname:	map[TablesColumnFile.mregcountryname]as String,
      mdefaultcurrency:	map[TablesColumnFile.mdefaultcurrency]as String,
      mbusinessdesc:	map[TablesColumnFile.mbusinessdesc]as String,

    );}
  factory CustomerListBean.fromMapMiddlewareDedup(Map<String, dynamic> map,bool isFromMiddleware) {
    return CustomerListBean(

      mfname: map[TablesColumnFile.mfname] as String,
      mmname: map[TablesColumnFile.mmname] as String,
      mlname: map[TablesColumnFile.mlname] as String,
      mcustno: map[TablesColumnFile.mcustno] as int,
      miscpemp: map[TablesColumnFile.miscpemp]as String,
      mrankofemp: map[TablesColumnFile.mrankofemp]as String,
      mempid: map[TablesColumnFile.mempid]as String,
      mcreatedby:map[TablesColumnFile.mcreatedby],
    );
  }
  factory CustomerListBean.fromMapV2(Map<String, dynamic> map) {
    final Map<String, dynamic> data  =  JSON.decode(map[TablesColumnFile.CUSTDATA]);


    return CustomerListBean(
      UUID: map[TablesColumnFile.UUID] as String,
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      missynctocoresys:(map[TablesColumnFile.missynctocoresys]=="null"||map[TablesColumnFile.missynctocoresys]==null)?0:map[TablesColumnFile.missynctocoresys] as int,

      mcustno: data[TablesColumnFile.mcustno] as int,
      mlbrcode: data[TablesColumnFile.mlbrcode] as int,
      mnametitle: data[TablesColumnFile.mnametitle] as String,
      mlongname: data[TablesColumnFile.mlongname] as String,
      mfathertitle: data[TablesColumnFile.mfathertitle] as String,
      mfatherfname: data[TablesColumnFile.mfatherfname] as String,
      mfathermname: data[TablesColumnFile.mfathermname] as String,
      mfatherlname: data[TablesColumnFile.mfatherlname] as String,
      mspousetitle: data[TablesColumnFile.mspousetitle] as String,
      mhusbandname: data[TablesColumnFile.mhusbandname] as String,
      mdob: (data[TablesColumnFile.mdob]=="null"||data[TablesColumnFile.mdob]==null)?null:DateTime.parse(data[TablesColumnFile.mdob]) as DateTime,
      mage: data[TablesColumnFile.mage] as int,
      mbankacno: data[TablesColumnFile.mbankacno] as String,
      mbankacyn: data[TablesColumnFile.mbankacyn] as String,
      mbankifsc: data[TablesColumnFile.mbankifsc] as String,
      mbanknamelk: data[TablesColumnFile.mbanknamelk] as String,
      mbankbranch: data[TablesColumnFile.mbankbranch] as String,
      mcuststatus: data[TablesColumnFile.mcuststatus] as int,
      mdropoutdate:  (data[TablesColumnFile.mdropoutdate]=="null"||data[TablesColumnFile.mdropoutdate]==null)?null:DateTime.parse(data[TablesColumnFile.mdropoutdate]) as DateTime,
      mmobno: data[TablesColumnFile.mmobno] as String,
      mpanno: data[TablesColumnFile.mpanno] as int,
      mpannodesc: data[TablesColumnFile.mpannodesc] as String,
      mtdsyn: data[TablesColumnFile.mtdsyn] as String,
      mtdsreasoncd: data[TablesColumnFile.mtdsreasoncd] as int,
      mtdsfrm15subdt:  (data[TablesColumnFile.mtdsfrm15subdt]=="null"||data[TablesColumnFile.mtdsfrm15subdt]==null)?null:DateTime.parse(data[TablesColumnFile.mtdsfrm15subdt]) as DateTime,
      memailId: data[TablesColumnFile.memailId] as String,
      mcustcategory: data[TablesColumnFile.mcustcategory] as String,
      mtier: data[TablesColumnFile.mtier] as int,
      mAdd1: data[TablesColumnFile.mAdd1] as String,
      mAdd2: data[TablesColumnFile.mAdd2] as String,
      mAdd3: data[TablesColumnFile.mAdd3] as String,
      mArea: data[TablesColumnFile.marea] as int,
      mPinCode: data[TablesColumnFile.mPinCode] as String,
      mCounCd: data[TablesColumnFile.mCounCd] as String,
      mCityCd: data[TablesColumnFile.mCityCd] as String,
      mfname: data[TablesColumnFile.mfname] as String,
      mmname: data[TablesColumnFile.mmname] as String,
      mlname: data[TablesColumnFile.mlname] as String,
      mgender: data[TablesColumnFile.mgender] as String,
      mrelegion: data[TablesColumnFile.mrelegion] as String,
      // mRuralUrban: data[TablesColumnFile.mRuralUrban] as String,
      mcaste: data[TablesColumnFile.mcaste] as String,
      mqualification: data[TablesColumnFile.mqualification] as String,
      moccupation: data[TablesColumnFile.moccupation] as int,
      mLandType: data[TablesColumnFile.mLandType] as String,
      mLandMeasurement: data[TablesColumnFile.mLandMeasurement] as String,
      mmaritialStatus: data[TablesColumnFile.mmaritialStatus] as int,
      mTypeOfId: data[TablesColumnFile.mTypeOfId] as int,
      mIdDesc: data[TablesColumnFile.mIdDesc] as String,
      mInsuranceCovYN: data[TablesColumnFile.mInsuranceCovYN] as String,
      mTypeofCoverage: data[TablesColumnFile.mTypeofCoverage] as int,

      mlastsynsdate:(data[TablesColumnFile.mlastsynsdate]=="null"||data[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(data[TablesColumnFile.mlastsynsdate]) as DateTime,


      ifYesThen:			data[TablesColumnFile.ifYesThen] as String,

      mShopName:			data[TablesColumnFile.mShopName] as String,
      mShpAdd:			data[TablesColumnFile.mShpAdd] as String,
      mYrsInBz:			data[TablesColumnFile.mYrsInBz] as int,
      mregNum:			data[TablesColumnFile.mregNum] as String,
      mHouse:			data[TablesColumnFile.mhouse] as String,
      mAgricultureType:			data[TablesColumnFile.mAgricultureType] as String,
      mIsMbrGrp:			data[TablesColumnFile.mIsMbrGrp] as int,
      mLoanAgreed:			data[TablesColumnFile.mLoanAgreed] as int,
      mGend:			data[TablesColumnFile.mGend] as int,
      mInsurance:			data[TablesColumnFile.mInsurance] as int,
      mConstruct:			data[TablesColumnFile.mConstruct] as int,
      mToilet:			data[TablesColumnFile.mToilet] as int,
      mhousBizSp:			data[TablesColumnFile.mhousBizSp] as int,
      mBzRegs:			data[TablesColumnFile.mBzRegs] as int,
      mBzTrnd:			data[TablesColumnFile.mBzTrnd] as int,
      misCbCheckDone:			data[TablesColumnFile.misCbCheckDone] as int,
      merrormessage:			data[TablesColumnFile.merrormessage] as String,
      mcentername : data[TablesColumnFile.mcentername] as String,
      mgroupname : data[TablesColumnFile.mgroupname] as String,
      mexpsramt : data[TablesColumnFile.mexpsramt] as double,
      mcbcheckrprtdt:(data[TablesColumnFile.mcbcheckrprtdt]=="null"||data[TablesColumnFile.mcbcheckrprtdt]==null)?null:DateTime.parse(data[TablesColumnFile.mcbcheckrprtdt]) as DateTime,
      // : data[TablesColumnFile.mcbcheckrprtdt] as DateTime,
      motpvrfdno:data[TablesColumnFile.motpvrfdno] as String,
      mhusdob:(data[TablesColumnFile.mhusdob]=="null"||data[TablesColumnFile.mhusdob]==null)?null:DateTime.parse(data[TablesColumnFile.mhusdob]) as DateTime,
      mprofileind : data[TablesColumnFile.mprofileind] as String,
      mlangofcust : data[TablesColumnFile.mlangofcust] as String,
      mmainoccupn : data[TablesColumnFile.mmainoccupn] as String,
      msuboccupn : data[TablesColumnFile.msuboccupn] as String,
      msecoccupatn : data[TablesColumnFile.msecoccupatn] as int,
      mmainoccupndesc : data[TablesColumnFile.mmainoccupndesc] as String,
      msuboccupndesc : data[TablesColumnFile.msuboccupndesc] as String,
      familyDetailsList:data[TablesColumnFile.familyDetails].map<FamilyDetailsBean>((i) =>
          FamilyDetailsBean.fromMap(i))
          .toList(),
      socialFinancialList:data[TablesColumnFile.bankDetails].map<SocialFinancialDetailsBean>((i) =>
          SocialFinancialDetailsBean.fromMap(i))
          .toList(),
      borrowingDetailsBean: data[TablesColumnFile.borrowingDetails].map<BorrowingDetailsBean>((i) => BorrowingDetailsBean.fromMap(i))
          .toList(),

      addressDetails : data[TablesColumnFile.addressDetails].map<AddressDetailsBean>((i) => AddressDetailsBean.fromMap(i))
          .toList(),
      customerBusinessDetailsBean: data[TablesColumnFile.customerBussDetails].map<CustomerBusinessDetailsBean>((i) => CustomerBusinessDetailsBean.fromMap(i))
          .toList(),

      assetDetailsList: data[TablesColumnFile.assetDetailsList].map<AssetDetailsBean>((i) => AssetDetailsBean.fromMap(i))
          .toList(),
      fixedAssetsList:data[TablesColumnFile.fixedAssetsList]==null?null:FixedAssetsBean.fromMapMiddleware(data[TablesColumnFile.fixedAssetsList]),
      currentAssetsList:data[TablesColumnFile.currentAssetsList]==null?null:CurrentAssetsBean.fromMapMiddleware(data[TablesColumnFile.currentAssetsList]),
      longTermLiabilitiesList:data[TablesColumnFile.longTermLiabilitiesList]==null?null:LongTermLiabilitiesBean.fromMapMiddleware(data[TablesColumnFile.longTermLiabilitiesList]),
      shortTermLiabilitiesList:data[TablesColumnFile.shortTermLiabilitiesList]==null?null:ShortTermLiabilitiesBean.fromMapMiddleware(data[TablesColumnFile.shortTermLiabilitiesList]),
      equityList:data[TablesColumnFile.equityList]==null?null:EquityBean.fromMapMiddleware(data[TablesColumnFile.equityList]),
      esmsentity: data[TablesColumnFile.esmsentity]==null?null:ESMSBean.fromMapMiddleware(data[TablesColumnFile.esmsentity]),
      riskratingsentity: data[TablesColumnFile.riskratingsentity]==null?null:RiskRatingsBean.fromMapMiddleware(data[TablesColumnFile.riskratingsentity]),
      incomeStatementList:data[TablesColumnFile.incomeStatementList]==null?null:IncomeStatementBean.fromMapMiddleware(data[TablesColumnFile.incomeStatementList]),
      financialStmntList:data[TablesColumnFile.financialStmntList]==null?null:FinancialStmntBean.fromMapMiddleware(data[TablesColumnFile.financialStmntList]),
      mnametitle2: data[TablesColumnFile.mnametitle2] as String,
      mlongname2: data[TablesColumnFile.mlongname2] as String,
      mfname2: data[TablesColumnFile.mfname2] as String,
      mmname2: data[TablesColumnFile.mmname2] as String,
      mlname2: data[TablesColumnFile.mlname2] as String,
      mnationality: data[TablesColumnFile.mnationality] as String,
      mid1issuedate: (data[TablesColumnFile.mid1issuedate]=="null"||data[TablesColumnFile.mid1issuedate]==null)?null:DateTime.parse(data[TablesColumnFile.mid1issuedate]) as DateTime,
      mid2issuedate: (data[TablesColumnFile.mid2issuedate]=="null"||data[TablesColumnFile.mid2issuedate]==null)?null:DateTime.parse(data[TablesColumnFile.mid2issuedate]) as DateTime,
      mid1expdate: (data[TablesColumnFile.mid1expdate]=="null"||data[TablesColumnFile.mid1expdate]==null)?null:DateTime.parse(data[TablesColumnFile.mid1expdate]) as DateTime,
      mid2expdate: (data[TablesColumnFile.mid2expdate]=="null"||data[TablesColumnFile.mid2expdate]==null)?null:DateTime.parse(data[TablesColumnFile.mid2expdate]) as DateTime,
      totalExpenditureDetailsBean:data[TablesColumnFile.totalExpenditureDetailsBean]==null?null:TotalExpenditureDetailsBean.fromMap(data[TablesColumnFile.totalExpenditureDetailsBean]),
      mid3issuedate: (data[TablesColumnFile.mid3issuedate]=="null"||data[TablesColumnFile.mid3issuedate]==null)?null:DateTime.parse(data[TablesColumnFile.mid3issuedate]) as DateTime,
      mid3expdate: (data[TablesColumnFile.mid3expdate]=="null"||data[TablesColumnFile.mid3expdate]==null)?null:DateTime.parse(data[TablesColumnFile.mid3expdate]) as DateTime,
      missngautryt1: data[TablesColumnFile.missngautryt1] as String,
      missngautryt2: data[TablesColumnFile.missngautryt2] as String,
      missngautryt3: data[TablesColumnFile.missngautryt3] as String,
      mtypeofid3: data[TablesColumnFile.mtypeofid3] as int,
      middesc3: data[TablesColumnFile.middesc3] as String,
      macctbal : data[TablesColumnFile.macctbal] as double,
      misearngmembr:data[TablesColumnFile.misearngmembr] as String,
      misstudyingmembr:data[TablesColumnFile.misstudyingmembr] as String,
      mmemberno: data[TablesColumnFile.mmemberno]as String,
      mischldrn: data[TablesColumnFile.mischldrn]as String,
      mbusinessname: data[TablesColumnFile.mbusinessname]as String,
      mtarget: data[TablesColumnFile.mtarget]as String,
      mownership: data[TablesColumnFile.mownership]as String,
      mresstatus: data[TablesColumnFile.mresstatus]as String,
      //mdedupnationalid: data[TablesColumnFile.mdedupnationalid]as String,
      miscpemp: data[TablesColumnFile.miscpemp]as String,
      mcusttype: data[TablesColumnFile.mcusttype]as String,

      mrankofemp: data[TablesColumnFile.mrankofemp]as String,
      mempid: data[TablesColumnFile.mempid]as String,
      mnameoforg:	data[TablesColumnFile.mnameoforg]as String,
      msnameoforg:	data[TablesColumnFile.msnameoforg]as String,
      morgtitle:	data[TablesColumnFile.morgtitle]as String,
      mnameoforgk:	data[TablesColumnFile.mnameoforgk]as String,
      msnameoforgk:	data[TablesColumnFile.msnameoforgk]as String,
      morgtitlek:	data[TablesColumnFile.morgtitlek]as String,
      mregno:	data[TablesColumnFile.mregno]as String,
      mregdatae: (data[TablesColumnFile.mregdatae]=="null"||data[TablesColumnFile.mregdatae]==null)?null:DateTime.parse(data[TablesColumnFile.mregdatae]) as DateTime,
      mtaxregno:	data[TablesColumnFile.mtaxregno]as String,
      mtaxregdatae: (data[TablesColumnFile.mtaxregdatae]=="null"||data[TablesColumnFile.mtaxregdatae]==null)?null:DateTime.parse(data[TablesColumnFile.mtaxregdatae]) as DateTime,
      mcomecoindicator:	data[TablesColumnFile.mcomecoindicator]as String,
      mnation:	data[TablesColumnFile.mnation]as String,
      mnationalid:	data[TablesColumnFile.mnationalid]as String,
      mregdob: (data[TablesColumnFile.mregdob]=="null"||data[TablesColumnFile.mregdob]==null)?null:DateTime.parse(data[TablesColumnFile.mregdob]) as DateTime,
      missuingauth:	data[TablesColumnFile.missuingauth]as String,
      mcomtype:	data[TablesColumnFile.mcomtype]as String,
      mdefalultlanguage:	data[TablesColumnFile.mdefalultlanguage]as String,
      mbusinesscommncmntdate: (data[TablesColumnFile.mbusinesscommncmntdate]=="null"||data[TablesColumnFile.mbusinesscommncmntdate]==null)?null:DateTime.parse(data[TablesColumnFile.mbusinesscommncmntdate]) as DateTime,
      mcompanystatus:	data[TablesColumnFile.mcompanystatus]as String,
      mregcountryname:	data[TablesColumnFile.mregcountryname]as String,
      mdefaultcurrency:	data[TablesColumnFile.mdefaultcurrency]as String,
      mbusinessdesc:	data[TablesColumnFile.mbusinessdesc]as String,


    );
  }
 
}
