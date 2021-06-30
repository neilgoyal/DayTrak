import 'package:flutter/material.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';
import 'Provider/theme_provider.dart';
import 'firstopenpages/fp1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      title: 'School planner',
      initialRoute: '/',
      routes: {
        '/first': (context) => Fp1Page(),
        '/main': (context) => Fp1Page(),
        '/main1': (context) => Home2Page(),
        '/fp2': (context) => Fp2Page()
      },
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    checkFirstSeen();
    super.initState();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.pushReplacementNamed(context, "/main");
    } else {
      Navigator.pushReplacementNamed(context, "/first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(),
      ),
    );
  }
}
