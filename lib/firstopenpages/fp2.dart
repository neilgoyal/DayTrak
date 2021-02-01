import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;

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
                          ]),)
                          ), toolbarHeight: toolbarHeight
                          ))));
  }
}