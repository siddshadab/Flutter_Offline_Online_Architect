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
import 'dart:async';


class ViewCustomerFormationBankDetails extends StatefulWidget {
  static const String routeName = '/material/data-table';


  @override
  _ViewCustomerFormationBankDetailsState createState() =>
      _ViewCustomerFormationBankDetailsState();
}

class _ViewCustomerFormationBankDetailsState
    extends State<ViewCustomerFormationBankDetails> {
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  List<int> selectedIndex = new List<int>();
  List<List<String>> bankList ;
  var rows2;
  var cols2;

  @override
  void initState() {
    super.initState();
    List columnName = [
      "Account Number",
      "Bank Name",
      "Branch",
      "Account Balance",
      "Is use for disbursement",
      ""
    ];
    if(CustomerFormationMasterTabsState.custListBean.socialFinancialList == null){
      CustomerFormationMasterTabsState.custListBean.socialFinancialList =List();
    }
    if(CustomerFormationMasterTabsState.custListBean.socialFinancialList!= null) {
      if(CustomerFormationMasterTabsState.custListBean.socialFinancialList.isNotEmpty){
        bankList = new List<List<String>>();
        for(int l = 0;l<CustomerFormationMasterTabsState.custListBean.socialFinancialList.length;l++){

          List<String> tempList = new List<String>(1);

          for (int k = 0; k < globals.dropdownCaptionsValuesSocialFinDetails.length; k++) {
            for (int i = 0; i < globals.dropdownCaptionsValuesSocialFinDetails[k].length; i++) {


              if (k == 0) {

                if (globals.dropdownCaptionsValuesSocialFinDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .socialFinancialList[l].mcurcode.toString().trim()) {

                  tempList[0] = globals.dropdownCaptionsValuesSocialFinDetails[k][i].mcodedesc;


                }
              }
            }
          }


          bankList.add(tempList);


        }
        print("bank List is ${bankList}");
        print("CustomerFormationMasterTabsState.custListBean.socialFinancialList"+CustomerFormationMasterTabsState.custListBean.socialFinancialList.toString());
      }
    }

    List<DataCell> _dataCells = ['A', 'B', 'C', 'D', 'E','F','G']
        .map((c) => DataCell(Text(c)))
        .toList();
    _sampleDataRows =
        [0, 1, 2, 3, 4,5].map((i) => DataRow(cells: _dataCells)).toList();
    _dataColumns = [0, 1, 2, 3, 4,5]
        .map((i) => DataColumn(label: Text(columnName[i])))
        .toList();
    getRow();
    cols2 = [
      new DataColumn(
        label: const Text('Account Number'),
      ),
      new DataColumn(
        label: const Text('Bank Name'),
      ),
      new DataColumn(
        label: const Text('Branch'),
      ),
      new DataColumn(
        label: const Text('Account Balance'),
      ),
      new DataColumn(
        label: const Text('Is use for disbursement'),
      ),
      new DataColumn(
        label: const Text('Currency Code'),
      ),
      new DataColumn(
        label: const Text('Edit'),
      )
    ];
  }
  void getRow(){
    rows2 = new List.generate(
        CustomerFormationMasterTabsState.custListBean.socialFinancialList.length,
            (int a) => new DataRow(
            selected:selectedIndex.contains(a)?true:false,
            onSelectChanged: (val){
              getRow();
              if(selectedIndex.contains(a)){
                print("a is there");
                selectedIndex.remove(a);
              }
              else{
                print("adding a");
                selectedIndex.add(a);


              }


              print("${a}  bool is ${val}");
              setState(() {
                getRow();
              });

            },


            cells: [
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  socialFinancialList[a].maccno!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .socialFinancialList[a].maccno!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .socialFinancialList[a].maccno.toString()):new Text("")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  socialFinancialList[a].mbankname!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .socialFinancialList[a].mbankname!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .socialFinancialList[a].mbankname.toString()):new Text("")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  socialFinancialList[a].mbranch!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .socialFinancialList[a].mbranch!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .socialFinancialList[a].mbranch.toString()):new Text("")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  socialFinancialList[a].maccbal!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .socialFinancialList[a].maccbal!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .socialFinancialList[a].maccbal.toString()):new Text("")),

              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.socialFinancialList[a].misusefordis=="null"||
                      CustomerFormationMasterTabsState.custListBean.socialFinancialList[a].misusefordis==null||
                      CustomerFormationMasterTabsState.custListBean.socialFinancialList[a].misusefordis=="0" ||
                      CustomerFormationMasterTabsState.custListBean.socialFinancialList[a].misusefordis== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(new Text(bankList[a][0]==null?"":bankList[a][0])),

              new DataCell(
                InkWell(

                  child: Text("Edit",
                      style: new TextStyle(color: Colors.red,fontSize: 18.0)),
                  onTap: () {_popEdit(CustomerFormationMasterTabsState.custListBean
                      .socialFinancialList[a],a);},
                ),)

            ]));

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          elevation: 3.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xff07426A),
          brightness: Brightness.light,
          title: new Text(
            'Bank details',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 22.0,
                ),
                onPressed: deleteSelected),
          ],
        ),
        body: ListView(padding: EdgeInsets.all(20.0), children: <Widget>[
          SingleChildScrollView(

            scrollDirection: Axis.horizontal,
            child: DataTable(
              rows: rows2,
              columns: cols2,
            ),
          ),
        ]),
      ),
    );
  }
  void deleteSelected()async{

    for( var items in selectedIndex){
      print("items"+items.toString()+CustomerFormationMasterTabsState.custListBean.socialFinancialList.length.toString());
      if(CustomerFormationMasterTabsState.custListBean.socialFinancialList[items].mbankname.contains("CAMBODIA POST BANK Plc")){
        _showAlert("Cambodia Post Bank Detalis", "Cannot be deleted");

      }
      else {
        /*await AppDatabase.get().deleBankDetails(
            CustomerFormationMasterTabsState.custListBean
                .socialFinancialList[items].mrefno,
            CustomerFormationMasterTabsState.custListBean
                .socialFinancialList[items].trefno);*/

        CustomerFormationMasterTabsState.custListBean.socialFinancialList
            .removeAt(items);
      }
    }
    selectedIndex.clear();

    setState(() {
      getRow();
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
  _popEdit(socialFinancialList, int a) async{
    if(socialFinancialList.mbankname.contains("CAMBODIA POST BANK Plc")){
      _showAlert("Cambodia Post Bank Detalis", "Cannot be edited");

    }else{
    socialFinancialList.positionindex=a;


    Navigator.of(context).pop(socialFinancialList);
    }
  }
}
