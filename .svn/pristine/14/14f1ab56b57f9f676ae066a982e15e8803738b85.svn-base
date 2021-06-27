import 'dart:async';
import 'dart:convert';
import 'package:eco_los/db/TablesColumnFile.dart';
import 'package:eco_los/screens/home/about_us.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class SideDrawer extends StatefulWidget {
  SideDrawer();

  @override
  _SideDrawerState createState() =>
      new _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {

  String userName = "";
  String role = "";
  String loginTime = "";
  _SideDrawerState();

  @override
  void initState() {
    super.initState();
    getSessionVariables();
  }



  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: new BoxDecoration(
              color: Color(0xff07426A),
            ),
            accountName: new Text("User ID ".toString() + userName.toString() + "  And role ".toString() + role.toString()),
            accountEmail: new Text(
              "Login Time : ".toString() + loginTime.toString(),
              overflow: TextOverflow.fade,
            ),
            otherAccountsPictures: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute<bool>(
                          builder: (context) => new AboutUsScreen()),
                    );
                  })
            ],
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              //backgroundImage: new AssetImage("assets/profile_pic.jpg"),
            ),
          ),

        ],
      ),
    );
  }



  void getSessionVariables() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.get(TablesColumnFile.musrcode);
    role = prefs.get(TablesColumnFile.musrdesignation);
    loginTime = prefs.get(TablesColumnFile.LoginTime);
  }


}
