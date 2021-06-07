import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart';

class Home2Page extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: s6,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    CupertinoIcons.person_alt_circle,
                    size: s6,
                  ),
                ),
                Text(" Good " "Morning",
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: h9,
                      fontWeight: FontWeight.w300,
                    ))
              ],
            ),
            Column(
              children: [
                Text("Day 6",
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: h4,
                      fontWeight: FontWeight.w300,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
