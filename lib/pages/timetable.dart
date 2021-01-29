import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../api.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
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
    getIntValuesSF();
    selectNumTiles();
    futureDay = fetchDay();
  }

  getIntValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.value_ = prefs.getInt('Value') ?? 11;
    });
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
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: numoftiles,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
                      child: Card(
                        // gradient: LinearGradient(
                        //   begin: Alignment(-1.0, -1.0),
                        //   end: Alignment(1.0, -0.73),
                        //   colors: [
                        //     const Color(0x566e7aef),
                        //     const Color(0x5671c8af)
                        //   ],
                        //   stops: [0.0, 1.0],
                        // ),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: Text(
                                      timetable[
                                          '${globals.value_}.${(index + 1)}'],
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: "Protipo Compact"),
                                    ),
                                  ))
                                ],
                              ),
                              trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      timetable[
                                          '${globals.value_}.${(index + 1)}_time'],
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ])),
                        ),
                      ),
                    );
                  }),
            )));
  }
}
