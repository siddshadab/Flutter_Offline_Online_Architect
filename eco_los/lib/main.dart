import 'package:eco_los/helpers/app_constant.dart';
import 'package:eco_los/screens/login/Login.dart';
import 'package:eco_los/screens/login/application.dart';
import 'package:eco_los/screens/login/translations.dart';
import 'package:eco_los/systems/settings/bean/SettingsBean.dart';
import 'package:eco_los/widgets/CustomBubbleTabIndicatorTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



String get = '';
//SettingsBean settingsBean ;
SettingsBean settingsBean = new SettingsBean();

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Constant.setVer();
    await Constant.generateUrl();
    await Constant.getDropDownInitialize();
    await Constant.setSystemVariables();
  }catch(_){
    print(_);
  }
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;

  @override
  void initState(){
    super.initState();
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);
    applic.onLocaleChanged = onLocaleChange;
  }

  onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(null),
      //home: new LoginPage(),
      theme: ThemeData(
        buttonColor: Color(0xff07426A),
        bottomAppBarColor: Color(0xff07426A),
        tabBarTheme: TabBarTheme(indicator:new BubbleTabIndicator(
          indicatorHeight: 25.0,
          indicatorColor: Color(0xff12D6F4),
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
            labelColor: Colors.white
        ),
        backgroundColor: Color(0xffeeeeee),
      ),
      localizationsDelegates: [
        _localeOverrideDelegate,
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: applic.supportedLocales(),
    );
  }
}



