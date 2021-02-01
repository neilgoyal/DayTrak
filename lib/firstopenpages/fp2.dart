import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/firstopenpages/settingsfp.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:schoolcalendar/pages/settings.dart';

final double toolbarHeight = 50.0;

class Fp2Page extends StatefulWidget {
  @override
  _Fp2State createState() => _Fp2State();
}

class _Fp2State extends State<Fp2Page> {
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  onPressed: () {},
                                  child: Icon(
                                    CupertinoIcons.chevron_back,
                                    color: Colors.black54,
                                    size: globals.h4,
                                  ))
                            ],
                          ),
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
                                  onPressed: () {},
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
                    'Add Your Blocks',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              
              Row(children: [
                Expanded(child: 
                SizedBox(
                    width: globals.w,
                    height: 450,
                    child: PageView(
                      children: <Widget>[
                        SettingsfpPage()
                      ],
                    ))
              )]),
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
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.chevron_forward,
                        color: Colors.black54,
                        size: globals.h2,
                      ))
                ],
              ),
              SizedBox(
                height: globals.h3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '.',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      color: Colors.black26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    ' .',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    ' .',
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: globals.h1,
                      color: Colors.black26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
