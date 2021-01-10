import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/weather.dart';
import 'package:schoolcalendar/dbhelper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//date
var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 190.0;

//date end

class Addtask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'To-Do List',
        home: TodoList());
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final dbhelper = Databasehelper.instance;
  final texteditingcontroller = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoedited = "";
  // ignore: deprecated_member_use
  var myitems = List();
  // ignore: deprecated_member_use
  List<Widget> children = new List<Widget>();
  SlidableController slidableController;

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoedited,
    };
    final id = await dbhelper.insert(row);
    Navigator.of(context, rootNavigator: true).pop();
    todoedited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  void updatetodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoedited,
    };
    final id = row["id"];
    print(id);
    Navigator.of(context, rootNavigator: true).pop();
    todoedited = "";
    setState(() {
      validated = true;
      errtext = "";
    });
  }

  Future<bool> query() async {
    myitems = [];
    children = [];

    var allrows = await dbhelper.queryall();

    allrows.forEach((row) {
      myitems.add(row.toString());
      children.add(Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
                    color: const Color(0xbfd270aa),
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
            actions: <Widget>[],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.grey[300],
                icon: Icons.edit_outlined,
                onTap: showalertdialog1,
              ),
              IconSlideAction(
                caption: 'Completed',
                color: Colors.lightGreenAccent[700],
                icon: Icons.check,
                onTap: () {
                  dbhelper.deletedata(row['id']);
                  setState(() {});
                },
              ),
            ],
          )));
    });
    return Future.value(true);
  }

  void showalertdialog() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Add Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Too many Characters";
                                validated = false;
                              });
                            } else {
                              addtodo();
                            }
                          },
                          color: Colors.amberAccent[700],
                          child: Text("ADD",
                              style: TextStyle(
                                fontFamily: 'Protipo Compact',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  void showalertdialog1() {
    texteditingcontroller.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              title: Text(
                "Update Task",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: texteditingcontroller,
                    autofocus: true,
                    onChanged: (_val) {
                      todoedited = _val;
                    },
                    style: TextStyle(
                      fontFamily: 'Protipo Compact',
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errtext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            if (texteditingcontroller.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (texteditingcontroller.text.length >
                                512) {
                              setState(() {
                                errtext = "Too many Characters";
                                validated = false;
                              });
                            } else {
                              updatetodo();
                            }
                          },
                          color: Colors.amberAccent[700],
                          child: Text("UPDATE",
                              style: TextStyle(
                                fontFamily: 'Protipo Compact',
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text(
              "No Data",
            ),
          );
        } else {
          if (myitems.length == 0) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amberAccent[700],
                elevation: 5,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
//APPBAR 1

              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(190),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                newDt,
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 40,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text("Day 1",
                                  style: TextStyle(
                                    fontFamily: 'Protipo Compact',
                                    fontSize: 40,
                                    color: const Color(0xff9b8fb1),
                                    fontWeight: FontWeight.w300,
                                  ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(newDt1,
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 35,
                                  color: const Color(0xffbadfca),
                                  fontWeight: FontWeight.w200,
                                )),
                            Container(
                              child: FutureBuilder<WeatherModel>(
                                future: getWeather(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    WeatherModel model = snapshot.data;
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${model.main.temp.round()} ˚C',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: 35,
                                            color: const Color(0xffbadfca),
                                            fontWeight: FontWeight.w200,
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (snapshot.hasError)
                                    return Text(
                                      '${snapshot.error}',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.red,
                                          fontFamily: 'Protipo Compact'),
                                    );
                                  return CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upcoming Tasks',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 34,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w200,
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    toolbarHeight: toolbarHeight,
                  )),
              backgroundColor: Colors.white,
              body: Center(
                child: Text(
                  "No Tasks Added",
                  style: TextStyle(fontFamily: "Raleway", fontSize: 20.0),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showalertdialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.amberAccent[700],
                elevation: 5,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
//APPBAR 2

              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(190.0),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                newDt,
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 40,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text("Day 1",
                                  style: TextStyle(
                                    fontFamily: 'Protipo Compact',
                                    fontSize: 40,
                                    color: const Color(0xff9b8fb1),
                                    fontWeight: FontWeight.w300,
                                  ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(newDt1,
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 35,
                                  color: const Color(0xffbadfca),
                                  fontWeight: FontWeight.w200,
                                )),
                            Container(
                              child: FutureBuilder<WeatherModel>(
                                future: getWeather(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    WeatherModel model = snapshot.data;
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${model.main.temp.round()} ˚C',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: 35,
                                            color: const Color(0xffbadfca),
                                            fontWeight: FontWeight.w200,
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (snapshot.hasError)
                                    return Text(
                                      '${snapshot.error}',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.red,
                                          fontFamily: 'Protipo Compact'),
                                    );
                                  return CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upcoming Tasks',
                                style: TextStyle(
                                  fontFamily: 'Protipo Compact',
                                  fontSize: 34,
                                  color: const Color(0xff9b8fb1),
                                  fontWeight: FontWeight.w200,
                                ),
                              )
                            ]),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                    toolbarHeight: toolbarHeight,
                  )),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
