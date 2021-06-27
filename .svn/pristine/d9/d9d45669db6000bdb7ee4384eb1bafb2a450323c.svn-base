
import 'package:eco_los/db/TablesColumnFile.dart';

class BorrowingDetailsBean {

  //numeric(8)
  int mcustno;
  //numeric(6)
  int  msrno;
  //NVarChar(50)
  String mnameofborrower;
  //NVarChar(50)
  String msource;
  //NVarChar(50)
  String mpurpose;
  double mamount;
  double mintrate;
  double memiamt;
  double moutstandingamt;
  //NVarChar(30)
  String mmemberno;
  //numeric(2)
  double mloancycle;
  DateTime mloanDate;
  DateTime mrepaymentDate;
  String mloanwthUs;
  String macctno;
  int mperiod;
  String mfrequency;
  String mcurcd;
  String mrestructrdloan;
  double msvngamount;
  String mremark;
  String mmodeofdisb;
  int positionindex;

  BorrowingDetailsBean(
      {
        this.mcustno,
        this. msrno,
        this.mnameofborrower,
        this.msource,
        this.mpurpose,
        this.mamount,
        this.mintrate,
        this.memiamt,
        this.moutstandingamt,
        this.mmemberno,
        this.mloancycle,
      this.mloanDate,
      this.mloanwthUs,
      this.mrepaymentDate,
        this.macctno,
        this.mperiod,
        this.mfrequency,
        this.mcurcd,
        this.mrestructrdloan,
        this.msvngamount,
        this.mremark,
        this.mmodeofdisb,
        this.positionindex
      });



  factory BorrowingDetailsBean.fromMap(Map<String, dynamic> map) {
    print("inside Borrowing Details map");
    print(map);
    return BorrowingDetailsBean(
        mcustno:	 map[TablesColumnFile.mcustno] as int,
        mnameofborrower:	 map[TablesColumnFile.mnameofborrower] as String,
        msource:	 map[TablesColumnFile.msource] as String,
        mpurpose:	 map[TablesColumnFile.mpurpose] as String,
        mamount:	 map[TablesColumnFile.mamount] as double,
        mintrate:	 map[TablesColumnFile.mintrate] as double,
        memiamt:	 map[TablesColumnFile.memiamt] as double,
        moutstandingamt:	 map[TablesColumnFile.moutstandingamt] as double,
        mmemberno:	 map[TablesColumnFile.mmemberno] as String,
        mloancycle:	 map[TablesColumnFile.mloancycle] as double,
        mloanDate:(map[TablesColumnFile.mloanDate]=="null"||map[TablesColumnFile.mloanDate]==null)?null:DateTime.parse(map[TablesColumnFile.mloanDate]) as DateTime,
        mrepaymentDate:(map[TablesColumnFile.mrepaymentDate]=="null"||map[TablesColumnFile.mrepaymentDate]==null)?null:DateTime.parse(map[TablesColumnFile.mrepaymentDate]) as DateTime,
        mloanwthUs:	 map[TablesColumnFile.mloanwthUs] as String,
        macctno:	 map[TablesColumnFile.macctno] as String,
        mperiod:	 map[TablesColumnFile.mperiod] as int,
        mfrequency:	 map[TablesColumnFile.mfrequency] as String,
        mcurcd:	 map[TablesColumnFile.mcurcd] as String,
        mrestructrdloan:	 map[TablesColumnFile.mrestructrdloan] as String,
        msvngamount:	 map[TablesColumnFile.msvngamount] as double,
      mremark:	 map[TablesColumnFile.mremark] as String,
      mmodeofdisb:	 map[TablesColumnFile.mmodeofdisb] as String,
    );
  }
}
