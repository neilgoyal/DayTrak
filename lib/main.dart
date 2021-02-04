import 'package:flutter/material.dart';
import 'package:schoolcalendar/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {'/first': (context) => Fp1Page(), '/s': (context) => HomePage()},
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
      Navigator.pushReplacementNamed(context, "/s");
    } else {
      prefs.setBool('seen', true);
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
