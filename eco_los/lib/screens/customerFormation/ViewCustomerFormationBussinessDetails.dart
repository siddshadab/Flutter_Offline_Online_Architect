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

class ViewCustomerFormationBussinessDetails extends StatefulWidget {
  static const String routeName = '/material/data-table';


  @override
  _ViewCustomerFormationBussinessDetailsState createState() =>
      _ViewCustomerFormationBussinessDetailsState();
}

class _ViewCustomerFormationBussinessDetailsState
    extends State<ViewCustomerFormationBussinessDetails> {
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  List<int> selectedIndex = new List<int>();
  List<List<String>> bussinessList ;
  var rows2;
  var cols2;

  @override
  void initState() {
    super.initState();
    List columnName = [
      "Service/Bussiness",
      "Employement Type",
      "Is Primary Source Of Income",
      "Rank Of Employee",
      "Is Self Employed",
      "Total length of employment",
      "Company Name",
      "",
      "Employee Id",
      "Monthly Income",
      "No Of Employee in Company",
      "Profession",
      "Mobile number",
      "",
      "Status Of Employment",
      "Income from other Source",
      "Source name of other Income",
      "Date Of Incorporation",
      "Employement From Date",
      "Employement To Date",
      "Years Of exprience",
      "Month of exprience",
      "House No",
      "Address Line 2",
      "Address Line 3",
      "Country",
      "Province",
      "District",
      "Communce",
      "Village",
      "Edit"
    ];
    if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean == null){
      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean =List();
    }
    if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean!= null) {
      if(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.isNotEmpty){
        bussinessList = new List<List<String>>();
        for(int l = 0;l<CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.length;l++){

          List<String> tempList = new List<String>(11);

          for (int k = 0; k < globals.dropDownCaptionValuesBusinessDetails.length; k++) {
            for (int i = 0; i < globals.dropDownCaptionValuesBusinessDetails[k].length; i++) {


              if (k == 0) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mbuslocownership.toString().trim()) {

                  tempList[0] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }

           /*   if (k == 0) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mbuslocownership.toString().trim()) {

                  tempList[0] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }*/

              if (k == 2) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mcompanycategory.toString().trim()) {

                  tempList[2] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }

              if (k == 3) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mbusstype.toString().trim()) {

                  tempList[3] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }

              if (k == 4) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].msrcname.toString().trim()) {

                  tempList[4] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }

              if (k == 5) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mstatusofemp.toString().trim()) {

                  tempList[5] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }


              if (k == 6) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].misprimarysrcincome.toString().trim()) {

                  tempList[6] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }
              if (k == 7) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mrankofemp.toString().trim()) {

                  tempList[7] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }
              if (k == 8) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mposition.toString().trim()) {

                  tempList[8] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }
              if (k == 9) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mdepartment.toString().trim()) {

                  tempList[9] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }
              if (k == 10) {
                if (globals.dropDownCaptionValuesBusinessDetails[k][i].mcode.toString().trim() ==
                    CustomerFormationMasterTabsState.custListBean
                        .customerBusinessDetailsBean[l].mbussstatus.toString().trim()) {

                  tempList[10] = globals.dropDownCaptionValuesBusinessDetails[k][i].mcodedesc;


                }
              }


            }


          }

          if(tempList!=null) {
            bussinessList.add(tempList);
          }


        }
        print("bussiness List is ${bussinessList}");
      }
    }




    List<DataCell> _dataCells = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L' , 'M', 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z','A1','B1','C1','D1','E1']
        .map((c) => DataCell(Text(c)))
        .toList();
    _sampleDataRows =
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,29].map((i) => DataRow(cells: _dataCells)).toList();
    _dataColumns = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,29,30]
        .map((i) => DataColumn(label: Text(columnName[i])))
        .toList();
    getRow();
    cols2 = [
      new DataColumn(
        label: const Text('Service/Bussiness'),
      ),
      new DataColumn(
        label: const Text('Employement Type'),
      ),
      new DataColumn(
        label: const Text('Is Primary Source Of Income'),
      ),
      new DataColumn(
        label: const Text('Rank Of Employee'),
      ),
      new DataColumn(
        label: const Text('Is Self Employed'),
      ),
      new DataColumn(
        label: const Text('Total length of employment'),
      ),
      new DataColumn(
        label: const Text('Company Name'),
      ),
      new DataColumn(
        label: const Text('Position'),
      ),
      new DataColumn(
        label: const Text('Employee Id'),
      ),
      new DataColumn(
        label: const Text('Monthly Income'),
      ),
      new DataColumn(
        label: const Text('No Of Employee in Company'),
      ),
      new DataColumn(
        label: const Text('Profession'),
      ),
      new DataColumn(
        label: const Text('Mobile number'),
      ),
      new DataColumn(
        label: const Text('Department'),
      ),
      new DataColumn(
        label: const Text('Status Of Employment'),
      ),
      new DataColumn(
        label: const Text('Income from other Source'),
      ),
      new DataColumn(
        label: const Text('Source name of other Income'),
      ),
      new DataColumn(
        label: const Text('Date Of Incorporation'),
      ),
      new DataColumn(
        label: const Text('Employement From Date'),
      ),
      new DataColumn(
        label: const Text('Employement To Date'),
      ),
      new DataColumn(
        label: const Text('Years Of exprience '),
      ),
      new DataColumn(
        label: const Text('Month of exprience'),
      ),
      new DataColumn(
        label: const Text('House No'),
      ),
      new DataColumn(
        label: const Text('Address Line 2'),
      ),
      new DataColumn(
        label: const Text('Address Line 3'),
      ),
      new DataColumn(
        label: const Text('Country'),
      ),
      new DataColumn(
        label: const Text('Province'),
      ),
      new DataColumn(
        label: const Text('District'),
      ),
      new DataColumn(
        label: const Text('Communce'),
      ),
      new DataColumn(
        label: const Text('Village'),
      ),
      new DataColumn(
        label: const Text('Edit'),
      )
    ];
  }
  void getRow(){
    rows2 = new List.generate(
        CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.length,
            (int a) => new DataRow(
            selected:selectedIndex.contains(a)?true:false,
            onSelectChanged: (val)async{
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
                  CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mcusactivitytype=="null"||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mcusactivitytype==null||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mcusactivitytype=="0" ||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a]. mcusactivitytype== ""?
                  new Text("Service"):new Text("Bussiness")),
              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][0]==null?"":bussinessList[a][0])),
              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][6]==null?"":bussinessList[a][6])),
              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][7]==null?"":bussinessList[a][7])),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].misselfemp=="null"||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].misselfemp==null||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].misselfemp=="1" ||
                      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a]. misselfemp== ""?
                  new Text("No"):new Text("Yes")),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbusyrsmnths!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbusyrsmnths!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbusyrsmnths.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbusinessname!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbusinessname!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbusinessname.toString()):new Text(""),),
              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][8]==null?"":bussinessList[a][8])),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mregistrationno!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mregistrationno!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mregistrationno.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mmonthlyincome!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mmonthlyincome!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mmonthlyincome.toString()):new Text(""),

              ),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mnoofempincmpny!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mnoofempincmpny!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mnoofempincmpny.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mprofession!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mprofession!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mprofession.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mmobile!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mmobile!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mmobile.toString()):new Text(""),),


              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][9]==null?"":bussinessList[a][9])),
              new DataCell(new Text(bussinessList!=null && bussinessList[a]!=null && bussinessList[a][10]==null?"":bussinessList[a][10])),

              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mincomefromothrsrc!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mincomefromothrsrc!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mincomefromothrsrc.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].msrcname!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].msrcname!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].msrcname.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mdateofincorporation!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mdateofincorporation!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mdateofincorporation.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mempfrom!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mempfrom!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mempfrom.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mempto!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mempto!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mempto.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].myrsofexpinyrs!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].myrsofexpinyrs!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].myrsofexpinyrs.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].myrsofexpinmnths!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].myrsofexpinmnths!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].myrsofexpinmnths.toString()):new Text(""),),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress1.toString()=="null"?"":CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress1.toString())),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress2.toString()=="null"?"":CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress2.toString())),
              new DataCell(new Text(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress3.toString()=="null"?"":CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[a].mbusaddress3.toString())),

              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbuscountry!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbuscountry!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbuscountry.toString()):new Text(""),),

              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbusstate!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbusstate!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbusstate.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mdistcd!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mdistcd!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mdistcd.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbuscity!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbuscity!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbuscity.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                customerBusinessDetailsBean[a].mbusarea!="null"&&
                    CustomerFormationMasterTabsState.custListBean.
                    customerBusinessDetailsBean[a].mbusarea!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .customerBusinessDetailsBean[a].mbusarea.toString()):new Text(""),),
              new DataCell(

    InkWell(

    child: Text("Edit",
        style: new TextStyle(color: Colors.red,fontSize: 18.0)),
    onTap: () {_popEdit(CustomerFormationMasterTabsState.custListBean
        .customerBusinessDetailsBean[a],a);},
    ),)
             // )




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
            'Bussiness details',
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
      print("items"+items.toString()+CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.length.toString());
     // await AppDatabase.get().deleBussDetails(CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[items].mrefno,CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean[items].trefno);
      CustomerFormationMasterTabsState.custListBean.customerBusinessDetailsBean.removeAt(items);

    }
    selectedIndex.clear();

    setState(() {
      getRow();
    });
  }

  _popEdit(customerBusinessDetailsBean, int a) async{
    customerBusinessDetailsBean.positionindex=a;


    Navigator.of(context).pop(customerBusinessDetailsBean);
  }


}
