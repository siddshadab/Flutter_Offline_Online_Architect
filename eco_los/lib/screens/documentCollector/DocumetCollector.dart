import 'dart:convert';
import 'dart:io';

import 'package:eco_los/db/AppdatabaseV2.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/db/TablesList.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/Guarantor/GuarantorDetailsForSelection.dart';
import 'package:eco_los/screens/customerFormation/List/CustomerList.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBankDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/documentCollector/DocumentCollectorBean.dart';
import 'package:eco_los/screens/documentCollector/ViewDocuments.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


/*TODO Addto list button should not save image directly to datavase,
 it should be done by saave button and add butto should
 save list which will later save in database by save button
 */

var docListView=new List<PhotoViewGalleryPageOptions>();

class DocumetCollector extends StatefulWidget {
  final String LOANUUID;
  final String custname;
  final String CUSTUUID;
  final int cusno;
  final String routeType;
  final bool isEditAllowed;
  final String mprdCd;

  DocumetCollector(this.LOANUUID,this.custname,this.CUSTUUID,this.cusno, this.routeType,this.isEditAllowed,this.mprdCd);


  @override
  _DocumetCollectorState createState() => new _DocumetCollectorState();
}

class _DocumetCollectorState extends State<DocumetCollector> {

  static const JsonCodec JSON = const JsonCodec();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<DocumentCollectorBean> documentCollectorBeanList = new List<DocumentCollectorBean>();
  DocumentCollectorBean documentCollectorBean = new DocumentCollectorBean();
  LookupBeanData blankBean =
      new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);
  LookupBeanData documenttype;
  LookupBeanData customerType;
  String customerName;
  int branch = 0;
  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  String usrRole;
  String geoLocation;
  String geoLatitude;
  String geoLongitude;
  String reportingUser;
  bool isTypeSelected=false;
  String imgtyp;
  String custtyp;

  var formatter = new DateFormat('dd-MM-yyyy');
  String tempIssueDateYear;
  String tempIssueDateDay;
  String tempIssueDateMonth;
  String tempIssueDateDate = "----/--/--";

  String issueDate = "__-__-____";
  FocusNode monthIssueDateFocus;
  FocusNode yearIssueDateFocus;



  String tempExecutionDateYear;
  String tempExecutionDateDay;
  String tempExecutionDateMonth;
  String tempExecutionDateDate = "----/--/--";

  String ExecutionDate = DateTime.now().toString();
  FocusNode monthExecutionDateFocus;
  FocusNode yearExecutionDateFocus;


  String tempExpDateYear;
  String tempExpDateDay;
  String tempExpDateMonth;
  String tempExpDateDate = "----/--/--";

  String expDate = "__-__-____";
  FocusNode monthExpDateFocus;
  FocusNode yearExpDateFocus;
  bool isEditAllowed = false;
  List mandDocType;


  @override
  void initState() {

    monthIssueDateFocus = new FocusNode();
    yearIssueDateFocus = new FocusNode();
    monthExecutionDateFocus=new FocusNode();
    yearExecutionDateFocus=new FocusNode();
    monthExpDateFocus = new FocusNode();
    yearExpDateFocus = new FocusNode();

      if (widget.LOANUUID != null &&
          widget.LOANUUID != "null" &&
          widget.LOANUUID != "") {
        documentCollectorBean.LOANUUID = widget.LOANUUID;
      }


    getSessionVariables();


   }


  Future<Null> getSessionVariables() async {
    setState(() {});
    prefs = await SharedPreferences.getInstance();

    setState(() {
      branch = prefs.get(TablesColumnFile.musrbrcode);
      username = prefs.getString(TablesColumnFile.musrcode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      geoLocation = prefs.getString(TablesColumnFile.geoLocation);
      geoLatitude = prefs.get(TablesColumnFile.geoLatitude).toString();
      geoLongitude = prefs.get(TablesColumnFile.geoLongitude).toString();
      reportingUser = prefs.getString(TablesColumnFile.reportingUser);
    });

    if (widget.mprdCd != null && widget.mprdCd != "null" &&
        widget.mprdCd != "") {
     }
  }

  showDropDown(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      //   print("inside  code Desc is null");
      switch (no) {
        case 0:
          documenttype = blankBean;
          documentCollectorBean.mimgtype = blankBean.mcode;
          break;
        case 1:
          customerType = blankBean;
          documentCollectorBean.mcustomertype = blankBean.mcode;
          setState(() {
            documentCollectorBean=new DocumentCollectorBean();
          });
          break;
        default:
          break;
      }
      setState(() {});
    } else {
      bool isBreak = false;
      for (int k = 0;
          k < globals.dropDownCaptionDocumentCollecter[no].length;
          k++) {
        if (globals.dropDownCaptionDocumentCollecter[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropDownCaptionDocumentCollecter[no][k]);
          isBreak = true;
          break;
        }
        if (isBreak) {
          break;
        }
      }
    }
  }

  setValue(int no, LookupBeanData value) {
    setState(() {
      // print("coming here");
      switch (no) {
        case 0:
          documenttype = value;
          documentCollectorBean.mimgtype = value.mcode;
          documentCollectorBean.mimgtypedesc = value.mcodedesc;
           imgtyp=documentCollectorBean.mimgtype;


          break;
        case 1:
          customerType = value;
          documentCollectorBean.mcustomertype = value.mcode;
           custtyp=documentCollectorBean.mcustomertype;
           print("imgtyp"+imgtyp.toString());
           print("custtyp"+custtyp.toString());
           if(custtyp=="101"){
             print("inside");
             setState(() {
               if (widget.custname != null &&
                   widget.custname != "null" &&
                   widget.custname != "") {
                 documentCollectorBean.mcustname = widget.custname;
               }
               if (widget.CUSTUUID != null &&
                   widget.CUSTUUID!= "null" &&
                   widget.CUSTUUID != "") {
                 documentCollectorBean.CUSTUUID= widget.CUSTUUID;
               }
               if (widget.LOANUUID != null &&
                   widget.LOANUUID!= "null" &&
                   widget.LOANUUID != "") {
                 documentCollectorBean.LOANUUID= widget.LOANUUID;
               }
               if (widget.cusno != null &&
                   widget.cusno != "null" &&
                   widget.cusno != "") {
                 documentCollectorBean.mcustno = widget.cusno;
               }
             });

           }
          if(custtyp=="101"){
}
          else{
            print("Inside else");
            setState(() {
              documentCollectorBean.mdoctno  ="";
              documentCollectorBean.missuingauth  = "";
              documentCollectorBean.mremarks  = "";
                documentCollectorBean.mcustno  =0;
                documentCollectorBean.mcustname  ="";
              tempExpDateDay="";
              tempExpDateYear="";
              tempExpDateMonth="";
              tempIssueDateDay="";
              tempIssueDateMonth="";
              tempIssueDateYear="";

            });
          }

          break;
        default:
          break;
      }
    });
  }

  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
        k < globals.dropDownCaptionDocumentCollecter[no].length;
        k++) {
      mapData.add(globals.dropDownCaptionDocumentCollecter[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      bool isMand = false;
      if(mandDocType!=null && mandDocType.length>0 && mandDocType.contains(value.mcode)){
        isMand=true;
      }
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(
          value.mcodedesc,
           style:new TextStyle(
            fontWeight: FontWeight.bold,
            color: isMand?Colors.red:Colors.black,
            fontStyle: FontStyle.normal),),
      );
    }).toList();

    return _dropDownMenuItems1;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          // callDialog();
        },
        child: new Scaffold(
            key: _scaffoldKey,
            appBar: new AppBar(
              elevation: 1.0,
              leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                    //  callDialog();
                  }),
              backgroundColor: Color(0xff07426A),
              brightness: Brightness.light,
              title: new Text(
                'Document Collector',
                //textDirection: TextDirection,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontStyle: FontStyle.normal),
              ),
              actions: <Widget>[
                widget.isEditAllowed?new IconButton(
                  icon: new Icon(
                    Icons.save,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();

                  },
                ):new Container(),
                new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                ),
              ],
            ),
            body: new Form(
              key: _formKey,
              autovalidate: false,
              onChanged: () async {
                final FormState form = _formKey.currentState;
                form.save();
                //await calculate();
              },
              child:  ListView(
                  shrinkWrap: true,
                  //padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  children: <Widget>[
                    SizedBox(height: 16.0),
                    Card(
                      color: Constant.mandatoryColor,
                      child: new DropdownButtonFormField(
                        value: documenttype,
                        items: generateDropDown(0),
                        onChanged: (LookupBeanData newValue) {
                          showDropDown(newValue, 0);
                        },
                        decoration: InputDecoration(labelText: Translations.of(context).text('DocTyp')),
                      ),
                    ),


                    Card(
                      color: Constant.mandatoryColor,
                      child: new DropdownButtonFormField(
                        value: customerType,
                        items: generateDropDown(1),
                        onChanged: (LookupBeanData newValue) {
                          isTypeSelected=true;
                          showDropDown(newValue, 1);
                        },
                        decoration: InputDecoration(labelText: Translations.of(context).text('CustTyp')),
                      ),
                    ),

isTypeSelected?
                    new Card(
                      child: new ListTile(
                          title: new Text(Translations.of(context).text('customer_number_and_name')  ),
                          subtitle: documentCollectorBean.mcustno == null
                              ? new Text("")
                              : new Text(
                              "${documentCollectorBean.mcustno.toString() + " " + documentCollectorBean.mcustname.toString()}"),
                          onTap: () => getCustomerNumber(documentCollectorBean.mcustomertype,documentCollectorBean.LOANUUID,documentCollectorBean.mcustname,documentCollectorBean.CUSTUUID,documentCollectorBean.mcustno)),
                    ): Container(),




                    SizedBox(height: 10.0,),

                    Container(
                      color:  Constant.mandatoryColor,
                      child: new TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('IDNo'),
                          labelText: Translations.of(context).text('IDNo'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        controller:  documentCollectorBean.mdoctno != null
                            ? TextEditingController(text:  documentCollectorBean.mdoctno)
                            : TextEditingController(text: ""),
                        onSaved: (val) => documentCollectorBean.mdoctno = val,
                      ),
                    ),


                    Container(
                      color: Constant.mandatoryColor,
                      child: new TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('Issuauth'),
                          labelText: Translations.of(context).text('Issuauth'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(20)],
                        controller:  documentCollectorBean.missuingauth != null
                            ? TextEditingController(text:  documentCollectorBean.missuingauth)
                            : TextEditingController(text: ""),
                        onSaved: (val) => documentCollectorBean.missuingauth = val,
                      ),
                    ),


                    Container(
                      color: Constant.mandatoryColor,
                      child: new TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(

                          hintText: Translations.of(context).text('Remarks'),
                          labelText: Translations.of(context).text('Remarks'),
                          hintStyle: TextStyle(color: Colors.grey),
                          /*labelStyle: TextStyle(color: Colors.grey),*/
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              )),
                          contentPadding: EdgeInsets.all(20.0),
                        ),
                        //inputFormatters: [new LengthLimitingTextInputFormatter(30),globals.onlyAphaNumeric],
                        controller:  documentCollectorBean.mremarks != null
                            ? TextEditingController(text:  documentCollectorBean.mremarks)
                            : TextEditingController(text: ""),
                        onSaved: (val) => documentCollectorBean.mremarks = val,
                      ),
                    ),

                      SizedBox(height: 10.0,),
                    new Center(
                      child: new Stack(
                        children: <Widget>[
                          getCircleContainer(),

                          new Positioned(
                            child: new GestureDetector(
                              onTap: () {
                                _PickImage(9);
                              },
                              child:IconButton(icon: new Icon(Icons.camera_alt, color: Color(0xff07426A),size: 50.0
                              ),
                                onPressed: (){},
                              ),
                            ),
                            top: 100.0,
                            left: 100.0,
                          ),
                        ],
                      ),
                    ),
                   /* new Container(
                        height: 250.0,
                        child: new Column(
                          children: <Widget>[
                            new ListTile(
                              title: new ListTile(
                                title: documentCollectorBean.imgstring !=
                                    null &&
                                    documentCollectorBean.imgstring !=
                                        null &&
                                    documentCollectorBean.imgstring !=
                                        null &&
                                    documentCollectorBean.imgstring !=
                                        ""
                                    ? new Image.file(
                                  File(documentCollectorBean.imgstring),
                                  height: 200.0,
                                  width: 200.0,
                                )

                                    :  new Icon(
                                          Icons.camera_alt,
                                          size: 200.0,
                                          color: Color(0xff07426A),
                             ),
                                subtitle: new Text(
                                  Translations.of(context)
                                      .text("Click_Here_To_Take_A_Picture"),
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                 *//* if(documentCollectorBean.mimgtype==null *//**//*|| documentCollectorBean.mimgtype ==""*//**//*) {
                                    showMessageWithoutProgress("Please Select Type");
                                    return ;
                                  }*//*
                                  _PickImage(0);
                                  *//*_navigateAndDisplaySelection(
                                  context, 'customer picture')*//*
                                  ;
                                },
                              ),
                            ),
                          ],
                        )),*/



                    SizedBox(height: 20.0,),
                    Container(
                      decoration: BoxDecoration(),
                      child: new Row(
                        children: <Widget>[Text(Translations.of(context).text('ExcDt'))],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(),
                      child: new Row(
                        children: <Widget>[
                          new Container(

                            width: 50.0,
                            child: new TextField(
                              enabled: false,
                                decoration: InputDecoration(hintText: "DD"),
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(2),
                                  globals.onlyIntNumber
                                ],
                                controller:  new TextEditingController(text: DateTime.now().day.toString()),
                                keyboardType: TextInputType.numberWithOptions(),
                               ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("/"),
                          ),
                          new Container(
                            width: 50.0,
                            child: new TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "MM",
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(2),
                                globals.onlyIntNumber
                              ],
                              focusNode: monthExecutionDateFocus,
                              controller:  new TextEditingController(text: DateTime.now().month.toString()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("/"),
                          ),
                          Container(
                            width: 80,
                            child: new TextField(
                              enabled:  false,
                              decoration: InputDecoration(
                                hintText: "YYYY",
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(4),
                                globals.onlyIntNumber
                              ],
                              focusNode: yearExecutionDateFocus,
                              controller: new TextEditingController(text: DateTime.now().year.toString()),


                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),

                        ],
                      ),
                    ),







                    SizedBox(height: 20.0,),
                    Container(
                      decoration: BoxDecoration(),
                      child: new Row(
                        children: <Widget>[Text(Translations.of(context).text('IssuDt'))],
                      ),
                    ),
                    new Container(
                      decoration: BoxDecoration(),
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 50.0,
                            child: new TextField(
                                decoration: InputDecoration(hintText: "DD"),
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(2),
                                  globals.onlyIntNumber
                                ],
                                controller: tempIssueDateDay == null
                                    ? null
                                    : new TextEditingController(text: tempIssueDateDay),
                                keyboardType: TextInputType.numberWithOptions(),
                                onChanged: (val) {
                                  if (val != "0") {
                                    tempIssueDateDay = val;

                                    if (int.parse(val) <= 31 && int.parse(val) > 0) {
                                      if (val.length == 2) {
                                        issueDate = issueDate.replaceRange(0, 2, val);
                                        FocusScope.of(context).requestFocus(monthIssueDateFocus);
                                      } else {
                                        issueDate =
                                            issueDate.replaceRange(0, 2, "0" + val);
                                      }
                                    } else {
                                      setState(() {
                                        tempIssueDateDay = "";
                                      });
                                    }
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("/"),
                          ),
                          new Container(
                            width: 50.0,
                            child: new TextField(
                              decoration: InputDecoration(
                                hintText: "MM",
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(2),
                                globals.onlyIntNumber
                              ],
                              focusNode: monthIssueDateFocus,
                              controller: tempIssueDateMonth == null
                                  ? null
                                  : new TextEditingController(text: tempIssueDateMonth),
                              onChanged: (val) {
                                if (val != "0") {
                                  tempIssueDateMonth = val;
                                  if (int.parse(val) <= 12 && int.parse(val) > 0) {
                                    if (val.length == 2) {
                                      issueDate = issueDate.replaceRange(3, 5, val);

                                      FocusScope.of(context).requestFocus(yearIssueDateFocus);
                                    } else {
                                      issueDate =
                                          issueDate.replaceRange(3, 5, "0" + val);
                                    }
                                  } else {
                                    setState(() {
                                      tempIssueDateMonth = "";
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text("/"),
                          ),
                          Container(
                            width: 80,
                            child: new TextField(
                              decoration: InputDecoration(
                                hintText: "YYYY",
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(4),
                                globals.onlyIntNumber
                              ],
                              focusNode: yearIssueDateFocus,
                              controller: tempIssueDateYear == null
                                  ? null
                                  : new TextEditingController(text: tempIssueDateYear),
                              onChanged: (val) {
                                tempIssueDateYear = val;
                                if (val.length == 4)
                                  issueDate =  issueDate.replaceRange(6, 10, val);

                              },

                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectIssueDtDate(context);
                              })
                        ],
                      ),
            ),




            SizedBox(height: 20.0,),
            Container(
              decoration: BoxDecoration(),
              child: new Row(
                children: <Widget>[Text(Translations.of(context).text('ExpDt'))],
              ),
            ),
            new Container(
              decoration: BoxDecoration(),
              child: new Row(
                children: <Widget>[
                  new Container(
                    width: 50.0,
                    child: new TextField(
                        decoration: InputDecoration(hintText: "DD"),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(2),
                          globals.onlyIntNumber
                        ],
                        controller: tempExpDateDay == null
                            ? null
                            : new TextEditingController(text: tempExpDateDay),
                        keyboardType: TextInputType.numberWithOptions(),
                        onChanged: (val) {
                          if (val != "0") {
                            tempExpDateDay = val;

                            if (int.parse(val) <= 31 && int.parse(val) > 0) {
                              if (val.length == 2) {
                                expDate = expDate.replaceRange(0, 2, val);
                                FocusScope.of(context).requestFocus(monthExpDateFocus);
                              } else {
                                expDate =
                                    expDate.replaceRange(0, 2, "0" + val);
                              }
                            } else {
                              setState(() {
                                tempExpDateDay = "";
                              });
                            }
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("/"),
                  ),
                  new Container(
                    width: 50.0,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "MM",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(2),
                        globals.onlyIntNumber
                      ],
                      focusNode: monthExpDateFocus,
                      controller: tempExpDateMonth == null
                          ? null
                          : new TextEditingController(text: tempExpDateMonth),
                      onChanged: (val) {
                        if (val != "0") {
                          tempExpDateMonth = val;
                          if (int.parse(val) <= 12 && int.parse(val) > 0) {
                            if (val.length == 2) {
                              expDate = expDate.replaceRange(3, 5, val);

                              FocusScope.of(context).requestFocus(yearExpDateFocus);
                            } else {
                              expDate =
                                  expDate.replaceRange(3, 5, "0" + val);
                            }
                          } else {
                            setState(() {
                              tempExpDateMonth = "";
                            });
                          }
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("/"),
                  ),
                  Container(
                    width: 80,
                    child: new TextField(
                      decoration: InputDecoration(
                        hintText: "YYYY",
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(4),
                        globals.onlyIntNumber
                      ],
                      focusNode: yearExpDateFocus,
                      controller: tempExpDateYear == null
                          ? null
                          : new TextEditingController(text: tempExpDateYear),
                      onChanged: (val) {
                        tempExpDateYear = val;
                        if (val.length == 4)
                          expDate =  expDate.replaceRange(6, 10, val);

                      },

                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectExpDtDate(context);
                      })
                ],
              ),
            ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: new IconButton(
                            icon: new Icon(
                              Icons.format_list_bulleted,
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            onPressed: () {
                             getDocumentsList(widget.LOANUUID);                            },
                          ),
                        ),
                        Flexible(
                            child: widget.isEditAllowed?new IconButton(
                                padding: EdgeInsets.only(right: 30.0),
                                icon: new Icon(
                                  Icons.add,
                                  color: Color(0xff07426A),
                                  size: 50.0,
                                ),
                                splashColor: Colors.red,
                                onPressed: () {
                                  proceed();

                                 /* else {
                                 //   addToList();
                                  }*/
                                }):new Container()),
                      ],
                    ),

                          ]
              ),
            )));
  }


  Future<void> _PickImage(int imageNo) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.touch_app,
              color: Colors.blue[800],
              size: 40.0,
            ),
            content: SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[

                  Card(
                    child: new ListTile(
                        title: new Text(('Take Picture From Camera')),
                        onTap: () {

                          Navigator.of(context).pop();
                          getImage(imageNo);

                        }),),

                  Card(
                    child: new ListTile(
                        title: new Text(('Choose From Gallery')),
                        onTap: () {

                          Navigator.of(context).pop();
                          getImageFromGallery(imageNo);

                        }),),


                ],
              ),
            ),
          );
        });
  }

  Future getImageFromGallery(int imageNo) async {
    final picker = ImagePicker();
    var image = await picker.getImage(
        source: ImageSource.gallery);
    File f;
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      //ratioX: 3.2,
      //ratioY: 3.2,
      maxWidth: 640,
      maxHeight: 640,
    );
    f = await croppedFile.copy(image.path);
    documentCollectorBean.imgstring= f.path;
    setState(() {

    });
     }


  Future getImage(imageNo) async {
    File f;
    final picker = ImagePicker();
    var image = await picker.getImage(
        source: ImageSource.camera);
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      //ratioX: 3.2,
      //ratioY: 3.2,
      maxWidth: 640,
      maxHeight: 640,

    );
    //String st = croppedFile.path;

    f = await croppedFile.copy(image.path);
    documentCollectorBean.imgstring= f.path;

    setState(() {

    });
  }

_navigateAndDisplaySelection(BuildContext context) async {
    print("documentCollectorBeanList"+documentCollectorBeanList.toString());

  final result = Navigator.push(
      context,
      new MaterialPageRoute(

        builder: (BuildContext context) =>
        new ViewDocuments(documentCollectorBeanList),
        fullscreenDialog: true,
      )).then((onValue) {
    setState(() {});
    //Scaffold.of(context).showSnackBar(SnackBar(content: Text("$onValue")));
  });
}



  void showMessageWithoutProgress(String message,
      [MaterialColor color = Colors.red]) {
    try {
      _scaffoldKey.currentState.hideCurrentSnackBar();
    } catch (e) {}
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }


  Future<Null> _selectIssueDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != documentCollectorBean.missuedate)
      setState(() {
        documentCollectorBean.missuedate = picked;
        tempIssueDateDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempIssueDateDay = "0" + picked.day.toString();
        } else
          tempIssueDateDay = picked.day.toString();
        issueDate = issueDate.replaceRange(0, 2, tempIssueDateDay);
        tempIssueDateYear = picked.year.toString();
        issueDate = issueDate.replaceRange(6, 10, tempIssueDateYear);
        if (picked.month.toString().length == 1) {
          tempIssueDateMonth = "0" + picked.month.toString();
        } else
          tempIssueDateMonth = picked.month.toString();
        issueDate = issueDate.replaceRange(3, 5, tempIssueDateMonth);
      });
    setState(() {

    });
  }


  Future<Null> _selectExpDtDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != documentCollectorBean.mexpdate)
      setState(() {
        documentCollectorBean.mexpdate = picked;
        tempExpDateDate = formatter.format(picked);
        if (picked.day.toString().length == 1) {
          tempExpDateDay = "0" + picked.day.toString();
        } else
          tempExpDateDay = picked.day.toString();
        expDate = expDate.replaceRange(0, 2, tempExpDateDay);
        tempExpDateYear = picked.year.toString();
        expDate = expDate.replaceRange(6, 10, tempExpDateYear);
        if (picked.month.toString().length == 1) {
          tempExpDateMonth = "0" + picked.month.toString();
        } else
          tempExpDateMonth = picked.month.toString();
        expDate = expDate.replaceRange(3, 5, tempExpDateMonth);
      });
    setState(() {

    });
  }





  // void addToList() async{
  //   if(documentCollectorBeanList==null){
  //     documentCollectorBeanList= new  List<DocumentCollectorBean>();
  //   }
  //     proceed();
  //
  //      if (widget.LOANUUID != null &&
  //       widget.LOANUUID!= "null" &&
  //       widget.LOANUUID != "") {
  //     documentCollectorBean.mforeignindicator = widget.LOANUUID;
  //   }
  //
  //
  //      documentCollectorBean.mlastupdatedt = DateTime.now();
  //      if (documentCollectorBean.mcreateddt == null) {
  //        documentCollectorBean.mcreatedby = username;
  //        documentCollectorBean.mcreateddt = DateTime.now();
  //      }
  //      documentCollectorBean.mlastupdateby = username;
  //      documentCollectorBean.mlastupdatedt = DateTime.now();
  //      if (documentCollectorBean.mcreatedby == null ||
  //          documentCollectorBean.mcreatedby == '' ||
  //          documentCollectorBean.mcreatedby == 'null') {
  //        documentCollectorBean.mcreatedby = username;
  //      }
  //
  //
  //      documentCollectorBean.mgeolocation = geoLocation;
  //      documentCollectorBean.mgeologd = geoLongitude;
  //      documentCollectorBean.mgeolatd = geoLatitude;
  //      documentCollectorBeanList.add(documentCollectorBean);
  //      setState(() {
  //        documentCollectorBean  =new DocumentCollectorBean();
  //
  //        tempIssueDateYear="";
  //        tempIssueDateDay="";
  //        tempIssueDateMonth="";
  //        tempExpDateYear="";
  //        tempExpDateDay="";
  //        tempExpDateMonth="";
  //        issueDate= "__-__-____";
  //        expDate= "__-__-____";
  //        documenttype= blankBean;
  //        customerType= blankBean;
  //
  //      });
  // }




  proceed() async {
    if (!validateSubmit()) {
      return;
    }

    documentCollectorBean.mcreatedby = username;
    documentCollectorBean.mexecutiondate = DateTime.now();


    if (documentCollectorBean.mcustomertype == "null" ||
        documentCollectorBean.mcustomertype == "" ||
        documentCollectorBean.mcustomertype == null) {
      //Khuda ka kahuf karo allah ki bandi yeh static kyun dala hai yaha
      documentCollectorBean.mcustomertype = '101';
    }




    if (documentCollectorBean.mcustno == "null" ||
        documentCollectorBean.mcustno == "" ||
        documentCollectorBean.mcustno == null) {
      documentCollectorBean.mcustno = widget.cusno;
    }

    if (documentCollectorBean.mcustname == "null" ||
        documentCollectorBean.mcustname == "" ||
        documentCollectorBean.mcustname == null) {
      documentCollectorBean.mcustname = widget.custname;
    }

    documentCollectorBean.mlastupdateby = username;
    documentCollectorBean.mlastupdatedt = DateTime.now();

    if (documentCollectorBean.mcreateddt == null) {
      documentCollectorBean.mcreatedby = username;
      documentCollectorBean.mcreateddt = DateTime.now();
    }





    documentCollectorBean.mgeolocation = geoLocation;
    documentCollectorBean.mgeologd = geoLongitude;
    documentCollectorBean.mgeolatd = geoLatitude;





    try {
      documentCollectorBean.missuedate = DateTime.parse(issueDate.substring(6) +
          "-" +
          issueDate.substring(3, 5) +
          "-" +
          issueDate.substring(0, 2));
    } catch (e) {

      print("applicantDob applicantDob applicantDob111 ${issueDate}");
      //return false;
    }


    try {
      documentCollectorBean.mexpdate = DateTime.parse(expDate.substring(6) +
          "-" +
          expDate.substring(3, 5) +
          "-" +
          expDate.substring(0, 2));
    } catch (e) {

      print("applicantDob applicantDob applicantDob111 ${expDate}");
      //return false;
    }

    if(documentCollectorBean.UUID!=null){
      //TODO UPDATE IN THIS CASE AND IN NEW ITEM CREATION MAKE UUID NULL BEFOR INITIALIZING DOC OBJ
      Map docJsonData =  await DocumentCollectorBean.toDocumentJson(documentCollectorBean);
      String docData = JSON.encode(docJsonData).toString();
      print("docData.mfname");
      print(docData);
      await AppdatabaseV2.get().updateDocuments(documentCollectorBean,docData,documentCollectorBean.UUID)
          .then((onValue) {

      });
      _successfulSubmit();
    }else{
      var uuid = Uuid();
      documentCollectorBean.UUID=uuid.v4();
      Map docJsonData =  await DocumentCollectorBean.toDocumentJson(documentCollectorBean);
      String docData = JSON.encode(docJsonData).toString();
      print("docData.mfname");
      print(docData);
      await AppdatabaseV2.get().updateDocuments(documentCollectorBean,docData,documentCollectorBean.UUID)
          .then((onValue) {

      });
      _successfulSubmit();
    }

    setState(() {
      documentCollectorBean  =new DocumentCollectorBean();
      documentCollectorBean.LOANUUID = widget.LOANUUID;
      tempIssueDateYear="";
      tempIssueDateDay="";
      tempIssueDateMonth="";
      tempExpDateYear="";
      tempExpDateDay="";
      tempExpDateMonth="";
      issueDate= "__-__-____";
      expDate= "__-__-____";
      documenttype= blankBean;
      customerType=blankBean;
    });

    }

  bool validateSubmit() {
    String error = "";

    if(documentCollectorBean.mimgtype==null||documentCollectorBean.mimgtype.toString().trim()==""){
      _showAlert("Document Type", "Cannot be Empty");
      return false;

    }
    if(documentCollectorBean.mcustomertype==null||documentCollectorBean.mcustomertype.toString().trim()==""){
      _showAlert("Customer Type", "Cannot be Empty");
      return false;

    }
    if(documentCollectorBean.mcustname==null||documentCollectorBean.mcustname.toString().trim()==""){
      _showAlert("Customer Name And Number", "Cannot be Empty");
      return false;

    }
    if(documentCollectorBean.imgstring==null||documentCollectorBean.imgstring.toString().trim()==""){
      _showAlert("Image", "Cannot be Empty");
      return false;

    }
    return true;
  }


  Future<void> _successfulSubmit() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.offline_pin,
              color: Colors.green,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Done'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
              //    Navigator.of(context).pop();
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        });
  }


  Future<void> _showAlert(arg, error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$arg error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void getDocumentsList(String LOANUUID) async{
    await AppdatabaseV2.get().selectDocumentsList('SELECT * FROM ${TablesList.DOCUMENTSMASTER} WHERE  ${TablesColumnFile.LOANUUID} = ${LOANUUID}')
        .then((List<DocumentCollectorBean> data) async{
      data.forEach((f) async{
        documentCollectorBeanList.add(f);
      });
      Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (BuildContext context) =>
            new ViewDocuments(documentCollectorBeanList),
            fullscreenDialog: true,
          ));
    });



  }

  Future<void> _CheckIfThere() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Icon(
              Icons.cancel,
              color: Colors.red,
              size: 60.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text(
                          "            No Records Found "),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok '),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future getCustomerNumber(String custtype, String LOANUUID, String custname,String CUSTUUID, int cusno) async {

    print("custtypeXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
    print(custtype);
    if(custtype!='101'&&custtype!=""){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GuarantorDetailsForSelection(custtype,LOANUUID))).then((onValue){
        if (onValue != null) {
          documentCollectorBean.mcustno =
          documentCollectorBean.mcustno != null ? onValue.mcustno : 0;
          documentCollectorBean.mcustno =onValue.UUID;
          documentCollectorBean.CUSTUUID =onValue.UUID;
          documentCollectorBean.mcustname = onValue.mnameofguar;
        }

      });
    }else{

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerList(null,"Loan Application"))).then((onValue){
        if (onValue != null) {
          documentCollectorBean.mcustno =
          documentCollectorBean.mcustno != null ? onValue.mcustno : 0;
          documentCollectorBean.mcustno =onValue.UUID;
          documentCollectorBean.CUSTUUID =onValue.UUID;
          documentCollectorBean.mcustname = onValue.mnameofguar;
        }

      }).then((value) => {setState(() {})});
        


    }

  }

  Widget getCircleContainer() {
    imageCache.clear();
    try {
      return
        new GestureDetector(
          onTap: () {
            print("Container clicked ${documentCollectorBean.imgstring}");
            imageCache.clear();
            docListView = new List<PhotoViewGalleryPageOptions>();

            if (documentCollectorBean.imgstring !=
                null &&
                documentCollectorBean.imgstring !=
                    null &&
                documentCollectorBean.imgstring!=
                    "") {
              docListView = new List<PhotoViewGalleryPageOptions>();
              docListView.add(PhotoViewGalleryPageOptions(
                  imageProvider: MemoryImage(
                      File(documentCollectorBean.imgstring)
                          .readAsBytesSync())));
              _showImage();
            } else {
              _PickImage(0);
            }
          },
          child:
          new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Color(0xff07426A), width: 0.5),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  //repeat: ImageRepeat.noRepeat,
                  image:
                  documentCollectorBean.imgstring !=
                      null &&
                      documentCollectorBean.imgstring !=
                          null &&
                      documentCollectorBean.imgstring!=
                          null &&
                      documentCollectorBean.imgstring !=
                          ""
                      ?
                  MemoryImage(File(documentCollectorBean.imgstring).readAsBytesSync())

                      : new ExactAssetImage('assets/utilityBill.png'),

                )

            ),
          ),
        );
    }catch(_){
      return
        new GestureDetector(
          onTap: () {
            print("Container clicked");
            imageCache.clear();
            docListView = new List<PhotoViewGalleryPageOptions>();

            if (documentCollectorBean.imgstring !=
                null &&
                documentCollectorBean.imgstring !=
                    null &&
                documentCollectorBean.imgstring !=
                    "") {
              docListView.add(PhotoViewGalleryPageOptions(
                  imageProvider: MemoryImage(
                      File(documentCollectorBean.imgstring)
                          .readAsBytesSync())));
              _showImage();
            } else {
              _PickImage(0);
            }
          },
          child:
          new Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border.all(color: Color(0xff07426A), width: 0.5),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  //repeat: ImageRepeat.noRepeat,
                  image: new ExactAssetImage('assets/utilityBill.png'),

                )

            ),
          ),
        );
    }

  }

  Future<void> _showImage() async {

    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            ViewImageScreen()));
  }}

class ViewImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.

      body: PhotoViewGallery( pageOptions:docListView),
    );
  }
}