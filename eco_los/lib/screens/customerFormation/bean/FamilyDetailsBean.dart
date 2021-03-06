
import 'package:eco_los/db/TablesColumnFile.dart';

class FamilyDetailsBean {

  int mcustno;
  //NVarChar(50)
  String mnametitle;
  String mlongname;
  String mfname;
  String mmname;

  @override
  String toString() {
    return 'FamilyDetailsBean{mcustno: $mcustno, mnametitle: $mnametitle, mlongname: $mlongname, mfname: $mfname, mmname: $mmname, mlname: $mlname, mnicno: $mnicno, mdob: $mdob, mage: $mage, meducation: $meducation, mmemberno: $mmemberno, moccuptype: $moccuptype, mincome: $mincome, mhealthstatus: $mhealthstatus, mrelationwithcust: $mrelationwithcust, mreverseRelationship: $mreverseRelationship, maritalstatus: $maritalstatus, mcontrforhouseexp: $mcontrforhouseexp, macidntlinsurance: $macidntlinsurance, mnomineeyn: $mnomineeyn, misstudyingmembr: $misstudyingmembr, misearngmembr: $misearngmembr, mdesignation: $mdesignation, mprofession: $mprofession, misleavingwithappcnt: $misleavingwithappcnt, positionindex: $positionindex}';
  }

  String mlname;

  //String mname;
  //NVarChar(25)
  String mnicno;
  DateTime mdob;
  //numeric(2)
  int mage;
  //NVarChar(15)
  String meducation;
  //NVarChar(30)
  String mmemberno;
  //numeric(4)
  int moccuptype;
  double mincome;
  //numeric(1)
  int mhealthstatus;
  //NVarChar(3)
  String mrelationwithcust;
  String mreverseRelationship;
  //numeric(2)
  String maritalstatus;
  double mcontrforhouseexp;
  //NVarChar(1)
    String macidntlinsurance;
  //NVarChar(1)
  String mnomineeyn;
 int misstudyingmembr;
 int misearngmembr;
  String mdesignation;
  String mprofession;
  int misleavingwithappcnt;
  int positionindex;


  FamilyDetailsBean(
      {

        this.mcustno,
       // this.mname,
        this.mnametitle,
        this.mlongname,
        this.mfname,
        this.mmname,
        this.mlname,
        this.mnicno,
        this.mdob,
        this.mage,
        this.meducation,
        this.mmemberno,
        this.moccuptype,
        this.mincome,
        this.mhealthstatus,
        this.mrelationwithcust,
        this.maritalstatus,
        this.mcontrforhouseexp,
        this.macidntlinsurance,
        this.mnomineeyn,
        this.misearngmembr,
        this.misstudyingmembr,
        this.mreverseRelationship,
        this.mdesignation,
        this.mprofession,
        this.misleavingwithappcnt,
        this.positionindex

      });



  factory FamilyDetailsBean.  fromMap(Map<String, dynamic> map) {
    print("Fam    xxxxxxxxxxx"+map.toString());
    return FamilyDetailsBean(


      mcustno: map[TablesColumnFile.mcustno]as int,
    //  mname: map[TablesColumnFile.mname]as String,
      mnicno: map[TablesColumnFile.mnicno]as String,
      mdob:(map[TablesColumnFile.mdob]=="null"||map[TablesColumnFile.mdob]==null)?null:DateTime.parse(map[TablesColumnFile.mdob]) as DateTime,
      mage: map[TablesColumnFile.mage]as int,
      meducation: map[TablesColumnFile.meducation]as String,
      mreverseRelationship: map[TablesColumnFile.mreverseRelationship]as String,
      mmemberno: map[TablesColumnFile.mmemberno]as String,
      moccuptype: map[TablesColumnFile.moccuptype]as int,
      mincome: map[TablesColumnFile.mincome]as double,
      mhealthstatus: map[TablesColumnFile.mhealthstatus]as int,
      mrelationwithcust: map[TablesColumnFile.mrelationwithcust]as String,
      maritalstatus: map[TablesColumnFile.maritalstatus]as String,
      mcontrforhouseexp: map[TablesColumnFile.mcontrforhouseexp]as double,
      macidntlinsurance: map[TablesColumnFile.macidntlinsurance]as String,
      mnomineeyn: map[TablesColumnFile.mnomineeyn]as String,
      misearngmembr:map[TablesColumnFile.misearngmembr] as int,
      misstudyingmembr:map[TablesColumnFile.misstudyingmembr] as int,
      misleavingwithappcnt:map[TablesColumnFile.misleavingwithappcnt] as int,
      mnametitle: map[TablesColumnFile.mnametitle] as String,
      mlongname: map[TablesColumnFile.mlongname] as String,
      mfname: map[TablesColumnFile.mfname] as String,
      mmname: map[TablesColumnFile.mmname] as String,
      mlname: map[TablesColumnFile.mlname] as String,
      mdesignation: map[TablesColumnFile.mdesignation] as String,
      mprofession: map[TablesColumnFile.mprofession] as String,

    );
  }
  factory FamilyDetailsBean.fromMapMiddleware(Map<String, dynamic> map,bool isFromMiddleware) {
    print("fromMap");
    return FamilyDetailsBean(

      mcustno: map[TablesColumnFile.mcustno]as int,
     // mname: map[TablesColumnFile.mname]as String,
      mnicno: map[TablesColumnFile.mnicno]as String,
      mdob:(map[TablesColumnFile.mdob]=="null"||map[TablesColumnFile.mdob]==null)?null:DateTime.parse(map[TablesColumnFile.mdob]) as DateTime,
      mage: map[TablesColumnFile.mage]as int,
      meducation: map[TablesColumnFile.meducation]as String,
      mmemberno: map[TablesColumnFile.mmemberno]as String,
      moccuptype: map[TablesColumnFile.moccuptype]as int,
      mincome: map[TablesColumnFile.mincome]as double,
      mhealthstatus: map[TablesColumnFile.mhealthstatus]as int,
      mrelationwithcust: map[TablesColumnFile.mrelationwithcust]as String,
      maritalstatus: map[TablesColumnFile.maritalstatus]as String,
      mcontrforhouseexp: map[TablesColumnFile.mcontrforhouseexp]as double,
      macidntlinsurance: map[TablesColumnFile.macidntlinsurance]as String,
      mnomineeyn: map[TablesColumnFile.mnomineeyn]as String,
      misearngmembr:map[TablesColumnFile.misearngmembr] as int,
      misstudyingmembr:map[TablesColumnFile.misstudyingmembr] as int,
      misleavingwithappcnt:map[TablesColumnFile.misleavingwithappcnt] as int,
      mreverseRelationship: map[TablesColumnFile.mreverseRelationship]as String,
      mnametitle: map[TablesColumnFile.mnametitle] as String,
      mlongname: map[TablesColumnFile.mlongname] as String,
      mfname: map[TablesColumnFile.mfname] as String,
      mmname: map[TablesColumnFile.mmname] as String,
      mlname: map[TablesColumnFile.mlname] as String,

      mdesignation: map[TablesColumnFile.mdesignation] as String,
      mprofession: map[TablesColumnFile.mprofession] as String,
    );}

}

