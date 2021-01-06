import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/weather.dart';
import 'package:http/http.dart' as http;
import 'package:schoolcalendar/dbhelper.dart';

//date
var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 100.0;
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

  void showalertdialog() {
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
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Raleway",
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
                                errtext = "Too Many Characters";
                                validated = false;
                              });
                            }
                          },
                          child: Text("ADD",
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 18.0,
                                fontFamily: "Raleway",
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

  Widget mycard(String task) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            "$task",
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Raleway",
            ),
          ),
          onLongPress: () {
            print("Delete");
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showalertdialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
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
                          fontSize: 35,
                          color: const Color(0xffbadfca),
                          fontWeight: FontWeight.w200,
                        )),
                    // Text(celsius.toString() + ' °C',
                    //     style: TextStyle(
                    //       fontFamily: 'Protipo Compact',
                    //       fontSize: 35,
                    //       color: const Color(0xffbadfca),
                    //       fontWeight: FontWeight.w200,
                    // ))
                  ],
                )
              ],
            ),
            toolbarHeight: toolbarHeight,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            mycard("Fire Vinayak"),
            mycard("Fire Vinayak"),
            mycard("Fire Vinayak"),
            mycard("Fire Vinayak"),
          ],
        ),
      ),
    );
  }
}

// floatingActionButton: FloatingActionButton(
//   elevation: 0,
//   backgroundColor: Colors.amberAccent[700],
//   onPressed: () {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8)),
//             title: Text("Add Task"),
//             content: TextField(
//               onChanged: (String value) {
//                 todoTitle = value;
//               },
//             ),
//             actions: <Widget>[
//               FlatButton(
//                   onPressed: () {
//                     createTodos();

//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Add"))
//             ],
//           );
//         });
//   },
//   child: Icon(
//     Icons.add,
//     color: Colors.white,
//   ),
// ),
// body: StreamBuilder(
//     stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
//     builder: (context, snapshots) {
//       if (snapshots.hasData) {
//         return ListView.builder(
//             shrinkWrap: true,
//             itemCount: snapshots.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot documentSnapshot =
//                   snapshots.data.documents[index];
//               return Dismissible(
//                   onDismissed: (direction) {
//                     deleteTodos(documentSnapshot["todoTitle"]);
//                   },
//                   key: Key(documentSnapshot["todoTitle"]),
//                   child: Card(
//                     elevation: 4,
//                     margin: EdgeInsets.all(8),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                     child: ListTile(
//                       title: Text(documentSnapshot["todoTitle"]),
//                       trailing: IconButton(
//                           icon: Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {
//                             deleteTodos(documentSnapshot["todoTitle"]);
//                           }),
//                     ),
//                   ));
//             });
//       } else {
//         return Align(
//           alignment: FractionalOffset.bottomCenter,
//           child: CircularProgressIndicator(),
//         );
//       }
//     }),
