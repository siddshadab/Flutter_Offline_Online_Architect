import 'package:eco_los/db/TablesColumnFile.dart';

class CollateralsGoldMasterBean {

  int mlbrcode;
  String mprdacctid;

  String item;
  String caratetype;
  int numberofitems;
  double weight;
  double netweight;
  double marketvalue;
  double sanction;
  double lendingamnt;
  double elegibleamnt;



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




  CollateralsGoldMasterBean(
      {

        this.mlbrcode,
        this.mprdacctid,

         this.item,
         this.caratetype,
         this.numberofitems,
        this.weight,
        this.netweight,
        this.marketvalue,
        this.sanction,
        this.lendingamnt,
        this.elegibleamnt,


        this.mcreateddt,
        this.mcreatedby,
        this.mlastupdatedt,
        this.mlastupdateby,
        this.mgeolocation,
        this.mgeolatd,
        this.mgeologd,
        this.mlastsynsdate,
        this.merrormessage,
        this.missynctocoresys,
      });


  factory CollateralsGoldMasterBean.fromMap(Map<String, dynamic> map) {
    print("inside for map");
    return CollateralsGoldMasterBean(

      mlbrcode:	map[TablesColumnFile.mlbrcode] as int,
      mprdacctid:	map[TablesColumnFile.mprdacctid] as String,

      item:	map[TablesColumnFile.item] as String,
      caratetype:	map[TablesColumnFile.caratetype] as String,
      numberofitems:	map[TablesColumnFile.numberofitems] as int,
      weight:	map[TablesColumnFile.weight] as double,
      netweight:	map[TablesColumnFile.netweight] as double,
      marketvalue:	map[TablesColumnFile.marketvalue] as double,
      sanction:	map[TablesColumnFile.sanction] as double,
      lendingamnt:	map[TablesColumnFile.lendingamnt] as double,
      elegibleamnt:	map[TablesColumnFile.elegibleamnt] as double,

      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:	map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:	map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:	map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:	map[TablesColumnFile.mgeolatd] as String,
      mgeologd:	map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,
      merrormessage:	map[TablesColumnFile.merrormessage] as String,
      missynctocoresys:	map[TablesColumnFile.missynctocoresys] as int,








    );

  }
  factory CollateralsGoldMasterBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return CollateralsGoldMasterBean(

      mlbrcode:	map[TablesColumnFile.mlbrcode] as int,
      mprdacctid:	map[TablesColumnFile.mprdacctid] as String,

      item:	map[TablesColumnFile.item] as String,
      caratetype:	map[TablesColumnFile.caratetype] as String,
      numberofitems:	map[TablesColumnFile.numberofitems] as int,
      weight:	map[TablesColumnFile.weight] as double,
      netweight:	map[TablesColumnFile.netweight] as double,
      marketvalue:	map[TablesColumnFile.marketvalue] as double,
      sanction:	map[TablesColumnFile.sanction] as double,
      lendingamnt:	map[TablesColumnFile.lendingamnt] as double,
      elegibleamnt:	map[TablesColumnFile.elegibleamnt] as double,

      mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:	map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:	map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:	map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:	map[TablesColumnFile.mgeolatd] as String,
      mgeologd:	map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,
      merrormessage:	map[TablesColumnFile.merrormessage] as String,
      missynctocoresys:	map[TablesColumnFile.missynctocoresys] as int,
    );
  }

}

