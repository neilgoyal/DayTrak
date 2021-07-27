import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import 'package:schoolcalendar/api.dart';
import 'package:schoolcalendar/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolcalendar/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home2Page extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

Future<Day>? futureDay;
Future<Map<String, dynamic>>? futureTimetablepers;
late Map<String, dynamic>? timetablePers = {};
String? b1, b2, b3, b4, b5, b6, b7, b8, b9;
int buffer = 0;
String uname = "DayTrak User", uname2 = "DayTrak User";

class _Home2State extends State<Home2Page> {
  String greeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  bool _isSigningOut = false;
  Future<User>? usersetup;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Fp1Page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Widget signOut() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                  height: globals.l4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You are now signed in as ',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: globals.h9,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 6,
                              ),
                            ]),
                        SizedBox(
                          height: globals.h8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<User>(
                                future: usersetup,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    uname = '${snapshot.data!.displayName}';
                                  }
                                  return Text(uname,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h9,
                                        fontWeight: FontWeight.w300,
                                      ));
                                })
                          ],
                        ),
                        SizedBox(
                          height: globals.h7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _isSigningOut
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.deepOrange[400],
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _isSigningOut = true;
                                      });
                                      await Authentication.signOut(
                                          context: context);
                                      setState(() {
                                        _isSigningOut = false;
                                      });
                                      Navigator.of(context).pushReplacement(
                                          _routeToSignInScreen());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Text(
                                        'Sign Out',
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: globals.h7,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        )
                      ])));
        });
    return Container();
  }

  Widget days() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 150,
              child: FutureBuilder<Day>(
                  future: futureDay,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      globals.day1 = ((snapshot.data!.day1).toString());
                      globals.day2 = ((snapshot.data!.day2).toString());
                      globals.day3 = ((snapshot.data!.day3).toString());
                      globals.day4 = ((snapshot.data!.day4).toString());
                      globals.day5 = ((snapshot.data!.day5).toString());
                      globals.day6 = ((snapshot.data!.day6).toString());
                      globals.day7 = ((snapshot.data!.day7).toString());
                    }
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day1)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tomorrow:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day2)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day After:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day3)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          );
        });
    return Container();
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.valueOfGrade = prefs.getInt('Value') ?? 11;
    });
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

  @override
  void initState() {
    super.initState();
    usersetup = initializeFirebase();
    getIntValuesSF();
    futureDay = fetchDay();
    futureTimetablepers = personalizedTT();
    defaultsvals();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<User> initializeFirebase() async {
    User user = FirebaseAuth.instance.currentUser!;
    return user;
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

  concisedate(date, time) {
    String concisedate = "";
    String concisetime = "";
    Color late = Colors.black45;
    if (date == "No Date") {
      return [concisedate, concisetime, late];
    }
    DateTime fulldate =
        DateFormat('yyyy-MM-dd kk:mm:a', 'en_US').parseLoose('$date $time');
    if (fulldate.compareTo(DateTime.now()) < 0) {
      late = Colors.red;
    } else if (date == DateFormat('yyyy-MM-dd').format(DateTime.now())) {
      concisedate = 'Today';
    } else if (date ==
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(Duration(days: 1)))) {
      concisedate = 'Tomorrow';
    } else {
      concisedate = DateFormat('E, d MMM').format(DateTime.parse(date));
    }
    if (concisetime != "No Time") {
      concisetime = time;
    }
    return [concisedate, concisetime, late];
  }

  perstimetable() {
    return Container(
        child: FutureBuilder<Map<String, dynamic>>(
            future: futureTimetablepers,
            builder: (context, snapshot) {
              if (globals.day1 == "7") {
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
              if (globals.day1 == "8") {
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
                  timetablePers = snapshot.data;
                  while (timetablePers![
                          '${globals.valueOfGrade}.${(buffer + 1)}'] ==
                      null) {
                    buffer = buffer + 1;
                  }
                }
                return ListView.builder(
                    itemCount: timetablePers!.length ~/ 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 18.0, right: 18.0),
                        child: Card(
                          elevation: 7.5,
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
                                        (timetablePers!.isNotEmpty)
                                            ? blocktoprefrence(timetablePers![
                                                '${globals.valueOfGrade}.${(index + buffer + 1)}'])
                                            : "-",
                                        style: TextStyle(
                                            fontSize: globals.h4,
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
                                        (timetablePers!.isNotEmpty)
                                            ? timetablePers![
                                                '${globals.valueOfGrade}.${(index + buffer + 1)}_time']
                                            : "-",
                                        style: TextStyle(color: Colors.grey),
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
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: globals.s7,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 0.0, left: 0.0, right: 9.0),
                          child: Material(
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              child: FutureBuilder<User>(
                                  future: usersetup,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      User? user = snapshot.data;
                                      return Ink.image(
                                        image: NetworkImage(user!.photoURL!),
                                        fit: BoxFit.cover,
                                        width: globals.s5,
                                        height: globals.s5,
                                        child: InkWell(
                                          onTap: () {
                                            signOut();
                                          },
                                        ),
                                      );
                                    } else {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          padding: EdgeInsets.all(4),
                                          primary: Colors.transparent,
                                          onSurface: Colors.transparent,
                                        ),
                                        child: Icon(
                                          CupertinoIcons.person_alt_circle,
                                          color: Colors.grey[500],
                                          size: globals.s6,
                                        ),
                                        onPressed: () {
                                          signOut();
                                        },
                                      );
                                    }
                                  })))
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good " '${greeting()},',
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              fontSize: globals.h9,
                              fontWeight: FontWeight.w300,
                            )),
                        FutureBuilder<User>(
                            future: usersetup,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                uname2 = snapshot.data!.displayName
                                    .toString()
                                    .split(" ")[0];
                              }
                              return Text(uname2,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Protipo Compact',
                                    fontSize: globals.h9,
                                    fontWeight: FontWeight.w300,
                                  ));
                            })
                      ]),
                ],
              ),
              Column(
                children: [
                  FutureBuilder<Day>(
                      future: futureDay,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          globals.day1 = ((snapshot.data!.day1).toString());
                          globals.day2 = ((snapshot.data!.day2).toString());
                          globals.day3 = ((snapshot.data!.day3).toString());
                          globals.day4 = ((snapshot.data!.day4).toString());
                          globals.day5 = ((snapshot.data!.day5).toString());
                          globals.day6 = ((snapshot.data!.day6).toString());
                          globals.day7 = ((snapshot.data!.day7).toString());
                        }
                        return ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.only(
                                    top: 0.0, left: 0.0, right: 0.0),
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onLongPress: () {
                            days();
                            HapticFeedback.heavyImpact();
                          },
                          onPressed: () {},
                          child: Text(
                            '${showcorrectday(globals.day1)}',
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              color: Colors.black,
                              fontSize: globals.h4,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        );
                      }),
                  Text(DateFormat.MMMEd().format(DateTime.now()),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: globals.h10,
                        fontWeight: FontWeight.w300,
                      )),
                ],
              )
            ],
          ),
        ),
        body: ListView(padding: EdgeInsets.all(13.0), children: [
          SizedBox(
            height: globals.h5,
          ),
          Text("Upcoming Classes:",
              style: TextStyle(
                  fontSize: globals.h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: globals.h4,
          ),
          Card(
              elevation: 39,
              color: Color.fromRGBO(201, 248, 86, 0.8),
              shadowColor: Color.fromRGBO(201, 254, 86, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                  height: 350,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: perstimetable())),
          SizedBox(
            height: globals.h1,
          ),
          Text("Tasks:",
              style: TextStyle(
                  fontSize: globals.h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: globals.h4,
          ),
          Card(
              elevation: 28,
              color: Color.fromRGBO(61, 195, 242, 0.8),
              shadowColor: Color.fromRGBO(61, 195, 252, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)),
              child: Container(
                  margin: EdgeInsets.all(10),
                  height: 400,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: DatabaseService.readItems(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        if (snapshot.data!.docs.isEmpty) {
                          return Container(
                              padding: EdgeInsets.only(
                                  top: 30.0, left: 12.0, right: 12.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "You're all done!  ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Protipo Compact",
                                          fontSize: globals.h4,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Icon(
                                      CupertinoIcons.smiley,
                                      size: globals.h4,
                                      color: Colors.black54,
                                    )
                                  ]));
                        } else
                          return ListView.separated(
                            padding: EdgeInsets.fromLTRB(5, 12, 5, 5),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16.0),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var tasks = snapshot.data!.docs[index];
                              String title = tasks['title'];
                              String description =
                                  concisedate(tasks['date'], tasks['time'])[0];
                              String description2 =
                                  concisedate(tasks['date'], tasks['time'])[1];
                              return Card(
                                shadowColor: Colors.blue,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  title: Text(
                                    title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    "$description $description2",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                          );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.orange,
                          ),
                        ),
                      );
                    },
                  ))),
          SizedBox(
            height: globals.h2,
          ),
        ]));
  }
}
