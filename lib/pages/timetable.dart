import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';
import 'timetable_today.dart';
import 'timetable_tom.dart';
import 'package:intl/intl.dart';

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
                              Text(DateFormat.EEEE().format(DateTime.now()),
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
                                    (snapshot.data.day1 != null)
                                        ? globals.dayOrder =
                                            ((snapshot.data.day1).toString())
                                        : globals.dayOrder = "-";
                                    globals.nextDay =
                                        ((snapshot.data.day2).toString());
                                    globals.dayAfter =
                                        ((snapshot.data.day3).toString());
                                    globals.timetable = snapshot.data.timetable;
                                    globals.timetabletom =
                                        snapshot.data.timetabletom;
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${showcorrectday(globals.dayOrder)}',
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
                                    print(showcorrectday(globals.dayOrder));
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
            body: TabBarView(
              children: <Widget>[TimetabletodayPage(), TimetabletomPage()],
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
            )));
  }
}
