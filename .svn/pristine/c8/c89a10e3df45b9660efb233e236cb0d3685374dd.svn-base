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


class ViewBorrowingDetails extends StatefulWidget {
  static const String routeName = '/material/data-table';

  @override
  _ViewBorrowingDetailsState createState() => _ViewBorrowingDetailsState();
}

class _ViewBorrowingDetailsState extends State<ViewBorrowingDetails> {
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  var rows2;
  var cols2;
  List<List<String>> borrowingList ;
  List<int> selectedIndex = new List<int>();

  @override
  void initState() {
    super.initState();
    List columnName = [
      "Family Member",
      "Age",
      "Education",
      "RelationShip",
      "Occupation",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
    ];
    
    
    
    
    if(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean == null){
      CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean =List();
    }



    if(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean!= null) {
      if(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.isNotEmpty){
        borrowingList = new List<List<String>>();
        for(int l = 0;l<CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.length;l++){

          List<String> tempList = new List<String>(4);

          for (int k = 0; k < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails.length; k++) {
            for (int i = 0; i < globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k].length; i++) {


              if (k == 0) {

                if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .borrowingDetailsBean[l].mcurcd.toString().trim()) {

                  tempList[0] = globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcodedesc;


                }
              }

              if (k == 1) {

                print(CustomerFormationMasterTabsState.custListBean
                    .borrowingDetailsBean[l].mrestructrdloan);
                if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .borrowingDetailsBean[l].mrestructrdloan.toString().trim()) {

                  tempList[1] = globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcodedesc;


                }



              }
              if (k == 2) {

                if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .borrowingDetailsBean[l].mfrequency.toString().trim()) {
                  tempList[2] = globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcodedesc;
                }
              }
              if (k == 3) {

                if (globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .borrowingDetailsBean[l].mmodeofdisb.toString().trim()) {
                  tempList[3] = globals.dropdownCaptionsValuesLoanFromOthrFinanclDetails[k][i].mcodedesc;
                }
              }


            }


          }


          borrowingList.add(tempList);


        }
        print("family List is ${borrowingList}");
      }
    }
    
    List<DataCell> _dataCells = ['A', 'B', 'C', 'D', 'E','F','G','H','I','J','K','L', 'M', 'N', 'O', 'P', 'Q', 'R']
        .map((c) => DataCell(Text(c)))
        .toList();
    _sampleDataRows =
        [0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17].map((i) => DataRow(cells: _dataCells)).toList();
    _dataColumns = [0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17]
        .map((i) => DataColumn(label: Text(columnName[i])))
        .toList();
    for (var items in CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean) {}
    getRow();
    cols2 = [
      new DataColumn(
        label: const Text('Account Number'),
      ),
      new DataColumn(
        label: const Text('Name Of The Bank'),
      ),
      new DataColumn(
        label: const Text('Name Of Product'),
      ),
      new DataColumn(
        label: const Text('Savings Amount'),
      ),
      new DataColumn(
        label: const Text('Loan Amount'),
      ),
      new DataColumn(
        label: const Text('Installment Amount'),
      ),
      new DataColumn(
        label: const Text('Rate Of Interest'),
      ),
      new DataColumn(
        label: const Text('Loan Date'),
      ),
      new DataColumn(
        label: const Text('Tenure'),
      ),
      new DataColumn(
        label: const Text('Currency'),
      ),
      new DataColumn(
        label: const Text('Restructered Loan'),
      ),
      new DataColumn(
        label: const Text('Frequency'),
      ),
      new DataColumn(
        label: const Text('Repayment Type'),
      ),
      new DataColumn(
        label: const Text('Loan Purpose'),
      ),
      new DataColumn(
        label: const Text('Outstanding Amount'),
      ),
      new DataColumn(
        label: const Text('Loan Cycle'),
      ),
      new DataColumn(
        label: const Text('Remarks'),
      ),  new DataColumn(
        label: const Text('Edit'),
      )

    ];
  }

  getRow(){
    rows2 = new List.generate(
        CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.length,
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
            CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].macctno!=null?
                  new Text(
            CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].macctno.toString()):new Text("")),
              new DataCell(
                  new Text(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mnameofborrower.toString())),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].msource!=null?
                  new Text(
                      CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].msource.toString()):new Text("")),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].msvngamount.toString())),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mamount.toString())),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].memiamt.toString())),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mintrate.toString())),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  borrowingDetailsBean[a].mloanDate!="null"&&
                      CustomerFormationMasterTabsState.custListBean
                          .borrowingDetailsBean[a].mloanDate!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .borrowingDetailsBean[a].mloanDate.toString()):new Text("")),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mperiod.toString())),
              new DataCell(new Text(borrowingList[a][0]==null?"":borrowingList[a][0])),
              new DataCell(new Text(borrowingList[a][1]==null?"":borrowingList[a][1])),
              new DataCell(new Text(borrowingList[a][2]==null?"":borrowingList[a][2])),
              new DataCell(new Text(borrowingList[a][3]==null?"":borrowingList[a][3])),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mpurpose.toString())),
              new DataCell(new Text(
                  CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].moutstandingamt.toString())),
              new DataCell(new Text("${CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mloancycle}")),
              new DataCell(
                  new Text(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[a].mremark.toString())),
              new DataCell(

                InkWell(

                  child: Text("Edit",
                      style: new TextStyle(color: Colors.red,fontSize: 18.0)),
                  onTap: () {_popEdit(CustomerFormationMasterTabsState.custListBean
                      .borrowingDetailsBean[a],a);},
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
              'Borrowing Loan list details',
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
            child:
            DataTable(
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
      print("items"+items.toString()+CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.length.toString());
      //await AppDatabase.get().deleBorrowDetails(CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[items].mrefno,CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean[items].trefno);
      CustomerFormationMasterTabsState.custListBean.borrowingDetailsBean.removeAt(items);

    }
    selectedIndex.clear();

    setState(() {
      getRow();
    });
  }

  _popEdit(borrowingDetailsBean, int a) async{
    borrowingDetailsBean.positionindex=a;
    Navigator.of(context).pop(borrowingDetailsBean);
  }
}
