import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/db/TablesColumnFile.dart';

class AssetDetailsBean {


  int mcustno;
  int mitem;

  AssetDetailsBean(
      {

        this.mcustno,
        this.mitem
      });


  factory AssetDetailsBean.fromMap(Map<String, dynamic> map) {
    return AssetDetailsBean(

      mcustno: map[TablesColumnFile.mcustno]as int,
      mitem: map[TablesColumnFile.mitem]as int
    );
  }
  factory AssetDetailsBean.fromMapMiddleware(Map<String, dynamic> map,bool isFromMiddleware) {
    print("fromMap");
    return AssetDetailsBean(

        mcustno: map[TablesColumnFile.mcustno]as int,
        mitem: map[TablesColumnFile.mitem]as int
    );}

}
