import 'package:eco_los/db/TablesColumnFile.dart';

class MissyncChangerBean {
  int mrefno;
  String tablename;
  int trefno;



  MissyncChangerBean(
      {this.mrefno,
        this.tablename,
        this.trefno
      });

  factory MissyncChangerBean.fromMap(Map<String, dynamic> map) {
    print("inside for map");
    return MissyncChangerBean(
        mrefno:	map[TablesColumnFile.mrefno] as int,
        tablename:	map[TablesColumnFile.tablename] as String,
        trefno:	map[TablesColumnFile.trefno] as int
    );

  }
  factory MissyncChangerBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return MissyncChangerBean(
        mrefno:	map[TablesColumnFile.mrefno] as int,
        tablename:	map[TablesColumnFile.tablename] as String,
        trefno:	map[TablesColumnFile.trefno] as int
    );
  }

}

