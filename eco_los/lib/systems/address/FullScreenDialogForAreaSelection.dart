import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:eco_los/db/AppDatabase.dart';
import 'package:eco_los/systems/address/beans/AreaDropDownBean.dart';
import 'package:eco_los/systems/address/beans/GetAreaSelectionList.dart';

class FullScreenDialogForAreaSelection extends StatefulWidget {
  int areaCd = 0;
  String areaDesc = "";

  @override
  FullScreenDialogForAreaSelectionState createState() =>
      new FullScreenDialogForAreaSelectionState();
}

class FullScreenDialogForAreaSelectionState
    extends State<FullScreenDialogForAreaSelection> {
  List<AreaDropDownList> items = new List();
  GlobalKey<ScaffoldState> _scaffoldHomeState = new GlobalKey<ScaffoldState>();
  static const JsonCodec JSON = const JsonCodec();
  String url =
      'http://14.141.164.239:8090/area/getlistOfData/';

  Future<List<AreaDropDownList>> _getSuggestion(String url) async {
    return http.get(Uri.parse(url)).then((http.Response response) {
      final String res = response.body;
      print(res + " --res ");
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      final parsed = json.decode(res).cast<Map<String, dynamic>>();

      return parsed
          .map<GetAreaSelectionList>(
              (json) => GetAreaSelectionList.fromJson(json))
          .toList();
    });
  }

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
    return new GestureDetector(
      onTap: () {

        _onTapItem(context, items[index]);
      },
      child: new Card(
        shape: BeveledRectangleBorder(),
        child: new Row(
        children: <Widget>[
            SizedBox(height: 8.0,),
            Expanded(
              child:  new Card(
                  child:new ListTile(
                    leading:Text(
                      '${items[index].areaCd.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 40.0,color: Color(0xff07426A),),
                    ),

                    title: Text(
                      "Area : ${ '${items[index].areaDesc}'}\n",
              style: TextStyle(

              ),
            ),

          )
              ),
            ),
        ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
        future: AppDatabase.get()
            .getAreaList()
            .then((List<AreaDropDownList> response) => items = response),
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
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0xff07426A),
        brightness: Brightness.light,
        title: new Text(
          'Area List',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: futureBuilder,
      ),
    );
  }

  void _onTapItem(
      BuildContext context, AreaDropDownList getAreaList) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(getAreaList.areaCd.toString() +
            ' - ' +
            getAreaList.areaDesc)));

    widget.areaCd = getAreaList.areaCd;
    widget.areaDesc = getAreaList.areaDesc.toString();
    globals.areaCd = getAreaList.areaCd;
    globals.areaDesc = getAreaList.areaDesc.toString();
    Navigator.of(context).pop(getAreaList);
  }
}
