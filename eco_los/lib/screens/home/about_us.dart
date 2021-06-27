import 'package:flutter/material.dart';
import 'package:eco_los/helpers/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

const double FONT_VERY_SMALL = 4.0;
const double FONT_SMALL = 8.0;
const double FONT_MEDIUM = 16.0;
const double FONT_LARGE = 24.0;
const double FONT_VERY_LARGE = 32.0;

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("About"),
        backgroundColor: Colors.blue,
        brightness: Brightness.light,
      ),
      body: new Container(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new ListView(
            children: <Widget>[
              new Card(
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                        leading:
                            new Icon(Icons.bug_report, color: Colors.black),
                        title: new Text("Rpeort an Issue"),
                        subtitle: new Text("Having an issue ? Report it here"),
                       ),
                    new ListTile(
                      leading: new Icon(Icons.update, color: Colors.black),
                      title: new Text("Version"),
                      subtitle: new Text("0.0.1"),
                    )
                  ],
                ),
              ),
              new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: new Text("Author",
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),
                    new ListTile(
                      leading:
                          new Icon(Icons.perm_identity, color: Colors.black),
                      title: new Text("Shadab siddiqui"),
                      subtitle: new Text("shadabep4372"),

                    ),
                    new ListTile(
                        leading:
                            new Icon(Icons.bug_report, color: Colors.black),
                        title: new Text("make a call"),
                        ),
                    new ListTile(
                        leading: new Icon(Icons.email, color: Colors.black),
                        title: new Text("Send an Email"),
                        subtitle: new Text("siddshadab7@gmail.com"),
                        ),
                  ],
                ),
              ),
              new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: new Text("Ask Question ?",
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),

                  ],
                ),
              ),
              new Card(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                      child: new Text("Infrasoft Licenese",
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: FONT_MEDIUM)),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new ListTile(
                        subtitle: new Text("Make a copyright"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
