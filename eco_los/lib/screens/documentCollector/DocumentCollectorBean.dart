

import 'dart:convert';

import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';

  class DocumentCollectorBean{

    static const JsonCodec JSON = const JsonCodec();
    String  UUID;
    String  LOANUUID;
    String  CUSTUUID;
  String mforeignindicator;
  String  mdoctno;
  String  mcustname;
  int mcustno;
  String  missuingauth;
  DateTime missuedate;
    DateTime mexpdate;
  DateTime mexecutiondate;

  String mimgtype;
  String mcustomertype;
  String mimgtypedesc;
  String mimgsubtype;
  String mcomment;
  String imgstring;
  String mremarks;
  DateTime mcreateddt;
  String mcreatedby;
  DateTime mlastupdatedt;
  String mlastupdateby;
  String mgeolocation;
  String mgeolatd;
  String mgeologd;
  DateTime mlastsynsdate;
  String merrormessage;



  DocumentCollectorBean(
      {this.mforeignindicator,this.UUID,this.mimgtype,this.mcustomertype,this.LOANUUID, this.mimgtypedesc, this.mimgsubtype,
        this.mcomment, this.imgstring,this.mremarks, this.CUSTUUID,
         this.mdoctno,this.mcustname,this.mcustno,
        this.missuingauth,this.missuedate,this.mexpdate,this.mexecutiondate, this.mcreateddt,
        this.mcreatedby,
        this.mlastupdatedt,
        this.mlastupdateby,
        this.mgeolocation,
        this.mgeolatd,
        this.mgeologd,
        this.mlastsynsdate,
        this.merrormessage,});

    static Future<Map> toDocumentJson(DocumentCollectorBean bean) async {
      var map = new Map();
      map[TablesColumnFile.mforeignindicator]  = bean.mforeignindicator;
      map[TablesColumnFile.mimgtype] = bean.mimgtype;
      map[TablesColumnFile.mcustomertype] = bean.mcustomertype;
      map[TablesColumnFile.mimgtypedesc] = bean.mimgtypedesc;
      map[TablesColumnFile.mimgsubtype] = bean.mimgsubtype;
      map[TablesColumnFile.mcomment] = bean.mcomment;
      map[TablesColumnFile.imgstring] = bean.imgstring;
      map[TablesColumnFile.mremarks] = bean.mremarks;
      map[TablesColumnFile.mdoctno] = bean.mdoctno;
      map[TablesColumnFile.mcustname] = bean.mcustname;
      map[TablesColumnFile.mcustno] = bean.mcustno;
      map[TablesColumnFile.missuingauth] = bean.missuingauth;
      map[TablesColumnFile.missuedate]= bean.missuedate;
      map[TablesColumnFile.mexpdate]= bean.mexpdate;
      map[TablesColumnFile.mexecutiondate]= bean.mexecutiondate;
      map[TablesColumnFile.mcreateddt]= bean.mcreateddt;
      map[TablesColumnFile.mcreatedby] = bean.mcreatedby;
      map[TablesColumnFile.mlastupdatedt]= bean.mlastupdatedt;
      map[TablesColumnFile.mlastupdateby] = bean.mlastupdateby;
      map[TablesColumnFile.mgeolocation] = bean.mgeolocation;
      map[TablesColumnFile.mgeolatd] = bean.mgeolatd;
      map[TablesColumnFile.mgeologd] = bean.mgeologd;
      map[TablesColumnFile.mlastsynsdate]= bean.mlastsynsdate;

    }
  factory DocumentCollectorBean.fromMap(Map<String, dynamic> map) {
    return DocumentCollectorBean(

      mforeignindicator: 	 map[TablesColumnFile.mforeignindicator],
      mimgtype: 	 map[TablesColumnFile.mimgtype] as String,
      mcustomertype: 	 map[TablesColumnFile.mcustomertype] as String,
      mimgtypedesc: map[TablesColumnFile.mimgtypedesc] as String,
      mimgsubtype: map[TablesColumnFile.mimgsubtype] as String,
      mcomment: map[TablesColumnFile.mcomment] as String,
      imgstring: map[TablesColumnFile.imgstring] as String,
      mremarks: map[TablesColumnFile.mremarks] as String,
      mdoctno: 	 map[TablesColumnFile.mdoctno] as String,
      mcustname: 	 map[TablesColumnFile.mcustname] as String,
      mcustno:	map[TablesColumnFile.mcustno] as int,
      missuingauth: 	 map[TablesColumnFile.missuingauth] as String,
      missuedate:(map[TablesColumnFile.missuedate]=="null"||map[TablesColumnFile.missuedate]==null)?null:DateTime.parse(map[TablesColumnFile.missuedate]) as DateTime,
      mexpdate:(map[TablesColumnFile.mexpdate]=="null"||map[TablesColumnFile.mexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mexpdate]) as DateTime,
      mexecutiondate:(map[TablesColumnFile.mexecutiondate]=="null"||map[TablesColumnFile.mexecutiondate]==null)?null:DateTime.parse(map[TablesColumnFile.mexecutiondate]) as DateTime,
      mcreateddt:	(map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:map[TablesColumnFile.mgeolatd] as String,
      mgeologd:map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,

    );
  }

  factory DocumentCollectorBean.fromMapFromMiddleWare(Map<String, dynamic> map) {
    return DocumentCollectorBean(

      mforeignindicator: 	 map[TablesColumnFile.mforeignindicator] as String,
      mimgtype: 	 map[TablesColumnFile.mimgtype] as String,
      mcustomertype: 	 map[TablesColumnFile.mcustomertype] as String,
      mimgtypedesc: map[TablesColumnFile.mimgtypedesc] as String,
      mimgsubtype: map[TablesColumnFile.mimgsubtype] as String,
      mcomment: map[TablesColumnFile.mcomment] as String,
      imgstring: map[TablesColumnFile.imgstring] as String,
      mremarks: map[TablesColumnFile.mremarks] as String,
      mdoctno: 	 map[TablesColumnFile.mdoctno] as String,
      mcustname: 	 map[TablesColumnFile.mcustname] as String,
      mcustno:	map[TablesColumnFile.mcustno] as int,

      missuingauth: 	 map[TablesColumnFile.missuingauth] as String,
      missuedate:(map[TablesColumnFile.missuedate]=="null"||map[TablesColumnFile.missuedate]==null)?null:DateTime.parse(map[TablesColumnFile.missuedate]) as DateTime,
      mexpdate:(map[TablesColumnFile.mexpdate]=="null"||map[TablesColumnFile.mexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mexpdate]) as DateTime,
      mexecutiondate:(map[TablesColumnFile.mexecutiondate]=="null"||map[TablesColumnFile.mexecutiondate]==null)?null:DateTime.parse(map[TablesColumnFile.mexecutiondate]) as DateTime,
      mcreateddt:	(map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:map[TablesColumnFile.mgeolatd] as String,
      mgeologd:map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,

    );
  }


    factory DocumentCollectorBean.fromMapFromMiddleWareOnMrefno(Map<String, dynamic> map) {
    print("map------------- "+map.toString());
    return DocumentCollectorBean(
      mforeignindicator: 	 map[TablesColumnFile.mforeignindicator] as String,
      mimgtype: 	 map[TablesColumnFile.mimgtype] as String,
      mcustomertype: 	 map[TablesColumnFile.mcustomertype] as String,
      mimgtypedesc: map[TablesColumnFile.mimgtypedesc] as String,
      mimgsubtype: map[TablesColumnFile.mimgsubtype] as String,
      mcomment: map[TablesColumnFile.mcomment] as String,
      imgstring: map[TablesColumnFile.imgstring] as String,
      mremarks: map[TablesColumnFile.mremarks] as String,
      mdoctno: 	 map[TablesColumnFile.mdoctno] as String,
      mcustname: 	 map[TablesColumnFile.mcustname] as String,
      mcustno:	map[TablesColumnFile.mcustno] as int,
      missuingauth: 	 map[TablesColumnFile.missuingauth] as String,
      missuedate:(map[TablesColumnFile.missuedate]=="null"||map[TablesColumnFile.missuedate]==null)?null:DateTime.parse(map[TablesColumnFile.missuedate]) as DateTime,
      mexpdate:(map[TablesColumnFile.mexpdate]=="null"||map[TablesColumnFile.mexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mexpdate]) as DateTime,
      mexecutiondate:(map[TablesColumnFile.mexecutiondate]=="null"||map[TablesColumnFile.mexecutiondate]==null)?null:DateTime.parse(map[TablesColumnFile.mexecutiondate]) as DateTime,
      mcreateddt:	(map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
      mcreatedby:map[TablesColumnFile.mcreatedby] as String,
      mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
      mlastupdateby:map[TablesColumnFile.mlastupdateby] as String,
      mgeolocation:map[TablesColumnFile.mgeolocation] as String,
      mgeolatd:map[TablesColumnFile.mgeolatd] as String,
      mgeologd:map[TablesColumnFile.mgeologd] as String,
      mlastsynsdate:(map[TablesColumnFile.mlastsynsdate]=="null"||map[TablesColumnFile.mlastsynsdate]==null)?null:DateTime.parse(map[TablesColumnFile.mlastsynsdate]) as DateTime,

    );
  }


    factory DocumentCollectorBean.fromMapV2(Map<String, dynamic> map) {
      final Map<String, dynamic> data  =  JSON.decode(map[TablesColumnFile.DOCDATA]);
      Constant.getAppPath(data.toString(),"AfterLoanSave");
      print(data);
      return DocumentCollectorBean(
        UUID: map[TablesColumnFile.UUID] as String,
        CUSTUUID: map[TablesColumnFile.CUSTUUID] as String,
        mcreateddt: (map[TablesColumnFile.mcreateddt]=="null"||map[TablesColumnFile.mcreateddt]==null)?null:DateTime.parse(map[TablesColumnFile.mcreateddt]) as DateTime,
        mcreatedby:map[TablesColumnFile.mcreatedby],
        mlastupdatedt:(map[TablesColumnFile.mlastupdatedt]=="null"||map[TablesColumnFile.mlastupdatedt]==null)?null:DateTime.parse(map[TablesColumnFile.mlastupdatedt]) as DateTime,
        mlastupdateby:map[TablesColumnFile.mlastupdateby],
        mgeolocation:map[TablesColumnFile.mgeolocation],
        mgeolatd:map[TablesColumnFile.mgeolatd],
        mgeologd:map[TablesColumnFile.mgeologd],

        mforeignindicator: 	 map[TablesColumnFile.mforeignindicator] as String,
        mimgtype: 	 map[TablesColumnFile.mimgtype] as String,
        mcustomertype: 	 map[TablesColumnFile.mcustomertype] as String,
        mimgtypedesc: map[TablesColumnFile.mimgtypedesc] as String,
        mimgsubtype: map[TablesColumnFile.mimgsubtype] as String,
        mcomment: map[TablesColumnFile.mcomment] as String,
        imgstring: map[TablesColumnFile.imgstring] as String,
        mremarks: map[TablesColumnFile.mremarks] as String,
        mdoctno: 	 map[TablesColumnFile.mdoctno] as String,
        mcustname: 	 map[TablesColumnFile.mcustname] as String,
        mcustno:	map[TablesColumnFile.mcustno] as int,
        missuingauth: 	 map[TablesColumnFile.missuingauth] as String,
        missuedate:(map[TablesColumnFile.missuedate]=="null"||map[TablesColumnFile.missuedate]==null)?null:DateTime.parse(map[TablesColumnFile.missuedate]) as DateTime,
        mexpdate:(map[TablesColumnFile.mexpdate]=="null"||map[TablesColumnFile.mexpdate]==null)?null:DateTime.parse(map[TablesColumnFile.mexpdate]) as DateTime,
        mexecutiondate:(map[TablesColumnFile.mexecutiondate]=="null"||map[TablesColumnFile.mexecutiondate]==null)?null:DateTime.parse(map[TablesColumnFile.mexecutiondate]) as DateTime,


      );
    }

}
