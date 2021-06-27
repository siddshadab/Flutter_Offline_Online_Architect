import 'package:eco_los/db/TablesColumnFile.dart';



class FinancialStmntBean {

  int mcustno;
  double mgrossprofitmargin=0.0;
  double mcurrentratio=0.0;
  double mdebtratio=0.0;
  double mtotcurasset=0.0;
  double mtotcurliabilities=0.0;
  double mworkngcapital=0.0;
  double mavginventory=0.0;
  double mavgaccreceivables=0.0;
  double mavgaccpayables=0.0;
  double mcogs=0.0;
  double msales=0.0;
  double mpurchases=0.0;
  double minvconperiod=0.0;
  double mrecconperiod=0.0;
  double mpayconperiod=0.0;
  double mworkngcapitalcycle=0.0;




  FinancialStmntBean(
      {

        this.mcustno,
        this.mgrossprofitmargin,
        this.mcurrentratio,
        this.mdebtratio,
        this.mtotcurasset,
        this.mtotcurliabilities,
        this.mworkngcapital,
        this.mavginventory,
        this.mavgaccreceivables,
        this.mavgaccpayables,
        this.mcogs,
        this.msales,
        this.mpurchases,
        this.minvconperiod,
        this.mrecconperiod,
        this.mpayconperiod,
        this.mworkngcapitalcycle
      });



  factory FinancialStmntBean.fromMap(Map<String, dynamic> map) {
    return FinancialStmntBean(

        mcustno : map[TablesColumnFile.mcustno]as int,
        mgrossprofitmargin : map[TablesColumnFile.mgrossprofitmargin] as double,
        mcurrentratio : map[TablesColumnFile.mcurrentratio] as double,
        mdebtratio : map[TablesColumnFile.mdebtratio] as double,
        mtotcurasset : map[TablesColumnFile.mtotcurasset] as double,
        mtotcurliabilities : map[TablesColumnFile.mtotcurliabilities] as double,
        mworkngcapital : map[TablesColumnFile.mworkngcapital] as double,
        mavginventory : map[TablesColumnFile.mavginventory] as double,
        mavgaccreceivables : map[TablesColumnFile.mavgaccreceivables] as double,
        mavgaccpayables : map[TablesColumnFile.mavgaccpayables] as double,
        mcogs : map[TablesColumnFile.mcogs] as double,
        msales : map[TablesColumnFile.msales] as double,
        mpurchases : map[TablesColumnFile.mpurchases] as double,
        minvconperiod : map[TablesColumnFile.minvconperiod] as double,
        mrecconperiod : map[TablesColumnFile.mrecconperiod] as double,
        mpayconperiod : map[TablesColumnFile.mpayconperiod] as double,
        mworkngcapitalcycle : map[TablesColumnFile.mworkngcapitalcycle] as double
    );
  }
  factory FinancialStmntBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return FinancialStmntBean(

        mcustno : map[TablesColumnFile.mcustno]as int,
        mgrossprofitmargin : map[TablesColumnFile.mgrossprofitmargin] as double,
        mcurrentratio : map[TablesColumnFile.mcurrentratio] as double,
        mdebtratio : map[TablesColumnFile.mdebtratio] as double,
        mtotcurasset : map[TablesColumnFile.mtotcurasset] as double,
        mtotcurliabilities : map[TablesColumnFile.mtotcurliabilities] as double,
        mworkngcapital : map[TablesColumnFile.mworkngcapital] as double,
        mavginventory : map[TablesColumnFile.mavginventory] as double,
        mavgaccreceivables : map[TablesColumnFile.mavgaccreceivables] as double,
        mavgaccpayables : map[TablesColumnFile.mavgaccpayables] as double,
        mcogs : map[TablesColumnFile.mcogs] as double,
        msales : map[TablesColumnFile.msales] as double,
        mpurchases : map[TablesColumnFile.mpurchases] as double,
        minvconperiod : map[TablesColumnFile.minvconperiod] as double,
        mrecconperiod : map[TablesColumnFile.mrecconperiod] as double,
        mpayconperiod : map[TablesColumnFile.mpayconperiod] as double,
        mworkngcapitalcycle : map[TablesColumnFile.mworkngcapitalcycle] as double,
    );}

}
