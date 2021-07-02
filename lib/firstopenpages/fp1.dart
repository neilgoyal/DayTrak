import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
import '../globals.dart' as globals;
import 'package:flare_flutter/flare_actor.dart';
import '../custom_colors.dart';
import '../authentication.dart';
import '../google_sign_in_button.dart';

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
    globals.s1 = width * 0.3;
    globals.s2 = width * 0.275;
    globals.s3 = width * 0.25;
    globals.s4 = width * 0.225;
    globals.s5 = width * 0.13;
    globals.w = width * 0.85;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                  // backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0,
                  title: Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                  )),
                  toolbarHeight: 50.0)),
          body: Column(
            children: [
              SizedBox(
                height: globals.h10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      // color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: globals.s5,
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 0.0,
                                left: globals.h5!,
                                right: globals.h5!),
                            child: Container(
                              child: Text(
                                'DayTrak is designed to help manage your school calendar in simple and easy way',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: globals.h6,
                                  // color: Colors.black54,
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
                height: globals.s5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: Authentication.initializeFirebase(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return GoogleSignInButton();
                      }
                      return CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
