import 'package:eco_los/db/TablesColumnFile.dart';

class DeleteTableBean {
  int mrefno;
  String tablename;
  int trefno;



  DeleteTableBean(
      {this.mrefno,
        this.tablename,
        this.trefno
      });

  factory DeleteTableBean.fromMap(Map<String, dynamic> map) {
    print("inside for map");
    return DeleteTableBean(
        mrefno:	map[TablesColumnFile.mrefno] as int,
        tablename:	map[TablesColumnFile.tablename] as String,
        trefno:	map[TablesColumnFile.trefno] as int
    );

  }
  factory DeleteTableBean.fromMapMiddleware(Map<String, dynamic> map) {
    print("fromMap");
    return DeleteTableBean(
        mrefno:	map[TablesColumnFile.mrefno] as int,
        tablename:	map[TablesColumnFile.tablename] as String,
        trefno:	map[TablesColumnFile.trefno] as int
    );
  }

}

