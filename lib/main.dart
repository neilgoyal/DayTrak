import 'package:flutter/material.dart';
import 'package:schoolcalendar/pages/tabBar.dart';
import 'Provider/theme_provider.dart';
import 'firstopenpages/fp1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

Future checkFirstSeen(context) async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  if (FirebaseAuth.instance.currentUser != null) {
    Navigator.pushReplacementNamed(context, "/main");
  } else {
    Navigator.pushReplacementNamed(context, "/first");
  }
  return firebaseApp;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      title: 'DayTrak',
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
    checkFirstSeen(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
