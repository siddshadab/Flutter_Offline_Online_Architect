import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:eco_los/db/AppDatabase.dart';

import 'bean/HbsUserBean.dart';
class FullScreenDialogForHbsUsers extends StatefulWidget {
   FullScreenDialogForHbsUsers( );
  @override
  _FullScreenDialogForHbsUsersState createState() =>
      new _FullScreenDialogForHbsUsersState();
}

class _FullScreenDialogForHbsUsersState
    extends State<FullScreenDialogForHbsUsers> {
  List<HbsUserBean> items = new List();
  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();
  static const JsonCodec JSON = const JsonCodec();

  //String url = 'http://14.141.164.239:8090/purposeData/getlistOfPurposes/';

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  getHomePageBody(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.data != null) {
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: _getItemUI,
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 20.0),
      );
    }
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new SizedBox(
      child: new Card(
          child: new Column(
            children: <Widget>[
              new ListTile(
                leading: new Text(
                  '${items[index].musrname}',
                  //textScaleFactor: 1.2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),

                title: new Text(
                  '${items[index].musrcode}',
                  //textScaleFactor: 0.9,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.blueAccent,
                  ),
                ),

                //trailing: ,
                onTap: () {
                  _onTapItem(context, items[index]);
                },
              )
            ],
          )),
    );
  }

  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: AppDatabase.get()
            .getHbsUsers()
            .then((List<HbsUserBean> response) => items = response),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('Press button to start');
            case ConnectionState.waiting:
              return new Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  child:
                  new CircularProgressIndicator()); // new Text('Awaiting result...');
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return getHomePageBody(context, snapshot);
          }
        });
    return Scaffold(
      key: _scaffoldHomeState,
      appBar: new AppBar(
        elevation: 3.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: new Text(
          "HBS USER",// 'Main Occupation Selection List',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      /*  floatingActionButton: new FloatingActionButton(
        child: new Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        onPressed: () async {
          bool isDataChanged = await Navigator.push(
            context,
            new MaterialPageRoute<bool>(
                builder: (context) => new CustomerFormationBasicDetails()),
          );

        },
      ),*/
      body: Center(
        child: futureBuilder,
      ),
    );
  }

  void _onTapItem(BuildContext context, HbsUserBean getSubOccOfLoanList) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(getSubOccOfLoanList.musrcode.toString() +
            ' - ' +
            getSubOccOfLoanList.musrname)));

    Navigator.of(context).pop(getSubOccOfLoanList);

  }
}
