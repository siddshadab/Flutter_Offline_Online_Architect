import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/helpers/globals.dart';
import 'package:eco_los/helpers/networt_util.dart';
import 'package:eco_los/screens/customerFormation/CustomerFormationMasterTabs.dart';
import 'package:eco_los/screens/customerFormation/bean/CustomerListBean.dart';
import 'package:eco_los/screens/customerFormation/bean/ImageBean.dart';
import 'package:eco_los/systems/SystemParameter/SystemParameterBean.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view_gallery.dart';


var docListView=new List<PhotoViewGalleryPageOptions>();
class CustomerFormationCenterAndGroupDetails extends StatefulWidget {
  var cameras;
  CustomerListBean bean;


  CustomerFormationCenterAndGroupDetails(this.cameras, {Key key})
      : super(key: key);

  @override
  _CustomerFormationCenterAndGroupDetailsState createState() =>
      new _CustomerFormationCenterAndGroupDetailsState();
}

class _CustomerFormationCenterAndGroupDetailsState
    extends State<CustomerFormationCenterAndGroupDetails> {
  static const JsonCodec JSON = const JsonCodec();

  LookupBeanData mcustcatgry;
  LookupBeanData mnationality;
  SystemParameterBean sysBean = new SystemParameterBean();
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  File _image;
  File f;
  int isBiometricNeeded = 0;
  bool isCambodia=true;


  SharedPreferences prefs;
  String loginTime;
  int usrGrpCode = 0;
  String username;
  int branch = 0;
  String usrRole;
  ImageBean imgBean = new ImageBean();
  String _base64;

  @override
  void initState() {
    super.initState();
    imageCache.clear();


    if (mounted) {
      getSessionVariables();
    }

    if (CustomerFormationMasterTabsState.custListBean.mnationality == null ||
        CustomerFormationMasterTabsState.custListBean.mnationality == 'null' ||
        CustomerFormationMasterTabsState.custListBean.mnationality == '') {
      CustomerFormationMasterTabsState.custListBean.mnationality = 'KH';
    }
    List tempDropDownValues = new List();
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.mcustcategory);
    tempDropDownValues
        .add(CustomerFormationMasterTabsState.custListBean.mnationality);
    print(CustomerFormationMasterTabsState.custListBean.mprofileind);
    for (int k = 0;
        k < globals.dropdownCaptionsValuesProfileDetails.length;
        k++) {
      for (int i = 0;
          i < globals.dropdownCaptionsValuesProfileDetails[k].length;
          i++) {
        // print("k and i is $k $i");
        print(globals.dropdownCaptionsValuesProfileDetails[k][i].mcode.length);

        try {
          if (globals.dropdownCaptionsValuesProfileDetails[k][i].mcode
                  .toString() ==
              tempDropDownValues[k].toString().trim()) {
            print("matched $k");
            setValue(k, globals.dropdownCaptionsValuesProfileDetails[k][i]);
          }
        } catch (_) {
          print("Exception in dropdown");
        }
      }
    }

    if (globals.applicationDate == null)
      globals.applicationDate = DateTime.now();


    setState(() {});
  }

  showDropDown(LookupBeanData selectedObj, int no) {
    if (selectedObj.mcodedesc.isEmpty) {
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          mcustcatgry = blankBean;
          CustomerFormationMasterTabsState.custListBean.mcustcategory =
              blankBean.mcode;
          break;
        case 1:
          mnationality = blankBean;
          CustomerFormationMasterTabsState.custListBean.mnationality =
              blankBean.mcode;
          break;

        default:
          break;
      }
      setState(() {});
    } else {
      for (int k = 0;
          k < globals.dropdownCaptionsValuesProfileDetails[no].length;
          k++) {
        if (globals.dropdownCaptionsValuesProfileDetails[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesProfileDetails[no][k]);
        }
      }
    }
  }

  setValue(int no, LookupBeanData value) {
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          mcustcatgry = value;
          CustomerFormationMasterTabsState.custListBean.mcustcategory =
              value.mcode;
          break;
        case 1:
          mnationality = value;
          CustomerFormationMasterTabsState.custListBean.mnationality =
              value.mcode;
          if(CustomerFormationMasterTabsState.custListBean.mnationality=="KH"){
            isCambodia=true;
            print(isCambodia);
          }
          else{
            isCambodia=false;
            print(isCambodia);
          }
          break;

        default:
          break;
      }
    });
  }


  Widget getTextContainer(String textValue) {
    return new Container(
      padding: EdgeInsets.fromLTRB(5.0, 20.0, 0.0, 20.0),
      child: new Text(
        textValue,
        //textDirection: TextDirection,
        textAlign: TextAlign.start,
        /*overflow: TextOverflow.ellipsis,*/
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontStyle: FontStyle.normal,
            fontSize: 12.0),
      ),
    );
  }

  Future<Null> getSessionVariables() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      CustomerFormationMasterTabsState.custListBean.mlbrcode =
          prefs.get(TablesColumnFile.musrbrcode);
      username = prefs.getString(TablesColumnFile.usrCode);
      usrRole = prefs.getString(TablesColumnFile.usrDesignation);
      usrGrpCode = prefs.getInt(TablesColumnFile.grpCd);
      loginTime = prefs.getString(TablesColumnFile.LoginTime);
      globals.agentUserName = username;
    });
  }

  LookupBeanData blankBean =
      new LookupBeanData(mcodedesc: "", mcode: "", mcodetype: 0);
  List<DropdownMenuItem<LookupBeanData>> generateDropDown(int no) {
    //print("caption value : " + globals.dropdownCaptionsPersonalInfo[no]);

    List<DropdownMenuItem<LookupBeanData>> _dropDownMenuItems1;
    List<LookupBeanData> mapData = List<LookupBeanData>();
    LookupBeanData bean = new LookupBeanData();
    bean.mcodedesc = "";
    mapData.add(blankBean);
    for (int k = 0;
        k < globals.dropdownCaptionsValuesProfileDetails[no].length;
        k++) {
      mapData.add(globals.dropdownCaptionsValuesProfileDetails[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      //print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(
          value.mcodedesc,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      );
    }).toList();
    /*   if(no==0){
      print(mapData);
      testString = mapData;
    }*/
    return _dropDownMenuItems1;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          new ListTile(
              leading: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(Translations.of(context).text('brnchCd'),
                      style: TextStyle(color: Color(0xff795548))),
                  new Text(
                      CustomerFormationMasterTabsState.custListBean.mlbrcode
                          .toString(),
                      style: TextStyle(color: Color(0xff12D6F4)))
                ],
              ),
              trailing: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    Translations.of(context).text('UUID'),
                    style: TextStyle(color: Color(0xff795548)),
                  ),
                  new Text(
                    "${CustomerFormationMasterTabsState.custListBean.UUID}",
                    style: TextStyle(color: Color(0xff12D6F4)),
                  ),
                ],
              )
              // trailing: new Text("Customer Number of Tab : " + "123456789"),

              ),


          SizedBox(height: 10.0),

          SizedBox(height: 16.0),
          Container(
            color: Constant.mandatoryColor,
            child: new DropdownButtonFormField(
              value: mnationality,
              items: generateDropDown(1),
              onChanged: (LookupBeanData newValue) {
                showDropDown(newValue, 1);
              },
              validator: (args) {
                print(args);
              },
              decoration: InputDecoration(labelText: Translations.of(context).text('Ntnlty')),
              // style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
isCambodia?
          new Form(
            key: _formKey,
            //autovalidate: CustomerFormationMasterTabsState.autoValidate,
            onWillPop: () {
              return Future(() => true);
            },
            onChanged: () {
              final FormState form = _formKey.currentState;
              form.save();
            },
            child: Container(
                decoration: BoxDecoration(color: Constant.mandatoryColor),
                child: new Stack(
                  alignment: const Alignment(1.02, 0.0),
                  children: <Widget>[
                    new TextFormField(
                        keyboardType: TextInputType.text,
                        decoration:  InputDecoration(
                          hintText: Translations.of(context).text('NtID'),
                          labelText: Translations.of(context).text('NtID'),
                          hintStyle: TextStyle(
                              color: Colors.grey, decorationColor: Colors.grey),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.green,
                          )),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.blue,
                          )),
                          contentPadding: EdgeInsets.all(20.0),
                          fillColor: Colors.red,
                        ),
                        controller: CustomerFormationMasterTabsState
                                    .custListBean.mnationalid ==
                                null
                            ? TextEditingController(text: "")
                            : TextEditingController(
                                text: CustomerFormationMasterTabsState
                                    .custListBean.mnationalid
                                    .toString()),
                        /*focusNode: _focusNode,*/
                        onSaved: (val) {
                          if (val == null || val == "") {
                          } else {
                            try {
                              CustomerFormationMasterTabsState
                                  .custListBean.mnationalid = val;
                            } catch (e) {
                              print("Exception ");
                            }

                          }
                        }),
                    new RaisedButton(
                        color: Color(0xff01579b),
                        elevation: 20.0,
                        child: new Text(
                          "Dedup",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.only(bottom: 0.0),
                        onPressed: () async {
                          await _DedupOnNationalID();
                        }),
                  ],
                )),
          ): new Form(
  key: _formKey,
  //autovalidate: CustomerFormationMasterTabsState.autoValidate,
  onWillPop: () {
    return Future(() => true);
  },
  onChanged: () {
    final FormState form = _formKey.currentState;
    form.save();
  },

  child: Container(
      decoration: BoxDecoration(color: Constant.mandatoryColor),
      child: new Stack(
        alignment: const Alignment(1.02, 0.0),
        children: <Widget>[
          new TextFormField(
              keyboardType: TextInputType.text,
              decoration:  InputDecoration(
                hintText: Translations.of(context).text('PassNo'),
                labelText: Translations.of(context).text('PassNo'),
                hintStyle: TextStyle(
                    color: Colors.grey, decorationColor: Colors.grey),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    )),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
                contentPadding: EdgeInsets.all(20.0),
                fillColor: Colors.red,
              ),
              controller: CustomerFormationMasterTabsState
                  .custListBean.mnationalid ==
                  null
                  ? TextEditingController(text: "")
                  : TextEditingController(
                  text: CustomerFormationMasterTabsState
                      .custListBean.mnationalid
                      .toString()),
              /*focusNode: _focusNode,*/
              onSaved: (val) {
                if (val == null || val == "") {
                } else {
                  try {
                    CustomerFormationMasterTabsState
                        .custListBean.mnationalid = val;
                  } catch (e) {
                    print("Exception ");
                  }
                }
              }),
          new RaisedButton(
              color: Color(0xff01579b),
              elevation: 20.0,
              child: new Text(
                "Dedup",
                style: TextStyle(color: Colors.white),
              ),
              padding: EdgeInsets.only(bottom: 0.0),
              onPressed: () async {
                await _DedupOnNationalID();
              }),
        ],
      )),
)
        ],
      ),
    );
  }

  getMiddleWareData() async {
    Utility obj = new Utility();
    final _headers = {'Content-Type': 'application/json'};
    var urlGetCustomerDetails = "customerData/getCustomerDedup/";

    try {
      String json = _toJson();
      String bodyValue = await NetworkUtil.callPostService(
          json.toString(),
          Constant.apiURL.toString() + urlGetCustomerDetails.toString(),
          _headers);
      if (bodyValue == "404") {
        return null;
      } else {
        print("xxxxxxxxxxccccccccccccccccccccccccccccccc ${bodyValue}");
        //final parsed = JSON.decode(bodyValue).cast<String, dynamic>();
        Map<String, dynamic> map = JSON.decode(bodyValue);
        if (map == null) {
          globals.isDedupDone= true;
          _showAlert(Translations.of(context).text('CustNtPrsntWthID'), "",0);
          isCustFoundInDedup=false;
        }
        var obj = null;
        try {
          obj = CustomerListBean.fromMapMiddlewareDedup(map, true);
          globals.isDedupDone= true;
        } catch (_) {
          print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXDedupI NNNNNNNNNNNNNNNNNNNNNNNNNN1111111111111111___________________________");
          _showAlert(Translations.of(context).text('CustNtPrsntWthID'), "",0);
          isCustFoundInDedup=false;
        }

        print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXDedupI NNNNNNNNNNNNNNNNNNNNNNNNNN___________________________");
        if(CustomerFormationMasterTabsState.custListBean.mcustno == null || CustomerFormationMasterTabsState.custListBean.mcustno == 0
            || CustomerFormationMasterTabsState.custListBean.mcustno != obj.mcustno) {

          String message = obj.mfname.toString() + " " + obj.mmname.toString() +
              Translations.of(context).text('isAlrdyprsntwthCustNo') +
              obj.mcustno.toString() +
              Translations.of(context).text('CustBlngsusr') +
              obj.mcreatedby.toString();
          _showAlert(
              message, Translations.of(context).text('cnntcrtcustwththsid'),0);
          isCustFoundInDedup = true;
        }else{
          _showAlert("You Can proceed With customer Edit", "National Id  Belongs to same user",0);
        }
      }
    } catch (_) {
      print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXDedupI NNNNNNNNNNNNNNNNNNNNNNNNNN1111111111111111222222222222222___________________________");
      isCustFoundInDedup=false;
      globals.isDedupDone= true;
     _showAlert(Translations.of(context).text('CustNtPrsntWthID'), "",0);
     // _showAlert("SOmeting", "");
    }
  }


  _DedupOnNationalID() async {

    if (CustomerFormationMasterTabsState.custListBean.mnationalid ==
        null ||
        CustomerFormationMasterTabsState.custListBean.mnationalid == '' ||
        CustomerFormationMasterTabsState.custListBean.mnationalid.length < 6) {
      _showAlert(Translations.of(context).text('fillNtlID'),
          Translations.of(context).text('MandDedup'),1);
    } else {
      bool isNetworkAvailable;
      bool isNetworkAvailablegoogle;
      isNetworkAvailable = await Utility.checkIntCon();

      //TODO check data in offline case for dedup if present them break here otherwise go online
          if (isNetworkAvailable) {
            print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXDedup___________________________");
            _ShowCircInd();
           await  getMiddleWareData();
          } else {
            globals.isDedupDone = true;
            _showAlert(Translations.of(context).text('PlschckyrNtwrk'),
                Translations.of(context).text('ThOnln'),0);
          }
        }


  }


  Future<void> _ShowCircInd() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deduping online'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Center(widthFactor: 30.0,heightFactor: 3.0,child:CircularProgressIndicator())],
            ),
          ),
        );
      },
    );
  }



  Future<void> _showAlert(arg, error,forwhat) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$arg'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('$error.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(Translations.of(context).text('ok')),
              onPressed: () {
                Navigator.of(context).pop();
                if(forwhat==0){
                  Navigator.of(context).pop();
                }


              },
            ),
          ],
        );
      },
    );
  }



  var commentWidgets = List<Widget>();

  String _toJson() {

    var mapData = new Map();
    mapData["mnationalid"] =
        CustomerFormationMasterTabsState.custListBean.mnationalid.trim();
    String json = JSON.encode(mapData);
    return json;
  }


  Future<void> _showImage() async {

    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) =>
            ViewImageScreen()));
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
class ViewImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.

      body: PhotoViewGallery( pageOptions:docListView),
    );
  }
}
