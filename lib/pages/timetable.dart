import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';
import 'timetable_today.dart';
import 'timetable_tom.dart';
import 'package:extended_tabs/extended_tabs.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

Future<Day> futureDay;

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
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    futureDay = fetchDay();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(170),
              child: AppBar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 1),
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
                              Text(globals.newDt1,
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
                                    var result =
                                        ((snapshot.data.day1).toString());
                                    var result2 =
                                        ((snapshot.data.day2).toString());
                                    globals.dayOrder = result;
                                    globals.nextDay = result2;
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${showcorrectday(result)}',
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
                                      '${showcorrectday(globals.dayOrder)}',
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
                  ],
                ),
              ),
            ),
            body: ExtendedTabBarView(
              children: <Widget>[TimetabletodayPage(), TimetabletomPage()],
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              cacheExtent: 1,
            )));
  }
}
