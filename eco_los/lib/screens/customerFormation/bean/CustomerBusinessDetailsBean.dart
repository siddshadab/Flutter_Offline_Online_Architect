import 'package:eco_los/db/TablesColumnFile.dart';

class CustomerBusinessDetailsBean {

  String mcusactivitytype;
  String mbusinessname;


  String mbusaddress1;
  String mbusaddress2;
  String mbusaddress3;
  String mbusaddress4;
  String mbuscity;
  int mdistcd;
  String mbusstate;
  String mbuscountry;
  int mbusarea;
  int mbusvillage;
  String mbuslandmark;
  int mbuspin;
  int mbusyrsmnths;
  String mregisteredyn;
  String mregistrationno;
  String mbusothtomanageabsyn;
  String mbusothmanagername;
  int mbusothmanagerrel;
  double mbusmonthlyincome;
  String mbusseasonalityjan;
  String mbusseasonalityfeb;
  String mbusseasonalitymar;
  String mbusseasonalityapr;
  String mbusseasonalitymay;
  String mbusseasonalityjun;
  String mbusseasonalityjul;
  String mbusseasonalityaug;
  String mbusseasonalitysep;
  String mbusseasonalityoct;
  String mbusseasonalitynov;
  String mbusseasonalitydec;
  double mbushighsales;
  double mbusmediumsales;
  double mbuslowsales;
  double mbushighincome;
  double mbusmediumincom;
  double mbuslowincome;
  //mbusmonthlytotalEval
  double mbusmonthlytotaleval;
  //mbusmonthlytotalVerif
  double mbusmonthlytotalverif;
  String mbusincludesurcalcyn;
  String mbusnhousesameplaceyn;
  String mbusinesstrend;
  double mmonthlyincome;
  double mtotalmonthlyincome;
  double mbusinessexpense;
  double mhousehldexpense;
  double mmonthlyemi;
  double mincomeemiratio;
  double mnetamount;
  double mpercentage;
  String mposition;
  String mdepartment;
  DateTime mempfrom;
  DateTime mempto;
  double mincomefromothrsrc;

  DateTime mdateofincorporation;
  double mbusinessownerandshareholdingpercentage;
  int mtotalmanpower;
  int mtotalman;
  int mtotalwomen;
String mcompanycategory;
  String mbusstype;
String mmanagerdetails;
double mcapital;
double mcostofgoodssold;
double moperationexpenditure;
double mnetprofit;
  String misselfemp;
  int mbuslocownership;

  String msrcname;
  String mprofession;
  int mnoofempincmpny;
  int myrsofexpinyrs;
  int myrsofexpinmnths;
  String mmobile;
  String mstatusofemp;
  String mtagtmrkt;
  String mstrtgy;
  String mbussprocss;
  String mcomptrmekt;
  String miscpemp;
  String mrankofemp;
  String misprimarysrcincome;
  String mcompanyname;
  String mbussstatus;
  int positionindex;

  CustomerBusinessDetailsBean(
      {
      this.mcusactivitytype,
      this.mbusinessname,
      this.mbusaddress1,
      this.mbusaddress2,
      this.mbusaddress3,
      this.mbusaddress4,
      this.mbuscity,
      this.mdistcd,
      this.mbusstate,
      this.mbuscountry,
      this.mbusarea,
      this.mbusvillage,
      this.mbuslandmark,
      this.mbuspin,
      this.mbusyrsmnths,
      this.mregisteredyn,
      this.mregistrationno,
      this.mbusothtomanageabsyn,
      this.mbusothmanagername,
      this.mbusothmanagerrel,
      this.mbusmonthlyincome,
      this.mbusseasonalityjan,
      this.mbusseasonalityfeb,
      this.mbusseasonalitymar,
      this.mbusseasonalityapr,
      this.mbusseasonalitymay,
      this.mbusseasonalityjun,
      this.mbusseasonalityjul,
      this.mbusseasonalityaug,
      this.mbusseasonalitysep,
      this.mbusseasonalityoct,
      this.mbusseasonalitynov,
      this.mbusseasonalitydec,
      this.mbushighsales,
      this.mbusmediumsales,
      this.mbuslowsales,
      this.mbushighincome,
      this.mbusmediumincom,
      this.mbuslowincome,
      //mbusmonthlytotalEval
      this.mbusmonthlytotaleval,
      //mbusmonthlytotalVerif
      this.mbusmonthlytotalverif,
      this.mbusincludesurcalcyn,
      this.mbusnhousesameplaceyn,
      this.mbusinesstrend,
      this.mmonthlyincome,
      this.mtotalmonthlyincome,
      this.mbusinessexpense,
      this.mhousehldexpense,
      this.mincomeemiratio,
      this.mmonthlyemi,
      this.mnetamount,
      this.mpercentage,
        this.mposition,
        this.mdepartment,
        this.mempfrom,
        this.mempto,
        this.mincomefromothrsrc,

        this.mdateofincorporation,
        this.mbusinessownerandshareholdingpercentage,
        this.mtotalmanpower,
        this.mcompanycategory,
        this.mmanagerdetails,
        this.mcapital,
        this.mcostofgoodssold,
        this.moperationexpenditure,
        this.mnetprofit,
        this.mtotalman,
        this.mtotalwomen,
        this.misselfemp,
        this.mbuslocownership,
        this.mbusstype,
        this.msrcname,
        this.mnoofempincmpny,
        this.myrsofexpinyrs,
        this.myrsofexpinmnths,
        this.mmobile,
        this.mstatusofemp,
        this.mtagtmrkt,
        this.mstrtgy,
        this.mbussprocss,
        this.mcomptrmekt,
        this.mprofession,
        this.miscpemp,
        this.mrankofemp,
        this.misprimarysrcincome,
        this.mcompanyname,
        this.mbussstatus,
        this.positionindex
      });



  factory CustomerBusinessDetailsBean.fromMap(Map<String, dynamic> map) {
   // print("fromMaBuisnessp" + map[TablesColumnFile.mempfrom]);
   // print("map[TablesColumnFile.mdateofincorporation] "+map[TablesColumnFile.mdateofincorporation].toString());
    return CustomerBusinessDetailsBean(

      mcusactivitytype: map[TablesColumnFile.mcusactivitytype] as String,
      mbusinessname: map[TablesColumnFile.mbusinessname] as String,
      mbusaddress1: map[TablesColumnFile.mbusaddress1] as String,
      mbusaddress2: map[TablesColumnFile.mbusaddress2] as String,
      mbusaddress3: map[TablesColumnFile.mbusaddress3] as String,
      mbusaddress4: map[TablesColumnFile.mbusaddress4] as String,
      mbuscity: map[TablesColumnFile.mbuscity] as String,
      mdistcd: map[TablesColumnFile.mdistcd] as int,
      mbusstate: map[TablesColumnFile.mbusstate] as String,
      mbuscountry: map[TablesColumnFile.mbuscountry] as String,
      mbusarea: map[TablesColumnFile.mbusarea] as int,
      mbusvillage: map[TablesColumnFile.mbusvillage] as int,
      mbuslandmark: map[TablesColumnFile.mbuslandmark] as String,
      mbuspin: map[TablesColumnFile.mbuspin] as int,
      mbusyrsmnths: map[TablesColumnFile.mbusyrsmnths] as int,
      mregisteredyn: map[TablesColumnFile.mregisteredyn] as String,
      mregistrationno: map[TablesColumnFile.mregistrationno] as String,
      mbusothtomanageabsyn:
          map[TablesColumnFile.mbusothtomanageabsyn] as String,
      mbusothmanagername: map[TablesColumnFile.mbusothmanagername] as String,
      mbusothmanagerrel: map[TablesColumnFile.mbusothmanagerrel] != null &&
              map[TablesColumnFile.mbusothmanagerrel] != 'null'
          ? map[TablesColumnFile.mbusothmanagerrel] as int
          : 0,
      mbusmonthlyincome: map[TablesColumnFile.mbusmonthlyincome] != null &&
              map[TablesColumnFile.mbusmonthlyincome] != 'null'
          ? map[TablesColumnFile.mbusmonthlyincome] as double
          : 0.0,
      mbusseasonalityjan: map[TablesColumnFile.mbusseasonalityjan] as String,
      mbusseasonalityfeb: map[TablesColumnFile.mbusseasonalityfeb] as String,
      mbusseasonalitymar: map[TablesColumnFile.mbusseasonalitymar] as String,
      mbusseasonalityapr: map[TablesColumnFile.mbusseasonalityapr] as String,
      mbusseasonalitymay: map[TablesColumnFile.mbusseasonalitymay] as String,
      mbusseasonalityjun: map[TablesColumnFile.mbusseasonalityjun] as String,
      mbusseasonalityjul: map[TablesColumnFile.mbusseasonalityjul] as String,
      mbusseasonalityaug: map[TablesColumnFile.mbusseasonalityaug] as String,
      mbusseasonalitysep: map[TablesColumnFile.mbusseasonalitysep] as String,
      mbusseasonalityoct: map[TablesColumnFile.mbusseasonalityoct] as String,
      mbusseasonalitynov: map[TablesColumnFile.mbusseasonalitynov] as String,
      mbusseasonalitydec: map[TablesColumnFile.mbusseasonalitydec] as String,
    /*  mbushighsales: map[TablesColumnFile.mbushighsales] != null &&
              map[TablesColumnFile.mbushighsales] != 'null'
          ? map[TablesColumnFile.mbushighsales] as double
          : 0.0,*/
    /*  mbusmediumsales: map[TablesColumnFile.mbusmediumsales] != null &&
              map[TablesColumnFile.mbusmediumsales] != 'null'
          ? map[TablesColumnFile.mbusmediumsales] as double
          : 0.0,*/
      /*mbuslowsales: map[TablesColumnFile.mbuslowsales] as double,
      mbushighincome: map[TablesColumnFile.mbushighincome] as double,
      mbusmediumincom: map[TablesColumnFile.mbusmediumincom] as double,
      mbuslowincome: map[TablesColumnFile.mbuslowincome] as double,
      //mbusmonthlytotalEval
      mbusmonthlytotaleval:
          map[TablesColumnFile.mbusmonthlytotaleval] as double,
      //mbusmonthlytotalVerif
      mbusmonthlytotalverif:
          map[TablesColumnFile.mbusmonthlytotalverif] as double,*/
      mbusincludesurcalcyn:
          map[TablesColumnFile.mbusincludesurcalcyn] as String,
      mbusnhousesameplaceyn:
          map[TablesColumnFile.mbusnhousesameplaceyn] as String,
      mbusinesstrend: map[TablesColumnFile.mbusinesstrend] as String,
      mmonthlyincome: map[TablesColumnFile.mmonthlyincome]as double,
      /* mtotalmonthlyincome : map[TablesColumnFile.mtotalmonthlyincome]as double,
      mbusinessexpense: map[TablesColumnFile.mbusinessexpense]as double,
      mhousehldexpense: map[TablesColumnFile.mhousehldexpense]as double,
      mincomeemiratio: map[TablesColumnFile.mincomeemiratio]as double,*/
     // mmonthlyemi: map[TablesColumnFile.mmonthlyemi]as double,
     // mnetamount: map[TablesColumnFile.mnetamount]as double,
    //  mpercentage: map[TablesColumnFile.mpercentage]as double,

      mdateofincorporation:(map[TablesColumnFile.mdateofincorporation]==null || map[TablesColumnFile.mdateofincorporation]=="null")?null:DateTime.parse(map[TablesColumnFile.mdateofincorporation]) as DateTime,
      //mbusinessownerandshareholdingpercentage:	map[TablesColumnFile.mbusinessownerandshareholdingpercentage] as double,
      mtotalmanpower:	map[TablesColumnFile.mtotalmanpower] as int,
      mtotalman:	map[TablesColumnFile.mtotalman] as int,
      mtotalwomen:	map[TablesColumnFile.mtotalwomen] as int,
      mcompanycategory:	map[TablesColumnFile.mcompanycategory] as String,
      mmanagerdetails:	map[TablesColumnFile.mmanagerdetails] as String,
     // mcapital:	map[TablesColumnFile.mcapital] as double,
  /*    mcostofgoodssold:	map[TablesColumnFile.mcostofgoodssold] as double,
      moperationexpenditure:	map[TablesColumnFile.moperationexpenditure] as double,
      mnetprofit:	map[TablesColumnFile.mnetprofit] as double,*/


      mposition: map[TablesColumnFile.mposition] as String,
      mdepartment: map[TablesColumnFile.mdepartment] as String,
      mempfrom: (map[TablesColumnFile.mempfrom]=="null"||map[TablesColumnFile.mempfrom]==null)?null:DateTime.parse(map[TablesColumnFile.mempfrom]) as DateTime,
      mempto: (map[TablesColumnFile.mempto]=="null"||map[TablesColumnFile.mempto]==null)?null:DateTime.parse(map[TablesColumnFile.mempto]) as DateTime,
      //mincomefromothrsrc:	map[TablesColumnFile.mincomefromothrsrc] as double,
      misselfemp :map[TablesColumnFile.misselfemp] as String,
      mbuslocownership:			map[TablesColumnFile.mbuslocownership] as int,
      mbusstype:			map[TablesColumnFile.mbusstype] as String,

      msrcname:			map[TablesColumnFile.msrcname] as String,
      mprofession:			map[TablesColumnFile.mprofession] as String,
      //mnoofempincmpny:			map[TablesColumnFile.mnoofempincmpny] as int,
      myrsofexpinyrs:			map[TablesColumnFile.myrsofexpinyrs] as int,
      myrsofexpinmnths:			map[TablesColumnFile.myrsofexpinmnths] as int,
      mmobile:			map[TablesColumnFile.mmobile] as String,
      mstatusofemp:			map[TablesColumnFile.mstatusofemp] as String,
      mtagtmrkt:			map[TablesColumnFile.mtagtmrkt] as String,
      mstrtgy:			map[TablesColumnFile.mstrtgy] as String,
      mbussprocss:			map[TablesColumnFile.mbussprocss] as String,
      mcomptrmekt:			map[TablesColumnFile.mcomptrmekt] as String,
      miscpemp:			map[TablesColumnFile.miscpemp] as String,
      mrankofemp:			map[TablesColumnFile.mrankofemp] as String,
      misprimarysrcincome:			map[TablesColumnFile.misprimarysrcincome] as String,
      mcompanyname:			map[TablesColumnFile.mcompanyname] as String,
      mbussstatus:			map[TablesColumnFile.mbussstatus] as String,
    );

  }

  factory CustomerBusinessDetailsBean.fromMapMiddleware(
      Map<String, dynamic> map) {
    print("fromMaBuisnessp" + map[TablesColumnFile.mempfrom]);
    //  print(map[TablesColumnFile.mbussdetailsrefno]);

    return CustomerBusinessDetailsBean(

      mcusactivitytype: map[TablesColumnFile.mcusactivitytype] != null &&
              map[TablesColumnFile.mcusactivitytype] != 'null' &&
              map[TablesColumnFile.mcusactivitytype] != ''
          ? map[TablesColumnFile.mcusactivitytype] as String
          : '0',
      mbusinessname: map[TablesColumnFile.mbusinessname] != null &&
          map[TablesColumnFile.mbusinessname] != 'null' &&
          map[TablesColumnFile.mbusinessname] != ''?map[TablesColumnFile.mbusinessname] as String:"",
      mbusaddress1: map[TablesColumnFile.mbusaddress1] as String,
      mbusaddress2: map[TablesColumnFile.mbusaddress2] as String,
      mbusaddress3: map[TablesColumnFile.mbusaddress3] as String,
      mbusaddress4: map[TablesColumnFile.mbusaddress4] as String,
      mbuscity: map[TablesColumnFile.mbuscity] as String,
      mdistcd: map[TablesColumnFile.mdistcd] != null &&
              map[TablesColumnFile.mdistcd] != 'null' &&
              map[TablesColumnFile.mdistcd] != ''
          ? map[TablesColumnFile.mdistcd] as int
          : 0,
      mbusstate: map[TablesColumnFile.mbusstate] as String,
      mbuscountry: map[TablesColumnFile.mbuscountry] as String,
      mbusarea: map[TablesColumnFile.mbusarea] != null &&
              map[TablesColumnFile.mbusarea] != 'null' &&
              map[TablesColumnFile.mbusarea] != ''
          ? map[TablesColumnFile.mbusarea] as int
          : 0,
      mbusvillage: map[TablesColumnFile.mbusvillage] != null &&
              map[TablesColumnFile.mbusvillage] != 'null' &&
              map[TablesColumnFile.mbusvillage] != ''
          ? map[TablesColumnFile.mbusvillage] as int
          : 0,
      mbuslandmark: map[TablesColumnFile.mbuslandmark] as String,
      mbuspin: map[TablesColumnFile.mbuspin] != null &&
              map[TablesColumnFile.mbuspin] != 'null' &&
              map[TablesColumnFile.mbuspin] != ''
          ? map[TablesColumnFile.mbuspin] as int
          : 0,
      mbusyrsmnths: map[TablesColumnFile.mbusyrsmnths] != null &&
              map[TablesColumnFile.mbusyrsmnths] != 'null' &&
              map[TablesColumnFile.mbusyrsmnths] != ''
          ? map[TablesColumnFile.mbusyrsmnths] as int
          : 0,
      mregisteredyn: map[TablesColumnFile.mregisteredyn] as String,
      mregistrationno: map[TablesColumnFile.mregistrationno] as String,
      mbusothtomanageabsyn:
          map[TablesColumnFile.mbusothtomanageabsyn] as String,
      mbusothmanagername: map[TablesColumnFile.mbusothmanagername] as String,
      mbusothmanagerrel: map[TablesColumnFile.mbusothmanagerrel] != null &&
              map[TablesColumnFile.mbusothmanagerrel] != 'null' &&
              map[TablesColumnFile.mbusothmanagerrel] != ''
          ? map[TablesColumnFile.mbusothmanagerrel] as int
          : 0,
      mbusmonthlyincome: map[TablesColumnFile.mbusmonthlyincome] != null &&
              map[TablesColumnFile.mbusmonthlyincome] != 'null' &&
              map[TablesColumnFile.mbusmonthlyincome] != ''
          ? map[TablesColumnFile.mbusmonthlyincome] as double
          : 0.0,
      mbusseasonalityjan: map[TablesColumnFile.mbusseasonalityjan] as String,
      mbusseasonalityfeb: map[TablesColumnFile.mbusseasonalityfeb] as String,
      mbusseasonalitymar: map[TablesColumnFile.mbusseasonalitymar] as String,
      mbusseasonalityapr: map[TablesColumnFile.mbusseasonalityapr] as String,
      mbusseasonalitymay: map[TablesColumnFile.mbusseasonalitymay] as String,
      mbusseasonalityjun: map[TablesColumnFile.mbusseasonalityjun] as String,
      mbusseasonalityjul: map[TablesColumnFile.mbusseasonalityjul] as String,
      mbusseasonalityaug: map[TablesColumnFile.mbusseasonalityaug] as String,
      mbusseasonalitysep: map[TablesColumnFile.mbusseasonalitysep] as String,
      mbusseasonalityoct: map[TablesColumnFile.mbusseasonalityoct] as String,
      mbusseasonalitynov: map[TablesColumnFile.mbusseasonalitynov] as String,
      mbusseasonalitydec: map[TablesColumnFile.mbusseasonalitydec] as String,
      mbushighsales: map[TablesColumnFile.mbushighsales] != null &&
              map[TablesColumnFile.mbushighsales] != 'null' &&
              map[TablesColumnFile.mbushighsales] != ''
          ? map[TablesColumnFile.mbushighsales] as double
          : 0,
      mbusmediumsales: map[TablesColumnFile.mbusmediumsales] != null &&
              map[TablesColumnFile.mbusmediumsales] != 'null' &&
              map[TablesColumnFile.mbusmediumsales] != ''
          ? map[TablesColumnFile.mbusmediumsales] as double
          : 0,
      mbuslowsales: map[TablesColumnFile.mbuslowsales] != null &&
              map[TablesColumnFile.mbuslowsales] != 'null' &&
              map[TablesColumnFile.mbuslowsales] != ''
          ? map[TablesColumnFile.mbuslowsales] as double
          : 0,
      mbushighincome: map[TablesColumnFile.mbushighincome] != null &&
              map[TablesColumnFile.mbushighincome] != 'null' &&
              map[TablesColumnFile.mbushighincome] != ''
          ? map[TablesColumnFile.mbushighincome] as double
          : 0,
      mbusmediumincom: map[TablesColumnFile.mbusmediumincom] != null &&
              map[TablesColumnFile.mbusmediumincom] != 'null' &&
              map[TablesColumnFile.mbusmediumincom] != ''
          ? map[TablesColumnFile.mbusmediumincom] as double
          : 0,
      mbuslowincome: map[TablesColumnFile.mbuslowincome] != null &&
              map[TablesColumnFile.mbuslowincome] != 'null' &&
              map[TablesColumnFile.mbuslowincome] != ''
          ? map[TablesColumnFile.mbuslowincome] as double
          : 0,
      //mbusmonthlytotalEval

      mbusmonthlytotaleval:
          map[TablesColumnFile.mbusmonthlytotaleval] != null &&
                  map[TablesColumnFile.mbusmonthlytotaleval] != 'null' &&
                  map[TablesColumnFile.mbusmonthlytotaleval] != ''
              ? map[TablesColumnFile.mbusmonthlytotaleval] as double
              : 0,
      //mbusmonthlytotalVerif
      mbusmonthlytotalverif:
          map[TablesColumnFile.mbusmonthlytotalverif] != null &&
                  map[TablesColumnFile.mbusmonthlytotalverif] != 'null' &&
                  map[TablesColumnFile.mbusmonthlytotalverif] != ''
              ? map[TablesColumnFile.mbusmonthlytotalverif] as double
              : 0,
      mbusincludesurcalcyn:
          map[TablesColumnFile.mbusincludesurcalcyn] as String,
      mbusnhousesameplaceyn:
          map[TablesColumnFile.mbusnhousesameplaceyn] as String,
      mbusinesstrend: map[TablesColumnFile.mbusinesstrend] as String,
      mmonthlyincome:
      map[TablesColumnFile.mmonthlyincome] != null &&
          map[TablesColumnFile.mmonthlyincome] != 'null' &&
          map[TablesColumnFile.mmonthlyincome] != ''
          ? map[TablesColumnFile.mmonthlyincome] as double
          : 0,
      mtotalmonthlyincome:
      map[TablesColumnFile.mtotalmonthlyincome] != null &&
          map[TablesColumnFile.mtotalmonthlyincome] != 'null' &&
          map[TablesColumnFile.mtotalmonthlyincome] != ''
          ? map[TablesColumnFile.mtotalmonthlyincome] as double
          : 0,
      mhousehldexpense:
      map[TablesColumnFile.mhousehldexpense] != null &&
          map[TablesColumnFile.mhousehldexpense] != 'null' &&
          map[TablesColumnFile.mhousehldexpense] != ''
          ? map[TablesColumnFile.mhousehldexpense] as double
          : 0,
      mbusinessexpense:
      map[TablesColumnFile.mbusinessexpense] != null &&
          map[TablesColumnFile.mbusinessexpense] != 'null' &&
          map[TablesColumnFile.mbusinessexpense] != ''
          ? map[TablesColumnFile.mbusinessexpense] as double
          : 0,
      mnetamount:
      map[TablesColumnFile.mnetamount] != null &&
          map[TablesColumnFile.mnetamount] != 'null' &&
          map[TablesColumnFile.mnetamount] != ''
          ? map[TablesColumnFile.mnetamount] as double
          : 0,
      mmonthlyemi:
      map[TablesColumnFile.mmonthlyemi] != null &&
          map[TablesColumnFile.mmonthlyemi] != 'null' &&
          map[TablesColumnFile.mmonthlyemi] != ''
          ? map[TablesColumnFile.mmonthlyemi] as double
          : 0,
      mincomeemiratio:
      map[TablesColumnFile.mincomeemiratio] != null &&
          map[TablesColumnFile.mincomeemiratio] != 'null' &&
          map[TablesColumnFile.mincomeemiratio] != ''
          ? map[TablesColumnFile.mincomeemiratio] as double
          : 0,
      mpercentage:
      map[TablesColumnFile.mpercentage] != null &&
          map[TablesColumnFile.mpercentage] != 'null' &&
          map[TablesColumnFile.mpercentage] != ''
          ? map[TablesColumnFile.mpercentage] as double
          : 0,
      mdateofincorporation:(map[TablesColumnFile.mdateofincorporation]=="null"||map[TablesColumnFile.mdateofincorporation]==null)?null:DateTime.parse(map[TablesColumnFile.mdateofincorporation]) as DateTime,
      mbusinessownerandshareholdingpercentage:	map[TablesColumnFile.mbusinessownerandshareholdingpercentage] as double,
      mtotalmanpower:	map[TablesColumnFile.mtotalmanpower] as int,
      mtotalman:	map[TablesColumnFile.mtotalman] as int,
      mtotalwomen:	map[TablesColumnFile.mtotalwomen] as int,
      mcompanycategory:	map[TablesColumnFile.mcompanycategory] as String,
      mmanagerdetails:	map[TablesColumnFile.mmanagerdetails] as String,
      mcapital:	map[TablesColumnFile.mcapital] as double,
      mcostofgoodssold:	map[TablesColumnFile.mcostofgoodssold] as double,
      moperationexpenditure:	map[TablesColumnFile.moperationexpenditure] as double,
      mnetprofit:	map[TablesColumnFile.mnetprofit] as double,


      mposition: map[TablesColumnFile.mposition] as String,
      mdepartment: map[TablesColumnFile.mdepartment] as String,
      mempfrom: (map[TablesColumnFile.mempfrom]=="null"||map[TablesColumnFile.mempfrom]==null)?null:DateTime.parse(map[TablesColumnFile.mempfrom]) as DateTime,
      mempto: (map[TablesColumnFile.mempto]=="null"||map[TablesColumnFile.mempto]==null)?null:DateTime.parse(map[TablesColumnFile.mempto]) as DateTime,
      mincomefromothrsrc:	map[TablesColumnFile.mincomefromothrsrc] as double,
      misselfemp :map[TablesColumnFile.misselfemp] as String,
      mbuslocownership:			map[TablesColumnFile.mbuslocownership] as int,
      mbusstype:			map[TablesColumnFile.mbusstype] as String,
      msrcname:			map[TablesColumnFile.msrcname] as String,
      mprofession:			map[TablesColumnFile.mprofession] as String,
      mnoofempincmpny:			map[TablesColumnFile.mnoofempincmpny] as int,
      myrsofexpinyrs:			map[TablesColumnFile.myrsofexpinyrs] as int,
      myrsofexpinmnths:			map[TablesColumnFile.myrsofexpinmnths] as int,
      mmobile:			map[TablesColumnFile.mmobile] as String,
      mstatusofemp:			map[TablesColumnFile.mstatusofemp] as String,
      mtagtmrkt:			map[TablesColumnFile.mtagtmrkt] as String,
      mstrtgy:			map[TablesColumnFile.mstrtgy] as String,
      mbussprocss:			map[TablesColumnFile.mbussprocss] as String,
      mcomptrmekt:			map[TablesColumnFile.mcomptrmekt] as String,
      miscpemp:			map[TablesColumnFile.miscpemp] as String,
      mrankofemp:			map[TablesColumnFile.mrankofemp] as String,
      misprimarysrcincome:			map[TablesColumnFile.misprimarysrcincome] as String,
      mcompanyname:			map[TablesColumnFile.mcompanyname] as String,
      mbussstatus:			map[TablesColumnFile.mbussstatus] as String,
    );
  }
}
