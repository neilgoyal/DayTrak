import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:nima/nima.dart';
import 'package:nima/nima_actor.dart';

final double toolbarHeight = 50.0;
String _animationName = "idle";

class Fp1Page extends StatefulWidget {
  @override
  _Fp1State createState() => _Fp1State();
}

class _Fp1State extends State<Fp1Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                  backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                  elevation: 0,
                  title: Container(
                      child: Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 2.0, right: 2.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                  ),
                                  onPressed: () {
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Icon(
                                    CupertinoIcons.multiply,
                                    color: Colors.black54,
                                    size: globals.h4,
                                  ))
                            ],
                          )
                        ]),
                  )),
                  toolbarHeight: toolbarHeight)),
          body: Column(
            children: [
              SizedBox(
                height: globals.h5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: globals.s5,
              ),
              Column(
                
                  children: [
                    SizedBox(
                      width: globals.w,
                      height: 225,
                      child: Stack(children: <Widget>[
                        Positioned.fill(
                            child: NimaActor(
                          "assets/Hop.nima",
                          alignment: Alignment.centerRight,
                          fit: BoxFit.contain,
                          animation: _animationName,
                        ))
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
                    Container(
                      width: globals.w,
                      child: Text(
                        '- is designed to help manage your school calendar in simple and easy way',
                        style: TextStyle(
                          fontFamily: 'Protipo Compact',
                          fontSize: globals.h8,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.justify,
                        maxLines: 6,
                      ),
                    )
                  ]),
              SizedBox(
                height: globals.s1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                      },
                      child: Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.black54,
                        size: globals.h2,
                      ))
                ],
              ),
              // SizedBox(
              //   height: globals.h3,
              // ),
              Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // children: [
                  //   Text(
                  //     '.',
                  //     style: TextStyle(
                  //       fontFamily: 'Protipo Compact',
                  //       fontSize: globals.h1,
                  //       color: Colors.black54,
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //   ),
                  //   Text(
                  //     ' . .',
                  //     style: TextStyle(
                  //       fontFamily: 'Protipo Compact',
                  //       fontSize: globals.h1,
                  //       color: Colors.black26,
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //   ),
                  // ],
                  )
            ],
          ),
        ));
  }
}
