import 'package:eco_los/db/TablesColumnFile.dart';

class LongTermLiabilitiesBean {

  int mcustno;
  double mcash;
  double mcashpresentamt=0.0;
  double mcashnextmonthamount=0.0;

  double maccntrecvbl;
  double maccntrecvblpresentamt=0.0;
  double maccntrecvblnextmonthamount=0.0;



  double msumpresentamt=0.0;
  double msumnextmonthamount=0.0;


  

  LongTermLiabilitiesBean(
      {
               this.mcustno,
        this.mcash,
        this.mcashpresentamt,
        this.mcashnextmonthamount,
        this.maccntrecvbl,
        this.maccntrecvblpresentamt,
        this.maccntrecvblnextmonthamount,
        this.msumpresentamt,
        this.msumnextmonthamount
      });





  factory LongTermLiabilitiesBean.fromMap(Map<String, dynamic> map) {
    return LongTermLiabilitiesBean(

      mcustno : map[TablesColumnFile.mcustno]as int,
        mcash :	map[TablesColumnFile.mcash]as double,
        mcashpresentamt:	map[TablesColumnFile.mcashpresentamt] as double,
        mcashnextmonthamount:	map[TablesColumnFile.mcashnextmonthamount] as double,

        maccntrecvbl:	map[TablesColumnFile.maccntrecvbl]as double,
        maccntrecvblpresentamt:	map[TablesColumnFile.maccntrecvblpresentamt] as double,
        maccntrecvblnextmonthamount:	map[TablesColumnFile.maccntrecvblnextmonthamount] as double,
      msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
      msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double
    );
  }
  factory LongTermLiabilitiesBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return LongTermLiabilitiesBean(

        mcustno : map[TablesColumnFile.mcustno]as int,

        mcash :	map[TablesColumnFile.mcash]as double,
        mcashpresentamt:	map[TablesColumnFile.mcashpresentamt] as double,
        mcashnextmonthamount:	map[TablesColumnFile.mcashnextmonthamount] as double,

        maccntrecvbl:	map[TablesColumnFile.maccntrecvbl]as double,
        maccntrecvblpresentamt:	map[TablesColumnFile.maccntrecvblpresentamt] as double,
        maccntrecvblnextmonthamount:	map[TablesColumnFile.maccntrecvblnextmonthamount] as double,

        msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
        msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double
    );}

}
