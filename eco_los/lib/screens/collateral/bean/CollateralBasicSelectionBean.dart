import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/collateral/collateralREM/bean/CollateralREMlandandhouseBean.dart';
import 'package:eco_los/screens/collateral/collateralT24/bean/CollateralT24Bean.dart';
import 'package:eco_los/screens/collateral/collatralVehicle/bean/CollateralVehicleBean.dart';
import 'dart:convert';

class CollateralBasicSelectionBean {

  static const JsonCodec JSON = const JsonCodec();
  String UUID;
  String LOANUUID;
  String CUSTUUID;
  String mleadsid;
  String mcollstatus;
  String mcollateralsid;
  int	msrno ;
  String mfname;
  String mmname;
  String mlname;
  String	mapplicanttype ;
  String collatrlTyp;
  int	mcustno ;
  String	mrelationwithcust ;
  int	mrelationsince ;

  String msubcolltrl;
  String msubocolltrldesc;
  String msubcolltrlcat;
  String msubocolltrlcatdesc;
  String collatrlcat;
  String nametitle;
  String insurance;
  String colltrltitle;
 // String colltrltitledesc;
  String mnameoftitledoc;
  String mcollbookno;
  String mcollpageno;
  String mplaceofuse;
  String mwithdrawcond;
  String mwthdrwcond;
  String misappctprimary;
  String mislmap;
  String mnoofattchmnt;
  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  DateTime mlastsynsdate;
  String merrormessage;
  int missynctocoresys;
  bool isFethMode;
    String mflag;
    String mcollrightid;
    String mollcreateid;
    String msubprodlimitid;
  CollateralBasicSelectionBean collateralBasicSelectionBean;
  CollateralREMlandandhouseBean collateralREMlandandhouseBean;
  CollateralVehicleBean collateralVehicleBean;
  CollateralT24Bean collateralT24Bean;

  CollateralBasicSelectionBean(
      {
        this.UUID,
        this.LOANUUID,
        this.CUSTUUID,
        this.mleadsid,
        this.mcollstatus,
        this.msrno,
        this.mapplicanttype,

        this.mcustno,

        this.misappctprimary,
        this.mislmap,
        this.mnoofattchmnt,
        this.mrelationwithcust,
        this.mrelationsince,
        this.mcreateddt,
        this.mcreatedby,
        this.mlastupdatedt,
        this.mlastupdateby,
        this.mgeolocation,
        this.mgeolatd,
        this.mgeologd,
        this.mlastsynsdate,
        this.merrormessage,
        this.mfname,
        this.mmname,
        this.mlname,
        this.collatrlTyp,
        this.msubcolltrl,
        this.msubocolltrldesc,
        this.msubcolltrlcat,
        this.msubocolltrlcatdesc,
        this.collatrlcat,
        //this.relationwithapplicant,
        this.nametitle,
        this.insurance,
        this.colltrltitle,
        this.mnameoftitledoc,
        this.mcollbookno,
        this.mcollpageno,
        this.mplaceofuse,
        this.mwithdrawcond,
        this.mwthdrwcond,
        this.mcollateralsid,
        this.missynctocoresys,
        this.isFethMode,
        this.mflag,
        this.mcollrightid,
        this.mollcreateid,
        this.msubprodlimitid,
        this.collateralVehicleBean,
        this.collateralREMlandandhouseBean,
        this.collateralT24Bean,
        this.collateralBasicSelectionBean
      });

  //ToCustomer
  //ToGuarante
  //ToDocuments
  //ToLoan
  //ToCollaterals

  static Future<Map> toCollaateralsJson(CollateralBasicSelectionBean bean) async {
    var mapData = new Map();
    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print(bean.collateralVehicleBean.toString());
    mapData[TablesColumnFile.mleadsid] = 	  Constant.ifNullCheck(bean.mleadsid);
    mapData[TablesColumnFile.mcollstatus] = 	  Constant.ifNullCheck(bean.mcollstatus);
    mapData[TablesColumnFile.mcollateralsid] = 	  Constant.ifNullCheck(bean.mcollateralsid);
    mapData[TablesColumnFile.msrno] = 	  bean.msrno==null?0:bean.msrno;
    mapData[TablesColumnFile.mfname] = 	  Constant.ifNullCheck(bean.mfname);
    mapData[TablesColumnFile.mmname] = 	  Constant.ifNullCheck(bean.mmname);
    mapData[TablesColumnFile.mlname] = 	 Constant.ifNullCheck(bean.mlname);
    mapData[TablesColumnFile.mapplicanttype] = 	  Constant.ifNullCheck(bean.mapplicanttype);
    mapData[TablesColumnFile.mcollatrlTyp] = 	  Constant.ifNullCheck(bean.collatrlTyp);

    mapData[TablesColumnFile.mcustno] = 	  bean.mcustno==null?0:bean.mcustno;
    mapData[TablesColumnFile.mrelationwithcust] = 	  Constant.ifNullCheck(bean.mrelationwithcust);
    mapData[TablesColumnFile.mrelationsince] = 	  bean.mrelationsince==null?0:bean.mrelationsince;
    mapData[TablesColumnFile.msubcolltrl] = 	  Constant.ifNullCheck(bean.msubcolltrl);
    mapData[TablesColumnFile.msubocolltrldesc] = 	  Constant.ifNullCheck(bean.msubocolltrldesc);
    mapData[TablesColumnFile.msubcolltrlcat] = 	  Constant.ifNullCheck(bean.msubcolltrlcat);
    mapData[TablesColumnFile.msubocolltrlcatdesc] = 	  Constant.ifNullCheck(bean.msubocolltrlcatdesc);
    mapData[TablesColumnFile.mcollatrlcat] = 	  Constant.ifNullCheck(bean.collatrlcat);
    mapData[TablesColumnFile.mnametitle] = 	  Constant.ifNullCheck(bean.nametitle);
    mapData[TablesColumnFile.minsurance] = 	  Constant.ifNullCheck(bean.insurance);
    mapData[TablesColumnFile.mcolltrltitle] = 	  Constant.ifNullCheck(bean.colltrltitle);
    mapData[TablesColumnFile.mnameoftitledoc] = 	  Constant.ifNullCheck(bean.mnameoftitledoc);
    mapData[TablesColumnFile.mcollbookno] = 	  Constant.ifNullCheck(bean.mcollbookno);
    mapData[TablesColumnFile.mcollpageno] = 	  Constant.ifNullCheck(bean.mcollpageno);
    mapData[TablesColumnFile.mplaceofuse] = 	  Constant.ifNullCheck(bean.mplaceofuse);
    mapData[TablesColumnFile.mwithdrawcond] = 	  Constant.ifNullCheck(bean.mwithdrawcond);
    mapData[TablesColumnFile.mwthdrwcond] = 	  Constant.ifNullCheck(bean.mwthdrwcond);

    mapData[TablesColumnFile.mflag] = 	  Constant.ifNullCheck(bean.mflag);
    mapData[TablesColumnFile.mcollrightid] = 	  Constant.ifNullCheck(bean.mcollrightid);
    mapData[TablesColumnFile.mollcreateid] = 	  Constant.ifNullCheck(bean.mollcreateid);
    mapData[TablesColumnFile.msubprodlimitid] = 	  Constant.ifNullCheck(bean.msubprodlimitid);


    mapData[TablesColumnFile.mcreateddt] =	Constant.ifDateNullCheck(bean.mcreateddt);
    mapData[TablesColumnFile.mcreatedby] =	Constant.ifNullCheck(bean.mcreatedby);
    mapData[TablesColumnFile.mlastupdatedt] =	Constant.ifDateNullCheck(bean.mlastupdatedt);
    mapData[TablesColumnFile.mlastupdateby] =	Constant.ifNullCheck(bean.mlastupdateby);
    mapData[TablesColumnFile.mgeolocation] =	Constant.ifNullCheck(bean.mgeolocation);
    mapData[TablesColumnFile.mgeolatd] =	Constant.ifNullCheck(bean.mgeolatd);
    mapData[TablesColumnFile.mgeologd] =	Constant.ifNullCheck(bean.mgeologd);
    mapData[TablesColumnFile.missynctocoresys] = 	  bean.missynctocoresys==null?0:bean.missynctocoresys;
    mapData[TablesColumnFile.mlastsynsdate] =	Constant.ifDateNullCheck(bean.mlastsynsdate);
    mapData[TablesColumnFile.misappctprimary] =	Constant.ifNullCheck(bean.misappctprimary);
    mapData[TablesColumnFile.mislmap] =	Constant.ifNullCheck(bean.mislmap);
    mapData[TablesColumnFile.mnoofattchmnt] =	Constant.ifNullCheck(bean.mnoofattchmnt);

    var rem = new Map();
    if (bean.collateralREMlandandhouseBean != null) {

    rem[TablesColumnFile.mlbrcode] = bean.collateralREMlandandhouseBean.mlbrcode != null ? bean.collateralREMlandandhouseBean.mlbrcode : 0;
    rem[TablesColumnFile.mprdacctid] = bean.collateralREMlandandhouseBean.mprdacctid != null ? bean.collateralREMlandandhouseBean.mprdacctid : '';
    rem[TablesColumnFile.mtitle] = bean.collateralREMlandandhouseBean.mtitle != null ? bean.collateralREMlandandhouseBean.mtitle : '';
    rem[TablesColumnFile.mfname] = bean.collateralREMlandandhouseBean.mfname != null ? bean.collateralREMlandandhouseBean.mfname : '';
    rem[TablesColumnFile.mmname] = bean.collateralREMlandandhouseBean.mmname != null ? bean.collateralREMlandandhouseBean.mmname : '';
    rem[TablesColumnFile.mlname] = bean.collateralREMlandandhouseBean.mlname != null ? bean.collateralREMlandandhouseBean.mlname : '';
    rem[TablesColumnFile.maddress1] = bean.collateralREMlandandhouseBean.maddress1 != null ? bean.collateralREMlandandhouseBean.maddress1 : '';
    rem[TablesColumnFile.maddress2] = bean.collateralREMlandandhouseBean.maddress2 != null ? bean.collateralREMlandandhouseBean.maddress2 : '';
    rem[TablesColumnFile.mcountry] = bean.collateralREMlandandhouseBean.mcountry != null ? bean.collateralREMlandandhouseBean.mcountry : '';
    rem[TablesColumnFile.mstate] = bean.collateralREMlandandhouseBean.mstate != null ? bean.collateralREMlandandhouseBean.mstate : '';
    rem[TablesColumnFile.mdist] = bean.collateralREMlandandhouseBean.mdist != null ? bean.collateralREMlandandhouseBean.mdist : '';
    rem[TablesColumnFile.msubdist] = bean.collateralREMlandandhouseBean.msubdist != null ? bean.collateralREMlandandhouseBean.msubdist : '';
    rem[TablesColumnFile.marea] = bean.collateralREMlandandhouseBean.marea != null ? bean.collateralREMlandandhouseBean.marea : '';
    rem[TablesColumnFile.mpoboxno] = bean.collateralREMlandandhouseBean.mpoboxno != null ? bean.collateralREMlandandhouseBean.mpoboxno : 0;
    rem[TablesColumnFile.mhousebuilttype] = bean.collateralREMlandandhouseBean.mhousebuilttype != null ? bean.collateralREMlandandhouseBean.mhousebuilttype : '';
    rem[TablesColumnFile.menvdescription] = bean.collateralREMlandandhouseBean.menvdescription != null ? bean.collateralREMlandandhouseBean.menvdescription : '';
    rem[TablesColumnFile.mlotarea] = bean.collateralREMlandandhouseBean.mlotarea != null ? bean.collateralREMlandandhouseBean.mlotarea : 0.0;
    rem[TablesColumnFile.mfloorarea] = bean.collateralREMlandandhouseBean.mfloorarea != null ? bean.collateralREMlandandhouseBean.mfloorarea : 0.0;
    rem[TablesColumnFile.msizeofproperty] = bean.collateralREMlandandhouseBean.msizeofproperty != null ? bean.collateralREMlandandhouseBean.msizeofproperty : '';
    rem[TablesColumnFile.msizeofpropertyl] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.msizeofpropertyl);
    rem[TablesColumnFile.msizeofpropertyh] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.msizeofpropertyh);
    rem[TablesColumnFile.mtctno] =	bean.collateralREMlandandhouseBean.mtctno==null?0:bean.collateralREMlandandhouseBean.mtctno;
    rem[TablesColumnFile.msrno] =	bean.msrno==null?0:bean.msrno;
    rem[TablesColumnFile.mregdate] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mregdate);
    rem[TablesColumnFile.mepebdate] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mepebdate);
    rem[TablesColumnFile.mrescodeorremark] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mrescodeorremark);
    rem[TablesColumnFile.mepebno] =bean.collateralREMlandandhouseBean.mepebno==null?0:bean.collateralREMlandandhouseBean.mepebno;
    rem[TablesColumnFile.mregofdeedslocation] = Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mregofdeedslocation);
    rem[TablesColumnFile.mcreateddt] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mcreateddt);
    rem[TablesColumnFile.mcreatedby] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mcreatedby);
    rem[TablesColumnFile.mlastupdatedt] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mlastupdatedt);
    rem[TablesColumnFile.mlastupdateby] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlastupdateby);
    rem[TablesColumnFile.mgeolocation] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mgeolocation);
    rem[TablesColumnFile.mgeolatd] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mgeolatd);
    rem[TablesColumnFile.mgeologd] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mgeologd);
    rem[TablesColumnFile.mlastsynsdate] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mlastsynsdate);
    rem[TablesColumnFile.merrormessage] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.merrormessage);
    rem[TablesColumnFile.missynctocoresys] =	bean.missynctocoresys==null?0:bean.missynctocoresys;
    rem[TablesColumnFile.mcollno] =	bean.collateralREMlandandhouseBean.mcollno==null?0:bean.collateralREMlandandhouseBean.mcollno;
    rem[TablesColumnFile.mpriorsec] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mpriorsec);
    rem[TablesColumnFile.mcolltype] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mcolltype);
    rem[TablesColumnFile.mcollsubtype] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mcollsubtype);
    rem[TablesColumnFile.mtypeofproperty] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mtypeofproperty);
    rem[TablesColumnFile.mltypeofownercerti] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mltypeofownercerti);
    rem[TablesColumnFile.mhtypeofownercerti] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhtypeofownercerti);
    rem[TablesColumnFile.mlissuednoprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlissuednoprop);
    rem[TablesColumnFile.mhissuednoprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhissuednoprop);
    rem[TablesColumnFile.mlissueby] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlissueby);
    rem[TablesColumnFile.mhissueby] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhissueby);
    rem[TablesColumnFile.mlsizeprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlsizeprop);
    rem[TablesColumnFile.mhsizeprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhsizeprop);
    rem[TablesColumnFile.mlnpropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlnpropborder);
    rem[TablesColumnFile.mhnpropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhnpropborder);
    rem[TablesColumnFile.mlspropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlspropborder);
    rem[TablesColumnFile.mhspropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhspropborder);
    rem[TablesColumnFile.mlwpropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlwpropborder);
    rem[TablesColumnFile.mhwpropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhwpropborder);
    rem[TablesColumnFile.mlepropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mlepropborder);
    rem[TablesColumnFile.mhepropborder] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhepropborder);
    rem[TablesColumnFile.mllocprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mllocprop);
    rem[TablesColumnFile.mhlocprop] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhlocprop);
    rem[TablesColumnFile.mltitleowener] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mltitleowener);
    rem[TablesColumnFile.mhtitleowener] =	Constant.ifNullCheck(bean.collateralREMlandandhouseBean.mhtitleowener);
    rem[TablesColumnFile.mllocalauthvalue] =	bean.collateralREMlandandhouseBean.mllocalauthvalue==null?0:bean.collateralREMlandandhouseBean.mllocalauthvalue;
    rem[TablesColumnFile.mhlocalauthvalue] =	bean.collateralREMlandandhouseBean.mhlocalauthvalue==null?0:bean.collateralREMlandandhouseBean.mhlocalauthvalue;
    rem[TablesColumnFile.mlrealestatecmpnyvalue] =	bean.collateralREMlandandhouseBean.mlrealestatecmpnyvalue==null?0:bean.collateralREMlandandhouseBean.mlrealestatecmpnyvalue;
    rem[TablesColumnFile.mhrealestatecmpnyvalue] =bean.collateralREMlandandhouseBean.mhrealestatecmpnyvalue==null?0:bean.collateralREMlandandhouseBean.mhrealestatecmpnyvalue;
    rem[TablesColumnFile.mlaskneighonvalue] =	bean.collateralREMlandandhouseBean.mlaskneighonvalue==null?0:bean.collateralREMlandandhouseBean.mlaskneighonvalue;
    rem[TablesColumnFile.mhaskneighonvalue] =	bean.collateralREMlandandhouseBean.mhaskneighonvalue==null?0:bean.collateralREMlandandhouseBean.mhaskneighonvalue;
    rem[TablesColumnFile.mlsumonvalprop] =	bean.collateralREMlandandhouseBean.mlsumonvalprop==null?0:bean.collateralREMlandandhouseBean.mlsumonvalprop;
    rem[TablesColumnFile.mhsumonvalprop] =	bean.collateralREMlandandhouseBean.mhsumonvalprop==null?0:bean.collateralREMlandandhouseBean.mhsumonvalprop;
    rem[TablesColumnFile.mlissuedt] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mlissuedt);
    rem[TablesColumnFile.mhissuedt] =	Constant.ifDateNullCheck(bean.collateralREMlandandhouseBean.mhissuedt);

    }


    var veh = new Map();
    if (bean.collateralVehicleBean != null) {

      veh[TablesColumnFile.msrno] = 	  bean.collateralVehicleBean.msrno==null?0:bean.collateralVehicleBean.msrno;
      veh[TablesColumnFile.mlbrcode] = 	  bean.collateralVehicleBean.mlbrcode==null?0:bean.collateralVehicleBean.mlbrcode ;
      veh[TablesColumnFile.mprdacctid] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mprdacctid);
      veh[TablesColumnFile.msectype] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.msectype);
     // veh[TablesColumnFile.trefno] = 	  bean.collateralVehicleBean.trefno==null?0:bean.collateralVehicleBean.trefno;
//      veh[TablesColumnFile.mrefno] = 	  bean.mrefno==null?0:bean.mrefno;
//      veh[TablesColumnFile.loantrefno] = 	  bean.mloantrefno==null?0:bean.mloantrefno;
//      veh[TablesColumnFile.loanmrefno] = 	  bean.mloanmrefno==null?0:bean.mloanmrefno;
//      veh[TablesColumnFile.colleteraltrefno] = 	  bean.colleteraltrefno==null?0:bean.colleteraltrefno;
//      veh[TablesColumnFile.colleteralmrefno] = 	  bean.colleteralmrefno==null?0:bean.colleteralmrefno;
      veh[TablesColumnFile.mbusinessname] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbusinessname);
      veh[TablesColumnFile.mownername] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mownername);
      veh[TablesColumnFile.mtel] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mtel);
      veh[TablesColumnFile.maddress1] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.maddress1);
      veh[TablesColumnFile.maddress2] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.maddress2);
      veh[TablesColumnFile.mcountrycd] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mcountry);
      veh[TablesColumnFile.mstate] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mstate);
      veh[TablesColumnFile.mdistcd] = 	 Constant.ifNullCheck(bean.collateralVehicleBean.mdist);
      veh[TablesColumnFile.msubdist] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.msubdist);
      veh[TablesColumnFile.mareatype] = 	 	  Constant.ifNullCheck(bean.collateralVehicleBean.marea);
      veh[TablesColumnFile.mvillage] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mvillage);
      veh[TablesColumnFile.mbrand] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbrand);
      veh[TablesColumnFile.mnoofaxles] = 	  bean.collateralVehicleBean.mnoofaxles==null?0:bean.collateralVehicleBean.mnoofaxles;
      veh[TablesColumnFile.mtype] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mtype);
      veh[TablesColumnFile.mnoofcylinder] = 	  bean.collateralVehicleBean.mnoofcylinder==null?0:bean.collateralVehicleBean.mnoofcylinder;
      veh[TablesColumnFile.mcolor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mcolor);
      veh[TablesColumnFile.msizeofcylinder] = 	  bean.collateralVehicleBean.msizeofcylinder==null?0:bean.collateralVehicleBean.msizeofcylinder;
      veh[TablesColumnFile.mbodyno] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbodyno);
      veh[TablesColumnFile.menginepower] = 	  bean.collateralVehicleBean.menginepower==null?0:bean.collateralVehicleBean.menginepower;
      veh[TablesColumnFile.mengineno] = 	   Constant.ifNullCheck(bean.collateralVehicleBean.mengineno);
      veh[TablesColumnFile.myearmade] = 	  bean.collateralVehicleBean.myearmade==null?0:bean.collateralVehicleBean.myearmade;
      veh[TablesColumnFile.mchassisno] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mchassisno);
      veh[TablesColumnFile.mmadeby] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mmadeby);
      veh[TablesColumnFile.midentitycarno] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.midentitycarno);
      veh[TablesColumnFile.mcarpricing] = 	  bean.collateralVehicleBean.mcarpricing==null?0.0:bean.collateralVehicleBean.mcarpricing;
      veh[TablesColumnFile.mstdpricing] = 	  bean.collateralVehicleBean.mstdpricing==null?0:bean.collateralVehicleBean.mstdpricing;
      veh[TablesColumnFile.minsurancepricing] = 	  bean.collateralVehicleBean.minsurancepricing==null?0:bean.collateralVehicleBean.minsurancepricing;
      veh[TablesColumnFile.mpriceafterevaluation] = 	  bean.collateralVehicleBean.mpriceafterevaluation==null?0:bean.collateralVehicleBean.mpriceafterevaluation;
      veh[TablesColumnFile.mltv] = 	  bean.collateralVehicleBean.mltv==null?0:bean.collateralVehicleBean.mltv;
      veh[TablesColumnFile.mltvdd] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mltvdd);
      veh[TablesColumnFile.mcartype] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mcartype);
      veh[TablesColumnFile.mloantovalueltv] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mloantovalueltv);
      veh[TablesColumnFile.mwhobelongocarowner] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mwhobelongocarowner);
      veh[TablesColumnFile.mcarlegality] = 	  bean.collateralVehicleBean.mcarlegality==null?0:bean.collateralVehicleBean.mcarlegality;
      veh[TablesColumnFile.mreason] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mreason);
      veh[TablesColumnFile.mdescription] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mdescription);
      veh[TablesColumnFile.mcarcanbeused] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mcarcanbeused);
      veh[TablesColumnFile.mcredittenor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mcredittenor);
      veh[TablesColumnFile.mdmirror] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mdmirror);
      veh[TablesColumnFile.mddoor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mddoor);
      veh[TablesColumnFile.mdmirrorbacklock] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mdmirrorbacklock);
      veh[TablesColumnFile.mdcolororspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mdcolororspot);
      veh[TablesColumnFile.mfcolorandspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mfcolorandspot);
      veh[TablesColumnFile.mftireandyan] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mftireandyan);
      veh[TablesColumnFile.mfcapofsplatter] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mfcapofsplatter);
      veh[TablesColumnFile.mhmirror] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhmirror);
      veh[TablesColumnFile.mhvent] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhvent);
      veh[TablesColumnFile.mhlightfarl] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhlightfarl);
      veh[TablesColumnFile.mhlightfarr] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhlightfarr);
      veh[TablesColumnFile.mhsignal] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhsignal);
      veh[TablesColumnFile.mhwincap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhwincap);
      veh[TablesColumnFile.mhheadcap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mhheadcap);
      veh[TablesColumnFile.mpmirror] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mpmirror);
      veh[TablesColumnFile.mpdoor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mpdoor);
      veh[TablesColumnFile.mpbackmirror] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mpbackmirror);
      veh[TablesColumnFile.mpcolororspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mpcolororspot);
      veh[TablesColumnFile.mftcolorandspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mftcolorandspot);
      veh[TablesColumnFile.mfttanandyan] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mfttanandyan);
      veh[TablesColumnFile.mftcap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mftcap);
      veh[TablesColumnFile.mftsplattercap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mftsplattercap);
      veh[TablesColumnFile.mbpmirror] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbpmirror);
      veh[TablesColumnFile.mbpdoor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbpdoor);
      veh[TablesColumnFile.mbpcolorandspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbpcolorandspot);
      veh[TablesColumnFile.mbtcolorandsport] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtcolorandsport);
      veh[TablesColumnFile.mbttanandyan] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbttanandyan);
      veh[TablesColumnFile.mbtcap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtcap);
      veh[TablesColumnFile.mbcbacklightr] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcbacklightr);
      veh[TablesColumnFile.mbcturnsignal] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcturnsignal);
      veh[TablesColumnFile.mbcmessagesignal] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcmessagesignal);
      veh[TablesColumnFile.mbcsignal] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcsignal);
      veh[TablesColumnFile.mbcbacklightl] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcbacklightl);
      veh[TablesColumnFile.mbcbackdoor] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcbackdoor);
      veh[TablesColumnFile.mbccranes] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbccranes);
      veh[TablesColumnFile.mbctakelock] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbctakelock);
      veh[TablesColumnFile.mbcholdlock] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcholdlock);
      veh[TablesColumnFile.mbchandcranes] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbchandcranes);
      veh[TablesColumnFile.mbcreservetire] = 	 Constant.ifNullCheck(bean.collateralVehicleBean.mbcreservetire);
      veh[TablesColumnFile.mbcbackmirror] = 	 Constant.ifNullCheck(bean.collateralVehicleBean.mbcbackmirror);
      veh[TablesColumnFile.mbcantenna] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbcantenna);
      veh[TablesColumnFile.mbtlcolororspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtlcolororspot);
      veh[TablesColumnFile.mbtltanandyan] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtltanandyan);
      veh[TablesColumnFile.mbtlcap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtlcap);
      veh[TablesColumnFile.mbtlsplattercap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtlsplattercap);
      veh[TablesColumnFile.mbtrcolororspot] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtrcolororspot);
      veh[TablesColumnFile.mbtrtireandyan] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtrtireandyan);
      veh[TablesColumnFile.mbtrcap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtrcap);
      veh[TablesColumnFile.mbtrsplattercap] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mbtrsplattercap);
      veh[TablesColumnFile.mibarsun] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mibarsun);
      veh[TablesColumnFile.midescriptionbook] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.midescriptionbook);
      veh[TablesColumnFile.miautosystem] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.miautosystem);
      veh[TablesColumnFile.miairconditioner] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.miairconditioner);
      veh[TablesColumnFile.mimirrorremote] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mimirrorremote);
      veh[TablesColumnFile.misafebell] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.misafebell);
      veh[TablesColumnFile.mimiddlebox] = 	  Constant.ifNullCheck(bean.collateralVehicleBean.mimiddlebox);
      veh[TablesColumnFile.mregdate] =	Constant.ifDateNullCheck(bean.collateralVehicleBean.mregdate);
      veh[TablesColumnFile.mregexpdate] =	Constant.ifDateNullCheck(bean.collateralVehicleBean.mregexpdate);
      veh[TablesColumnFile.mcreateddt] =	Constant.ifDateNullCheck(bean.collateralVehicleBean.mcreateddt);
      veh[TablesColumnFile.mcreatedby] =	Constant.ifNullCheck(bean.collateralVehicleBean.mcreatedby);
      veh[TablesColumnFile.mlastupdatedt] =	Constant.ifDateNullCheck(bean.collateralVehicleBean.mlastupdatedt);
      veh[TablesColumnFile.mlastupdateby] =	Constant.ifNullCheck(bean.collateralVehicleBean.mlastupdateby);
      veh[TablesColumnFile.mgeolocation] =	Constant.ifNullCheck(bean.collateralVehicleBean.mgeolocation);
      veh[TablesColumnFile.mgeolatd] =	Constant.ifNullCheck(bean.collateralVehicleBean.mgeolatd);
      veh[TablesColumnFile.mgeologd] =	Constant.ifNullCheck(bean.collateralVehicleBean.mgeologd);
      veh[TablesColumnFile.missynctocoresys] = 	  bean.collateralVehicleBean.missynctocoresys==null?0:bean.collateralVehicleBean.missynctocoresys;
      veh[TablesColumnFile.mlastsynsdate] =	Constant.ifDateNullCheck(bean.collateralVehicleBean.mlastsynsdate);

    }

    mapData[TablesColumnFile.collateralRemEntity] = rem;
    mapData[TablesColumnFile.collateralVehicleEntity] = veh;

    return mapData;
  }


  factory CollateralBasicSelectionBean.fromColateralsJson(Map<String, dynamic> map,bool isFromMiddleware) {
    return CollateralBasicSelectionBean(


    );
  }


  //ADDED NEW METHODS FOR GET CollateralBasicSelectionBean
  factory CollateralBasicSelectionBean.fromMapV2(Map<String, dynamic> map) {
    final Map<String, dynamic> data  =  JSON.decode(map[TablesColumnFile.COLLDATA]);
    Constant.getAppPath(data.toString(),"AfterColleralSave");
    print(data);
    return CollateralBasicSelectionBean(
      UUID: map[TablesColumnFile.UUID] as String,
      LOANUUID: map[TablesColumnFile.LOANUUID] as String,
      CUSTUUID: map[TablesColumnFile.CUSTUUID] as String,
      //collateralBasicSelectionBean:data==null?null:CollateralBasicSelectionBean.fromColateralsJson(data,false),
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],


      mleadsid:	data[TablesColumnFile.mleadsid] as String,
      mcollstatus:	data[TablesColumnFile.mcollstatus] as String,
      msrno:	data[TablesColumnFile.msrno] as int,
      mapplicanttype:	data[TablesColumnFile.mapplicanttype] as String,
      collatrlTyp:data[TablesColumnFile.mcollatrlTyp] as String,

      mcustno:	data[TablesColumnFile.mcustno] as int,
      mrelationwithcust:	data[TablesColumnFile.mrelationwithcust] as String,
      mrelationsince:	data[TablesColumnFile.mrelationsince] as int,
      mlastsynsdate:(data[TablesColumnFile.mlastsynsdate]=="null"||data[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(data[TablesColumnFile.mlastsynsdate]) as DateTime,
      merrormessage:data[TablesColumnFile.merrormessage] as String,
      mfname: data[TablesColumnFile.mfname] as String,
      mmname: data[TablesColumnFile.mmname] as String,
      mlname: data[TablesColumnFile.mlname] as String,
      msubcolltrl: data[TablesColumnFile.msubcolltrl] as String,
      msubocolltrldesc: data[TablesColumnFile.msubocolltrldesc] as String,
      msubcolltrlcat: data[TablesColumnFile.msubcolltrlcat] as String,
      msubocolltrlcatdesc: data[TablesColumnFile.msubocolltrlcatdesc] as String,
      collatrlcat: data[TablesColumnFile.mcollatrlcat] as String,
      //relationwithapplicant: data[TablesColumnFile.mrelationwithapplicant] as String,
      nametitle: data[TablesColumnFile.mnametitle] as String,
      insurance: data[TablesColumnFile.minsurance] as String,
      colltrltitle: data[TablesColumnFile.mcolltrltitle] as String,
      mnameoftitledoc: data[TablesColumnFile.mnameoftitledoc] as String,
      mcollbookno: data[TablesColumnFile.mcollbookno] as String,
      mcollpageno: data[TablesColumnFile.mcollpageno] as String,
      mplaceofuse: data[TablesColumnFile.mplaceofuse] as String,
      mwithdrawcond: data[TablesColumnFile.mwithdrawcond] as String,
      mwthdrwcond: data[TablesColumnFile.mwthdrwcond] as String,

      mcollateralsid: data[TablesColumnFile.mcollateralsid] as String,
      missynctocoresys: data[TablesColumnFile.missynctocoresys] as int,
      misappctprimary: data[TablesColumnFile.misappctprimary] as String,
      mislmap: data[TablesColumnFile.mislmap] as String,
      mnoofattchmnt: data[TablesColumnFile.mnoofattchmnt] as String,
      mflag: data[TablesColumnFile.mflag] as String,
      mcollrightid: data[TablesColumnFile.mcollrightid] as String,
      mollcreateid: data[TablesColumnFile.mollcreateid] as String,
      msubprodlimitid: data[TablesColumnFile.msubprodlimitid] as String,
      collateralVehicleBean: data[TablesColumnFile.collateralVehicleEntity]==null?null:CollateralVehicleBean.fromMapMiddleware(data[TablesColumnFile.collateralVehicleEntity]),
      collateralREMlandandhouseBean: data[TablesColumnFile.collateralRemEntity]==null?null:CollateralREMlandandhouseBean.fromMapMiddleware(data[TablesColumnFile.collateralRemEntity]),
      collateralT24Bean: data[TablesColumnFile.collateralT24Entity]==null?null:CollateralT24Bean.fromMapMiddleware(data[TablesColumnFile.collateralT24Entity]),

    );
  }



}

