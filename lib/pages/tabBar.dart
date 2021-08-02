import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'home.dart';
import 'timeTable.dart';
import 'addTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double lenght = MediaQuery.of(context).size.height;
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
    globals.s6 = width * 0.15;
    globals.s7 = width * 0.17;
    globals.w = width * 0.85;
    globals.l4 = lenght * 0.21;
    globals.l5 = lenght * 0.08;
    globals.lc = lenght * 0.41;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: [
            Home2Page(globals.thirdlangsc.stream),
            Timetable2Page(globals.thirdlangsc.stream),
            Addtask2Page()
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  CupertinoIcons.house,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.calendar_today,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.list_bullet,
                  size: 35,
                ),
              ),
            ],
            unselectedLabelColor: Color.fromRGBO(150, 150, 150, 1),
            indicatorColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
