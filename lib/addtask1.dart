import 'package:flutter/material.dart';
import 'package:schoolcalendar/models/todo.dart';
import 'package:schoolcalendar/services/todo_service.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:schoolcalendar/weather.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 190.0;

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
        model.isFinished = todo['isFinished'];
        _todoList.add(model);
      });
    });
  }

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('EEEE').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        margin: const EdgeInsets.all(20.0),
        renderPanelSheet: false,
        controller: panelController,
        minHeight: 45,
        panel: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _todoTitleController,
                decoration: InputDecoration(
                    labelText: 'Title', hintText: 'Write Todo Title'),
              ),
              TextField(
                controller: _todoDateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'Pick a Date',
                  prefixIcon: InkWell(
                    onTap: () {
                      _selectedTodoDate(context);
                      getAllTodos();
                    },
                    child: Icon(Icons.calendar_today),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  getAllTodos();
                  var todoObject = Todo();
                  todoObject.title = _todoTitleController.text;
                  todoObject.isFinished = 0;
                  todoObject.todoDate = _todoDateController.text;
                  var _todoService = TodoService();
                  var result = await _todoService.saveTodo(todoObject);
                  if (result > 0) {
                    getAllTodos();
                    _todoTitleController.text = "";
                    _todoDateController.text = "";
                  }
                  print(result);
                  panelController.close();
                },
                color: Colors.blue,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        collapsed: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(185, 143, 163, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(250.0),
                topRight: Radius.circular(250.0)),
          ),
          child: Center(
            child: Text(
              "Add Task",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(_todoList[index].title ?? 'No Title')
                            ],
                          ),
                          trailing:
                              Text(_todoList[index].todoDate ?? 'No Date'),
                        ),
                      ),
                      actions: <Widget>[],
                      secondaryActions: <Widget>[
                        // IconSlideAction(
                        //     caption: 'Edit',
                        //     color: Colors.grey[300],
                        //     icon: Icons.edit_outlined,
                        //     onTap: () {
                        //       update = true;
                        //       _todoTitleController.text =
                        //           _todoList[index].title;
                        //       _todoDateController.text =
                        //           _todoList[index].todoDate;
                        //       panelController.open();
                        //     }),
                        IconSlideAction(
                          caption: 'Completed',
                          color: Colors.lightGreenAccent[700],
                          icon: Icons.check,
                          onTap: () async {
                            var _todoService = TodoService();
                            var result = await _todoService
                                .deleteTodo(_todoList[index].id);
                            setState(() {});
                            if (result > 0) {
                              getAllTodos();
                            }
                          },
                        ),
                      ],
                    ),
                  ));
            }),
        body: Scaffold(
          key: _globalKey,
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
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
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
        ),
      ),
    );
  }
}
