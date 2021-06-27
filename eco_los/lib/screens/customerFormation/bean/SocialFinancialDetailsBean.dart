import 'package:eco_los/db/TablesColumnFile.dart';

class SocialFinancialDetailsBean {

  String maccno;
  String mcreatedby;
  String maccstatus;
  String migyn;
  String mcurcode;
  int positionindex;
  String mbankname;
  String mbranch;
  double maccbal;
  String misusefordis;

  SocialFinancialDetailsBean(
      {
        this.maccno,
        this.mcreatedby,
        this.maccstatus,
        this.migyn,
        this.mcurcode,
        this.mbankname,
        this.mbranch,
        this.maccbal,
        this.misusefordis,
        this.positionindex
      });



  factory SocialFinancialDetailsBean.fromMap(Map<String, dynamic> map) {
    return SocialFinancialDetailsBean(
      maccno : map[TablesColumnFile.maccno] as String,
        mcreatedby : map[TablesColumnFile.mcreatedby] as String,
        maccstatus : map[TablesColumnFile.maccstatus] as String,
        migyn : map[TablesColumnFile.migyn] as String,
        mcurcode : map[TablesColumnFile.mcurcode] as String,
      mbankname : map[TablesColumnFile.mbankname] as String,
      mbranch : map[TablesColumnFile.mbranch] as String,
      maccbal : map[TablesColumnFile.maccbal] as double,
      misusefordis : map[TablesColumnFile.misusefordis] as String


    );
  }
  factory SocialFinancialDetailsBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return SocialFinancialDetailsBean(
      maccno : map[TablesColumnFile.maccno] as String,
        mcreatedby : map[TablesColumnFile.mcreatedby] as String,
        mcurcode : map[TablesColumnFile.mcurcode] as String,
        mbankname : map[TablesColumnFile.mbankname] as String,
      mbranch : map[TablesColumnFile.mbranch] as String,
      maccbal : map[TablesColumnFile.maccbal] as double,
      misusefordis : map[TablesColumnFile.misusefordis] as String
    );}

}
