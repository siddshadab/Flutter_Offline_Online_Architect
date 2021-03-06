import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'dart:convert';

class CustomerLoanDetailsBean {

  static const JsonCodec JSON = const JsonCodec();
  String UUID;
  String CUSTUUID;
  CustomerLoanDetailsBean customerLoanDetailsBean;

  String mleadsid;
  double mappldloanamt;
  double mapprvdloanamt;
  //cust related changes
  int mcustno;
  String mcustcategory;
  //
  double mloanamtdisbd;
  DateTime mloandisbdt;
  int mleadstatus;
  String mleadstatusdesc;
  DateTime mexpdt;
  double minstamt;
  DateTime minststrtdt;
  double minterestamount;
  int mrepaymentmode;
  int mmodeofdisb;
  int mperiod;
  String mprdcd;
  String mcurcd;
  int mpurposeofLoan;
  String msubpurposeofloan;
  double mintrate;
  String mroutefrom;
  String mrouteto;
  String mprdacctid;
  int mloancycle;
  String mfrequency;
  String mtypeofloan;
  String missecuredloan;
  String mrepaymentfreq;
  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  int missynctocoresys;
  DateTime mlastsynsdate;
  String mprdname; //get value from prdCd
  String mcustname;
  //String mpurposeofloandesc;
  String msubpurposeofloandesc;
  String mrepaymentmodedesc;
  String mfrequencydesc;
  String mmodeofdisbdesc;
  String mapprovaldesc;
  String merrormessage;

  CustomerListBean custBean;

  int mcenterid;
  int mgroupcd;
  String mappliedasind;
  String mmainoccupn;
  String msuboccupn;
  String msuboccupndesc;
  String mmainoccupndesc;
  String mremarks;
  String mreason;
  String mrepayable;

  String maccno;
  String minvestment;
  String mrental;
  String mowneruse;
  String payoffreason;
  String preclosuredetails;
  String loanacctno;
  String mfacilitycd;
  String mcrdtsbclsfcd;
  bool isEditAllowed;
  int totlNoOfColl;
  int totlNoOfGuar;
  int totlNoOfDoc;
  List<String> collTypes;
  List<String> guarTypes;
  List<String> docTypes;
  bool isCollMissing;
  bool isGuarMissing;
  bool isDocMissing;


  CustomerLoanDetailsBean(
      {
        this.UUID,
        this.CUSTUUID,
        this.customerLoanDetailsBean,
        this.mleadsid,
        this.mappldloanamt,
        this.mapprvdloanamt,
        this.mcustno,
        this.mcustcategory,
        this.mloanamtdisbd,
        this.mloandisbdt,
        this.mleadstatus,
        this.mleadstatusdesc,
        this.mexpdt,
        this.minstamt,
        this.minststrtdt,
        this.minterestamount,
        this.mrepaymentmode,
        this.mmodeofdisb,
        this.mperiod,
        this.mprdcd,
        this.mpurposeofLoan,
        this.msubpurposeofloan,
        this.mintrate,
        this.mroutefrom,
        this.mrouteto,
        this.mprdacctid,
        this.mloancycle,
        this.mfrequency,
        this.mtypeofloan,
        this.missecuredloan,
        this.mrepaymentfreq,
        this.mcreateddt,
        this.mcreatedby,
        this.mlastupdatedt,
        this.mlastupdateby,
        this.mgeolocation,
        this.mgeolatd,
        this.mgeologd,
        this.missynctocoresys,
        this.mlastsynsdate,
        //this.mpurposeofloandesc,
        this.msubpurposeofloandesc,
        this.mcurcd,
        this.mcustname,
        this.mprdname,
        this.mapprovaldesc,
        this.merrormessage,
        this.custBean,
        this.mcenterid,
        this.mgroupcd,
        this.mappliedasind,
        this.mmainoccupn,
        this.msuboccupndesc,
        this.msuboccupn,
        this.mmainoccupndesc,
        this.mremarks,
        this.mreason,
        this.mrepayable,
        this.maccno,
        this.minvestment,
        this.mrental,
        this.mowneruse,
        this.payoffreason,
        this.preclosuredetails,
        this.loanacctno,
        this.mfacilitycd,
        this.mcrdtsbclsfcd,
        this.isEditAllowed,
        this.totlNoOfColl,
        this.totlNoOfGuar,
        this.totlNoOfDoc,
        this.collTypes,
        this.guarTypes,
        this.docTypes,
        this.isCollMissing,
        this.isGuarMissing,
        this.isDocMissing,


      });

  static Future<Map> toLoanJson(CustomerLoanDetailsBean customerLoan) async {
    var map = new Map();
  
    map[TablesColumnFile.mleadsid]  =  Constant.ifNullCheck(customerLoan.mleadsid);
    map[TablesColumnFile.mappldloanamt]  =  customerLoan.mappldloanamt!=null?customerLoan.mappldloanamt:0.0;
    map[TablesColumnFile.mapprvdloanamt]  = customerLoan.mappldloanamt!=null?customerLoan.mapprvdloanamt:0.0;
    map[TablesColumnFile.mcustno]  = customerLoan.mcustno!=null?customerLoan.mcustno:0;
    map[TablesColumnFile.mcustcategory]  =  Constant.ifNullCheck(customerLoan.mcustcategory);
    map[TablesColumnFile.mloanamtdisbd]  = customerLoan.mloanamtdisbd!=null?customerLoan.mloanamtdisbd:0;
    map[TablesColumnFile.mloandisbdt]  = customerLoan.mloandisbdt!=null?customerLoan.mloandisbdt.toIso8601String():null;
    map[TablesColumnFile.mleadstatus]  = customerLoan.mloanamtdisbd!=null?customerLoan.mleadstatus:0;
    map[TablesColumnFile.mexpdt]  = customerLoan.mexpdt!=null?customerLoan.mexpdt.toIso8601String():null;

    map[TablesColumnFile.minstamt]  = customerLoan.minstamt!=null?customerLoan.minstamt:0.0;
    map[TablesColumnFile.minststrtdt]  = customerLoan.minststrtdt!=null?customerLoan.minststrtdt.toIso8601String():null;
    map[TablesColumnFile.minterestamount]  = customerLoan.minterestamount!=null?customerLoan.minterestamount:0.0;
    map[TablesColumnFile.mrepaymentmode]  =customerLoan.mrepaymentmode!=null? customerLoan.mrepaymentmode:0;
    map[TablesColumnFile.mmodeofdisb]  = customerLoan.mmodeofdisb!=null?customerLoan.mmodeofdisb:0;
    map[TablesColumnFile.mperiod]  = customerLoan.mperiod!=null?customerLoan.mperiod:0;
    map[TablesColumnFile.mprdcd]  = Constant.ifNullCheck(customerLoan.mprdcd);
    map[TablesColumnFile.mprdname]  = Constant.ifNullCheck(customerLoan.mprdname);
    map[TablesColumnFile.mcurcd]  = Constant.ifNullCheck(customerLoan.mcurcd);
    map[TablesColumnFile.mpurposeofLoan]  =customerLoan.mpurposeofLoan!=null? customerLoan.mpurposeofLoan:0;
    map[TablesColumnFile.msubpurposeofloan]  = Constant.ifNullCheck(customerLoan.msubpurposeofloan);
    map[TablesColumnFile.msubpurposeofloandesc]  = Constant.ifNullCheck(customerLoan.msubpurposeofloandesc);
    map[TablesColumnFile.mintrate]  = customerLoan.mintrate!=null?customerLoan.mintrate:0;
    map[TablesColumnFile.mroutefrom]  = Constant.ifNullCheck(customerLoan.mroutefrom);
    map[TablesColumnFile.mrouteto]  = Constant.ifNullCheck(customerLoan.mrouteto);
    map[TablesColumnFile.mprdacctid]  = Constant.ifNullCheck(customerLoan.mprdacctid);
    map[TablesColumnFile.mloancycle]  = customerLoan.mloancycle!=null?customerLoan.mloancycle:0;
    map[TablesColumnFile.mfrequency]  = Constant.ifNullCheck(customerLoan.mfrequency);
    map[TablesColumnFile.mtypeofloan]  = Constant.ifNullCheck(customerLoan.mtypeofloan);
    map[TablesColumnFile.missecuredloan]  = Constant.ifNullCheck(customerLoan.missecuredloan);
    map[TablesColumnFile.mfacilitycd]  = Constant.ifNullCheck(customerLoan.mfacilitycd);
    map[TablesColumnFile.mcrdtsbclsfcd]  = Constant.ifNullCheck(customerLoan.mcrdtsbclsfcd);
    map[TablesColumnFile.mrepaymentfreq]  = Constant.ifNullCheck(customerLoan.mrepaymentfreq);
    map[TablesColumnFile.mcreateddt]  = customerLoan.mcreateddt!=null?customerLoan.mcreateddt.toIso8601String():null;
    map[TablesColumnFile.mcreatedby]  = Constant.ifNullCheck(customerLoan.mcreatedby);
    map[TablesColumnFile.mlastupdatedt]  = DateTime.now().toIso8601String();
    map[TablesColumnFile.mlastupdateby]  = Constant.ifNullCheck(customerLoan.mlastupdateby);
    map[TablesColumnFile.mgeolocation]  = Constant.ifNullCheck(customerLoan.mgeolocation);
    map[TablesColumnFile.mgeolatd]  =Constant.ifNullCheck(customerLoan.mgeolatd);
    map[TablesColumnFile.mgeologd]  = Constant.ifNullCheck(customerLoan.mgeologd);
    map[TablesColumnFile.mappliedasind]  = Constant.ifNullCheck(customerLoan.mappliedasind);
    map[TablesColumnFile.mappliedasind]  = Constant.ifNullCheck(customerLoan.mappliedasind);
    map[TablesColumnFile.missynctocoresys]  = 99;
    map[TablesColumnFile.mlastsynsdate]  = DateTime.now().toIso8601String();
    map[TablesColumnFile.mcustname]=Constant.ifNullCheck(customerLoan.mcustname);
    map[TablesColumnFile.mmainoccupn] =   Constant.ifNullCheck(customerLoan.mmainoccupn);
    map[TablesColumnFile.msuboccupn] =    Constant.ifNullCheck(customerLoan.msuboccupn);
    map[TablesColumnFile.mmainoccupndesc] =   Constant.ifNullCheck(customerLoan.mmainoccupndesc);
    map[TablesColumnFile.msuboccupndesc] =    Constant.ifNullCheck(customerLoan.msuboccupndesc);
    map[TablesColumnFile.mremarks] =    Constant.ifNullCheck(customerLoan.mremarks);
    map[TablesColumnFile.mreason] =    Constant.ifNullCheck(customerLoan.mreason);
    map[TablesColumnFile.mrepayable] =    Constant.ifNullCheck(customerLoan.mrepayable);
    map[TablesColumnFile.maccno] =    Constant.ifNullCheck(customerLoan.maccno);
    map[TablesColumnFile.minvestment] =    Constant.ifNullCheck(customerLoan.minvestment);
    map[TablesColumnFile.mrental] =    Constant.ifNullCheck(customerLoan.mrental);
    map[TablesColumnFile.mowneruse] =    Constant.ifNullCheck(customerLoan.mowneruse);
    map[TablesColumnFile.payoffreason] =    Constant.ifNullCheck(customerLoan.payoffreason);
    map[TablesColumnFile.preclosuredetails] =    Constant.ifNullCheck(customerLoan.preclosuredetails);
    map[TablesColumnFile.loanacctno] =    Constant.ifNullCheck(customerLoan.loanacctno);
    return map;
  
  }
  factory CustomerLoanDetailsBean.fromLoanJson(Map<String, dynamic> map,bool isFromMiddleware) {
    return CustomerLoanDetailsBean(
      CUSTUUID: map[TablesColumnFile.CUSTUUID] as String,
      UUID: map[TablesColumnFile.UUID] as String,
      mleadsid: map[TablesColumnFile.mleadsid] as String,
      mappldloanamt: map[TablesColumnFile.mappldloanamt] as double,
      mapprvdloanamt: map[TablesColumnFile.mapprvdloanamt] as double,
      mcustno: map[TablesColumnFile.mcustno] as int,
      mcustcategory:map[TablesColumnFile.mcustcategory] as String,
      mloanamtdisbd: map[TablesColumnFile.mloanamtdisbd] as double,
      mloandisbdt: (map[TablesColumnFile.mloandisbdt]=="null"||map[TablesColumnFile.mloandisbdt]==null)?null:DateTime.parse(map[TablesColumnFile.mloandisbdt]) as DateTime,
      mleadstatus: map[TablesColumnFile.mleadstatus] as int,
      mleadstatusdesc: map[TablesColumnFile.mleadstatusdesc] as String,
      mexpdt:(map[TablesColumnFile.mexpdt]=="null"||map[TablesColumnFile.mexpdt]==null)?null:DateTime.parse(map[TablesColumnFile.mexpdt]) as DateTime,
      minstamt: map[TablesColumnFile.minstamt] as double,
      minststrtdt:(map[TablesColumnFile.minststrtdt]=="null"||map[TablesColumnFile.minststrtdt]==null)?null:DateTime.parse(map[TablesColumnFile.minststrtdt]) as DateTime,
      minterestamount: map[TablesColumnFile.minterestamount] as double,
      mrepaymentmode: map[TablesColumnFile.mrepaymentmode] as int,
      mmodeofdisb: map[TablesColumnFile.mmodeofdisb] as int,
      mperiod: map[TablesColumnFile.mperiod] as int,
      mprdcd: map[TablesColumnFile.mprdcd]as String,
      mcurcd: map[TablesColumnFile.mcurcd] as String,
      mprdname: map[TablesColumnFile.mprdname] as String,
      mpurposeofLoan: map[TablesColumnFile.mpurposeofLoan] as int,
      msubpurposeofloan: map[TablesColumnFile.msubpurposeofloan] as String,
      msubpurposeofloandesc: map[TablesColumnFile.msubpurposeofloandesc] as String,
      mintrate: map[TablesColumnFile.mintrate] as double,
      mroutefrom: map[TablesColumnFile.mroutefrom] as String,
      mrouteto: map[TablesColumnFile.mrouteto] as String,
      mprdacctid: map[TablesColumnFile.mprdacctid] as String,
      mloancycle: map[TablesColumnFile.mloancycle] as int,
      mfrequency: map[TablesColumnFile.mfrequency] as String,
      mtypeofloan: map[TablesColumnFile.mtypeofloan] as String,
      missecuredloan: map[TablesColumnFile.missecuredloan] as String,
      mrepaymentfreq: map[TablesColumnFile.mrepaymentfreq] as String,
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby: map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby: map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation: map[TablesColumnFile.mgeolocation] as String,
      mgeolatd: map[TablesColumnFile.mgeolatd] as String,
      mgeologd: map[TablesColumnFile.mgeologd] as String,
      missynctocoresys: map[TablesColumnFile.missynctocoresys] as int,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,
      mcustname:map[TablesColumnFile.mcustname] as String,
      mapprovaldesc:map[TablesColumnFile.mApprovalDesc] as String,
      merrormessage:map[TablesColumnFile.merrormessage] as String,
      mcenterid:map[TablesColumnFile.mcenterid] as int,
      mgroupcd:map[TablesColumnFile.mgroupid] as int,
      custBean:map[TablesColumnFile.custBean]==null?null:
      CustomerListBean.fromCustomerJson(map[TablesColumnFile.custBean],true),
      mappliedasind:map[TablesColumnFile.mappliedasind] as String,
      mmainoccupn : map[TablesColumnFile.mmainoccupn] as String,
      msuboccupn : map[TablesColumnFile.msuboccupn] as String,
      mmainoccupndesc : map[TablesColumnFile.mmainoccupndesc] as String,
      msuboccupndesc : map[TablesColumnFile.msuboccupndesc] as String,
      mremarks : map[TablesColumnFile.mremarks] as String,
      mreason : map[TablesColumnFile.mreason] as String,
      mrepayable : map[TablesColumnFile.mrepayable] as String,
      maccno : map[TablesColumnFile.maccno] as String,
      minvestment : map[TablesColumnFile.minvestment] as String,
      mrental : map[TablesColumnFile.mrental] as String,
      mowneruse : map[TablesColumnFile.mowneruse] as String,
      payoffreason : map[TablesColumnFile.payoffreason] as String,
      preclosuredetails : map[TablesColumnFile.preclosuredetails] as String,
      loanacctno : map[TablesColumnFile.loanacctno] as String,
      mfacilitycd : map[TablesColumnFile.mfacilitycd] as String,
      mcrdtsbclsfcd : map[TablesColumnFile.mcrdtsbclsfcd] as String,

    );}
  factory CustomerLoanDetailsBean.fromMapV2(Map<String, dynamic> map) {
    final Map<String, dynamic> data  =  JSON.decode(map[TablesColumnFile.LOANDATA]);
    Constant.getAppPath(data.toString(),"AfterLoanSave");
    print(data);
    return CustomerLoanDetailsBean(
      UUID: map[TablesColumnFile.UUID] as String,
      CUSTUUID: map[TablesColumnFile.CUSTUUID] as String,
     //customerLoanDetailsBean:data==null?null:CustomerLoanDetailsBean.fromLoanJson(data,false),
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      missynctocoresys:(map[TablesColumnFile.missynctocoresys]=="null"||map[TablesColumnFile.missynctocoresys]==null)?0:map[TablesColumnFile.missynctocoresys] as int,
      mleadsid: data[TablesColumnFile.mleadsid] as String,
      mappldloanamt: data[TablesColumnFile.mappldloanamt] as double,
      mapprvdloanamt: data[TablesColumnFile.mapprvdloanamt] as double,
      mcustno: data[TablesColumnFile.mcustno] as int,
      mcustcategory:data[TablesColumnFile.mcustcategory] as String,
      mloanamtdisbd: data[TablesColumnFile.mloanamtdisbd] as double,
      mloandisbdt: (data[TablesColumnFile.mloandisbdt]=="null"||data[TablesColumnFile.mloandisbdt]==null)?null:DateTime.parse(data[TablesColumnFile.mloandisbdt]) as DateTime,
      mleadstatus: data[TablesColumnFile.mleadstatus] as int,
      mleadstatusdesc: data[TablesColumnFile.mleadstatusdesc] as String,
      mexpdt:(data[TablesColumnFile.mexpdt]=="null"||data[TablesColumnFile.mexpdt]==null)?null:DateTime.parse(data[TablesColumnFile.mexpdt]) as DateTime,
      minstamt: data[TablesColumnFile.minstamt] as double,
      minststrtdt:(data[TablesColumnFile.minststrtdt]=="null"||data[TablesColumnFile.minststrtdt]==null)?null:DateTime.parse(data[TablesColumnFile.minststrtdt]) as DateTime,
      minterestamount: data[TablesColumnFile.minterestamount] as double,
      mrepaymentmode: data[TablesColumnFile.mrepaymentmode] as int,
      mmodeofdisb: data[TablesColumnFile.mmodeofdisb] as int,
      mperiod: data[TablesColumnFile.mperiod] as int,
      mprdcd: data[TablesColumnFile.mprdcd]as String,
      mcurcd: data[TablesColumnFile.mcurcd] as String,
      mprdname: data[TablesColumnFile.mprdname] as String,
      mpurposeofLoan: data[TablesColumnFile.mpurposeofLoan] as int,
      msubpurposeofloan: data[TablesColumnFile.msubpurposeofloan] as String,
      msubpurposeofloandesc: data[TablesColumnFile.msubpurposeofloandesc] as String,
      mintrate: data[TablesColumnFile.mintrate] as double,
      mroutefrom: data[TablesColumnFile.mroutefrom] as String,
      mrouteto: data[TablesColumnFile.mrouteto] as String,
      mprdacctid: data[TablesColumnFile.mprdacctid] as String,
      mloancycle: data[TablesColumnFile.mloancycle] as int,
      mfrequency: data[TablesColumnFile.mfrequency] as String,
      mtypeofloan: data[TablesColumnFile.mtypeofloan] as String,
      missecuredloan: data[TablesColumnFile.missecuredloan] as String,
      mrepaymentfreq: data[TablesColumnFile.mrepaymentfreq] as String,
      mlastsynsdate:(data[TablesColumnFile.mlastsynsdate]=="null"||data[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(data[TablesColumnFile.mlastsynsdate]) as DateTime,
      mcustname:data[TablesColumnFile.mcustname] as String,
      mapprovaldesc:data[TablesColumnFile.mApprovalDesc] as String,
      merrormessage:data[TablesColumnFile.merrormessage] as String,
      mcenterid:data[TablesColumnFile.mcenterid] as int,
      mgroupcd:data[TablesColumnFile.mgroupid] as int,
      //custBean:data[TablesColumnFile.custBean]==null?null:CustomerListBean.fromCustomerJson(data[TablesColumnFile.custBean],true),
      mappliedasind:data[TablesColumnFile.mappliedasind] as String,
      mmainoccupn : data[TablesColumnFile.mmainoccupn] as String,
      msuboccupn : data[TablesColumnFile.msuboccupn] as String,
      mmainoccupndesc : data[TablesColumnFile.mmainoccupndesc] as String,
      msuboccupndesc : data[TablesColumnFile.msuboccupndesc] as String,
      mremarks : data[TablesColumnFile.mremarks] as String,
      mreason : data[TablesColumnFile.mreason] as String,
      mrepayable : data[TablesColumnFile.mrepayable] as String,
      maccno : data[TablesColumnFile.maccno] as String,
      minvestment : data[TablesColumnFile.minvestment] as String,
      mrental : data[TablesColumnFile.mrental] as String,
      mowneruse : data[TablesColumnFile.mowneruse] as String,
      payoffreason : data[TablesColumnFile.payoffreason] as String,
      preclosuredetails : data[TablesColumnFile.preclosuredetails] as String,
      loanacctno : data[TablesColumnFile.loanacctno] as String,
      mfacilitycd : data[TablesColumnFile.mfacilitycd] as String,
      mcrdtsbclsfcd : data[TablesColumnFile.mcrdtsbclsfcd] as String,
    );
  }



}

