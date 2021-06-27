import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBankDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/lookup/bean/LookupMasterBean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'CustomerFormationMasterTabs.dart';
import 'package:intl/intl.dart';
import 'dart:async';



class CustomerFormationSocialFinancialDetails extends StatefulWidget {
  CustomerFormationSocialFinancialDetails({Key key}) : super(key: key);

  static Container _get(Widget child,
      [EdgeInsets pad = const EdgeInsets.all(6.0)]) =>
      new Container(
        padding: pad,
        child: child,
      );

  @override
  _CustomerFormationSocialFinancialDetailsState createState() =>
      new _CustomerFormationSocialFinancialDetailsState();
}

class _CustomerFormationSocialFinancialDetailsState
    extends State<CustomerFormationSocialFinancialDetails> {
  final formatDouble = new NumberFormat("#,##0.00", "en_US");


  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();



  int count = 0;
  final TextEditingController _controller = new TextEditingController();
  static bool isSubmitClicked = false;
  final TextEditingController _typeAheadController = TextEditingController();

  SocialFinancialDetailsBean sfb = new SocialFinancialDetailsBean();
  final List<SocialFinancialDetailsBean> bankListLocal =
  new List<SocialFinancialDetailsBean>();
  bool forEdit=false;
  LookupBeanData curcode;



  bool isBool = false;
  int i = 0;

  bool ifNullCheck(String value) {
    bool isNull = false;
    try {
      if (value == null || value == 'null' || value.trim()=='') {
        isNull = true;
      }
    }catch(_){
      isNull =true;
    }
    return isNull;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

    if (!isBool) {
      isBool = true;
    }

    if(CustomerFormationMasterTabsState.sfb!=null){
      //bankListLocal=CustomerFormationMasterTabsState.sfb;
      
    }else{
      CustomerFormationMasterTabsState.sfb= new SocialFinancialDetailsBean();
    }




  }



  List<Widget> _makeRadios(int numberOfRadios, List textName, int position) {
    /*print(
        "dumper " + CustomerFormationMasterTabsState.sfb.mmemberno.toString());*/
    List<Widget> radios = new List<Widget>();
    for (int i = 0; i < numberOfRadios; i++) {
      radios.add(new Row(
        children: <Widget>[
          new Text(
            textName[i],
            textAlign: TextAlign.right,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontStyle: FontStyle.normal,
              fontSize: 10.0,
            ),
          ),
          new Radio(
            value: i,
            groupValue: CustomerFormationMasterTabsState.socialFinancialRadios[position],
            onChanged: (selection) => _onRadioSelected(selection, position),
            activeColor: Color(0xff07426A),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
      ));
    }
    return radios;
  }

  _onRadioSelected(int selection, int position) {
    setState(() => CustomerFormationMasterTabsState.socialFinancialRadios[position] = selection);
    if (position == 0) {
      CustomerFormationMasterTabsState.sfb.misusefordis = selection.toString();
    }
  }
  showDropDown(LookupBeanData selectedObj, int no) {

    print("selected Obj is ${selectedObj}");
    if(selectedObj.mcodedesc.isEmpty){
      print("inside  code Desc is null");
      switch (no) {
        case 0:
          curcode = blankBean;
          CustomerFormationMasterTabsState.sfb.mcurcode = selectedObj.mcode;
          break;
        default:
          break;
      }
      setState(() {

      });
    }
    else {
      bool isBreak = false;
      for (int k = 0;
      k < globals.dropdownCaptionsValuesSocialFinDetails[no].length;
      k++) {
        if (globals.dropdownCaptionsValuesSocialFinDetails[no][k].mcodedesc ==
            selectedObj.mcodedesc) {
          setValue(no, globals.dropdownCaptionsValuesSocialFinDetails[no][k]);
          isBreak=true;
          break;
        }
        if(isBreak){
          break;
        }
      }
    }


  }
  LookupBeanData blankBean = new LookupBeanData(mcodedesc: "",mcode: "",mcodetype: 0);


  setValue(int no, LookupBeanData value) {
    print("value is ${value}");
    setState(() {
      print("coming here");
      switch (no) {
        case 0:
          curcode = value;
          CustomerFormationMasterTabsState.sfb.mcurcode = value.mcode;
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
    bean.mcode = "";
    bean.mcodetype = 0;
    mapData.add(blankBean);
    for (int k = 0;
    k < globals.dropdownCaptionsValuesSocialFinDetails[no].length;
    k++) {
      mapData.add(globals.dropdownCaptionsValuesSocialFinDetails[no][k]);
    }
    _dropDownMenuItems1 = mapData.map((value) {
      print("data here is of  dropdownwale biayajai " + value.mcodedesc);
      return new DropdownMenuItem<LookupBeanData>(
        value: value,
        child: new Text(value.mcodedesc),
      );
    }).toList();
    /*   if(no==0){
      print(mapData);
      testString = mapData;
    }*/
    return _dropDownMenuItems1;
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





  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
            key: _formKey,
            /* onWillPop: () {
              return Future(() => true);
            },*/
            onChanged: () {
              final FormState form = _formKey.currentState;
              form.save();
            },
            autovalidate: true,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                SizedBox(height: 10.0,),


                new TextFormField(
                  keyboardType: TextInputType.text,
                  inputFormatters: [new LengthLimitingTextInputFormatter(20),globals.onlyAphaNumeric],
                  decoration:  InputDecoration(
                    hintText: Translations.of(context).text('EntrAccNo'),
                    labelText: Translations.of(context).text('Acc_No'),
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff07426A),
                        )),
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                  controller: CustomerFormationMasterTabsState.sfb.maccno != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.sfb.maccno)
                      : TextEditingController(text: ""),
               //   inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyCharacter],
                  onSaved: (val) {
                    //if(val!=null) {
                    //globals.familyMember = val;
                    /*CustomerFormationMasterTabsState.custListBean
                        .SocialFinancialList.last.name = val;*/
                    CustomerFormationMasterTabsState.sfb.maccno = val;
                    //}
                  },
                ),
                SizedBox(height: 10.0,),


                TypeAheadFormField<LookupBeanData>(
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: this._typeAheadController,
                      decoration: InputDecoration(
                          labelText: Translations.of(context).text('bankName')
                      )
                  ),
                  suggestionsCallback: (pattern) {
                    return returnLookup(pattern);
                  },

                  itemBuilder: (context, item) {
                    return ListTile(
                      title: Text(item.mcodedesc),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (item) {
                    this._typeAheadController.text = item.mcodedesc;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Bank Name';
                    }
                  },
                  onSaved: (value) => CustomerFormationMasterTabsState.sfb.mbankname = value,
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.characters
                  ,decoration:  InputDecoration(
                  hintText: Translations.of(context).text('BRANCH'),
                  labelText: Translations.of(context).text('BRANCH'),
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff07426A),
                      )),
                  contentPadding: EdgeInsets.all(20.0),
                ),
                  controller: CustomerFormationMasterTabsState.sfb.mbranch != null
                      ? TextEditingController(text: CustomerFormationMasterTabsState.sfb.mbranch)
                      : TextEditingController(text: ""),
                  inputFormatters: [new LengthLimitingTextInputFormatter(50),globals.onlyAphaNumeric],
                  onSaved: (val) {
                    //if(val!=null) {
                    //globals.familyMember = val;
                    /*CustomerFormationMasterTabsState.custListBean
                        .SocialFinancialList.last.name = val;*/
                    CustomerFormationMasterTabsState.sfb.mbranch = val;
                    //}
                  },
                ),
                new DropdownButtonFormField(
                  value: curcode==null?null: curcode,
                  items: generateDropDown(0),
                  onChanged: (LookupBeanData newValue) {
                    print("new Value is ${newValue}");
                    showDropDown(newValue, 0);
                  },
                  validator: (args) {
                    print(args);
                  },
                  //  isExpanded: true,
                  //hint:Text("Select"),
                  decoration: InputDecoration(labelText: Translations.of(context).text('curr_cd')),
                  // style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 10.0,),
                new TextFormField(
                  controller:
                      CustomerFormationMasterTabsState
                          .sfb.maccbal !=
                          null
                      ? TextEditingController(
                      text: formatDouble.format(CustomerFormationMasterTabsState
                          .sfb.maccbal))
                      : TextEditingController(text: "0.0"),
                  onSaved: (String value) {
                    try {
                      CustomerFormationMasterTabsState
                          .sfb.maccbal = double.parse(value);
                      //addToList(context,0);
                    } catch (_) {}
                  },
                  inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintText: Translations.of(context).text('acctBallabel'),
                      labelText: Translations.of(context).text('acctBallabel'),
                      prefixText: '',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.green)),
                ),


           
                new Container(
                  width: 300.0,
                  height: 10.0,
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
                          _navigateAndDisplaySelection(context);
                        },
                      ),
                    ),
                    Flexible(
                        child: new IconButton(
                            padding: EdgeInsets.only(right: 30.0),
                            icon: new Icon(
                              Icons.add,
                              color: Color(0xff07426A),
                              size: 50.0,
                            ),
                            splashColor: Colors.red,
                            onPressed: () {
                              if(forEdit) {
                                try {
                                 /* AppDatabase.get().deleBankDetails(
                                      CustomerFormationMasterTabsState.sfb
                                          .mrefno,
                                      CustomerFormationMasterTabsState.sfb
                                          .trefno);*/
                                }catch(_){}

                                CustomerFormationMasterTabsState.custListBean
                                    .socialFinancialList.removeAt(
                                    CustomerFormationMasterTabsState.sfb
                                        .positionindex);

                                forEdit=false;
                              }
                              addToList();
                            })),
                  ],
                ),
              ],
            )));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
       final result = Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) =>
          new ViewCustomerFormationBankDetails(),
          fullscreenDialog: true,
        )).then<SocialFinancialDetailsBean>((socialFinancialDetailsBean) {
      setState(() {

        if(socialFinancialDetailsBean==null) {
          return;
        }else {
          forEdit = true;

          CustomerFormationMasterTabsState.sfb = socialFinancialDetailsBean;
          List tempDropDownValues = new List();
          tempDropDownValues.add(CustomerFormationMasterTabsState.sfb.mcurcode.toString());
          for (int k = 0;
          k < globals.dropdownCaptionsValuesSocialFinDetails.length;
          k++) {
            for (int i = 0;
            i < globals.dropdownCaptionsValuesSocialFinDetails[k].length;
            i++) {
              // print("k and i is $k $i");
              print(globals.dropdownCaptionsValuesSocialFinDetails[k][i].mcode.length);

              try {
                if (globals.dropdownCaptionsValuesSocialFinDetails[k][i].mcode
                    .toString() ==
                    tempDropDownValues[k].toString().trim()) {
                  print("matched $k");
                  setValue(k, globals.dropdownCaptionsValuesSocialFinDetails[k][i]);
                }
              } catch (_) {
                print("Exception in dropdown");
              }}}
        }

      });
    });
  }

  void addToList() {

    if(CustomerFormationMasterTabsState.custListBean.socialFinancialList==null){
      CustomerFormationMasterTabsState.custListBean.socialFinancialList= new  List<SocialFinancialDetailsBean>();
    }


    if(CustomerFormationMasterTabsState.sfb.maccno!=null&&CustomerFormationMasterTabsState.sfb.maccno!="null"){


      CustomerFormationMasterTabsState.custListBean.socialFinancialList.add(CustomerFormationMasterTabsState.sfb);


      //globals.SocialFinancialList.insert(listLength, sfb);
      print("CustomerFormationMasterTabsState.sfb"+CustomerFormationMasterTabsState.sfb.toString());

      setState(() {
        curcode=blankBean;

        CustomerFormationMasterTabsState.sfb = new SocialFinancialDetailsBean();
      });

    } else {
      _showAlert("Account Number", "It Is Mandatory");
    }
  }
  Future<void> _showAlert(String error, String message) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${error} error"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new Text("${error} error"),
                  new Text("${message}"),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  List<LookupBeanData> returnLookup(String pattern) {

    List<LookupBeanData> beanList=new List<LookupBeanData>();
    for (int i = 0;
    i < globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2].length;
    i++) {
      try {
        if (globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2][i].mcodedesc.toString().trim().toUpperCase().contains(pattern.trim().toUpperCase())){
          print(globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2][i].mcodedesc.toString().trim().toUpperCase());
          beanList.add(globals.dropDownCaptionValuesCOdeKeysSocialFinancial[2][i]);

        }
      }catch(_){
        print("Exception Occured");
      }
    }

    return beanList;


  }
}
class CustomModel {
  static const TITLE_KEY = 'title';

  String id;
  String title;
  bool isChecked = false;


  @override
  String toString() {
    return 'CustomModel{id: $id, title: $title, isChecked: $isChecked}';
  }

  void setIsChecked(bool isChecked) {
    this.isChecked = isChecked;
  }

  bool getIsChecked() {
    return isChecked;
  }



  CustomModel(String ex) {
    title = ex;
  }

}


