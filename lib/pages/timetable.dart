import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';
// import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

final double toolbarHeight = 120.0;
Future<Day> futureDay;
double blocks_6 = 55;
int numoftiles;
Map timetable;
String b1;
String b2;
String b3;
String b4;
String b5;
String b6;
String b7;
String b8;
String b9;
String b10;
List<String> cachedtiles = ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
List cachedtime = ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-"];
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

class _TimetableState extends State<TimetablePage> {
  @override
  void initState() {
    super.initState();
    getIntValuesSF();
    selectNumTiles();
    futureDay = fetchDay();
    defaultsvals();
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.value_ = prefs.getInt('Value') ?? 11;
    });
  }

  blocktoprefrence(userinput) {
    if (userinput == 'B1') {
      return b1;
    } else if (userinput == 'B2') {
      return b2;
    } else if (userinput == 'B3') {
      return b3;
    } else if (userinput == 'B4') {
      return b4;
    } else if (userinput == 'B5') {
      return b5;
    } else if (userinput == 'B6') {
      return b6;
    } else if (userinput == 'B7') {
      return b7;
    } else if (userinput == 'B8') {
      return b8;
    } else if (userinput == 'B9') {
      return b9;
    } else if (userinput == 'B10') {
      return b10;
    } else {
      return userinput;
    }
  }

  defaultsvals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (globals.value_ == 11 || globals.value_ == 12) {
      setState(() {
        b1 = prefs.getString('B1') ?? "Block 1";
        b2 = prefs.getString('B2') ?? "Block 2";
        b3 = prefs.getString('B3') ?? "Block 3";
        b4 = prefs.getString('B4') ?? "Block 4";
        b5 = prefs.getString('B5') ?? "Block 5";
        b6 = prefs.getString('B6') ?? "Block 6";
      });
    } else {
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
        b10 = prefs.getString('B10') ?? "Block 10";
      });
    }
  }

  selectNumTiles() {
    if (globals.value_ == 12 || globals.value_ == 11) {
      numoftiles = 6;
    } else {
      numoftiles = 1;
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(150),
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
                                      fontSize: 45,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    )),
                              ]),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            child: FutureBuilder<Day>(
                              future: futureDay,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var result =
                                      ((snapshot.data.day1).toString());
                                  timetable = snapshot.data.timetable;
                                  globals.dayOrder = result;
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${showcorrectday(result)}',
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: 38,
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
                                      fontSize: 38,
                                      color: const Color(0xffbadfca),
                                      fontWeight: FontWeight.w200,
                                    ),
                                  );
                              },
                            ),
                          ),
                        ]),
                  )),
                  toolbarHeight: toolbarHeight,
                )),
            body: Container(
                child: FutureBuilder<Day>(
                    future: futureDay,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: numoftiles,
                            itemBuilder: (context, index) {
                              timetable = snapshot.data.timetable;
                              cachedtiles[index + 1] = blocktoprefrence(
                                  timetable[
                                      '${globals.value_}.${(index + 1)}']);
                              cachedtime[index + 1] = timetable[
                                  '${globals.value_}.${(index + 1)}_time'];
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 18.0, right: 18.0),
                                child: Card(
                                  elevation: 2.5,
                                  color: Color.fromRGBO(252, 252, 252, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27)),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                                child: Container(
                                              child: Text(
                                                blocktoprefrence(timetable[
                                                    '${globals.value_}.${(index + 1)}']),
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily:
                                                        "Protipo Compact"),
                                              ),
                                            ))
                                          ],
                                        ),
                                        trailing: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                timetable[
                                                    '${globals.value_}.${(index + 1)}_time'],
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ])),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            itemCount: numoftiles,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 18.0, right: 18.0),
                                child: Card(
                                  elevation: 2.5,
                                  color: Color.fromRGBO(252, 252, 252, 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27)),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                                child: Container(
                                              child: Text(
                                                cachedtiles[index + 1],
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w300,
                                                    fontFamily:
                                                        "Protipo Compact"),
                                              ),
                                            ))
                                          ],
                                        ),
                                        trailing: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                cachedtime[index + 1],
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ])),
                                  ),
                                ),
                              );
                            });
                      }
                    }))));
  }
}
