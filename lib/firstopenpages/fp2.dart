import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DataBase/globals.dart' as globals;
import 'package:flutter/rendering.dart';
import '../pages/tabBar.dart';
import 'package:schoolcalendar/pages/settings.dart';

String errmessage = "Cannot Be Empty";
OutlineInputBorder textfieldborderenabled = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Colors.black54, width: 1),
);
OutlineInputBorder focusedborder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(color: Color.fromRGBO(202, 232, 140, 1), width: 2),
);

class Fp2Page extends StatefulWidget {
  @override
  _Fp2State createState() => _Fp2State();
}

class _Fp2State extends State<Fp2Page> {
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
                                                        child: Text("7"),
                                                        value: 7),
                                                    DropdownMenuItem(
                                                        child: Text("8"),
                                                        value: 8),
                                                    DropdownMenuItem(
                                                        child: Text("9A"),
                                                        value: 91),
                                                    DropdownMenuItem(
                                                        child: Text("9B"),
                                                        value: 92),
                                                    DropdownMenuItem(
                                                        child: Text("10"),
                                                        value: 10),
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
                                                      91 ||
                                                  globals.valueOfGrade == 92)
                                                grade9(context, false)
                                              else if (globals.valueOfGrade ==
                                                      61 ||
                                                  globals.valueOfGrade == 62)
                                                grade6(context, false)
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
