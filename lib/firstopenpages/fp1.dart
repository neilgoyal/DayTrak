import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:flare_flutter/flare_actor.dart';
import 'package:schoolcalendar/pages/tabBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fp2.dart';
import 'SignIn.dart';
import 'SignUp.dart';

class Fp1Page extends StatefulWidget {
  @override
  _Fp1State createState() => _Fp1State();
}

class _Fp1State extends State<Fp1Page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    globals.h1 = width * 0.115;
    globals.h2 = width * 0.1;
    globals.h3 = width * 0.09;
    globals.h4 = width * 0.079;
    globals.h5 = width * 0.069;
    globals.h6 = width * 0.065;
    globals.h7 = width * 0.06;
    globals.h8 = width * 0.055;
    globals.h9 = width * 0.05;
    globals.h10 = width * 0.045;
    globals.s2 = width * 0.275;
    globals.s4 = width * 0.225;
    globals.s5 = width * 0.13;
    globals.w = width * 0.85;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                  elevation: 0, title: Container(), toolbarHeight: 50.0)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(children: [
                  SizedBox(
                    width: globals.w,
                    height: 225,
                    child: Stack(children: <Widget>[
                      Positioned.fill(
                        child: FlareActor("assets/connection.flr",
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            animation: "conn"),
                      )
                    ]),
                  ),
                ]),
                SizedBox(
                  height: globals.s5,
                ),
                Row(children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: globals.h5!, right: globals.h5!),
                          child: Container(
                            child: Text(
                              'DayTrak is designed to help you manage your school calendar in a simple and easy way.',
                              style: TextStyle(
                                fontFamily: 'Protipo Compact',
                                fontSize: globals.h6,
                                fontWeight: FontWeight.w300,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              maxLines: 6,
                            ),
                          )))
                ]),
                SizedBox(
                  height: globals.h10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: Colors.transparent,
                      shadowColor: Colors.black,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        // color: Color.fromRGBO(245, 245, 245, 1),
                        color: Colors.black,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        CupertinoIcons.hare,
                                        size: globals.h4,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Sign In",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: globals.h5,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ]))))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      primary: Colors.transparent,
                      shadowColor: Colors.black,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35)),
                        // color: Color.fromRGBO(245, 245, 245, 1),
                        color: Colors.black,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        CupertinoIcons.scope,
                                        size: globals.h4,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Sign Up",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: globals.h5,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ])))))
              ],
            ),
          ),
        ));
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Fp2Page(globals.thirdlangsc.stream),
        ),
      );
    }
  }
}
