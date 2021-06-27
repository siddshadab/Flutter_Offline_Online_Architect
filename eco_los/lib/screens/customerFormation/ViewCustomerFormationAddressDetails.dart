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

class ViewCustomerFormationAddressDetails extends StatefulWidget {
  static const String routeName = '/material/data-table';

  @override
  _ViewCustomerFormationAddressDetailsState createState() =>
      _ViewCustomerFormationAddressDetailsState();
}

class _ViewCustomerFormationAddressDetailsState
    extends State<ViewCustomerFormationAddressDetails> {
  List<DataRow> _sampleDataRows = new List<DataRow>();
  List<DataColumn> _dataColumns = new List<DataColumn>();
  var rows2;
  var cols2;
  List<int> selectedIndex = new List<int>();
  List<List<String>> contactList ;



  @override
  void initState() {
    super.initState();
    List columnName = [
      "Address Type",
      "Home Owenership",
      "Country",
      "Province",
      "District",
      "Communce",
      "Village",
      "House No",
      "Address Line 2",
      "Address Line 3",
      "Mobile Number",
      "Telephone Number",
      "",
      ""
    ];
    List<DataCell> _dataCells = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L','M', 'N']
        .map((c) => DataCell(Text(c)))
        .toList();
    _sampleDataRows =
        [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13]
            .map((i) => DataRow(cells: _dataCells))
            .toList();
    _dataColumns = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,13]
        .map((i) => DataColumn(label: Text(columnName[i])))
        .toList();

    print("Address List");

    print("CustomerFormationMasterTabsState.addressBean");
    print(CustomerFormationMasterTabsState.custListBean.addressDetails);

    print(CustomerFormationMasterTabsState.custListBean.addressDetails);
    if(CustomerFormationMasterTabsState.custListBean.addressDetails == null){
      CustomerFormationMasterTabsState.custListBean.addressDetails =List();
    }

    if(CustomerFormationMasterTabsState.custListBean.addressDetails!= null) {
      if (CustomerFormationMasterTabsState.custListBean.addressDetails
          .isNotEmpty) {
        contactList = new List<List<String>>();

        print(CustomerFormationMasterTabsState.custListBean.addressDetails);
      for(int l = 0;l<CustomerFormationMasterTabsState.custListBean.addressDetails.length;l++){
        List<String> adressList = new List<String>(2);
        for (int k = 0; k < globals.dropdownCaptionsValuesKycDetails2.length; k++) {
          for (int i = 0; i < globals.dropdownCaptionsValuesKycDetails2[k].length; i++) {


            if (k == 0) {

              if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode.toString().trim() ==
                  CustomerFormationMasterTabsState.custListBean
                      .addressDetails[l].maddrType.toString().trim()) {

                adressList[0] = globals.dropdownCaptionsValuesKycDetails2[k][i].mcodedesc;


              }
            }
            if (k == 1) {

              print(CustomerFormationMasterTabsState.custListBean
                  .addressDetails[l].mownership);
              if (globals.dropdownCaptionsValuesKycDetails2[k][i].mcode.toString().trim() ==
                  CustomerFormationMasterTabsState.custListBean
                      .addressDetails[l].mownership.toString().trim()) {

                adressList[1] = globals.dropdownCaptionsValuesKycDetails2[k][i].mcodedesc;
print("adressList[1]"+adressList[1].toString());

              }



            }


  }


}
        contactList.add(adressList);


}
      }
      getRow();
    }

    cols2 = [
      new DataColumn(
        label: const Text('Address Type'),
      ),
      new DataColumn(
        label: const Text('Home Owenership'),
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
        label: const Text('House No'),
      ),
      new DataColumn(
        label: const Text('Address Line 2'),
      ),
      new DataColumn(
        label: const Text('Address Line 3'),
      ),
      new DataColumn(
        label: const Text('Years Of Stay'),
      ),
      new DataColumn(
        label: const Text('Mobile Number'),
      ),new DataColumn(
        label: const Text('Telephone Number'),
      ),new DataColumn(
        label: const Text('Edit'),
      )
    ];
  }
  Future getRow() async{
    rows2 = new List.generate(
      //adressList.length,
        CustomerFormationMasterTabsState.custListBean.addressDetails.length,

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

                    new DataCell(new Text(contactList[a][0]==null?"":contactList[a][0])),
                    new DataCell(new Text(contactList[a][1]==null?"":contactList[a][1])),
                    new DataCell(
              CustomerFormationMasterTabsState.custListBean.
              addressDetails[a].mcountryCd!="null"&&
                CustomerFormationMasterTabsState.custListBean.
                    addressDetails[a].mcountryCd!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mcountryCd.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                addressDetails[a].mState!="null"&&
                CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mState!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mState.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mDistCd!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mDistCd.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                addressDetails[a].mcityCd!="null"&&
                CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mcityCd!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].mcityCd.toString()):new Text(""),),
              new DataCell(
                CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].marea!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                    .addressDetails[a].marea.toString()):new Text(""),),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean
                      .addressDetails[a].maddr1!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .addressDetails[a].maddr1.toString()):new Text("")),
              new DataCell(
                  CustomerFormationMasterTabsState.custListBean.
                  addressDetails[a].maddr2!="null"&&
                  CustomerFormationMasterTabsState.custListBean
                      .addressDetails[a].maddr2!=null?
                  new Text(CustomerFormationMasterTabsState.custListBean
                      .addressDetails[a].maddr2):new Text("")),
                    new DataCell(
                        CustomerFormationMasterTabsState.custListBean.
                        addressDetails[a].maddr3!="null"&&
                            CustomerFormationMasterTabsState.custListBean
                                .addressDetails[a].maddr3!=null?
                        new Text(CustomerFormationMasterTabsState.custListBean
                            .addressDetails[a].maddr3):new Text("")),
                    new DataCell(
                        CustomerFormationMasterTabsState.custListBean.
                        addressDetails[a].mYearStay!="null"&&
                            CustomerFormationMasterTabsState.custListBean
                                .addressDetails[a].mYearStay!=null?
                        new Text(CustomerFormationMasterTabsState.custListBean
                            .addressDetails[a].mYearStay.toString()):new Text("")),
                    new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                addressDetails[a].mMobile!="null"&&
                CustomerFormationMasterTabsState.custListBean
                .addressDetails[a].mMobile!=null?
                new Text(CustomerFormationMasterTabsState.custListBean
                .addressDetails[a].mMobile):new Text("")),

            new DataCell(
                CustomerFormationMasterTabsState.custListBean.
                addressDetails[a].mtel1!="null"&&
                CustomerFormationMasterTabsState.custListBean
                .addressDetails[a].mtel1!=null?
                      new Text(CustomerFormationMasterTabsState.custListBean
                      .addressDetails[a].mtel1):new Text("")),
                    new DataCell(
                      /* new RaisedButton(
                  color: Color(0xff07426A),
                  onPressed: _popEdit(CustomerFormationMasterTabsState.custListBean
                      .customerBusinessDetailsBean[a],a),
                  child:*/
                      InkWell(

                        child: Text("Edit",
                            style: new TextStyle(color: Colors.red,fontSize: 18.0)),
                        onTap: () {_popEdit(CustomerFormationMasterTabsState.custListBean
                            .addressDetails[a],a);},
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
            'Contact details',
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
      print("items"+items.toString()+CustomerFormationMasterTabsState.custListBean.addressDetails.length.toString());
      //await AppDatabase.get().deleAddDetails(CustomerFormationMasterTabsState.custListBean.addressDetails[items].mrefno,CustomerFormationMasterTabsState.custListBean.addressDetails[items].trefno);

      CustomerFormationMasterTabsState.custListBean.addressDetails.removeAt(items);

    }
    selectedIndex.clear();

    setState(() {
      getRow();
    });
    await Navigator.of(context).pop();
  }

  void _popEdit(addressDetailsBean , int a) async{
    addressDetailsBean.positionindex=a;


    Navigator.of(context).pop(addressDetailsBean);
  }



}
