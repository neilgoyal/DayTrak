import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:schoolcalendar/DataBase/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:schoolcalendar/DataBase/database.dart';
import 'package:schoolcalendar/authentication.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';

class Home2Page extends StatefulWidget {
  Home2Page(this.stream);
  final Stream<int> stream;
  @override
  _Home2State createState() => _Home2State();
}

Future<Day>? futureDay;
Future<Map<String, dynamic>>? futureTimetablepers;
late Map<String, dynamic>? timetablePers = {};

int buffer = 0;
String uname = "DayTrak User", uname2 = "DayTrak User";

class _Home2State extends State<Home2Page> {
  String greeting() {
    int hour = DateTime.now().hour;
    if (hour < 12 && hour > 6) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  bool _isSigningOut = false;
  Future<User>? usersetup;
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
                                        Colors.red,
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      AuthenticationHelper().signOut();
                                      setState(() {});
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Fp1Page(),
                                          ),
                                          (route) => false);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child: Text(
                                        'Sign Out',
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: globals.h9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
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

  @override
  void initState() {
    super.initState();
    usersetup = initializeFirebase();
    futureDay = fetchDay();
    futureTimetablepers = personalizedTT();
    defaultsvals();
    widget.stream.listen((index) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<User> initializeFirebase() async {
    User user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  perstimetable() {
    return Container(
        child: FutureBuilder<Map<String, dynamic>>(
            future: futureTimetablepers,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  timetablePers = snapshot.data;
                  while (timetablePers![
                          '${globals.valueOfGrade}.${(buffer + 1)}'] ==
                      null) {
                    buffer++;
                    if (buffer > 6) {
                      buffer = 0;
                      break;
                    }
                  }
                }
              }
              return ListView.builder(
                  itemCount: (timetablePers!.length == 0)
                      ? 3
                      : (timetablePers!.length ~/ 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 12.0, right: 12.0),
                      child: Card(
                        elevation: 7.5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27)),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                                          fontSize: globals.h5,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Protipo Compact"),
                                    ),
                                  ))
                                ],
                              ),
                              trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: globals.superman,
                                        child: Text(
                                          (timetablePers!.isNotEmpty)
                                              ? timetablePers![
                                                  '${globals.valueOfGrade}.${(index + buffer + 1)}_time']
                                              : "-",
                                          style: TextStyle(color: Colors.grey),
                                          maxLines: 2,
                                          overflow: TextOverflow.clip,
                                        ))
                                  ])),
                        ),
                      ),
                    );
                  });
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
                            child: ElevatedButton(
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
                            ),
                          ))
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good " '${greeting()}',
                            style: TextStyle(
                              fontFamily: 'Protipo Compact',
                              fontSize: globals.h9,
                              fontWeight: FontWeight.w300,
                            ))
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
                  SizedBox(
                    height: globals.h10,
                  )
                ],
              ),
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
                  height: globals.lc,
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
                  height: globals.lc,
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
                                  subtitle: (concisedate(tasks['date'],
                                              tasks['time'])[0]) !=
                                          ""
                                      ? Text(
                                          "$description  $description2",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: concisedate(tasks['date'],
                                                tasks['time'])[2],
                                          ),
                                        )
                                      : null,
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
