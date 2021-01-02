import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  newDt,
                  style: TextStyle(
                    fontFamily: 'Protipo Compact',
                    fontSize: 40,
                    color: const Color(0xff9b8fb1),
                    fontWeight: FontWeight.w100,
                  ),
                ),
                Text("Day 1",
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: 40,
                      color: const Color(0xff9b8fb1),
                      fontWeight: FontWeight.w100,
                    ))
              ],
            )));
  }
}
