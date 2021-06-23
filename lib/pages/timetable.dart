import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:schoolcalendar/pages/timetable_2.dart';
import 'package:schoolcalendar/pages/timetable_3.dart';
import 'package:schoolcalendar/pages/timetable_4.dart';
import 'package:schoolcalendar/pages/timetable_5.dart';
import 'package:schoolcalendar/pages/timetable_6.dart';
import '../api.dart';
import 'timetable_0.dart';
import 'timetable_1.dart';
import 'package:intl/intl.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

Future<Day>? futureDay;
late String daytoshow;
String? ordertoshow;

showcorrectday(result) {
  if (result == '7') {
    result = 'Break';
  } else if (result == '8') {
    result = 'Error';
  } else {
    result = "Day $result";
  }
  return result;
}

class _TimetableState extends State<TimetablePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    futureDay = fetchDay();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 7);
    _handleTabSelection();
    _tabController!.addListener(_handleTabSelection);
  }

  _handleTabSelection() {
    setState(() {
      if (_tabController!.index == 1) {
        ordertoshow = globals.day2;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 1)));
      } else {
        ordertoshow = globals.day1;
        daytoshow = DateFormat.EEEE().format(DateTime.now());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(170),
              child: AppBar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                // backgroundColor: Colors.black,
                elevation: 0,
                title: Container(
                    child: Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(daytoshow,
                                  style: TextStyle(
                                    fontSize: globals.h1,
                                    color: const Color(0xff9b8fb1),
                                    fontWeight: FontWeight.w300,
                                  )),
                            ]),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: FutureBuilder<Day>(
                                future: futureDay,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    globals.day1 =
                                        ((snapshot.data!.day1).toString());
                                    globals.day2 =
                                        ((snapshot.data!.day2).toString());
                                    globals.day3 =
                                        ((snapshot.data!.day3).toString());
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${showcorrectday(ordertoshow)}',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: globals.h2,
                                            color: const Color(0xffbadfca),
                                            fontWeight: FontWeight.w200,
                                          ),
                                        )
                                      ],
                                    );
                                  } else
                                    return Text(
                                      '${showcorrectday(ordertoshow)}',
                                      style: TextStyle(
                                        fontSize: globals.h2,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w200,
                                      ),
                                    );
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                )),
                toolbarHeight: 120.0,
                bottom: TabBar(
                  indicatorColor: const Color(0xffbadfca),
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text('Tomorrow',
                        style: TextStyle(
                          fontFamily: 'Protipo Compact',
                          fontSize: globals.h7,
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        )),
                    Text(
                      DateFormat.MMMEd().format(DateTime.now().add(new Duration(days: 2))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                     Text(
                      DateFormat.MMMEd().format(DateTime.now().add(new Duration(days: 3))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                     Text(
                      DateFormat.MMMEd().format(DateTime.now().add(new Duration(days: 4))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                     Text(
                      DateFormat.MMMEd().format(DateTime.now().add(new Duration(days: 5))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                     Text(
                      DateFormat.MMMEd().format(DateTime.now().add(new Duration(days: 6))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Timetable_0Page(),
                Timetable_1Page(),
                Timetable_2Page(),
                Timetable_3Page(),
                Timetable_4Page(),
                Timetable_5Page(),
                Timetable_6Page()
              ],
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
            )));
  }
}
