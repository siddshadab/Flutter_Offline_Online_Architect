import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'dart:convert';

import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';


  class GuarantorDetailsBean {

  static const JsonCodec JSON = const JsonCodec();


  String UUID;
  String LOANUUID;
  String CUSTUUID;
  String mleadsid;
  String mprdacctid;
  String mfname;
  //nvarchar(50)
  String mmname;
  //nvarchar(50)
  String mlname;
  int	msrno ;
  int	mapplicanttype ;
  String	mexistingcustyn ;
  int	mcustno ;
  String	mnameofguar ;
    String	mgender ;
  String	mrelationwithcust ;
  int	mrelationsince ;
  int	mage ;
  String	mphone ;
  String	mmobile ;
  String	maddress ;
  int	mmonthlyincome ;
  DateTime mdob ;
  int	moccupationtype ;
  int	mmainoccupation ;
  int	mworkexpinyrs ;
  double	mincomeothsources ;
  double	mtotalincome ;
  int	mhousetype ;
  String	mworkingaddress ;
  String	mworkphoneno ;
  String	mmothermaidenname ;
  String	mpromissorynote ;
  int	mnationalidtype ;
  int	mnationalid ;
  String	mnationaliddesc ;
  String	maddress2 ;
  String	maddress3 ;
  String	maddress4 ;
  int	mmaritalstatus ;
  int	mreligioncd ;
  String	meducationalqual ;
  String	memailaddr ;
  String	memployername ;
  String	mbusinessname ;
  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  DateTime mlastsynsdate;
  String merrormessage;


  String	mrevsrc1 ;
  String	mrevsrc2;
  String	mnamesrc1 ;
  String	mnamesrc2;
  double	mrev1 ;
  double	mrev2;
  double	mexp1 ;
  double	mexp2;
  double	minc1 ;
  double	minc2;
  double	mrevtotal ;
  double	mexptotal ;
  double	minctotal ;
  String	mpldggurproprty1 ;
  String	mpldggurproprty2;
  String	mpldggurproprty3;
  double	msize1 ;
  double	msize2;
  double	msize3 ;
  double	mcollvalue1 ;
  double	mcollvalue2;
  double	mcollvalue3 ;
  double	mcollvaluetotal;
  GuarantorDetailsBean guarantorDetailsBean;
  CustomerListBean customerListBean;


  GuarantorDetailsBean(
      {
        this.UUID,
        this.LOANUUID,
        this.CUSTUUID,
        this.mleadsid,
        this.mprdacctid,
        this.msrno,
        this.mapplicanttype,
        this.mexistingcustyn,
        this.mcustno,
        this.mnameofguar,
        this.mgender,
        this.mrelationwithcust,
        this.mrelationsince,
        this.mage,
        this.mphone,
        this.mmobile,
        this.maddress,
        this.mmonthlyincome,
        this.mdob,
        this.moccupationtype,
        this.mmainoccupation,
        this.mworkexpinyrs,
        this.mincomeothsources,
        this.mtotalincome,
        this.mhousetype,
        this.mworkingaddress,
        this.mworkphoneno,
        this.mmothermaidenname,
        this.mpromissorynote,
        this.mnationalidtype,
        this.mnationalid,
        this.mnationaliddesc,
        this.maddress2,
        this.maddress3,
        this.maddress4,
        this.mmaritalstatus,
        this.mreligioncd,
        this.meducationalqual,
        this.memailaddr,
        this.memployername,
        this.mbusinessname,
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
        this.mrevsrc1 ,
        this.mrevsrc2,
        this.mnamesrc1 ,
        this.mnamesrc2,
        this.mrev1 ,
        this.mrev2,
        this.mexp1 ,
        this.mexp2,
        this.minc1 ,
        this.minc2,
        this.mrevtotal ,
        this.mexptotal ,
        this.minctotal ,
        this.mpldggurproprty1 ,
        this.mpldggurproprty2,
        this.mpldggurproprty3,
        this.msize1 ,
        this.msize2,
        this.msize3 ,
        this.mcollvalue1 ,
        this.mcollvalue2,
        this.mcollvalue3 ,
        this.mcollvaluetotal,
        this.guarantorDetailsBean,
        this.customerListBean
        });



  static Future<Map> toGuaranterJson(GuarantorDetailsBean bean) async {

    var mapData = new Map();

    if(bean.customerListBean!=null){
      mapData= await CustomerListBean.toCustomerJson(bean.customerListBean);
    }
    mapData[TablesColumnFile.mleadsid] =	Constant.ifNullCheck(bean.mleadsid);
    mapData[TablesColumnFile.mprdacctid] =	Constant.ifNullCheck(bean.mprdacctid);
    mapData[TablesColumnFile.msrno] =	bean.msrno !=null ? bean.msrno :0;
    mapData[TablesColumnFile.mapplicanttype] =	bean.mapplicanttype !=null ? bean.mapplicanttype:0;
    mapData[TablesColumnFile.mexistingcustyn] =	Constant.ifNullCheck(bean.mexistingcustyn);
    mapData[TablesColumnFile.mcustno] =	bean.mcustno !=null ? bean.mcustno:0;
    mapData[TablesColumnFile.mnameofguar] =	Constant.ifNullCheck(bean.mnameofguar);
    mapData[TablesColumnFile.mgender] =	Constant.ifNullCheck(bean.mgender);
    mapData[TablesColumnFile.mrelationwithcust] =	Constant.ifNullCheck(bean.mrelationwithcust);
    mapData[TablesColumnFile.mrelationsince] =	bean.mrelationsince !=null ? bean.mrelationsince:0;
    mapData[TablesColumnFile.mage] =	bean.mage !=null ? bean.mage:0;
    mapData[TablesColumnFile.mphone] =	Constant.ifNullCheck(bean.mphone);
    mapData[TablesColumnFile.mmobile] =	Constant.ifNullCheck(bean.mmobile);
    mapData[TablesColumnFile.maddress] =	Constant.ifNullCheck(bean.maddress);
    mapData[TablesColumnFile.mmonthlyincome] =	bean.mmonthlyincome!=null?bean.mmonthlyincome:0;
    mapData[TablesColumnFile.mdob] =	Constant.ifDateNullCheck(bean.mdob) ;
    mapData[TablesColumnFile.moccupationtype] =	bean.moccupationtype!=null ? bean.moccupationtype:0;
    mapData[TablesColumnFile.mmainoccupation] =	bean.mmainoccupation !=null ? bean.mmainoccupation:0;
    mapData[TablesColumnFile.mworkexpinyrs] =	bean.mworkexpinyrs !=null ? bean.mworkexpinyrs:0;
    mapData[TablesColumnFile.mincomeothsources] =	bean.mincomeothsources!=null? bean.mincomeothsources:0;
    mapData[TablesColumnFile.mtotalincome] =	bean.mtotalincome!=null? bean.mtotalincome:0;mapData[TablesColumnFile.mhousetype] =	bean.mhousetype!=null ? bean.mhousetype:0;
    mapData[TablesColumnFile.mworkingaddress] =	Constant.ifNullCheck(bean.mworkingaddress);
    mapData[TablesColumnFile.mworkphoneno] =	Constant.ifNullCheck(bean.mworkphoneno);
    mapData[TablesColumnFile.mmothermaidenname] =	Constant.ifNullCheck(bean.mmothermaidenname);
    mapData[TablesColumnFile.mpromissorynote] =	Constant.ifNullCheck(bean.mpromissorynote);
    mapData[TablesColumnFile.mnationalidtype] =	bean.mnationalidtype!=null ? bean.mnationalidtype:0;
    mapData[TablesColumnFile.mnationalid] =	bean.mnationalid !=null ? bean.mnationalid:0;
    mapData[TablesColumnFile.mnationaliddesc] =	Constant.ifNullCheck(bean.mnationaliddesc);
    mapData[TablesColumnFile.maddress2] =	Constant.ifNullCheck(bean.maddress2);
    mapData[TablesColumnFile.maddress3] =	Constant.ifNullCheck(bean.maddress3);
    mapData[TablesColumnFile.maddress4] =	Constant.ifNullCheck(bean.maddress4);
    mapData[TablesColumnFile.mmaritalstatus] =	bean.mmaritalstatus!=null ? bean.mmaritalstatus:0;
    mapData[TablesColumnFile.mreligioncd] =	bean.mreligioncd!=null ? bean.mreligioncd:0;
    mapData[TablesColumnFile.meducationalqual] =	Constant.ifNullCheck(bean.meducationalqual);
    mapData[TablesColumnFile.memailaddr] =	Constant.ifNullCheck(bean.memailaddr);
    mapData[TablesColumnFile.memployername] =	Constant.ifNullCheck(bean.memployername);
    mapData[TablesColumnFile.mbusinessname] =	Constant.ifNullCheck(bean.mbusinessname);
    mapData[TablesColumnFile.mcreateddt] =	Constant.ifDateNullCheck(bean.mcreateddt);
    mapData[TablesColumnFile.mcreatedby] =	Constant.ifNullCheck(bean.mcreatedby);
    mapData[TablesColumnFile.mlastupdatedt] =	Constant.ifDateNullCheck(bean.mlastupdatedt);
    mapData[TablesColumnFile.mlastupdateby] =	Constant.ifNullCheck(bean.mlastupdateby);
    mapData[TablesColumnFile.mgeolocation] =	Constant.ifNullCheck(bean.mgeolocation);
    mapData[TablesColumnFile.mgeolatd] =	Constant.ifNullCheck(bean.mgeolatd);
    mapData[TablesColumnFile.mgeologd] =	Constant.ifNullCheck(bean.mgeologd);
    mapData[TablesColumnFile.mlastsynsdate] =	Constant.ifDateNullCheck(bean.mlastsynsdate);
    mapData[TablesColumnFile.merrormessage] =	Constant.ifNullCheck(bean.merrormessage);

    mapData[TablesColumnFile.mrevsrc1 ]=	Constant.ifNullCheck(bean.mrevsrc1);
    mapData[TablesColumnFile.mrevsrc2]=	Constant.ifNullCheck(bean.mrevsrc2);
    mapData[TablesColumnFile.mnamesrc1 ]=	Constant.ifNullCheck(bean.mnamesrc1);
    mapData[TablesColumnFile.mnamesrc2]=	Constant.ifNullCheck(bean.mnamesrc2);
    mapData[TablesColumnFile.mrev1 ]=bean.mrev1!=null ? bean.mrev1:0;
    mapData[TablesColumnFile.mrev2]=	bean.mrev2!=null ? bean.mrev2:0;
    mapData[TablesColumnFile.mexp1 ]=	bean.mexp1!=null ? bean.mexp1:0;
    mapData[TablesColumnFile.mexp2]=	bean.mexp2!=null ? bean.mexp2:0;
    mapData[TablesColumnFile.minc1 ]=	bean.minc1!=null ? bean.minc1:0;
    mapData[TablesColumnFile.minc2]=	bean.minc2!=null ? bean.minc2:0;
    mapData[TablesColumnFile.mrevtotal ]=bean.mrevtotal!=null ? bean.mrevtotal:0;
    mapData[TablesColumnFile.mexptotal ]=	bean.mexptotal!=null ? bean.mexptotal:0;
    mapData[TablesColumnFile.minctotal ]=	bean.minctotal!=null ? bean.minctotal:0;
    mapData[TablesColumnFile.mpldggurproprty1 ]=	Constant.ifNullCheck(bean.mpldggurproprty1);
    mapData[TablesColumnFile.mpldggurproprty2]=	Constant.ifNullCheck(bean.mpldggurproprty2);
    mapData[TablesColumnFile.mpldggurproprty3]=	Constant.ifNullCheck(bean.mpldggurproprty3);
    mapData[TablesColumnFile.msize1 ]=	bean.msize1!=null ? bean.msize1:0;
    mapData[TablesColumnFile.msize2]=	bean.msize2!=null ? bean.msize2:0;
    mapData[TablesColumnFile.msize3 ]=bean.msize3!=null ? bean.msize3:0;
    mapData[TablesColumnFile.mcollvalue1 ]=	bean.mcollvalue1!=null ? bean.mcollvalue1:0;
    mapData[TablesColumnFile.mcollvalue2]=	bean.mcollvalue2!=null ? bean.mcollvalue2:0;
    mapData[TablesColumnFile.mcollvalue3 ]=bean.mcollvalue3!=null ? bean.mcollvalue3:0;
    mapData[TablesColumnFile.mcollvaluetotal]=	bean.mcollvaluetotal!=null ? bean.mcollvaluetotal:0;

    return mapData;
  }

  factory GuarantorDetailsBean.fromGuaranterJson(Map<String, dynamic> map,bool isFromMiddleware) {
    return GuarantorDetailsBean(
      mleadsid:	map[TablesColumnFile.mleadsid] as String,
      mprdacctid:	map[TablesColumnFile.mprdacctid] as String,
      msrno:	map[TablesColumnFile.msrno] as int,
      mapplicanttype:	map[TablesColumnFile.mapplicanttype] as int,
      mexistingcustyn:	map[TablesColumnFile.mexistingcustyn] as String,
      mcustno:	map[TablesColumnFile.mcustno] as int,
      mnameofguar:	map[TablesColumnFile.mnameofguar] as String,
      mgender:	map[TablesColumnFile.mgender] as String,
      mrelationwithcust:	map[TablesColumnFile.mrelationwithcust] as String,
      mrelationsince:	map[TablesColumnFile.mrelationsince] as int,
      mage:	map[TablesColumnFile.mage] as int,
      mphone:	map[TablesColumnFile.mphone] as String,
      mmobile:	map[TablesColumnFile.mmobile] as String,
      maddress:	map[TablesColumnFile.maddress] as String,
      mmonthlyincome:	map[TablesColumnFile.mmonthlyincome] as int,
      mdob:	(map[TablesColumnFile.mdob]=="null"||map[TablesColumnFile.mdob]==null)?null:DateTime.parse(map[TablesColumnFile.mdob]) as DateTime,
      moccupationtype:	map[TablesColumnFile.moccupationtype] as int,
      mmainoccupation:	map[TablesColumnFile.mmainoccupation] as int,
      mworkexpinyrs:	map[TablesColumnFile.mworkexpinyrs] as int,
      mincomeothsources:	map[TablesColumnFile.mincomeothsources] as double,
      mtotalincome:	map[TablesColumnFile.mtotalincome] as double,
      mhousetype:	map[TablesColumnFile.mhousetype] as int,
      mworkingaddress:	map[TablesColumnFile.mworkingaddress] as String,
      mworkphoneno:	map[TablesColumnFile.mworkphoneno] as String,
      mmothermaidenname:	map[TablesColumnFile.mmothermaidenname] as String,
      mpromissorynote:	map[TablesColumnFile.mpromissorynote] as String,
      mnationalidtype:	map[TablesColumnFile.mnationalidtype] as int,
      mnationalid:	map[TablesColumnFile.mnationalid] as int,
      mnationaliddesc:	map[TablesColumnFile.mnationaliddesc] as String,
      maddress2:	map[TablesColumnFile.maddress2] as String,
      maddress3:	map[TablesColumnFile.maddress3] as String,
      maddress4:	map[TablesColumnFile.maddress4] as String,
      mmaritalstatus:	map[TablesColumnFile.mmaritalstatus] as int,
      mreligioncd:	map[TablesColumnFile.mreligioncd] as int,
      meducationalqual:	map[TablesColumnFile.meducationalqual] as String,
      memailaddr:	map[TablesColumnFile.memailaddr] as String,
      memployername:	map[TablesColumnFile.memployername] as String,
      mbusinessname:	map[TablesColumnFile.mbusinessname] as String,
      mcreateddt:	(map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:map[TablesColumnFile.mgeolatd] as String,
      mgeologd:map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,
      merrormessage:map[TablesColumnFile.merrormessage] as String,
      mfname: map[TablesColumnFile.mfname] as String,
      mmname: map[TablesColumnFile.mmname] as String,
      mlname: map[TablesColumnFile.mlname] as String,

      mrevsrc1 :		 map[TablesColumnFile.mrevsrc1] as String,
      mrevsrc2:		  map[TablesColumnFile.mrevsrc2] as String,
      mnamesrc1 :		  map[TablesColumnFile.mnamesrc1] as String,
      mnamesrc2:		  map[TablesColumnFile.mnamesrc2] as String,
      mrev1 :		  map[TablesColumnFile.mrev1] as double,
      mrev2:		  map[TablesColumnFile.mrev2] as double,
      mexp1 :		  map[TablesColumnFile.mexp1] as double,
      mexp2:		  map[TablesColumnFile.mexp2] as double,
      minc1 :		  map[TablesColumnFile.minc1] as double,
      minc2:		  map[TablesColumnFile.minc2] as double,
      mrevtotal :		  map[TablesColumnFile.mrevtotal] as double,
      mexptotal :		  map[TablesColumnFile.mexptotal] as double,
      minctotal :		  map[TablesColumnFile.minctotal] as double,
      mpldggurproprty1 :		  map[TablesColumnFile.mpldggurproprty1] as String,
      mpldggurproprty2:		  map[TablesColumnFile.mpldggurproprty2] as String,
      mpldggurproprty3:		  map[TablesColumnFile.mpldggurproprty3] as String,
      msize1 :		  map[TablesColumnFile.msize1] as double,
      msize2:		  map[TablesColumnFile.msize2] as double,
      msize3 :		  map[TablesColumnFile.msize3] as double,
      mcollvalue1 :		  map[TablesColumnFile.mcollvalue1] as double,
      mcollvalue2:		  map[TablesColumnFile.mcollvalue2] as double,
      mcollvalue3 :		  map[TablesColumnFile.mcollvalue3] as double,
      mcollvaluetotal:		  map[TablesColumnFile.mcollvaluetotal] as double,

    );
  }

  //ADDED NEW METHODS FOR GET GUARANTER
  factory GuarantorDetailsBean.fromMapV2(Map<String, dynamic> map) {
    final Map<String, dynamic> data  =  JSON.decode(map[TablesColumnFile.GUARDATA]);
    Constant.getAppPath(data.toString(),"AfterSaveGuarantor");
    print(data);
    return GuarantorDetailsBean(
      UUID: map[TablesColumnFile.UUID] as String,
      LOANUUID: map[TablesColumnFile.LOANUUID] as String,
      CUSTUUID: map[TablesColumnFile.CUSTUUID] as String,
      //guarantorDetailsBean:data==null?null:GuarantorDetailsBean.fromGuaranterJson(data,false),
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      mleadsid:	data[TablesColumnFile.mleadsid] as String,
      mprdacctid:	data[TablesColumnFile.mprdacctid] as String,
      msrno:	data[TablesColumnFile.msrno] as int,
      mapplicanttype:	data[TablesColumnFile.mapplicanttype] as int,
      mexistingcustyn:	data[TablesColumnFile.mexistingcustyn] as String,
      mcustno:	data[TablesColumnFile.mcustno] as int,
      mnameofguar:	data[TablesColumnFile.mnameofguar] as String,
      mgender:	data[TablesColumnFile.mgender] as String,
      mrelationwithcust:	data[TablesColumnFile.mrelationwithcust] as String,
      mrelationsince:	data[TablesColumnFile.mrelationsince] as int,
      mage:	data[TablesColumnFile.mage] as int,
      mphone:	data[TablesColumnFile.mphone] as String,
      mmobile:	data[TablesColumnFile.mmobile] as String,
      maddress:	data[TablesColumnFile.maddress] as String,
      mmonthlyincome:	data[TablesColumnFile.mmonthlyincome] as int,
      mdob:	(data[TablesColumnFile.mdob]=="null"||data[TablesColumnFile.mdob]==null)?null:DateTime.parse(data[TablesColumnFile.mdob]) as DateTime,
      moccupationtype:	data[TablesColumnFile.moccupationtype] as int,
      mmainoccupation:	data[TablesColumnFile.mmainoccupation] as int,
      mworkexpinyrs:	data[TablesColumnFile.mworkexpinyrs] as int,
      //mincomeothsources:	data[TablesColumnFile.mincomeothsources] as double,
      //mtotalincome:	data[TablesColumnFile.mtotalincome] as double,
      mhousetype:	data[TablesColumnFile.mhousetype] as int,
      mworkingaddress:	data[TablesColumnFile.mworkingaddress] as String,
      mworkphoneno:	data[TablesColumnFile.mworkphoneno] as String,
      mmothermaidenname:	data[TablesColumnFile.mmothermaidenname] as String,
      mpromissorynote:	data[TablesColumnFile.mpromissorynote] as String,
      mnationalidtype:	data[TablesColumnFile.mnationalidtype] as int,
      mnationalid:	data[TablesColumnFile.mnationalid] as int,
      mnationaliddesc:	data[TablesColumnFile.mnationaliddesc] as String,
      maddress2:	data[TablesColumnFile.maddress2] as String,
      maddress3:	data[TablesColumnFile.maddress3] as String,
      maddress4:	data[TablesColumnFile.maddress4] as String,
      mmaritalstatus:	data[TablesColumnFile.mmaritalstatus] as int,
      mreligioncd:	data[TablesColumnFile.mreligioncd] as int,
      meducationalqual:	data[TablesColumnFile.meducationalqual] as String,
      memailaddr:	data[TablesColumnFile.memailaddr] as String,
      memployername:	data[TablesColumnFile.memployername] as String,
      mbusinessname:	data[TablesColumnFile.mbusinessname] as String,
      merrormessage:data[TablesColumnFile.merrormessage] as String,
      mfname: data[TablesColumnFile.mfname] as String,
      mmname: data[TablesColumnFile.mmname] as String,
      mlname: data[TablesColumnFile.mlname] as String,
      mrevsrc1 :		 data[TablesColumnFile.mrevsrc1] as String,
      mrevsrc2:		  data[TablesColumnFile.mrevsrc2] as String,
      mnamesrc1 :		  data[TablesColumnFile.mnamesrc1] as String,
      mnamesrc2:		  data[TablesColumnFile.mnamesrc2] as String,
     // mrev1 :		  data[TablesColumnFile.mrev1] as double,
      //mrev2:		  data[TablesColumnFile.mrev2] as double,
      //mexp1 :		  data[TablesColumnFile.mexp1] as double,
      //mexp2:		  data[TablesColumnFile.mexp2] as double,
      //minc1 :		  data[TablesColumnFile.minc1] as double,
      //minc2:		  data[TablesColumnFile.minc2] as double,
      //mrevtotal :		  data[TablesColumnFile.mrevtotal] as double,
      //mexptotal :		  data[TablesColumnFile.mexptotal] as double,
      //minctotal :		  data[TablesColumnFile.minctotal] as double,
      mpldggurproprty1 :		  data[TablesColumnFile.mpldggurproprty1] as String,
      mpldggurproprty2:		  data[TablesColumnFile.mpldggurproprty2] as String,
      mpldggurproprty3:		  data[TablesColumnFile.mpldggurproprty3] as String,
      // msize1 :		  data[TablesColumnFile.msize1] as double,
      // msize2:		  data[TablesColumnFile.msize2] as double,
      // msize3 :		  data[TablesColumnFile.msize3] as double,
      // mcollvalue1 :		  data[TablesColumnFile.mcollvalue1] as double,
      // mcollvalue2:		  data[TablesColumnFile.mcollvalue2] as double,
      // mcollvalue3 :		  data[TablesColumnFile.mcollvalue3] as double,
      // mcollvaluetotal:		  data[TablesColumnFile.mcollvaluetotal] as double,
    );
  }

}

