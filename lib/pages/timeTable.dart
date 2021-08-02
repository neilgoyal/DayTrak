import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/Provider/theme_provider.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:schoolcalendar/pages/settings.dart';
import 'package:schoolcalendar/DataBase/api.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:schoolcalendar/pages/home.dart';

selectNumTiles() {
  numoftiles = 6;
}

class Timetable2Page extends StatefulWidget {
  Timetable2Page(this.stream);
  final Stream<int> stream;
  @override
  _Timetable2State createState() => _Timetable2State();
}

Future<Day>? futureDay;
Future<Timetable>? futureTimetable;
late String daytoshow;
String? ordertoshow;

int? numoftiles;
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

class _Timetable2State extends State<Timetable2Page>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    futureDay = fetchDay();
    futureTimetable = timetable();
    selectNumTiles();
    defaultsvals();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 7);
    _handleTabSelection();
    _tabController!.addListener(_handleTabSelection);
    widget.stream.listen((index) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  dayAdjust(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return new MyModalContent(globals.thirdlangsc.stream);
        });
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
              if (gloabls[dayord] == "7" || gloabls[dayord] == "8") {
                return Container(
                    padding:
                        EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                              shadowColor: Color.fromRGBO(61, 195, 252, 1),
                              elevation: 7.5,
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
                                          (gloabls[dayord] == "7")
                                              ? 'No School'
                                              : "Error",
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
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    timetable_0 = snapshot.data!.timetable_0;
                    timetable_1 = snapshot.data!.timetable_1;
                    timetable_2 = snapshot.data!.timetable_2;
                    timetable_3 = snapshot.data!.timetable_3;
                    timetable_4 = snapshot.data!.timetable_4;
                    timetable_5 = snapshot.data!.timetable_5;
                    timetable_6 = snapshot.data!.timetable_6;
                  }
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

class MyModalContent extends StatefulWidget {
  MyModalContent(this.stream);
  final Stream<int> stream;
  @override
  _MyModalContentState createState() => new _MyModalContentState();
}

class _MyModalContentState extends State<MyModalContent> {
  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myController.text = prefs.getString('B1') ?? "";
      myController2.text = prefs.getString('B2') ?? "";
      myController3.text = prefs.getString('B3') ?? "";
      myController4.text = prefs.getString('B4') ?? "";
      myController5.text = prefs.getString('B5') ?? "";
      myController6.text = prefs.getString('B6') ?? "";
      myController7.text = prefs.getString('B7') ?? "";
      myController8.text = prefs.getString('B8') ?? "";
      myController9.text = prefs.getString('B9') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    defaultsvals();
    widget.stream.listen((index) {
      futureTimetable = timetable();
      setState(() {
        selectNumTiles();
        defaultsvals();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Padding(
            padding: EdgeInsets.fromLTRB(4, 17, 0, 4),
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                    child: Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 0.0, left: 25.0, right: 25.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Customize',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h2,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Choose Grade',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: globals.h4,
                                            fontWeight: FontWeight.w300,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                      child: Center(
                                          child: Column(children: <Widget>[
                                    InputDecorator(
                                        decoration: InputDecoration(
                                          labelText: 'Select Grade',
                                          labelStyle: Theme.of(context)
                                              .primaryTextTheme
                                              .caption!
                                              .copyWith(color: Colors.black),
                                          border: const OutlineInputBorder(
                                              gapPadding: 0,
                                              borderSide:
                                                  const BorderSide(width: 1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(25.0))),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                            child: Listener(
                                          onPointerDown: (_) =>
                                              FocusScope.of(context).unfocus(),
                                          child: DropdownButton(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontSize: globals.h9,
                                                fontFamily: 'Protipo Compact'),
                                            elevation: 1,
                                            isExpanded: false,
                                            isDense: true,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            value: globals.valueOfGrade,
                                            items: [
                                              DropdownMenuItem(
                                                  child: Text("6A"), value: 61),
                                              DropdownMenuItem(
                                                  child: Text("6B"), value: 62),
                                              DropdownMenuItem(
                                                  child: Text("7A"), value: 71),
                                              DropdownMenuItem(
                                                  child: Text("7B"), value: 72),
                                              DropdownMenuItem(
                                                  child: Text("8A"), value: 81),
                                              DropdownMenuItem(
                                                  child: Text("8B"), value: 82),
                                              DropdownMenuItem(
                                                  child: Text("8C"), value: 83),
                                              DropdownMenuItem(
                                                  child: Text("9A"), value: 91),
                                              DropdownMenuItem(
                                                  child: Text("9B"), value: 92),
                                              DropdownMenuItem(
                                                  child: Text("9C"), value: 93),
                                              DropdownMenuItem(
                                                  child: Text("10A"),
                                                  value: 101),
                                              DropdownMenuItem(
                                                  child: Text("10B"),
                                                  value: 102),
                                              DropdownMenuItem(
                                                  child: Text("11"), value: 11),
                                              DropdownMenuItem(
                                                  child: Text("12"), value: 12),
                                            ],
                                            onChanged: (dynamic value) {
                                              setState(() {
                                                timetable_0 = {};
                                                timetable_1 = {};
                                                timetable_2 = {};
                                                timetable_3 = {};
                                                timetable_4 = {};
                                                timetable_5 = {};
                                                timetable_6 = {};
                                                timetablePers = {};
                                                globals.valueOfGrade = value;
                                                addIntToSF(value);
                                              });
                                              globals.thirdlangsc.add(1);
                                            },
                                          ),
                                        ))),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Add subjects',
                                            style: TextStyle(
                                              fontFamily: 'Protipo Compact',
                                              fontSize: globals.h4,
                                              fontWeight: FontWeight.w300,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        if (globals.valueOfGrade == 11)
                                          grade11(context, true)
                                        else if (globals.valueOfGrade == 12)
                                          grade12(context, true)
                                        else if (globals.valueOfGrade == 91 ||
                                            globals.valueOfGrade == 92 ||
                                            globals.valueOfGrade == 93 ||
                                            globals.valueOfGrade == 101 ||
                                            globals.valueOfGrade == 102)
                                          grade9and10(context, true)
                                        else if (globals.valueOfGrade == 61 ||
                                            globals.valueOfGrade == 62 ||
                                            globals.valueOfGrade == 71 ||
                                            globals.valueOfGrade == 72)
                                          grade6and7(context, true)
                                        else if (globals.valueOfGrade == 81 ||
                                            globals.valueOfGrade == 82 ||
                                            globals.valueOfGrade == 83)
                                          grade8(context, true)
                                      ],
                                    ),
                                  ]))),
                                ])))))));
  }
}
