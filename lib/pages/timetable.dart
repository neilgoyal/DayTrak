import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';

class TimetablePage extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

final double toolbarHeight = 110.0;
var dt = DateTime.now();
String newDay = Jiffy(dt).format("EEEE");
String newDay1 = Jiffy(dt).format("do");
Future<DayDecrypted> futureDay;

showcorrectday(result) {
  if (result == '7') {
    result = 'Break';
  } else if (result == '8') {
    result = 'Error';
  } else {
    // ignore: unnecessary_brace_in_string_interps
    result = "Day ${result}";
  }
  return result;
}

class _TimetableState extends State<TimetablePage> {
  @override
  void initState() {
    super.initState();
    futureDay = fetchDay();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(190),
              child: AppBar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                elevation: 0,
                title: Container(
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(newDay,
                                        style: TextStyle(
                                          fontSize: 40,
                                          color: const Color(0xff9b8fb1),
                                          fontWeight: FontWeight.w300,
                                        )),
                                  ]),
                              Container(
                                child: FutureBuilder<DayDecrypted>(
                                  future: futureDay,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      var result =
                                          ((snapshot.data.day1).toString());
                                      globals.dayOrder = result;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '${showcorrectday(result)}',
                                            style: TextStyle(
                                              fontFamily: 'Protipo Compact',
                                              fontSize: 40,
                                              color: const Color(0xff9b8fb1),
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )
                                        ],
                                      );
                                    } else
                                      return Text(
                                        '${showcorrectday(globals.dayOrder)}',
                                        style: TextStyle(
                                          fontFamily: 'Protipo Compact',
                                          fontSize: 40,
                                          color: const Color(0xff9b8fb1),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      );
                                  },
                                ),
                              )
                            ]))),
                toolbarHeight: toolbarHeight,
              )),
        ));
  }
}
