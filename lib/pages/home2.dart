import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';
import 'package:schoolcalendar/globals.dart';
import 'package:schoolcalendar/pages/timetable.dart';
import '../api.dart';
import '../authentication.dart';
import '../globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../database.dart';

class Home2Page extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2Page> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  // ignore: unused_field
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
                  height: l4,
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
                                  fontSize: h9,
                                  fontWeight: FontWeight.w300,
                                ),
                                overflow: TextOverflow.ellipsis,
                                // textDirection: TextDirection.LTR,
                                textAlign: TextAlign.center,
                                maxLines: 6,
                              ),
                            ]),
                        SizedBox(
                          height: h8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<User>(
                                future: usersetup,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    User? user = snapshot.data;
                                    return Text("'${user!.displayName}'",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: h9,
                                          fontWeight: FontWeight.w300,
                                        ));
                                  } else {
                                    return Text(globals.nickname,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: h9,
                                          fontWeight: FontWeight.w300,
                                        ));
                                  }
                                })
                          ],
                        ),
                        SizedBox(
                          height: h7,
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
                                          fontSize: h7,
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
                                children: [
                                  Text(
                                    'Today:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day1)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tomorrow:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      // color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day2)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        // color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day After:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day3)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else
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
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      // color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day1)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        // color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Tomorrow:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      // color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day2)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        // color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Day After:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      // color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day3)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        // color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                },
              ),
            ),
          );
        });
    return Container();
  }

  @override
  void initState() {
    usersetup = initializeFirebase();
    super.initState();
  }

  Future<User> initializeFirebase() async {
    // ignore: unused_local_variable
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    // ignore: unused_local_variable
    User user = FirebaseAuth.instance.currentUser!;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: s7,
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
                                        width: s5,
                                        height: s5,
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
                                          size: s6,
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
                              fontSize: h9,
                              fontWeight: FontWeight.w300,
                            )),
                        // SizedBox(
                        //   height: h11,
                        // ),
                        FutureBuilder<User>(
                            future: usersetup,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                User? user = snapshot.data;
                                return Text(
                                    user!.displayName.toString().split(" ")[0],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: h9,
                                      fontWeight: FontWeight.w300,
                                    ));
                              } else {
                                return Text(globals.nickname,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: h9,
                                      fontWeight: FontWeight.w300,
                                    ));
                              }
                            })
                      ]),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
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
                      '${showcorrectday(day1)}',
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        color: Colors.black,
                        fontSize: h4,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(DateFormat.MMMEd().format(DateTime.now()),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Protipo Compact',
                        fontSize: h10,
                        fontWeight: FontWeight.w300,
                      )),
                ],
              )
            ],
          ),
        ),
        body: ListView(padding: EdgeInsets.all(13.0), children: [
          SizedBox(
            height: h5,
          ),
          Text("Upcoming Classes:",
              style: TextStyle(
                  fontSize: h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: h4,
          ),
          Card(
              elevation: 39,
              color: Color.fromRGBO(201, 248, 86, 0.8),
              // color: Colors.transparent,
              shadowColor: Color.fromRGBO(201, 254, 86, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "hellp grwfgmreofgnorengoraengoarengoirengove",
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: "Protipo Compact",
                      fontWeight: FontWeight.w200),
                ),
              )),
          SizedBox(
            height: h1,
          ),
          Text("Tasks:",
              style: TextStyle(
                  fontSize: h4,
                  fontFamily: "Protipo Compact",
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: h4,
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
                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(5, 12, 5, 5),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.0),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var tasks = snapshot.data!.docs[index];
                            // ignore: unused_local_variable
                            String docID = snapshot.data!.docs[index].id;
                            String title = tasks['title'];
                            String description = tasks['date'];
                            return Card(
                              shadowColor: Colors.blue,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 1.5, color: Colors.grey),
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
                                  description,
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
            height: h2,
          ),
        ]));
  }
}
