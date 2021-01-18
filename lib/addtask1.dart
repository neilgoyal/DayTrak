import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/models/todo.dart';
import 'package:schoolcalendar/services/todo_service.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:schoolcalendar/weather.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 190.0;
BorderRadiusGeometry radius = BorderRadius.only(
  topLeft: Radius.circular(35.0),
  topRight: Radius.circular(35.0),
);

class Addtask1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        title: 'To-Do List',
        home: TodoList1());
  }
}

class TodoList1 extends StatefulWidget {
  @override
  _TodoListState1 createState() => _TodoListState1();
}

class _TodoListState1 extends State<TodoList1> {
  TodoService _todoService;
  List<Todo> _todoList;
  final panelController = PanelController();
  var _todoTitleController = TextEditingController();
  var _todoDateController = TextEditingController();
  String errtext1 = "";
  String errtext2 = "";
  bool validated1 = true;
  bool validated2 = true;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  DateTime _dateTime = DateTime.now();

  @override
  initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    // ignore: deprecated_member_use
    _todoList = List<Todo>();

    var todos = await _todoService.readTodos();

    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.todoDate = todo['todoDate'];
        _todoList.add(model);
      });
    });
  }

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showRoundedDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 25,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(2, 163, 160, 1),
        accentColor: Color.fromRGBO(185, 225, 203, 1),
        dialogBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1:
              TextStyle(color: Colors.black54, fontFamily: 'Protipo Compact'),
          caption: TextStyle(
              color: Color.fromRGBO(224, 163, 160, 1),
              fontFamily: 'Protipo Compact'),
        ),
        accentTextTheme: TextTheme(
          bodyText2: TextStyle(
              color: Colors.green[200], fontFamily: 'Protipo Compact'),
        ),
      ),
      customWeekDays: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
      styleDatePicker: MaterialRoundedDatePickerStyle(
        paddingMonthHeader: EdgeInsets.all(12),
        textStyleButtonNegative:
            TextStyle(fontSize: 15, color: Color.fromRGBO(2, 163, 160, 1)),
        textStyleButtonPositive: TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(2, 163, 160, 1),
        ),
      ),
    );

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('yMd').format(_pickedDate);
      });
    }
  }

  Widget _floatingPanel() {
    return Container(
      // margin: const EdgeInsets.all(20.0),
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
                  fontSize: 30,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                )),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('',
                style: TextStyle(
                  fontFamily: 'Protipo Compact',
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                )),
          ]),
          TextField(
              // textInputAction: TextInputAction.next,
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('',
                style: TextStyle(
                  fontFamily: 'Protipo Compact',
                  fontSize: 10,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                )),
          ]),
          TextField(
            cursorColor: Colors.black54,
            controller: _todoDateController,
            readOnly: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (term) async {
              if (_todoTitleController.text.isEmpty &&
                  _todoDateController.text.isEmpty) {
                setState(() {
                  errtext1 = "";
                  errtext2 = "";
                  validated1 = true;
                  validated2 = true;
                  errtext1 = "Can't Be Empty";
                  validated1 = false;
                  errtext2 = "Can't Be Empty";
                  validated2 = false;
                });
              } else if (_todoTitleController.text.isEmpty) {
                setState(() {
                  errtext1 = "";
                  errtext2 = "";
                  validated1 = true;
                  validated2 = true;
                  errtext1 = "Can't Be Empty";
                  validated1 = false;
                });
              } else if (_todoDateController.text.isEmpty) {
                setState(() {
                  errtext1 = "";
                  errtext2 = "";
                  validated1 = true;
                  validated2 = true;
                  errtext2 = "Can't Be Empty";
                  validated2 = false;
                });
              } else {
                _addbutton();
                _dateTime = DateTime.now();
              }
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
                  _selectedTodoDate(context);
                  getAllTodos();
                },
                child: Icon(CupertinoIcons.calendar, color: Colors.black54),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (_todoTitleController.text.isEmpty &&
                  _todoDateController.text.isEmpty) {
                setState(() {
                  errtext1 = "Can't Be Empty";
                  validated1 = false;
                  errtext2 = "Can't Be Empty";
                  validated2 = false;
                });
              } else if (_todoTitleController.text.isEmpty) {
                setState(() {
                  errtext1 = "Can't Be Empty";
                  validated1 = false;
                });
              } else if (_todoDateController.text.isEmpty) {
                setState(() {
                  errtext2 = "Can't Be Empty";
                  validated2 = false;
                });
              } else {
                _addbutton();
                _dateTime = DateTime.now();
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(119, 227, 134, 1),
              shadowColor: Color.fromRGBO(223, 164, 160, 1),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
            ),
            child: Text('Add',
                style: TextStyle(
                  color: Colors.black54,
                  fontFamily: 'Protipo Compact',
                )),
          )
        ],
      ),
    );
  }

  Widget _floatingCollasped() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(185, 143, 163, 1),
        borderRadius: radius,
      ),
      child: Center(
        child: Text(
          "Add Task",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Protipo Compact', fontSize: 20),
        ),
      ),
    );
  }

  _addbutton() async {
    getAllTodos();
    FocusScopeNode currentFocus = FocusScope.of(context);
    var todoObject = Todo();
    todoObject.title = _todoTitleController.text;
    todoObject.todoDate = _todoDateController.text;
    var _todoService = TodoService();
    var result = await _todoService.saveTodo(todoObject);
    if (result > 0) {
      getAllTodos();
      _todoTitleController.text = "";
      _todoDateController.text = "";
    }
    setState(() {
      validated1 = true;
      errtext1 = "";
      validated2 = true;
      errtext2 = "";
    });
    print(result);
    panelController.close();
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        backdropTapClosesPanel: true,
        backdropEnabled: true,
        renderPanelSheet: false,
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        controller: panelController,
        borderRadius: radius,
        minHeight: 55,
        maxHeight: 394,
        panel: _floatingPanel(),
        collapsed: _floatingCollasped(),
        body: Scaffold(
          key: _globalKey,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(190),
              child: AppBar(
                backgroundColor: Color.fromRGBO(250, 250, 250, 1),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    Color.fromRGBO(250, 250, 250, 1)),
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
          body: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
                    child: Card(
                      color: Color.fromRGBO(211, 223, 229, 1),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  child: Text(
                                      _todoList[index].title ?? 'No Title'),
                                ))
                              ],
                            ),
                            trailing: Text(DateFormat('E, d MMM').format(
                                    DateFormat("yMd")
                                        .parse(_todoList[index].todoDate)) ??
                                'No Date'),
                          ),
                        ),
                        actions: <Widget>[],
                        secondaryActions: <Widget>[
                          Column(children: [
                            Expanded(
                              child: SlideAction(
                                  color: Color.fromRGBO(0, 0, 0, 0),
                                  child: Container(
                                    height: 100000000000.0,
                                    width: 100000000000.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(119, 227, 134, 1),
                                      borderRadius: BorderRadius.only(
                                        topRight: const Radius.circular(25.0),
                                        bottomRight:
                                            const Radius.circular(25.0),
                                      ),
                                    ),
                                    child:
                                        Icon(Icons.check, color: Colors.black),
                                  ),
                                  onTap: () async {
                                    var _todoService = TodoService();
                                    var result = await _todoService
                                        .deleteTodo(_todoList[index].id);
                                    setState(() {});
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
      ),
      borderRadius: radius,
    );
  }
}
