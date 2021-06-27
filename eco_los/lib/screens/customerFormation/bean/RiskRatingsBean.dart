
import 'package:eco_los/db/TablesColumnFile.dart';

class RiskRatingsBean{

String mtypeofaccount;
String macctno;       //Account Number
String mcifno;
String vmpurposeofacct;  //Purpose of account Opening
String mcountryrisk;   //12121 >Does The customer comes from,riside in, or work in high risk country
String mvisaperiod;    //12122 > Visa (Foreigner Only) period
String mvisavalid;     //12123 >  Visa (Foreigner Only) validity
String mvisatype;      //12124 > Visa (Foreigner Only) type
String mnatureofbuss; //12125 >  Naturer Of Business
String mhwwsacctopn;  //12126 >  How Was the A/C Oppened
String mnetwrth;      //12127 >  Net Worth/ Sales turnover
String mexpectedvalue;//12128 >  Expeected Values
String mnooftransmnthly;//12129 > No Of Transactions (Monthly)
String mhighnetwrth;    //121230 > High Net Worth Customer(Avereage Account Balance Exceeds USD-1,000,000")
String mprcdservrskque1;   //12131 > Does The Customer Instruct Telegraphich Transfer immediately after opening the account and the account exceed  USD-1,000,000 or the equivelent currency

RiskRatingsBean(
{

  this.mtypeofaccount,
  this.macctno,
  this.mcifno,
  this.vmpurposeofacct,
  this.mcountryrisk,
  this.mvisaperiod,
  this.mvisavalid,
  this.mvisatype,
  this.mnatureofbuss,
  this.mhwwsacctopn,
  this.mnetwrth,
  this.mexpectedvalue,
  this.mnooftransmnthly,
  this.mhighnetwrth,
  this.mprcdservrskque1,
});




factory RiskRatingsBean.fromMap(Map<String, dynamic> map) {
  return RiskRatingsBean(

    mtypeofaccount:	 map[TablesColumnFile.mtypeofaccount] as String,
    macctno:	 map[TablesColumnFile.macctno] as String,
    mcifno:	 map[TablesColumnFile.mcifno] as String,
    vmpurposeofacct:	 map[TablesColumnFile.vmpurposeofacct] as String,
    mcountryrisk:	 map[TablesColumnFile.mcountryrisk] as String,
    mvisaperiod:	 map[TablesColumnFile.mvisaperiod] as String,
    mvisavalid:	 map[TablesColumnFile.mvisavalid] as String,
    mvisatype:	 map[TablesColumnFile.mvisatype] as String,
    mnatureofbuss:	 map[TablesColumnFile.mnatureofbuss] as String,
    mhwwsacctopn:	 map[TablesColumnFile.mhwwsacctopn] as String,
    mnetwrth:	 map[TablesColumnFile.mnetwrth] as String,
    mexpectedvalue:	 map[TablesColumnFile.mexpectedvalue] as String,
    mnooftransmnthly:	 map[TablesColumnFile.mnooftransmnthly] as String,
    mhighnetwrth:	 map[TablesColumnFile.mhighnetwrth] as String,
    mprcdservrskque1:	 map[TablesColumnFile.mprcdservrskque1] as String,

  );
}
factory RiskRatingsBean.fromMapMiddleware(Map<String, dynamic> map) {
  print("fromMap");
  return RiskRatingsBean(

    mtypeofaccount:	 map[TablesColumnFile.mtypeofaccount] as String,
    macctno:	 map[TablesColumnFile.macctno] as String,
    mcifno:	 map[TablesColumnFile.mcifno] as String,
    vmpurposeofacct:	 map[TablesColumnFile.vmpurposeofacct] as String,
    mcountryrisk:	 map[TablesColumnFile.mcountryrisk] as String,
    mvisaperiod:	 map[TablesColumnFile.mvisaperiod] as String,
    mvisavalid:	 map[TablesColumnFile.mvisavalid] as String,
    mvisatype:	 map[TablesColumnFile.mvisatype] as String,
    mnatureofbuss:	 map[TablesColumnFile.mnatureofbuss] as String,
    mhwwsacctopn:	 map[TablesColumnFile.mhwwsacctopn] as String,
    mnetwrth:	 map[TablesColumnFile.mnetwrth] as String,
    mexpectedvalue:	 map[TablesColumnFile.mexpectedvalue] as String,
    mnooftransmnthly:	 map[TablesColumnFile.mnooftransmnthly] as String,
    mhighnetwrth:	 map[TablesColumnFile.mhighnetwrth] as String,
     mprcdservrskque1:	 map[TablesColumnFile.mprcdservrskque1] as String,
  );}

}

