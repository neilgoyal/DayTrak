import 'package:flutter/material.dart';
import 'package:schoolcalendar/pages/home.dart';
import 'Provider/theme_provider.dart';
import 'firstopenpages/fp1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
        '/main': (context) => HomePage(),
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
    // ignore: unused_local_variable
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
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
