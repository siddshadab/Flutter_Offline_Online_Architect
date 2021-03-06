import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';

class CollateralVehicleBean {


  int msrno;
  int mlbrcode;
  String mprdacctid;
  String msectype;
  String mbusinessname;
  String mownername;
  String mtel;
  String maddress1;
  String maddress2;
  String mcountry;
  String mstate;
  String mdist;
  String msubdist;
  String marea;
  String mvillage;
  String mbrand;
  int mnoofaxles;
  String mtype;
  int mnoofcylinder;
  String mcolor;
  int msizeofcylinder;
  String mbodyno;
  double menginepower;
  String mengineno;
  int myearmade;
  String mchassisno;
  String mmadeby;
  String midentitycarno;
  double mcarpricing;
  double mstdpricing;
  double minsurancepricing;
  double mpriceafterevaluation;
  double mltv;
  String mcartype;
  String mltvdd;
  String mloantovalueltv;
  String mwhobelongocarowner;
  int mcarlegality;
  String mreason;


  String mdescription;
  String mcarcanbeused;
  String mcredittenor;
  String mdmirror;
  String mddoor;
  String mdmirrorbacklock;
  String mdcolororspot;
  String mfcolorandspot;
  String mftireandyan;
  String mfcapofsplatter;
  String mhmirror;
  String mhvent;
  String mhlightfarl;
  String mhlightfarr;
  String mhsignal;
  String mhwincap;
  String mhheadcap;
  String mpmirror;
  String mpdoor;
  String mpbackmirror;
  String mpcolororspot;
  String mftcolorandspot;
  String mfttanandyan;
  String mftcap;
  String mftsplattercap;
  String mbpmirror;
  String mbpdoor;
  String mbpcolorandspot;
  String mbtcolorandsport;
  String mbttanandyan;
  String mbtcap;
  String mbcbacklightr;
  String mbcturnsignal;
  String mbcmessagesignal;
  String mbcsignal;
  String mbcbacklightl;
  String mbcbackdoor;
  String mbccranes;
  String mbctakelock;
  String mbcholdlock;
  String mbchandcranes;
  String mbcreservetire;
  String mbcbackmirror;
  String mbcantenna;
  String mbtlcolororspot;
  String mbtltanandyan;
  String mbtlcap;
  String mbtlsplattercap;
  String mbtrcolororspot;
  String mbtrtireandyan;
  String mbtrcap;
  String mbtrsplattercap;
  String mibarsun;
  String midescriptionbook;
  String miautosystem;
  String miairconditioner;
  String mimirrorremote;
  String misafebell;
  String mimiddlebox;
  DateTime mregdate;
  DateTime mregexpdate;
  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  int missynctocoresys;
  DateTime mlastsynsdate;


  CollateralVehicleBean(
      {

        this.msrno,
        this.mlbrcode,
        this.mprdacctid,
        this.msectype,

        this.mbusinessname,
        this.mownername,
        this.mtel,
        this.maddress1,
        this.maddress2,
        this.mcountry,
        this.mstate,
        this.mdist,
        this.msubdist,
        this.marea,
        this.mvillage,
        this.mbrand,
        this.mnoofaxles,
        this.mtype,
        this.mnoofcylinder,
        this.mcolor,
        this.msizeofcylinder,
        this.mbodyno,
        this.menginepower,
        this.mengineno,
        this.myearmade,
        this.mchassisno,
        this.mmadeby,
        this.midentitycarno,
        this.mcarpricing,
        this.mstdpricing,
        this.minsurancepricing,
        this.mpriceafterevaluation,
        this.mltv,
        this.mcartype,
        this.mltvdd,
        this.mloantovalueltv,
        this.mwhobelongocarowner,
        this.mcarlegality,
        this.mreason,
        this.mdescription,
        this.mcarcanbeused,
        this.mcredittenor,
        this.mdmirror,
        this.mddoor,
        this.mdmirrorbacklock,
        this.mdcolororspot,
        this.mfcolorandspot,
        this.mftireandyan,
        this.mfcapofsplatter,
        this.mhmirror,
        this.mhvent,
        this.mhlightfarl,
        this.mhlightfarr,
        this.mhsignal,
        this.mhwincap,
        this.mhheadcap,
        this.mpmirror,
        this.mpdoor,
        this.mpbackmirror,
        this.mpcolororspot,
        this.mftcolorandspot,
        this.mfttanandyan,
        this.mftcap,
        this.mftsplattercap,
        this.mbpmirror,
        this.mbpdoor,
        this.mbpcolorandspot,
        this.mbtcolorandsport,
        this.mbttanandyan,
        this.mbtcap,
        this.mbcbacklightr,
        this.mbcturnsignal,
        this.mbcmessagesignal,
        this.mbcsignal,
        this.mbcbacklightl,
        this.mbcbackdoor,
        this.mbccranes,
        this.mbctakelock,
        this.mbcholdlock,
        this.mbchandcranes,
        this.mbcreservetire,
        this.mbcbackmirror,
        this.mbcantenna,
        this.mbtlcolororspot,
        this.mbtltanandyan,
        this.mbtlcap,
        this.mbtlsplattercap,
        this.mbtrcolororspot,
        this.mbtrtireandyan,
        this.mbtrcap,
        this.mbtrsplattercap,
        this.mibarsun,
        this.midescriptionbook,
        this.miautosystem,
        this.miairconditioner,
        this.mimirrorremote,
        this.misafebell,
        this.mimiddlebox,
        this.mregdate,
        this.mregexpdate,
        this.mcreateddt,
        this.mcreatedby,
        this.mlastupdatedt,
        this.mlastupdateby,
        this.mgeolocation,
        this.mgeolatd,
        this.mgeologd,
        this.missynctocoresys,
        this.mlastsynsdate
      });

  factory CollateralVehicleBean.fromMap(Map<String, dynamic> map) {
    return CollateralVehicleBean(

      msrno :	map[TablesColumnFile.msrno] as int,
      mlbrcode:	map[TablesColumnFile.mlbrcode] as int,
      mprdacctid:	map[TablesColumnFile.mprdacctid] as String,
      msectype:	map[TablesColumnFile.msectype] as String,

      mbusinessname:	map[TablesColumnFile.mbusinessname] as String,
      mownername:	map[TablesColumnFile.mownername] as String,
      mtel:	map[TablesColumnFile.mtel] as String,
      maddress1:	map[TablesColumnFile.maddress1] as String,
      maddress2:	map[TablesColumnFile.maddress2] as String,
      mcountry:	map[TablesColumnFile.mcountry] as String,
      mstate:	map[TablesColumnFile.mstate] as String,
      mdist:	map[TablesColumnFile.mdist] as String,
      msubdist:	map[TablesColumnFile.msubdist] as String,
      marea:	map[TablesColumnFile.marea] as String,
      mvillage:	map[TablesColumnFile.mvillage] as String,
      mbrand:	map[TablesColumnFile.mbrand] as String,
      mnoofaxles:	map[TablesColumnFile.mnoofaxles] as int,
      mtype:	map[TablesColumnFile.mtype] as String,
      mnoofcylinder:	map[TablesColumnFile.mnoofcylinder] as int,
      mcolor:	map[TablesColumnFile.mcolor] as String,
      msizeofcylinder:	map[TablesColumnFile.msizeofcylinder] as int,
      mbodyno:	map[TablesColumnFile.mbodyno] as String,
      menginepower:	map[TablesColumnFile.menginepower] as double,
      mengineno:	map[TablesColumnFile.mengineno] as String,
      myearmade:	map[TablesColumnFile.myearmade] as int,
      mchassisno:	map[TablesColumnFile.mchassisno] as String,
      mmadeby:	map[TablesColumnFile.mmadeby] as String,
      midentitycarno:	map[TablesColumnFile.midentitycarno] as String,
      mcarpricing:	map[TablesColumnFile.mcarpricing] as double,
      mstdpricing:	map[TablesColumnFile.mstdpricing] as double,
      minsurancepricing:	map[TablesColumnFile.minsurancepricing] as double,
      mpriceafterevaluation:	map[TablesColumnFile.mpriceafterevaluation] as double,
      mltv:	map[TablesColumnFile.mltv] as double,
      mcartype:	map[TablesColumnFile.mcartype] as String,
      mltvdd:	map[TablesColumnFile.mltvdd] as String,
      mloantovalueltv:	map[TablesColumnFile.mloantovalueltv] as String,
      mwhobelongocarowner:	map[TablesColumnFile.mwhobelongocarowner] as String,
      mcarlegality:	map[TablesColumnFile.mcarlegality] as int,
      mreason:	map[TablesColumnFile.mreason] as String,
      mdescription:	map[TablesColumnFile.mdescription] as String,
      mcarcanbeused:	map[TablesColumnFile.mcarcanbeused] as String,
      mcredittenor:	map[TablesColumnFile.mcredittenor] as String,
      mdmirror:	map[TablesColumnFile.mdmirror] as String,
      mddoor:	map[TablesColumnFile.mddoor] as String,
      mdmirrorbacklock:	map[TablesColumnFile.mdmirrorbacklock] as String,
      mdcolororspot:	map[TablesColumnFile.mdcolororspot] as String,
      mfcolorandspot:	map[TablesColumnFile.mfcolorandspot] as String,
      mftireandyan:	map[TablesColumnFile.mftireandyan] as String,
      mfcapofsplatter:	map[TablesColumnFile.mfcapofsplatter] as String,
      mhmirror:	map[TablesColumnFile.mhmirror] as String,
      mhvent:	map[TablesColumnFile.mhvent] as String,
      mhlightfarl:	map[TablesColumnFile.mhlightfarl] as String,
      mhlightfarr:	map[TablesColumnFile.mhlightfarr] as String,
      mhsignal:	map[TablesColumnFile.mhsignal] as String,
      mhwincap:	map[TablesColumnFile.mhwincap] as String,
      mhheadcap:	map[TablesColumnFile.mhheadcap] as String,
      mpmirror:	map[TablesColumnFile.mpmirror] as String,
      mpdoor:	map[TablesColumnFile.mpdoor] as String,
      mpbackmirror:	map[TablesColumnFile.mpbackmirror] as String,
      mpcolororspot:	map[TablesColumnFile.mpcolororspot] as String,
      mftcolorandspot:	map[TablesColumnFile.mftcolorandspot] as String,
      mfttanandyan:	map[TablesColumnFile.mfttanandyan] as String,
      mftcap:	map[TablesColumnFile.mftcap] as String,
      mftsplattercap:	map[TablesColumnFile.mftsplattercap] as String,
      mbpmirror:	map[TablesColumnFile.mbpmirror] as String,
      mbpdoor:	map[TablesColumnFile.mbpdoor] as String,
      mbpcolorandspot:	map[TablesColumnFile.mbpcolorandspot] as String,
      mbtcolorandsport:	map[TablesColumnFile.mbtcolorandsport] as String,
      mbttanandyan:	map[TablesColumnFile.mbttanandyan] as String,
      mbtcap:	map[TablesColumnFile.mbtcap] as String,
      mbcbacklightr:	map[TablesColumnFile.mbcbacklightr] as String,
      mbcturnsignal:	map[TablesColumnFile.mbcturnsignal] as String,
      mbcmessagesignal:	map[TablesColumnFile.mbcmessagesignal] as String,
      mbcsignal:	map[TablesColumnFile.mbcsignal] as String,
      mbcbacklightl:	map[TablesColumnFile.mbcbacklightl] as String,
      mbcbackdoor:	map[TablesColumnFile.mbcbackdoor] as String,
      mbccranes:	map[TablesColumnFile.mbccranes] as String,
      mbctakelock:	map[TablesColumnFile.mbctakelock] as String,
      mbcholdlock:	map[TablesColumnFile.mbcholdlock] as String,
      mbchandcranes:	map[TablesColumnFile.mbchandcranes] as String,
      mbcreservetire:	map[TablesColumnFile.mbcreservetire] as String,
      mbcbackmirror:	map[TablesColumnFile.mbcbackmirror] as String,
      mbcantenna:	map[TablesColumnFile.mbcantenna] as String,
      mbtlcolororspot:	map[TablesColumnFile.mbtlcolororspot] as String,
      mbtltanandyan:	map[TablesColumnFile.mbtltanandyan] as String,
      mbtlcap:	map[TablesColumnFile.mbtlcap] as String,
      mbtlsplattercap:	map[TablesColumnFile.mbtlsplattercap] as String,
      mbtrcolororspot:	map[TablesColumnFile.mbtrcolororspot] as String,
      mbtrtireandyan:	map[TablesColumnFile.mbtrtireandyan] as String,
      mbtrcap:	map[TablesColumnFile.mbtrcap] as String,
      mbtrsplattercap:	map[TablesColumnFile.mbtrsplattercap] as String,
      mibarsun:	map[TablesColumnFile.mibarsun] as String,
      midescriptionbook:	map[TablesColumnFile.midescriptionbook] as String,
      miautosystem:	map[TablesColumnFile.miautosystem] as String,
      miairconditioner:	map[TablesColumnFile.miairconditioner] as String,
      mimirrorremote:	map[TablesColumnFile.mimirrorremote] as String,
      misafebell:	map[TablesColumnFile.misafebell] as String,
      mimiddlebox:	map[TablesColumnFile.mimiddlebox] as String,

      mregdate: (map[TablesColumnFile.mregdate]=="null"||map[TablesColumnFile.mregdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregdate]) as DateTime,
      mregexpdate: (map[TablesColumnFile.mregexpdate]=="null"||map[TablesColumnFile.mregexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregexpdate]) as DateTime,
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      missynctocoresys:(map[TablesColumnFile.missynctocoresys]=="null"||map[TablesColumnFile.missynctocoresys]==null)?0:map[TablesColumnFile.missynctocoresys] as int,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,

    );
  }

  factory CollateralVehicleBean.fromMapMiddleware(
      Map<String, dynamic> map) {
    Constant.printBigString(map.toString(),'Vehicle Object');

    return CollateralVehicleBean(
      mbusinessname:	map[TablesColumnFile.mbusinessname] as String,
      mownername:	map[TablesColumnFile.mownername] as String,
      mtel:	map[TablesColumnFile.mtel] as String,
      maddress1:	map[TablesColumnFile.maddress1] as String,
      maddress2:	map[TablesColumnFile.maddress2] as String,
      mcountry:	map[TablesColumnFile.mcountrycd] as String,
      mstate:	map[TablesColumnFile.mstate] as String,
      mdist:	map[TablesColumnFile.mdistcd] as String,
      msubdist:	map[TablesColumnFile.msubdist] as String,
      marea:	map[TablesColumnFile.mareatype] as String,
      mvillage:	map[TablesColumnFile.mvillage] as String,
      mbrand:	map[TablesColumnFile.mbrand] as String,
      mnoofaxles:	map[TablesColumnFile.mnoofaxles] as int,
      mtype:	map[TablesColumnFile.mtype] as String,
      mnoofcylinder:	map[TablesColumnFile.mnoofcylinder] as int,
      mcolor:	map[TablesColumnFile.mcolor] as String,
      msizeofcylinder:	map[TablesColumnFile.msizeofcylinder] as int,
      mbodyno:	map[TablesColumnFile.mbodyno] as String,
      //menginepower:	map[TablesColumnFile.menginepower] as double,
      mengineno:	map[TablesColumnFile.mengineno] as String,
      myearmade:	map[TablesColumnFile.myearmade] as int,
      mchassisno:	map[TablesColumnFile.mchassisno] as String,
      mmadeby:	map[TablesColumnFile.mmadeby] as String,
      midentitycarno:	map[TablesColumnFile.midentitycarno] as String,
      //mcarpricing:	map[TablesColumnFile.mcarpricing] as double,
      //mstdpricing:	map[TablesColumnFile.mstdpricing] as double,
      //minsurancepricing:	map[TablesColumnFile.minsurancepricing] as double,
      //mpriceafterevaluation:	map[TablesColumnFile.mpriceafterevaluation] as double,
      //mltv:	map[TablesColumnFile.mltv] as double,
      mcartype:	map[TablesColumnFile.mcartype] as String,
      mltvdd:	map[TablesColumnFile.mltvdd] as String,
      mloantovalueltv:	map[TablesColumnFile.mloantovalueltv] as String,
      mwhobelongocarowner:	map[TablesColumnFile.mwhobelongocarowner] as String,
      mcarlegality:	map[TablesColumnFile.mcarlegality] as int,
      mreason:	map[TablesColumnFile.mreason] as String,
      mdescription:	map[TablesColumnFile.mdescription] as String,
      mcarcanbeused:	map[TablesColumnFile.mcarcanbeused] as String,
      mcredittenor:	map[TablesColumnFile.mcredittenor] as String,
      mdmirror:	map[TablesColumnFile.mdmirror] as String,
      mddoor:	map[TablesColumnFile.mddoor] as String,
      mdmirrorbacklock:	map[TablesColumnFile.mdmirrorbacklock] as String,
      mdcolororspot:	map[TablesColumnFile.mdcolororspot] as String,
      mfcolorandspot:	map[TablesColumnFile.mfcolorandspot] as String,
      mftireandyan:	map[TablesColumnFile.mftireandyan] as String,
      mfcapofsplatter:	map[TablesColumnFile.mfcapofsplatter] as String,
      mhmirror:	map[TablesColumnFile.mhmirror] as String,
      mhvent:	map[TablesColumnFile.mhvent] as String,
      mhlightfarl:	map[TablesColumnFile.mhlightfarl] as String,
      mhlightfarr:	map[TablesColumnFile.mhlightfarr] as String,
      mhsignal:	map[TablesColumnFile.mhsignal] as String,
      mhwincap:	map[TablesColumnFile.mhwincap] as String,
      mhheadcap:	map[TablesColumnFile.mhheadcap] as String,
      mpmirror:	map[TablesColumnFile.mpmirror] as String,
      mpdoor:	map[TablesColumnFile.mpdoor] as String,
      mpbackmirror:	map[TablesColumnFile.mpbackmirror] as String,
      mpcolororspot:	map[TablesColumnFile.mpcolororspot] as String,
      mftcolorandspot:	map[TablesColumnFile.mftcolorandspot] as String,
      mfttanandyan:	map[TablesColumnFile.mfttanandyan] as String,
      mftcap:	map[TablesColumnFile.mftcap] as String,
      mftsplattercap:	map[TablesColumnFile.mftsplattercap] as String,
      mbpmirror:	map[TablesColumnFile.mbpmirror] as String,
      mbpdoor:	map[TablesColumnFile.mbpdoor] as String,
      mbpcolorandspot:	map[TablesColumnFile.mbpcolorandspot] as String,
      mbtcolorandsport:	map[TablesColumnFile.mbtcolorandsport] as String,
      mbttanandyan:	map[TablesColumnFile.mbttanandyan] as String,
      mbtcap:	map[TablesColumnFile.mbtcap] as String,
      mbcbacklightr:	map[TablesColumnFile.mbcbacklightr] as String,
      mbcturnsignal:	map[TablesColumnFile.mbcturnsignal] as String,
      mbcmessagesignal:	map[TablesColumnFile.mbcmessagesignal] as String,
      mbcsignal:	map[TablesColumnFile.mbcsignal] as String,
      mbcbacklightl:	map[TablesColumnFile.mbcbacklightl] as String,
      mbcbackdoor:	map[TablesColumnFile.mbcbackdoor] as String,
      mbccranes:	map[TablesColumnFile.mbccranes] as String,
      mbctakelock:	map[TablesColumnFile.mbctakelock] as String,
      mbcholdlock:	map[TablesColumnFile.mbcholdlock] as String,
      mbchandcranes:	map[TablesColumnFile.mbchandcranes] as String,
      mbcreservetire:	map[TablesColumnFile.mbcreservetire] as String,
      mbcbackmirror:	map[TablesColumnFile.mbcbackmirror] as String,
      mbcantenna:	map[TablesColumnFile.mbcantenna] as String,
      mbtlcolororspot:	map[TablesColumnFile.mbtlcolororspot] as String,
     //TODO Remove comment later and fix it
      mbtltanandyan:	map[TablesColumnFile.mbtltanandyan] as String,
      mbtlcap:	map[TablesColumnFile.mbtlcap] as String,
      mbtlsplattercap:	map[TablesColumnFile.mbtlsplattercap] as String,
      mbtrcolororspot:	map[TablesColumnFile.mbtrcolororspot] as String,
      mbtrtireandyan:	map[TablesColumnFile.mbtrtireandyan] as String,
      mbtrcap:	map[TablesColumnFile.mbtrcap] as String,
      mbtrsplattercap:	map[TablesColumnFile.mbtrsplattercap] as String,
      mibarsun:	map[TablesColumnFile.mibarsun] as String,
      midescriptionbook:	map[TablesColumnFile.midescriptionbook] as String,
      miautosystem:	map[TablesColumnFile.miautosystem] as String,
      miairconditioner:	map[TablesColumnFile.miairconditioner] as String,
      mimirrorremote:	map[TablesColumnFile.mimirrorremote] as String,
      misafebell:	map[TablesColumnFile.misafebell] as String,
      mimiddlebox:	map[TablesColumnFile.mimiddlebox] as String,
      mregdate: (map[TablesColumnFile.mregdate]=="null"||map[TablesColumnFile.mregdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregdate]) as DateTime,
      mregexpdate: (map[TablesColumnFile.mregexpdate]=="null"||map[TablesColumnFile.mregexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mregexpdate]) as DateTime,
      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby],
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby],
      mgeolocation:map[TablesColumnFile.mgeolocation],
      mgeolatd:map[TablesColumnFile.mgeolatd],
      mgeologd:map[TablesColumnFile.mgeologd],
      missynctocoresys:(map[TablesColumnFile.missynctocoresys]=="null"||map[TablesColumnFile.missynctocoresys]==null)?0:map[TablesColumnFile.missynctocoresys] as int,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,

    );
  }
}
