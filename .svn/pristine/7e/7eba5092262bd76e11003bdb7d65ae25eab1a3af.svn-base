

import 'package:eco_los/db/TablesColumnFile.dart';

class HbsUserBean{

  String musrcode;
  String musrname;
  int musrbrcode;
  int mgrpcd;



  HbsUserBean({this.musrcode, this.musrname, this.musrbrcode,this.mgrpcd});

  factory HbsUserBean.fromMap(Map<String, dynamic> json) {
    return HbsUserBean(
    musrcode: json[TablesColumnFile.musrcode] as String,
    musrname: json[TablesColumnFile.musrname] as String,
    musrbrcode: json[TablesColumnFile.musrbrcode] as int,
    mgrpcd: json[TablesColumnFile.mgrpcd] as int,

    );
  }
}