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


class ViewCustomerFormationFamilyDetails extends StatefulWidget {
  static const String routeName = '/material/data-table';


  @override
  _ViewCustomerFormationFamilyDetailsState createState() =>
      _ViewCustomerFormationFamilyDetailsState();
}

class _ViewCustomerFormationFamilyDetailsState
    extends State<ViewCustomerFormationFamilyDetails> {
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  List<int> selectedIndex = new List<int>();
  List<List<String>> familyList ;
  var rows2;
  var cols2;

  @override
  void initState() {
    super.initState();
    List columnName = [
      "Title",
      "Surname",
      "Middle Name",
      "Last Name",
      "Date Of Birth",
      "Education",
      "Relation",
      "Reverse Relationship",
      "Maratial Status",
      "Occupation",
      "Designation",
      "Dependent",
      "Earning Member",
      "Styding Menber",
      "Is living with applicant",
      ""
    ];
    if(CustomerFormationMasterTabsState.custListBean.familyDetailsList == null){
      CustomerFormationMasterTabsState.custListBean.familyDetailsList =List();
    }
    if(CustomerFormationMasterTabsState.custListBean.familyDetailsList!= null) {
      if(CustomerFormationMasterTabsState.custListBean.familyDetailsList.isNotEmpty){
        familyList = new List<List<String>>();
        for(int l = 0;l<CustomerFormationMasterTabsState.custListBean.familyDetailsList.length;l++){

          List<String> tempList = new List<String>(7);

          for (int k = 0; k < globals.dropdownCaptionsValuesFamilyDetails.length; k++) {
            for (int i = 0; i < globals.dropdownCaptionsValuesFamilyDetails[k].length; i++) {


              if (k == 0) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].meducation.toString().trim()) {

                  tempList[0] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;


                }
              }

              if (k == 1) {

                print(CustomerFormationMasterTabsState.custListBean
                    .familyDetailsList[l].mrelationwithcust);
                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].mrelationwithcust.toString().trim()) {

                  tempList[1] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;


                }



              }
              if (k == 2) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].moccuptype.toString().trim()) {
                  tempList[2] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;
                }
              }
              if (k == 3) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].maritalstatus.toString().trim()) {
                  tempList[3] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;
                }
              }
              if (k == 4) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].mnametitle.toString().trim()) {
                  tempList[4] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;
                }
              }

              if (k == 5) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].mreverseRelationship.toString().trim()) {
                  tempList[5] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;
                }
              }
              if (k == 6) {

                if (globals.dropdownCaptionsValuesFamilyDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .familyDetailsList[l].mdesignation.toString().trim()) {
                  tempList[6] = globals.dropdownCaptionsValuesFamilyDetails[k][i].mcodedesc;
                }
              }
            }


          }


          familyList.add(tempList);


        }
        print("family List is ${familyList}");
        print("CustomerFormationMasterTabsState.custListBean.familyDetailsList"+CustomerFormationMasterTabsState.custListBean.familyDetailsList.toString());
      }
    }




    List<DataCell> _dataCells = ['A', 'B', 'C', 'D', 'E', 'F', 'G','H','I','J','K','L','M', 'N','O','P']
        .map((c) => DataCell(Text(c)))
        .toList();
    _sampleDataRows =
        [0, 1, 2, 3, 4, 5, 6,7,8,9,10,11,13,14,15].map((i) => DataRow(cells: _dataCells)).toList();
    _dataColumns = [0, 1, 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14,15]
        .map((i) => DataColumn(label: Text(columnName[i])))
        .toList();
    getRow();
    cols2 = [
      new DataColumn(
        label: const Text('Title'),
      ),
      new DataColumn(
        label: const Text('Surname'),
      ),
      new DataColumn(
        label: const Text('Middle Name'),
      ),
      new DataColumn(
        label: const Text('Last Name'),
      ),
      new DataColumn(
        label: const Text('Date Of Birth'),
      ),
      new DataColumn(
        label: const Text('Education'),
      ),
      new DataColumn(
        label: const Text('Relation'),
      ),
      new DataColumn(
        label: const Text('Reverse Relationship'),
      ),
      new DataColumn(
        label: const Text('Maratial Status'),
      ),
      new DataColumn(
        label: const Text('Occupation'),
      ),
      new DataColumn(
        label: const Text('Designation'),
      ),
      new DataColumn(
        label: const Text('Dependent'),
      ),
      new DataColumn(
        label: const Text('Earning Member'),
      ),
      new DataColumn(
        label: const Text('Styding Menber'),
      ),
      new DataColumn(
        label: const Text('Is living with applicant'),
      ),
      new DataColumn(
        label: const Text('Edit'),
      )


    ];
  }
  void getRow(){
    rows2 = new List.generate(
        CustomerFormationMasterTabsState.custListBean.familyDetailsList.length,
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
              new DataCell(new Text(familyList[a][0]==null?"":familyList[a][4])),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mfname)),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mmname)),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mlname)),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  familyDetailsList[a].mdob!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .familyDetailsList[a].mdob!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .familyDetailsList[a].mdob.toString()):new Text("")),
              new DataCell(new Text(familyList[a][0]==null?"":familyList[a][0])),
              new DataCell(new Text(familyList[a][1]==null?"":familyList[a][1])),
              new DataCell(new Text(familyList[a][5]==null?"":familyList[a][5])),
              new DataCell(new Text(familyList[a][3]==null?"":familyList[a][3])),
              new DataCell(new Text(familyList[a][2]==null?"":familyList[a][2])),
              new DataCell(new Text(familyList[a][6]==null?"":familyList[a][6])),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mmemberno==null||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mmemberno=="null"||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mmemberno=="0" ||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].mmemberno== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misearngmembr==null||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misearngmembr=="null"||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misearngmembr=="0" ||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misearngmembr== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misstudyingmembr==null||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misstudyingmembr=="null"||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misstudyingmembr=="0" ||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misstudyingmembr== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misleavingwithappcnt==null||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misleavingwithappcnt=="null"||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misleavingwithappcnt=="0" ||
                      CustomerFormationMasterTabsState.custListBean.familyDetailsList[a].misleavingwithappcnt== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(
                InkWell(

                  child: Text("Edit",
                      style: new TextStyle(color: Colors.red,fontSize: 18.0)),
                  onTap: () {_popEdit(CustomerFormationMasterTabsState.custListBean
                      .familyDetailsList[a],a);},
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
            'Family details',
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
      print("items"+items.toString()+CustomerFormationMasterTabsState.custListBean.familyDetailsList.length.toString());
     // await AppDatabase.get().deleFamDetails(CustomerFormationMasterTabsState.custListBean.familyDetailsList[items].mrefno,CustomerFormationMasterTabsState.custListBean.familyDetailsList[items].trefno);
      CustomerFormationMasterTabsState.custListBean.familyDetailsList.removeAt(items);

    }
    selectedIndex.clear();

    setState(() {
      getRow();
    });
  }

  _popEdit(familyDetailsList, int a) async{
    familyDetailsList.positionindex=a;
    Navigator.of(context).pop(familyDetailsList);
  }

}
