import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'dart:async';

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.E().format(dt);
final double toolbarHeight = 100.0;
String key = '77580a3797c4f2efd008403c9faf5e22';
String cityName = 'Gurgaon';
double lat = 28.466667;
double lon = 77.033333;
WeatherFactory wf = WeatherFactory(key);
List<Weather> _data = [];
double celsius = 0.0;
const fiveSeconds = const Duration(seconds: 100);

class Addtask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();
  List todos = List();
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
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
                          fontSize: 30,
                          color: const Color(0xff9b8fb1),
                          fontWeight: FontWeight.w100,
                        )),
                    Text(celsius.toString() + ' °C',
                        style: TextStyle(
                          fontFamily: 'Protipo Compact',
                          fontSize: 30,
                          color: const Color(0xff9b8fb1),
                          fontWeight: FontWeight.w100,
                        ))
                  ],
                )
              ],
            ),
            toolbarHeight: toolbarHeight,
          )),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.amberAccent[700],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Task"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todos[index]),
                  ),
                ));
          }),
    );
  }

  void _addTodoItem(String title) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed
    setState(() {
      _todoList.add(title);
    });
    _textFieldController.clear();
  }

  // Generate list of item widgets
  Widget _buildTodoItem(String title) {
    return ListTile(title: Text(title));
  }

  // Generate a single item widget
  Future<AlertDialog> _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your list'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _todoList) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}
