import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import 'package:flutter/rendering.dart';
import 'package:schoolcalendar/pages/tabBar.dart';
import 'package:schoolcalendar/pages/settings.dart';

class Fp2Page extends StatefulWidget {
  Fp2Page(this.stream);
  final Stream<int> stream;
  @override
  _Fp2State createState() => _Fp2State();
}

class _Fp2State extends State<Fp2Page> {
  @override
  void initState() {
    super.initState();
    widget.stream.listen((index) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: AppBar(
                    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                    elevation: 0,
                    title: Container(
                        child: Padding(
                      padding: EdgeInsets.only(left: 2.0, right: 2.0),
                      child: Text(
                        'Setup',
                        style: TextStyle(
                          fontFamily: 'Protipo Compact',
                          fontSize: globals.h1,
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
                    toolbarHeight: 50.0)),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                        child: Column(children: [
                          Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.0, right: 30.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: globals.h6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Grade: ',
                                                style: TextStyle(
                                                  fontFamily: 'Protipo Compact',
                                                  fontSize: globals.h4,
                                                  fontWeight: FontWeight.w300,
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: globals.h6,
                                        ),
                                        Container(
                                            child: Center(
                                                child:
                                                    Column(children: <Widget>[
                                          InputDecorator(
                                              decoration: InputDecoration(
                                                labelText: 'Grade: ',
                                                labelStyle: Theme.of(context)
                                                    .primaryTextTheme
                                                    .caption!
                                                    .copyWith(
                                                        color: Colors.black),
                                                border:
                                                    const OutlineInputBorder(
                                                        gapPadding: 0,
                                                        borderSide:
                                                            const BorderSide(
                                                                width: 1),
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    25.0))),
                                              ),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                      child: Listener(
                                                onPointerDown: (_) =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: DropdownButton(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: globals.h10,
                                                      fontFamily:
                                                          'Protipo Compact'),
                                                  elevation: 1,
                                                  isExpanded: true,
                                                  isDense: true,
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  value: globals.valueOfGrade,
                                                  items: [
                                                    DropdownMenuItem(
                                                        child: Text("6A"),
                                                        value: 61),
                                                    DropdownMenuItem(
                                                        child: Text("6B"),
                                                        value: 62),
                                                    DropdownMenuItem(
                                                        child: Text("7A"),
                                                        value: 71),
                                                    DropdownMenuItem(
                                                        child: Text("7B"),
                                                        value: 72),
                                                    DropdownMenuItem(
                                                        child: Text("8A"),
                                                        value: 81),
                                                    DropdownMenuItem(
                                                        child: Text("8B"),
                                                        value: 82),
                                                    DropdownMenuItem(
                                                        child: Text("8C"),
                                                        value: 83),
                                                    DropdownMenuItem(
                                                        child: Text("9A"),
                                                        value: 91),
                                                    DropdownMenuItem(
                                                        child: Text("9B"),
                                                        value: 92),
                                                    DropdownMenuItem(
                                                        child: Text("9C"),
                                                        value: 93),
                                                    DropdownMenuItem(
                                                        child: Text("10A"),
                                                        value: 101),
                                                    DropdownMenuItem(
                                                        child: Text("10B"),
                                                        value: 102),
                                                    DropdownMenuItem(
                                                        child: Text("11"),
                                                        value: 11),
                                                    DropdownMenuItem(
                                                        child: Text("12"),
                                                        value: 12),
                                                  ],
                                                  onChanged: (dynamic value) {
                                                    setState(() {
                                                      globals.valueOfGrade =
                                                          value;
                                                      addIntToSF();
                                                    });
                                                  },
                                                ),
                                              ))),
                                          SizedBox(
                                            height: globals.h6,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Subjects:',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Protipo Compact',
                                                    fontSize: globals.h4,
                                                    fontWeight: FontWeight.w300,
                                                  )),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              if (globals.valueOfGrade == 11)
                                                grade11(context, false)
                                              else if (globals.valueOfGrade ==
                                                  12)
                                                grade12(context, false)
                                              else if (globals.valueOfGrade ==
                                                      91 ||
                                                  globals.valueOfGrade == 92 ||
                                                  globals.valueOfGrade == 101 ||
                                                  globals.valueOfGrade == 102)
                                                grade9and10(context, false)
                                              else if (globals.valueOfGrade ==
                                                      61 ||
                                                  globals.valueOfGrade == 62 ||
                                                  globals.valueOfGrade == 71 ||
                                                  globals.valueOfGrade == 72)
                                                grade6and7(context, false)
                                              else if (globals.valueOfGrade ==
                                                      81 ||
                                                  globals.valueOfGrade == 82 ||
                                                  globals.valueOfGrade == 83)
                                                grade8(context, false)
                                              else
                                                nosupport()
                                            ],
                                          ),
                                        ]))),
                                      ]))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent),
                                  ),
                                  onPressed: () async {
                                    fp2helper();
                                    Navigator.of(context).pushReplacement(
                                        new MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  },
                                  child: Icon(
                                    CupertinoIcons.checkmark_alt,
                                    color: Colors.black54,
                                    size: globals.h2,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: globals.h6,
                          ),
                        ]))))));
  }
}
