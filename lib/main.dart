import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School planner',
      initialRoute: '/',
      routes: {
        '/first': (context) => SignInScreen(),
        // '/main': (context) => Fp1Page(),
        '/main': (context) => HomePage()
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
