import 'package:eco_los/db/TablesColumnFile.dart';

class FixedAssetsBean {

  int mcustno;

  double mland;
  double mlandpresentamt=0.0;
  double mlandnextmonthamount=0.0;

  double mbuildng;
  double mbuildngpresentamt=0.0;
  double mbuildngnextmonthamount=0.0;

  double mmachnryorequp;
  double mmachnryorequppresentamt=0.0;
  double mmachnryorequpnextmonthamount=0.0;

  double mmeansandtransprt;
  double mmeansandtransprtpresentamt=0.0;
  double mmeansandtransprtnextmonthamount=0.0;

  double mothrs;
  double mothrspresentamt=0.0;
  double mothrsnextmonthamount=0.0;

  double msumpresentamt=0.0;
  double msumnextmonthamount=0.0;

  DateTime mfromdate;
  DateTime mtodate;


  FixedAssetsBean(
      {

        this.mcustno,
        this.mland,
        this.mlandpresentamt,
        this.mlandnextmonthamount,
        this.mbuildng,
        this.mbuildngpresentamt,
        this.mbuildngnextmonthamount,
        this.mmachnryorequp,
        this.mmachnryorequppresentamt,
        this.mmachnryorequpnextmonthamount,
        this.mmeansandtransprt,
        this.mmeansandtransprtpresentamt,
        this.mmeansandtransprtnextmonthamount,
        this.mothrs,
        this.mothrspresentamt,
        this.mothrsnextmonthamount,
        this.msumpresentamt,
        this.msumnextmonthamount,
        this.mfromdate,
        this.mtodate
      });




  factory FixedAssetsBean.fromMap(Map<String, dynamic> map) {
    return FixedAssetsBean(

      mcustno : map[TablesColumnFile.mcustno]as int,
        mland : map[TablesColumnFile.mland]as double,
        mlandpresentamt : map[TablesColumnFile.mlandpresentamt] as double,
        mlandnextmonthamount : map[TablesColumnFile.mlandnextmonthamount] as double,

        mbuildng : map[TablesColumnFile.mbuildng]as double,
        mbuildngpresentamt : map[TablesColumnFile.mbuildngpresentamt] as double,
        mbuildngnextmonthamount : map[TablesColumnFile.mbuildngnextmonthamount] as double,

        mmachnryorequp : map[TablesColumnFile.mmachnryorequp]as double,
        mmachnryorequppresentamt : map[TablesColumnFile.mmachnryorequppresentamt] as double,
        mmachnryorequpnextmonthamount : map[TablesColumnFile.mmachnryorequpnextmonthamount] as double,

        mmeansandtransprt : map[TablesColumnFile.mmeansandtransprt]as double,
        mmeansandtransprtpresentamt : map[TablesColumnFile.mmeansandtransprtpresentamt] as double,
        mmeansandtransprtnextmonthamount : map[TablesColumnFile.mmeansandtransprtnextmonthamount] as double,

        mothrs : map[TablesColumnFile.mothrs]as double,
        mothrspresentamt : map[TablesColumnFile.mothrspresentamt] as double,
        mothrsnextmonthamount : map[TablesColumnFile.mothrsnextmonthamount] as double,

      msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
      msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double,

        mfromdate:(map[TablesColumnFile.mfromdate]=="null"||map[TablesColumnFile.mfromdate]==null)?null:DateTime.parse(map[TablesColumnFile.mfromdate]) as DateTime,
    mtodate:(map[TablesColumnFile.mtodate]=="null"||map[TablesColumnFile.mtodate]==null)?null:DateTime.parse(map[TablesColumnFile.mtodate]) as DateTime,
    );
  }
  factory FixedAssetsBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return FixedAssetsBean(

        mcustno : map[TablesColumnFile.mcustno]as int,
        mland : map[TablesColumnFile.mland]as double,
        mlandpresentamt : map[TablesColumnFile.mlandpresentamt] as double,
        mlandnextmonthamount : map[TablesColumnFile.mlandnextmonthamount] as double,

        mbuildng : map[TablesColumnFile.mbuildng]as double,
        mbuildngpresentamt : map[TablesColumnFile.mbuildngpresentamt] as double,
        mbuildngnextmonthamount : map[TablesColumnFile.mbuildngnextmonthamount] as double,

        mmachnryorequp : map[TablesColumnFile.mmachnryorequp]as double,
        mmachnryorequppresentamt : map[TablesColumnFile.mmachnryorequppresentamt] as double,
        mmachnryorequpnextmonthamount : map[TablesColumnFile.mmachnryorequpnextmonthamount] as double,

        mmeansandtransprt : map[TablesColumnFile.mmeansandtransprt]as double,
        mmeansandtransprtpresentamt : map[TablesColumnFile.mmeansandtransprtpresentamt] as double,
        mmeansandtransprtnextmonthamount : map[TablesColumnFile.mmeansandtransprtnextmonthamount] as double,

        mothrs : map[TablesColumnFile.mothrs]as double,
        mothrspresentamt : map[TablesColumnFile.mothrspresentamt] as double,
        mothrsnextmonthamount : map[TablesColumnFile.mothrsnextmonthamount] as double,
        msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
        msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double,

        mfromdate:(map[TablesColumnFile.mfromdate]=="null"||map[TablesColumnFile.mfromdate]==null)?null:DateTime.parse(map[TablesColumnFile.mfromdate]) as DateTime,
    mtodate:(map[TablesColumnFile.mtodate]=="null"||map[TablesColumnFile.mtodate]==null)?null:DateTime.parse(map[TablesColumnFile.mtodate]) as DateTime,
    );}

}
