import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
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

class Timetable2Page extends StatefulWidget {
  @override
  _Timetable2State createState() => _Timetable2State();
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

class _Timetable2State extends State<Timetable2Page>
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
      } else if (_tabController!.index == 2) {
        ordertoshow = globals.day3;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 2)));
      } else if (_tabController!.index == 3) {
        ordertoshow = globals.day4;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 3)));
      } else if (_tabController!.index == 4) {
        ordertoshow = globals.day5;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 4)));
      } else if (_tabController!.index == 5) {
        ordertoshow = globals.day6;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 5)));
      } else if (_tabController!.index == 6) {
        ordertoshow = globals.day7;
        daytoshow = DateFormat.EEEE()
            .format((DateTime.now()).add(const Duration(days: 6)));
      } else if (_tabController!.index == 0) {
        ordertoshow = globals.day1;
        daytoshow = DateFormat.EEEE().format((DateTime.now()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130),
              child: AppBar(
                // backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                // backgroundColor: Colors.black,
                elevation: 0,
                title: Container(
                    child: Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       // Text(daytoshow,
                        //       //     style: TextStyle(
                        //       //       fontSize: globals.h1,
                        //       //       color: const Color(0xff9b8fb1),
                        //       //       fontWeight: FontWeight.w300,
                        //       //     )),
                        //     ]),
                        // SizedBox(
                        //   height: 6,
                        // ),
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
                                    globals.day4 =
                                        ((snapshot.data!.day4).toString());
                                    globals.day5 =
                                        ((snapshot.data!.day5).toString());
                                    globals.day6 =
                                        ((snapshot.data!.day6).toString());
                                    globals.day7 =
                                        ((snapshot.data!.day7).toString());

                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${showcorrectday(ordertoshow)}',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: globals.h2,
                                            // color: Colors.black54,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        )
                                      ],
                                    );
                                  } else
                                    return Text(
                                      '${showcorrectday(ordertoshow)}',
                                      style: TextStyle(
                                        fontSize: globals.h2,
                                        // color: Colors.black54,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    );
                                },
                              ),
                            ),
                          ],
                        ),
                      ]),
                )),
                toolbarHeight: 100.0,
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Color.fromRGBO(201, 248, 86, 0.8),
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text('Tomorrow',
                        style: TextStyle(
                          fontFamily: 'Protipo Compact',
                          fontSize: globals.h6,
                          // color: Colors.black54,
                          fontWeight: FontWeight.w300,
                        )),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 2))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 3))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 4))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 5))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 6))),
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h6,
                        // color: Colors.black54,
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
