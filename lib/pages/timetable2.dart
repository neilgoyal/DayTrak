import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolcalendar/api.dart';
import 'package:intl/intl.dart';

class Timetable2Page extends StatefulWidget {
  @override
  _Timetable2State createState() => _Timetable2State();
}

Future<Day>? futureDay;
late String daytoshow;
String? ordertoshow;
Future<Timetable>? futureTimetable;
int? numoftiles;
String? b1, b2, b3, b4, b5, b6, b7, b8, b9;
List gloabls = [
  globals.day1,
  globals.day2,
  globals.day3,
  globals.day4,
  globals.day5,
  globals.day6,
  globals.day7,
];
Map? timetable_0 = {},
    timetable_1 = {},
    timetable_2 = {},
    timetable_3 = {},
    timetable_4 = {},
    timetable_5 = {},
    timetable_6 = {};

dayAdjust(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      isScrollControlled: false,
      context: context,
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60), color: Colors.white),
            child: Padding(
                padding: EdgeInsets.fromLTRB(4, 20, 0, 4), child: Fp2Page()));
      });
}

class _Timetable2State extends State<Timetable2Page>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    getIntValuesSF();
    futureDay = fetchDay();
    futureTimetable = timetable();
    selectNumTiles();
    defaultsvals();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 7);
    _handleTabSelection();
    _tabController!.addListener(_handleTabSelection);
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.valueOfGrade = prefs.getInt('Value') ?? 11;
    });
  }

  blocktoprefrence(userinput) {
    if (userinput == 'B1') {
      return (b1 == "Block 1") ? b1 : "B1 $b1";
    } else if (userinput == 'B2') {
      return (b2 == "Block 2") ? b2 : "B2 $b2";
    } else if (userinput == 'B3') {
      return (b3 == "Block 3") ? b3 : "B3 $b3";
    } else if (userinput == 'B4') {
      return (b4 == "Block 4") ? b4 : "B4 $b4";
    } else if (userinput == 'B5') {
      return (b5 == "Block 5") ? b5 : "B5 $b5";
    } else if (userinput == 'B6') {
      return (b6 == "Block 6") ? b6 : "B6 $b6";
    } else if (userinput == 'B7') {
      return (b7 == "Block 7") ? b7 : "B7 $b7";
    } else if (userinput == 'B8') {
      return (b8 == "Block 8") ? b8 : "B8 $b8";
    } else if (userinput == 'B9') {
      return (b9 == "Block 9") ? b9 : "B9 $b9";
    } else {
      return userinput;
    }
  }

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (globals.valueOfGrade == 11 || globals.valueOfGrade == 12) {
      setState(() {
        b1 = prefs.getString('B1') ?? "Block 1";
        b2 = prefs.getString('B2') ?? "Block 2";
        b3 = prefs.getString('B3') ?? "Block 3";
        b4 = prefs.getString('B4') ?? "Block 4";
        b5 = prefs.getString('B5') ?? "Block 5";
        b6 = prefs.getString('B6') ?? "Block 6";
      });
    } else if (globals.valueOfGrade == 91 || globals.valueOfGrade == 92) {
      setState(() {
        b1 = prefs.getString('B1') ?? "Block 1";
        b2 = prefs.getString('B2') ?? "Block 2";
        b3 = prefs.getString('B3') ?? "Block 3";
        b4 = prefs.getString('B4') ?? "Block 4";
        b5 = prefs.getString('B5') ?? "Block 5";
        b6 = prefs.getString('B6') ?? "Block 6";
        b7 = prefs.getString('B7') ?? "Block 7";
        b8 = prefs.getString('B8') ?? "Block 8";
        b9 = prefs.getString('B9') ?? "Block 9";
      });
    }
  }

  selectNumTiles() {
    if (globals.valueOfGrade == 11 ||
        globals.valueOfGrade == 91 ||
        globals.valueOfGrade == 92) {
      numoftiles = 6;
    } else {
      numoftiles = 0;
    }
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

  buildTimetable(dayord) {
    return Container(
        child: FutureBuilder<Timetable>(
            future: futureTimetable,
            builder: (context, snapshot) {
              if (gloabls[dayord] == "7") {
                return Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              elevation: 4,
                              color: Color.fromRGBO(252, 252, 252, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'No School',
                                          style: TextStyle(
                                              fontSize: globals.h3,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ]));
              }
              if (gloabls[dayord] == "8") {
                return Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              elevation: 4,
                              color: Color.fromRGBO(252, 252, 252, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(27)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'Error',
                                          style: TextStyle(
                                              fontSize: globals.h3,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Protipo Compact"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ]));
              } else {
                if (snapshot.hasData) {
                  timetable_0 = snapshot.data!.timetable_0;
                  timetable_1 = snapshot.data!.timetable_1;
                  timetable_2 = snapshot.data!.timetable_2;
                  timetable_3 = snapshot.data!.timetable_3;
                  timetable_4 = snapshot.data!.timetable_4;
                  timetable_5 = snapshot.data!.timetable_5;
                  timetable_6 = snapshot.data!.timetable_6;
                }
                List titables = [
                  timetable_0,
                  timetable_1,
                  timetable_2,
                  timetable_3,
                  timetable_4,
                  timetable_5,
                  timetable_6
                ];
                return ListView.builder(
                    itemCount: numoftiles,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 18.0, right: 18.0),
                        child: Card(
                          shadowColor: Color.fromRGBO(61, 195, 252, 1),
                          elevation: 7.5,
                          color: Color.fromRGBO(252, 252, 252, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27)),
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                      child: Text(
                                        (titables[dayord]!.isNotEmpty)
                                            ? blocktoprefrence(titables[
                                                    dayord]![
                                                '${globals.valueOfGrade}.${(index + 1)}'])
                                            : "-",
                                        style: TextStyle(
                                            fontSize: globals.h4,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Protipo Compact"),
                                      ),
                                    ))
                                  ],
                                ),
                                trailing: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (titables[dayord]!.isNotEmpty)
                                            ? titables[dayord]![
                                                '${globals.valueOfGrade}.${(index + 1)}_time']
                                            : "-",
                                      )
                                    ])),
                          ),
                        ),
                      );
                    });
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130),
              child: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        dayAdjust(context);
                      },
                      icon: Icon(CupertinoIcons.ellipsis))
                ],
                elevation: 0,
                title: Container(
                    child: Padding(
                  padding: EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                  }
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${showcorrectday(ordertoshow)}',
                                        style: TextStyle(
                                          fontSize: globals.h2,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )
                                    ],
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
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text('Tomorrow',
                        style: TextStyle(
                          fontSize: globals.h6,
                          fontWeight: FontWeight.w300,
                        )),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 2))),
                      style: TextStyle(
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 3))),
                      style: TextStyle(
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 4))),
                      style: TextStyle(
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 5))),
                      style: TextStyle(
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      DateFormat.MMMEd()
                          .format(DateTime.now().add(new Duration(days: 6))),
                      style: TextStyle(
                        fontSize: globals.h6,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                buildTimetable(0),
                buildTimetable(1),
                buildTimetable(2),
                buildTimetable(3),
                buildTimetable(4),
                buildTimetable(5),
                buildTimetable(6)
              ],
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
            )));
  }
}
