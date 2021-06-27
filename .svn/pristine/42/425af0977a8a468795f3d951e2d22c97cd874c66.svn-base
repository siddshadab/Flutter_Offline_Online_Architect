import 'package:eco_los/db/TablesColumnFile.dart';

class ImageBean {

  String imgType;
  String imgSubType;
  String desc;
  String imgString;

  ImageBean(
      { this.imgType, this.imgSubType, this.desc, this.imgString});

  factory ImageBean.fromMap(Map<String, dynamic> map) {
    return ImageBean(

      imgType: map[TablesColumnFile.imageType] as String,
      imgSubType: map[TablesColumnFile.imageSubType] as String,
      imgString: map[TablesColumnFile.imageString] as String,
      desc: map[TablesColumnFile.desc] as String,
    );
  }

  factory ImageBean.fromMapFromMiddleWare(Map<String, dynamic> map) {
    return ImageBean(

      imgType: map["imgType"] as String,
        imgSubType: map["imgSubType"] as String,
      imgString: map["imgString"] as String,
      desc: map[TablesColumnFile.desc] as String,
    );
  }


}
