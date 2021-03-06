import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/customerFormation/ViewCustomerFormationBankDetails.dart';
import 'package:eco_los/screens/customerFormation/bean/SocialFinancialDetailsBean.dart';
import 'package:eco_los/screens/customerFormation/bean/TotalExpenditureDetailsBean.dart';
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

class CustomerTotalExpenditureDetails extends StatefulWidget {
  CustomerTotalExpenditureDetails();

  @override
  _CustomerTotalExpenditureDetailsState createState() =>
      new _CustomerTotalExpenditureDetailsState();
}

class _CustomerTotalExpenditureDetailsState
    extends State<CustomerTotalExpenditureDetails> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final formatDouble = new NumberFormat("#,##0.00", "en_US");
  @override
  void initState() {
    print("CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean"+CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean.toString());
    if (CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean == null) {
      CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean =   new TotalExpenditureDetailsBean();
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: _formKey,
      autovalidate: false,
      onChanged: () async{
        final FormState form = _formKey.currentState;
        form.save();

        setState(() {
          calculateTotalFamExpense();
          calculateTotalDebtExpense();
        });


      },
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          children: <Widget>[
            SizedBox(height: 10.0,),
            Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child: new Row(

                children: <Widget>[Text(Translations.of(context).text('FamExp'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
              ),
            ),
            SizedBox(height: 10.0,),
            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mlivngexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mlivngexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mlivngexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('livngExpnsHint'),
                  labelText: Translations.of(context).text('livngExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotlcommexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotlcommexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mtotlcommexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),

                  hintText: Translations.of(context).text('telExpnsHint'),
                  labelText: Translations.of(context).text('telExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),
            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.meduexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.meduexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .meduexpns = double.parse(value);
                  //addToList(context,0);
                }catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('eduExpnsHint'),
                  labelText: Translations.of(context).text('eduExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),
            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mmedexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mmedexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mmedexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('medExpnsHint'),
                  labelText: Translations.of(context).text('medExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mrntlexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mrntlexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mrntlexpns = double.parse(value);
                  //addToList(context,0);
                }catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('RentlExpnsHint'),
                  labelText: Translations.of(context).text('RentlExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mlghtwtrexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mlghtwtrexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mlghtwtrexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('lghtwtrExpnsHint'),
                  labelText: Translations.of(context).text('lghtwtrExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mvechtrnsprtexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('vehtrnsprtExpnsHint'),
                  labelText: Translations.of(context).text('vehtrnsprtExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mothrexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mothrexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mothrexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType
                  .numberWithOptions(decimal: true),

              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('othrExpnsHint'),
                  labelText: Translations.of(context).text('othrExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),


            /*new TextFormField(
              enabled: false,
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotlfamexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotlfamexpns))
                  : TextEditingController(text: "0.0"),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mtotlfamexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              keyboardType: TextInputType.numberWithOptions(),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('totlFamExpnsHint'),
                  labelText: Translations.of(context).text('totlFamExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),*/

            new ListTile(
              title: new Text(Translations.of(context).text('totlFamExpnslabel')),
              subtitle: CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                  .mtotlfamexpns ==
                  null
                  ? new Text("")
                  : new Text(
                  "${CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mtotlfamexpns}"),
            ),
            SizedBox(height: 10.0,),



            Container(
              decoration: BoxDecoration(color: Constant.mandatoryColor),
              child: new Row(

                children: <Widget>[Text(Translations.of(context).text('DbtExp'),style: TextStyle(color: Colors.blue,fontSize: 25.0),)],
              ),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mloanservexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mloanservexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mloanservexpns = double.parse(value);
                  //addToList(context,0);
                }catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('loanservExpnsHint'),
                  labelText: Translations.of(context).text('loanservExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mcredcrdexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mcredcrdexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mcredcrdexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('creditExpnsHint'),
                  labelText: Translations.of(context).text('creditExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            new TextFormField(
              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns))
                  : TextEditingController(text: ""),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mothrdebtrepymntexpns = double.parse(value);
                  //addToList(context,0);
                } catch (e) {
                  print(e);
                }
              },
              inputFormatters: [new LengthLimitingTextInputFormatter(15),globals.onlyDoubleNumber],

              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('othrDebtExpnsHint'),
                  labelText: Translations.of(context).text('othrDebtExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
            SizedBox(height: 10.0,),

            /*      new TextFormField(
              enabled: false,

              controller: CustomerFormationMasterTabsState
                  .custListBean.totalExpenditureDetailsBean !=
                  null &&
                  CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotldebtexpns !=
                      null
                  ? TextEditingController(
                  text: formatDouble.format(CustomerFormationMasterTabsState
                      .custListBean.totalExpenditureDetailsBean.mtotldebtexpns))
                  : TextEditingController(text: "0.0"),
              onSaved: (String value) {
                try {
                  CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mtotldebtexpns = double.parse(value);
                  //addToList(context,0);
                } catch (_) {}
              },

              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: Translations.of(context).text('totlDebtExpnsHint'),
                  labelText: Translations.of(context).text('totlDebtExpnslabel'),
                  prefixText: '',
                  suffixText: '',
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),*/

            new ListTile(
              title: new Text(Translations.of(context).text('totlDebtExpnslabel')),
              subtitle: CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                  .mtotldebtexpns ==
                  null
                  ? new Text("")
                  : new Text(
                  "${CustomerFormationMasterTabsState.custListBean.totalExpenditureDetailsBean
                      .mtotldebtexpns}"),
            ),
            SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }


  calculateTotalFamExpense() {
    CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean.mtotlfamexpns = 0.0;

    if (CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean != null) {
      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mothrexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mothrexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mvechtrnsprtexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mlghtwtrexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mlghtwtrexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mrntlexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mrntlexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mmedexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mmedexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.meduexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.meduexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mtotlcommexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mtotlcommexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mlivngexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotlfamexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mlivngexpns;
      }
    }
  }

  calculateTotalDebtExpense() {
    CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean.mtotldebtexpns = 0.0;
    print("vvvvvvvvvvvvvv");
    print(CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns);

    print(CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean.mcredcrdexpns);

    print(CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean.mloanservexpns);

    if(CustomerFormationMasterTabsState
        .custListBean.totalExpenditureDetailsBean!=null){
      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns !=
          null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotldebtexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mothrdebtrepymntexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mcredcrdexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotldebtexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mcredcrdexpns;
      }

      if (CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mloanservexpns != null) {
        CustomerFormationMasterTabsState
            .custListBean.totalExpenditureDetailsBean.mtotldebtexpns +=
            CustomerFormationMasterTabsState
                .custListBean.totalExpenditureDetailsBean.mloanservexpns;
      }

      print(CustomerFormationMasterTabsState
          .custListBean.totalExpenditureDetailsBean.mtotldebtexpns);

    }
  }

}
