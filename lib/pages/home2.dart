import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
import 'package:schoolcalendar/globals.dart';
import 'package:schoolcalendar/pages/timetable.dart';

class Home2Page extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2Page> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: s7,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {},
                          padding: EdgeInsets.only(
                            top: 0.0,
                            left: 0.0,
                            right: 0.0,
                            bottom: 25,
                          ),
                          icon: Icon(
                            CupertinoIcons.person_alt_circle,
                            // color: Colors.pink,
                            size: s6,
                          ))
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("   Good " '${greeting()},',
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              fontSize: h9,
                              fontWeight: FontWeight.w300,
                            )),
                        Text("   Neil",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              fontSize: h9,
                              fontWeight: FontWeight.w300,
                            )),
                      ]),
                ],
              ),
              Column(
                children: [
                  Text('${showcorrectday(day1)}',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: h4,
                        fontWeight: FontWeight.w300,
                      )),
                  Text(DateFormat.MMMEd().format(DateTime.now()),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: h10,
                        fontWeight: FontWeight.w300,
                      )),
                ],
              )
            ],
          ),
        ),
        body: ListView(padding: EdgeInsets.all(10.0), children: [
          SizedBox(
            height: s5,
          ),
          Text("Upcoming Classes:",
              style: TextStyle(
                  fontSize: h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: h4,
          ),
          Card(
              elevation: 39,
              color: Color.fromRGBO(201, 248, 86, 0.8),
              // color: Colors.transparent,
              shadowColor: Color.fromRGBO(201, 254, 86, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "hellp grwfgmreofgnorengoraengoarengoirengove",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Protipo Compact",
                      fontWeight: FontWeight.w200),
                ),
              )),
          SizedBox(
            height: h1,
          ),
          Text("Tasks:",
              style: TextStyle(
                  fontSize: h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: h4,
          ),
          Card(
              elevation: 28,
              color: Color.fromRGBO(61, 195, 242, 0.8),
              shadowColor: Color.fromRGBO(61, 195, 252, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "hefiejnwfoewnceiuc ifnewunewiufneiwfniefewfewawnf",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Protipo Compact",
                      fontWeight: FontWeight.w200),
                ),
              )),
          SizedBox(
            height: h2,
          ),
        ]));
  }
}
