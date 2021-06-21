import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Provider/theme_provider.dart';
import 'db.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:schoolcalendar/flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter/services.dart';
import 'globals.dart' as globals;

BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(35.0),
  topRight: Radius.circular(35.0),
);
Future<Day>? futureDay;

int weatherorder = 0;

class Addtask1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'DayTrak',
        home: TodoList1());
  }
}

class TodoList1 extends StatefulWidget {
  @override
  _TodoListState1 createState() => _TodoListState1();
}

class _TodoListState1 extends State<TodoList1> {
  late TodoService _todoService;
  late List<Todo> _todoList;
  final panelController = PanelController();
  TextEditingController _todoTitleController = TextEditingController(),
      _todoDateController = TextEditingController();
  String errtext1 = "", errtext2 = "";
  bool validated1 = true, validated2 = true;
  DateTime _dateTime = DateTime.now();

  addatask() {
    if (_todoTitleController.text.isEmpty && _todoDateController.text.isEmpty) {
      if (mounted) {
        setState(() {
          errtext1 = "Add a Task";
          validated1 = false;
          errtext2 = "Select a Date";
          validated2 = false;
        });
      }
    } else if (_todoTitleController.text.isEmpty) {
      if (mounted) {
        setState(() {
          errtext2 = "";
          validated2 = true;
          errtext1 = "Add a Task";
          validated1 = false;
        });
      }
    } else if (_todoDateController.text.isEmpty) {
      if (mounted) {
        setState(() {
          errtext1 = "";
          validated1 = true;
          errtext2 = "Select a Date";
          validated2 = false;
        });
      }
    } else {
      _addbutton();
      _dateTime = DateTime.now();
    }
  }

  _addbutton() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    Todo todoObject = Todo();
    todoObject.title = _todoTitleController.text;
    todoObject.todoDate = _todoDateController.text;
    TodoService _todoService = TodoService();
    dynamic result = await _todoService.saveTodo(todoObject);
    if (result > 0) {
      getAllTodos();
      _todoTitleController.text = "";
      _todoDateController.text = "";
    }
    if (mounted) {
      setState(() {
        validated1 = true;
        errtext1 = "";
        validated2 = true;
        errtext2 = "";
      });
    }
    panelController.close();
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  closekeyboard() {
    if (!FocusScope.of(context).hasPrimaryFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  concisedate(index) {
    DateTime setDate = DateTime.parse(_todoList[index].todoDate);
    String concise;
    Color late = Colors.black45;
    if (setDate.difference(DateTime.now()) < Duration(days: -1)) {
      late = Colors.red;
    }
    if (_todoList[index].todoDate ==
        DateFormat('yyyy-MM-dd').format(DateTime.now())) {
      concise = 'Today';
    } else if (_todoList[index].todoDate ==
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(Duration(days: 1)))) {
      concise = 'Tomorrow';
    } else if (_todoList[index].todoDate ==
        DateFormat('yyyy-MM-dd')
            .format(DateTime.now().add(new Duration(days: -1)))) {
      concise = 'Yesterday';
    } else {
      concise = DateFormat('E, d MMM').format(setDate);
    }
    return [concise, late];
  }

  getAllTodos() async {
    _todoService = TodoService();
    // ignore: deprecated_member_use
    _todoList = <Todo>[];
    dynamic todos = await _todoService.readTodos();
    todos.forEach((todo) {
      setState(() {
        Todo model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.todoDate = todo['todoDate'];
        _todoList.add(model);
      });
    });
  }

  selectedTodoDate(BuildContext context) async {
    DateTime? _pickedDate = await showRoundedDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 25,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(2, 163, 160, 1),
        accentColor: Color.fromRGBO(185, 225, 203, 1),
        dialogBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.black54,
              fontFamily: 'Protipo Compact',
              fontSize: globals.h8),
          caption: TextStyle(
              color: Color.fromRGBO(224, 163, 160, 1),
              fontFamily: 'Protipo Compact',
              fontSize: globals.h10),
        ),
        accentTextTheme: TextTheme(
          bodyText2: TextStyle(
              color: Colors.green[200],
              fontFamily: 'Protipo Compact',
              fontSize: globals.h10),
        ),
      ),
      customWeekDays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
      styleDatePicker: MaterialRoundedDatePickerStyle(
        paddingMonthHeader: EdgeInsets.all(12),
        textStyleButtonNegative: TextStyle(
            fontSize: globals.h9, color: Color.fromRGBO(2, 163, 160, 1)),
        textStyleButtonPositive: TextStyle(
          fontSize: globals.h9,
          color: Color.fromRGBO(2, 163, 160, 1),
        ),
      ),
    );

    if (_pickedDate != null) {
      if (mounted) {
        setState(() {
          _dateTime = _pickedDate;
          _todoDateController.text =
              DateFormat('yyyy-MM-dd').format(_pickedDate);
        });
      }
    }
  }

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

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      margin: const EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Add Task',
                style: TextStyle(
                  fontFamily: 'Protipo Compact',
                  fontSize: globals.h5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                )),
          ]),
          SizedBox(
            height: 15,
          ),
          TextField(
              cursorColor: Colors.black54,
              controller: _todoTitleController,
              decoration: InputDecoration(
                errorText: validated1 ? null : errtext1,
                labelText: "Create a new task",
                labelStyle: TextStyle(color: Colors.black54),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.black54, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(224, 163, 160, 1), width: 2),
                ),
              )),
          SizedBox(
            height: 15,
          ),
          TextField(
            cursorColor: Colors.black54,
            controller: _todoDateController,
            readOnly: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (term) async {
              Addtask1();
            },
            decoration: InputDecoration(
              errorText: validated2 ? null : errtext2,
              labelText: "Select a date",
              labelStyle: TextStyle(color: Colors.black54),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Colors.black54, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(224, 163, 160, 1), width: 2),
              ),
              prefixIcon: InkWell(
                onTap: () {
                  selectedTodoDate(context);
                },
                child: Icon(
                  CupertinoIcons.calendar,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              HapticFeedback.heavyImpact();
              addatask();
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(119, 227, 134, 1),
              shadowColor: Color.fromRGBO(223, 164, 160, 1),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
            child: Text('+',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Protipo Compact',
                  fontSize: globals.h4,
                )),
          )
        ],
      ),
    );
  }

  Widget days() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 350,
              child: FutureBuilder<Day>(
                future: futureDay,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    globals.dayOrder = ((snapshot.data!.day1).toString());
                    globals.day2 = ((snapshot.data!.day2).toString());
                    globals.day3 = ((snapshot.data!.day3).toString());
                    globals.day4 = ((snapshot.data!.day4).toString());
                    globals.day5 = ((snapshot.data!.day5).toString());
                    globals.day6 = ((snapshot.data!.day6).toString());
                    globals.day7 = ((snapshot.data!.day7).toString());
                    globals.timetable = snapshot.data!.timetable;
                    globals.timetabletom = snapshot.data!.timetabletom;
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.dayOrder)}',
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
                                    '  Tomorrow:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day2)}',
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
                                    '  Day After1:  ',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '  Day After2:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day4)}',
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
                                    '  Day After3:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day5)}',
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
                                    '  Day After4:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day6)}',
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
                                    '  Day After5:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day7)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              )
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.dayOrder)}',
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
                                    '  Tomorrow:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day2)}',
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
                                    '  Day After:  ',
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
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '  Day After2:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day4)}',
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
                                    '  Day After3:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day5)}',
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
                                    '  Day After4:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day6)}',
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
                                    '  Day After5:  ',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h4,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text('${showcorrectday(globals.day7)}',
                                      style: TextStyle(
                                        fontFamily: 'Protipo Compact',
                                        fontSize: globals.h4,
                                        color: const Color(0xffbadfca),
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              )
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

  Widget _floatingCollasped() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(137, 180, 184, 0.9),
        borderRadius: radius,
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(CupertinoIcons.chevron_compact_up, size: globals.h2)
          ]),
    );
  }

  @override
  initState() {
    super.initState();
    getAllTodos();
    futureDay = fetchDay();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // PopupMenu.context = context;
    return Material(
      color: Colors.black,
      child: SlidingUpPanel(
          backdropTapClosesPanel: true,
          backdropEnabled: true,
          renderPanelSheet: false,
          color: Colors.white,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          controller: panelController,
          borderRadius: radius,
          minHeight: 45,
          maxHeight: 376,
          panel: _floatingPanel(),
          collapsed: _floatingCollasped(),
          onPanelClosed: () {
            closekeyboard();
            _todoTitleController.text = "";
            _todoDateController.text = "";
            if (mounted) {
              setState(() {
                validated1 = true;
                errtext1 = "";
                validated2 = true;
                errtext2 = "";
              });
            }
          },
          body: GestureDetector(
              onTap: () {
                closekeyboard();
              },
              child: Scaffold(
                  key: GlobalKey<ScaffoldState>(),
                  appBar: PreferredSize(
                      preferredSize: Size.fromHeight(190),
                      child: AppBar(
                        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                        // backgroundColor: Colors.black,
                        elevation: 0,
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat.MMMd().format(DateTime.now()),
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h1,
                                      color: const Color(0xff9b8fb1),
                                      fontWeight: FontWeight.w300,
                                    )),
                                Container(
                                  child: FutureBuilder<Day>(
                                    future: futureDay,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        (snapshot.data!.day1 != null)
                                            ? globals.dayOrder =
                                                ((snapshot.data!.day1)
                                                    .toString())
                                            : globals.dayOrder = "-";
                                        globals.day2 =
                                            ((snapshot.data!.day2).toString());
                                        globals.day3 =
                                            ((snapshot.data!.day3).toString());
                                        globals.timetable =
                                            snapshot.data!.timetable;
                                        globals.timetabletom =
                                            snapshot.data!.timetabletom;
                                        return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    padding:
                                                        MaterialStateProperty.all<
                                                            EdgeInsetsGeometry>(
                                                      EdgeInsets.only(
                                                          top: 0.0,
                                                          left: 0.0,
                                                          right: 0.0),
                                                    ),
                                                    shadowColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromRGBO(
                                                                    1, 1, 1, 0)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Color.fromRGBO(
                                                                    1,
                                                                    1,
                                                                    1,
                                                                    0))),
                                                onLongPress: () {
                                                  days();
                                                  HapticFeedback.heavyImpact();
                                                },
                                                onPressed: () {},
                                                child: Text(
                                                  '${showcorrectday(globals.dayOrder)}',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'Protipo Compact',
                                                    fontSize: globals.h1,
                                                    color:
                                                        const Color(0xff9b8fb1),
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              )
                                            ]);
                                      } else
                                        return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      padding:
                                                          MaterialStateProperty.all<
                                                              EdgeInsetsGeometry>(
                                                        EdgeInsets.only(
                                                            top: 0.0,
                                                            left: 0.0,
                                                            right: 0.0),
                                                      ),
                                                      shadowColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Color
                                                                  .fromRGBO(
                                                                      1, 1, 1, 0)),
                                                      backgroundColor:
                                                          MaterialStateProperty.all<
                                                                  Color>(
                                                              Color.fromRGBO(
                                                                  1, 1, 1, 0))),
                                                  onPressed: () {},
                                                  onLongPress: () {
                                                    days();
                                                    HapticFeedback
                                                        .heavyImpact();
                                                  },
                                                  child: Text(
                                                    '${showcorrectday(globals.dayOrder)}',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Protipo Compact',
                                                      fontSize: globals.h1,
                                                      color: const Color(
                                                          0xff9b8fb1),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ))
                                            ]);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat.EEEE().format(DateTime.now()),
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h2,
                                      color: const Color(0xffbadfca),
                                      fontWeight: FontWeight.w200,
                                    )),
                                Container(
                                  child: FutureBuilder<WeatherModel>(
                                    future: getWeather(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        WeatherModel model1 = snapshot.data!;
                                        weatherorder =
                                            model1.main!.temp!.round();
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${model1.main!.temp!.round()} ˚C',
                                              style: TextStyle(
                                                fontFamily: 'Protipo Compact',
                                                fontSize: globals.h2,
                                                color: const Color(0xffbadfca),
                                                fontWeight: FontWeight.w200,
                                              ),
                                            )
                                          ],
                                        );
                                      } else
                                        return Text(
                                          '$weatherorder ˚C',
                                          style: TextStyle(
                                            fontFamily: 'Protipo Compact',
                                            fontSize: globals.h2,
                                            color: const Color(0xffbadfca),
                                            fontWeight: FontWeight.w200,
                                          ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Upcoming Tasks',
                                    style: TextStyle(
                                      fontFamily: 'Protipo Compact',
                                      fontSize: globals.h3,
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
                        toolbarHeight: 200.0,
                      )),
                  body: (_todoList.isEmpty)
                      ? Container(
                          padding: EdgeInsets.only(
                              top: 0.0, left: 12.0, right: 12.0),
                          child: Card(
                              color: Colors.white,
                              elevation: 12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)),
                              child: Column(children: [
                                SizedBox(
                                  height: globals.s4,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "You're all done!  ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Protipo Compact",
                                            fontSize: globals.h6,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      Icon(
                                        CupertinoIcons.smiley,
                                        size: globals.h6,
                                        color: Colors.black54,
                                      )
                                    ])
                              ])))
                      : Container(
                          padding: EdgeInsets.only(
                              top: 0.0, left: 12.0, right: 12.0),
                          child: Card(
                            color: Colors.white,
                            elevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: ListView.builder(
                                  itemCount: _todoList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 8.0, right: 8.0),
                                        child: Card(
                                          color:
                                              Color.fromRGBO(211, 223, 229, 1),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Slidable(
                                            actionPane:
                                                SlidableDrawerActionPane(),
                                            actionExtentRatio: 0.25,
                                            child: Container(
                                              padding: EdgeInsets.all(5.0),
                                              child: ListTile(
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: Container(
                                                        child: Text(
                                                            _todoList[index]
                                                                .title,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontFamily:
                                                                    "Protipo Compact",
                                                                fontSize:
                                                                    globals
                                                                        .h7)),
                                                      ))
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    '${concisedate(index)[0]}',
                                                    style: TextStyle(
                                                        color: concisedate(
                                                            index)[1],
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontFamily:
                                                            "Protipo Compact",
                                                        fontSize: globals.h10),
                                                  )),
                                            ),
                                            actions: <Widget>[],
                                            secondaryActions: <Widget>[
                                              Column(children: [
                                                Expanded(
                                                  child: SlideAction(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0),
                                                      child: Container(
                                                        height: 10000000.0,
                                                        width: 10000000.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              119, 227, 134, 1),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight: const Radius
                                                                .circular(25.0),
                                                            bottomRight:
                                                                const Radius
                                                                        .circular(
                                                                    25.0),
                                                          ),
                                                        ),
                                                        child: Icon(
                                                            CupertinoIcons
                                                                .checkmark_alt,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      onTap: () async {
                                                        HapticFeedback
                                                            .heavyImpact();
                                                        TodoService
                                                            _todoService =
                                                            TodoService();
                                                        dynamic result =
                                                            await _todoService
                                                                .deleteTodo(
                                                                    _todoList[
                                                                            index]
                                                                        .id);
                                                        if (mounted) {
                                                          setState(() {});
                                                        }
                                                        if (result > 0) {
                                                          getAllTodos();
                                                        }
                                                      }),
                                                )
                                              ])
                                            ],
                                          ),
                                        ));
                                  }),
                            ),
                          ))))),
      borderRadius: radius,
    );
  }
}
