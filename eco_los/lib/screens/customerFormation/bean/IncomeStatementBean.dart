import 'package:eco_los/db/TablesColumnFile.dart';

class IncomeStatementBean {

  int mcustno;
  double mtotalrevenuep=0.0;
  double mtotalrevenuenm=0.0;
  double mgrossprofitfirstp=0.0;
  double mgrossprofitfirstnm=0.0;
  double mrevenuefirstp=0.0;
  double mrevenuefirstnm=0.0;
  double mgoodcostfirstp=0.0;
  double mgoodcostfirstnm=0.0;
  double mgrossprofitsecondp=0.0;
  double mgrossprofitsecondnm=0.0;
  double mrevenuesecondp=0.0;
  double mrevenuesecondnm=0.0;
  double mgoodcostsecondp=0.0;
  double mgoodcostsecondnm=0.0;
  double motherrevenuep=0.0;
  double motherrevenuenm=0.0;
  double mtotalopexpp=0.0;
  double mtotalopexpnm=0.0;
  double mopexpfirstp=0.0;
  double mopexpfirstnm=0.0;
  double mpersonalexpfirstp=0.0;
  double mpersonalexpfirstnm=0.0;
  double mgeneralexpfirstp=0.0;
  double mgeneralexpfirstnm=0.0;
  double motherexpfirstp=0.0;
  double motherexpfirstnm=0.0;
  double mopexpsecondp=0.0;
  double mopexpsecondnm=0.0;
  double mpersonalexpsecondp=0.0;
  double mpersonalexpsecondnm=0.0;
  double mgeneralexpsecondp=0.0;
  double mgeneralexpsecondnm=0.0;
  double motherexpsecondp=0.0;
  double motherexpsecondnm=0.0;
  double mtaxexpp=0.0;
  double mtaxexpnm=0.0;
  double mnetincomep=0.0;
  double mnetincomenm=0.0;
  DateTime mfromdate;
  DateTime mtodate;



  IncomeStatementBean(
      {

        this.mcustno,
        this.mtotalrevenuep,
        this.mtotalrevenuenm,
        this.mgrossprofitfirstp,
        this.mgrossprofitfirstnm,
        this.mrevenuefirstp,
        this.mrevenuefirstnm,
        this.mgoodcostfirstp,
        this.mgoodcostfirstnm,
        this.mgrossprofitsecondp,
        this.mgrossprofitsecondnm,
        this.mrevenuesecondp,
        this.mrevenuesecondnm,
        this.mgoodcostsecondp,
        this.mgoodcostsecondnm,
        this.motherrevenuep,
        this.motherrevenuenm,
        this.mtotalopexpp,
        this.mtotalopexpnm,
        this.mopexpfirstp,
        this.mopexpfirstnm,
        this.mpersonalexpfirstp,
        this.mpersonalexpfirstnm,
        this.mgeneralexpfirstp,
        this.mgeneralexpfirstnm,
        this.motherexpfirstp,
        this.motherexpfirstnm,
        this.mopexpsecondp,
        this.mopexpsecondnm,
        this.mpersonalexpsecondp,
        this.mpersonalexpsecondnm,
        this.mgeneralexpsecondp,
        this.mgeneralexpsecondnm,
        this.motherexpsecondp,
        this.motherexpsecondnm,
        this.mtaxexpp,
        this.mtaxexpnm,
        this.mnetincomep,
        this.mnetincomenm,
        this.mfromdate,
        this.mtodate
      });




  factory IncomeStatementBean.fromMap(Map<String, dynamic> map) {
    return IncomeStatementBean(

      mcustno : map[TablesColumnFile.mcustno]as int,
      mtotalrevenuep : map[TablesColumnFile.mtotalrevenuep] as double,
      mtotalrevenuenm : map[TablesColumnFile.mtotalrevenuenm] as double,
      mgrossprofitfirstp : map[TablesColumnFile.mgrossprofitfirstp] as double,
      mgrossprofitfirstnm : map[TablesColumnFile.mgrossprofitfirstnm] as double,
      mrevenuefirstp : map[TablesColumnFile.mrevenuefirstp] as double,
      mrevenuefirstnm : map[TablesColumnFile.mrevenuefirstnm] as double,
      mgoodcostfirstp : map[TablesColumnFile.mgoodcostfirstp] as double,
      mgoodcostfirstnm : map[TablesColumnFile.mgoodcostfirstnm] as double,
      mgrossprofitsecondp : map[TablesColumnFile.mgrossprofitsecondp] as double,
      mgrossprofitsecondnm : map[TablesColumnFile.mgrossprofitsecondnm] as double,
      mrevenuesecondp : map[TablesColumnFile.mrevenuesecondp] as double,
      mrevenuesecondnm : map[TablesColumnFile.mrevenuesecondnm] as double,
      mgoodcostsecondp : map[TablesColumnFile.mgoodcostsecondp] as double,
      mgoodcostsecondnm : map[TablesColumnFile.mgoodcostsecondnm] as double,
      motherrevenuep : map[TablesColumnFile.motherrevenuep] as double,
      motherrevenuenm : map[TablesColumnFile.motherrevenuenm] as double,
      mtotalopexpp : map[TablesColumnFile.mtotalopexpp] as double,
      mtotalopexpnm : map[TablesColumnFile.mtotalopexpnm] as double,
      mopexpfirstp : map[TablesColumnFile.mopexpfirstp] as double,
      mopexpfirstnm : map[TablesColumnFile.mopexpfirstnm] as double,
      mpersonalexpfirstp : map[TablesColumnFile.mpersonalexpfirstp] as double,
      mpersonalexpfirstnm : map[TablesColumnFile.mpersonalexpfirstnm] as double,
      mgeneralexpfirstp : map[TablesColumnFile.mgeneralexpfirstp] as double,
      mgeneralexpfirstnm : map[TablesColumnFile.mgeneralexpfirstnm] as double,
      motherexpfirstp : map[TablesColumnFile.motherexpfirstp] as double,
      motherexpfirstnm : map[TablesColumnFile.motherexpfirstnm] as double,
      mopexpsecondp : map[TablesColumnFile.mopexpsecondp] as double,
      mopexpsecondnm : map[TablesColumnFile.mopexpsecondnm] as double,
      mpersonalexpsecondp : map[TablesColumnFile.mpersonalexpsecondp] as double,
      mpersonalexpsecondnm : map[TablesColumnFile.mpersonalexpsecondnm] as double,
      mgeneralexpsecondp : map[TablesColumnFile.mgeneralexpsecondp] as double,
      mgeneralexpsecondnm : map[TablesColumnFile.mgeneralexpsecondnm] as double,
      motherexpsecondp : map[TablesColumnFile.motherexpsecondp] as double,
      motherexpsecondnm : map[TablesColumnFile.motherexpsecondnm] as double,
      mtaxexpp : map[TablesColumnFile.mtaxexpp] as double,
      mtaxexpnm : map[TablesColumnFile.mtaxexpnm] as double,
      mnetincomep : map[TablesColumnFile.mnetincomep] as double,
      mnetincomenm : map[TablesColumnFile.mnetincomenm] as double,
      mfromdate:(map[TablesColumnFile.mfromdate]=="null"||map[TablesColumnFile.mfromdate]==null)?null:DateTime.parse(map[TablesColumnFile.mfromdate]) as DateTime,
      mtodate:(map[TablesColumnFile.mtodate]=="null"||map[TablesColumnFile.mtodate]==null)?null:DateTime.parse(map[TablesColumnFile.mtodate]) as DateTime,
    );
  }
  factory IncomeStatementBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return IncomeStatementBean(

      mcustno : map[TablesColumnFile.mcustno]as int,
      mtotalrevenuep : map[TablesColumnFile.mtotalrevenuep] as double,
      mtotalrevenuenm : map[TablesColumnFile.mtotalrevenuenm] as double,
      mgrossprofitfirstp : map[TablesColumnFile.mgrossprofitfirstp] as double,
      mgrossprofitfirstnm : map[TablesColumnFile.mgrossprofitfirstnm] as double,
      mrevenuefirstp : map[TablesColumnFile.mrevenuefirstp] as double,
      mrevenuefirstnm : map[TablesColumnFile.mrevenuefirstnm] as double,
      mgoodcostfirstp : map[TablesColumnFile.mgoodcostfirstp] as double,
      mgoodcostfirstnm : map[TablesColumnFile.mgoodcostfirstnm] as double,
      mgrossprofitsecondp : map[TablesColumnFile.mgrossprofitsecondp] as double,
      mgrossprofitsecondnm : map[TablesColumnFile.mgrossprofitsecondnm] as double,
      mrevenuesecondp : map[TablesColumnFile.mrevenuesecondp] as double,
      mrevenuesecondnm : map[TablesColumnFile.mrevenuesecondnm] as double,
      mgoodcostsecondp : map[TablesColumnFile.mgoodcostsecondp] as double,
      mgoodcostsecondnm : map[TablesColumnFile.mgoodcostsecondnm] as double,
      motherrevenuep : map[TablesColumnFile.motherrevenuep] as double,
      motherrevenuenm : map[TablesColumnFile.motherrevenuenm] as double,
      mtotalopexpp : map[TablesColumnFile.mtotalopexpp] as double,
      mtotalopexpnm : map[TablesColumnFile.mtotalopexpnm] as double,
      mopexpfirstp : map[TablesColumnFile.mopexpfirstp] as double,
      mopexpfirstnm : map[TablesColumnFile.mopexpfirstnm] as double,
      mpersonalexpfirstp : map[TablesColumnFile.mpersonalexpfirstp] as double,
      mpersonalexpfirstnm : map[TablesColumnFile.mpersonalexpfirstnm] as double,
      mgeneralexpfirstp : map[TablesColumnFile.mgeneralexpfirstp] as double,
      mgeneralexpfirstnm : map[TablesColumnFile.mgeneralexpfirstnm] as double,
      motherexpfirstp : map[TablesColumnFile.motherexpfirstp] as double,
      motherexpfirstnm : map[TablesColumnFile.motherexpfirstnm] as double,
      mopexpsecondp : map[TablesColumnFile.mopexpsecondp] as double,
      mopexpsecondnm : map[TablesColumnFile.mopexpsecondnm] as double,
      mpersonalexpsecondp : map[TablesColumnFile.mpersonalexpsecondp] as double,
      mpersonalexpsecondnm : map[TablesColumnFile.mpersonalexpsecondnm] as double,
      mgeneralexpsecondp : map[TablesColumnFile.mgeneralexpsecondp] as double,
      mgeneralexpsecondnm : map[TablesColumnFile.mgeneralexpsecondnm] as double,
      motherexpsecondp : map[TablesColumnFile.motherexpsecondp] as double,
      motherexpsecondnm : map[TablesColumnFile.motherexpsecondnm] as double,
      mtaxexpp : map[TablesColumnFile.mtaxexpp] as double,
      mtaxexpnm : map[TablesColumnFile.mtaxexpnm] as double,
      mnetincomep : map[TablesColumnFile.mnetincomep] as double,
      mnetincomenm : map[TablesColumnFile.mnetincomenm] as double,
      mfromdate:(map[TablesColumnFile.mfromdate]=="null"||map[TablesColumnFile.mfromdate]==null)?null:DateTime.parse(map[TablesColumnFile.mfromdate]) as DateTime,
      mtodate:(map[TablesColumnFile.mtodate]=="null"||map[TablesColumnFile.mtodate]==null)?null:DateTime.parse(map[TablesColumnFile.mtodate]) as DateTime,
    );}

}
