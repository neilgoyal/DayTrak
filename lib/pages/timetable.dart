import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

final double toolbarHeight = 100.0;
var dt = DateTime.now();
String newDay = Jiffy(dt).format("EEEE");
String newDay1 = Jiffy(dt).format("do");

class _TimetableState extends State<TimetablePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(190),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              newDay + ' ' + newDay1,
                              style: TextStyle(
                                fontSize: 40,
                                color: const Color(0xff9b8fb1),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ])
                    ]),
                toolbarHeight: toolbarHeight,
              )),
        ));
  }
}
