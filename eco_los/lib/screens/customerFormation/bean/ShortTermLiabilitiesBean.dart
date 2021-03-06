import 'package:eco_los/db/TablesColumnFile.dart';

class ShortTermLiabilitiesBean {

  int mcustno;

  double mcash;
  double mcashpresentamt=0.0;
  double mcashnextmonthamount=0.0;

  double maccntrecvbl;
  double maccntrecvblpresentamt=0.0;
  double maccntrecvblnextmonthamount=0.0;

  double mfield3;
  double mfield3presentamt=0.0;
  double mfield3nextmonthamount=0.0;

  double mfield4;
  double mfield4presentamt=0.0;
  double mfield4nextmonthamount=0.0;

  double msumpresentamt=0.0;
  double msumnextmonthamount=0.0;




  ShortTermLiabilitiesBean(
      {

        this.mcustno,
        this.mcash,
        this.mcashpresentamt,
        this.mcashnextmonthamount,
        this.maccntrecvbl,
        this.maccntrecvblpresentamt,
        this.maccntrecvblnextmonthamount,
        this.mfield3,
        this.mfield3presentamt,
        this.mfield3nextmonthamount,
        this.mfield4,
        this.mfield4presentamt,
        this.mfield4nextmonthamount,
        this.msumpresentamt,
        this.msumnextmonthamount
      });




  factory ShortTermLiabilitiesBean.fromMap(Map<String, dynamic> map) {
    return ShortTermLiabilitiesBean(

      mcustno : map[TablesColumnFile.mcustno]as int,
        mcash :	map[TablesColumnFile.mcash]as double,
        mcashpresentamt:	map[TablesColumnFile.mcashpresentamt] as double,
        mcashnextmonthamount:	map[TablesColumnFile.mcashnextmonthamount] as double,

        maccntrecvbl:	map[TablesColumnFile.maccntrecvbl]as double,
        maccntrecvblpresentamt:	map[TablesColumnFile.maccntrecvblpresentamt] as double,
        maccntrecvblnextmonthamount:	map[TablesColumnFile.maccntrecvblnextmonthamount] as double,


        mfield3:	map[TablesColumnFile.mfield3]as double,
        mfield3presentamt:	map[TablesColumnFile.mfield3presentamt] as double,
        mfield3nextmonthamount:	map[TablesColumnFile.mfield3nextmonthamount] as double,

        mfield4:	map[TablesColumnFile.mfield4]as double,
        mfield4presentamt:	map[TablesColumnFile.mfield4presentamt] as double,
        mfield4nextmonthamount:	map[TablesColumnFile.mfield4nextmonthamount] as double,

      msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
      msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double
    );
  }
  factory ShortTermLiabilitiesBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return ShortTermLiabilitiesBean(

        mcustno : map[TablesColumnFile.mcustno]as int,
        mcash :	map[TablesColumnFile.mcash]as double,
        mcashpresentamt:	map[TablesColumnFile.mcashpresentamt] as double,
        mcashnextmonthamount:	map[TablesColumnFile.mcashnextmonthamount] as double,

        maccntrecvbl:	map[TablesColumnFile.maccntrecvbl]as double,
        maccntrecvblpresentamt:	map[TablesColumnFile.maccntrecvblpresentamt] as double,
        maccntrecvblnextmonthamount:	map[TablesColumnFile.maccntrecvblnextmonthamount] as double,

        mfield3:	map[TablesColumnFile.mfield3]as double,
        mfield3presentamt:	map[TablesColumnFile.mfield3presentamt] as double,
        mfield3nextmonthamount:	map[TablesColumnFile.mfield3nextmonthamount] as double,

        mfield4:	map[TablesColumnFile.mfield4]as double,
        mfield4presentamt:	map[TablesColumnFile.mfield4presentamt] as double,
        mfield4nextmonthamount:	map[TablesColumnFile.mfield4nextmonthamount] as double,
        msumpresentamt : map[TablesColumnFile.msumpresentamt] as double,
        msumnextmonthamount : map[TablesColumnFile.msumnextmonthamount] as double
    );}

}
