import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/weather.dart';
// import 'package:schoolcalendar/dbhelper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schoolcalendar/new_task.dart';
import 'package:schoolcalendar/Task.dart';
// import 'package:schoolcalendar/utils.dart';
import 'package:sqflite/sqflite.dart';

var dt = DateTime.now();
String newDt = DateFormat.MMMd().format(dt);
String newDt1 = DateFormat.EEEE().format(dt);
final double toolbarHeight = 190.0;

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
  DatabaseHelper databaseHelper = DatabaseHelper();
  Utils utility = new Utils();
  List<Task> taskList;
  int count = 0;
  String _themeType;
  final homeScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (taskList == null) {
      taskList = List<Task>();
      updateListView();
    }

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          key: homeScaffold,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).title(),
              style: TextStyle(fontSize: 25),
            ),
            actions: <Widget>[
              PopupMenuButton<bool>(
                onSelected: (res) {
                  bloc.changeTheme(res);
                  _setPref(res);
                  setState(() {
                    if (_themeType == 'Dark Theme') {
                      _themeType = 'Light Theme';
                    } else {
                      _themeType = 'Dark Theme';
                    }
                  });
                },
                itemBuilder: (context) {
                  return <PopupMenuEntry<bool>>[
                    PopupMenuItem<bool>(
                      value: !widget.darkThemeEnabled,
                      child: Text(_themeType),
                    )
                  ];
                },
              )
            ],
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.format_list_numbered_rtl),
              ),
              Tab(
                icon: Icon(Icons.playlist_add_check),
              )
            ]),
          ), //AppBar
          body: TabBarView(children: [
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getInCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Text("Loading");
                        } else {
                          if (snapshot.data.length < 1) {
                            return Center(
                              child: Text(
                                'No Tasks Added',
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return new GestureDetector(
                                    onTap: () {
                                      if (snapshot.data[position].status !=
                                          "Task Completed")
                                        navigateToTask(snapshot.data[position],
                                            "Edit Task", this);
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(1.0),
                                      elevation: 2.0,
                                      child: CustomWidget(
                                        title: snapshot.data[position].task,
                                        sub1: snapshot.data[position].date,
                                        sub2: snapshot.data[position].time,
                                        status: snapshot.data[position].status,
                                        delete:
                                            snapshot.data[position].status ==
                                                    "Task Completed"
                                                ? IconButton(
                                                    icon: Icon(Icons.delete),
                                                    onPressed: null,
                                                  )
                                                : Container(),
                                        trailing: Icon(
                                          Icons.edit,
                                          color: Theme.of(context).primaryColor,
                                          size: 28,
                                        ),
                                      ),
                                    ) //Card
                                    );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ), //Container
            new Container(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: FutureBuilder(
                      future: databaseHelper.getCompleteTaskList(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Text("Loading");
                        } else {
                          if (snapshot.data.length < 1) {
                            return Center(
                              child: Text(
                                'No Tasks Completed',
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return new GestureDetector(
                                    onTap: () {
                                      if (snapshot.data[position].status !=
                                          "Task Completed")
                                        navigateToTask(snapshot.data[position],
                                            "Edit Task", this);
                                    },
                                    child: Card(
                                      margin: EdgeInsets.all(1.0),
                                      elevation: 2.0,
                                      child: CustomWidget(
                                          title: snapshot.data[position].task,
                                          sub1: snapshot.data[position].date,
                                          sub2: snapshot.data[position].time,
                                          status:
                                              snapshot.data[position].status,
                                          delete: snapshot
                                                      .data[position].status ==
                                                  "Task Completed"
                                              ? IconButton(
                                                  icon: Icon(Icons.delete,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 28),
                                                  onPressed: () {
                                                    delete(snapshot
                                                        .data[position].id);
                                                  },
                                                )
                                              : Container(),
                                          trailing: Container()
//                                    Icon(
//                                          Icons.edit,
//                                          color: Theme.of(context).primaryColor,
//                                          size: 28,
//                                        ),
                                          ),
                                    ) //Card
                                    );
                              });
                        }
                      },
                    ),
                  )
                ],
              ),
            ), //Container
          ]),
          floatingActionButton: FloatingActionButton(
              tooltip: "Add Task",
              child: Icon(Icons.add),
              onPressed: () {
                navigateToTask(Task('', '', '', ''), "Add Task", this);
              }), //FloatingActionButton
        ));
  } //build()

  void navigateToTask(Task task, String title, todo_state obj) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new_task(task, title, obj)),
    );
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = databaseHelper.getTaskList();
      taskListFuture.then((taskList) {
        setState(() {
          this.taskList = taskList;
          this.count = taskList.length;
        });
      });
    });
  } //updateListView()

  void delete(int id) async {
    await databaseHelper.deleteTask(id);
    updateListView();
    //Navigator.pop(context);
    utility.showSnackBar(homeScaffold, 'Task Deleted Successfully');
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (context, snap) {
//         if (snap.hasData == null) {
//           return Center(
//             child: Text(
//               "No Data",
//             ),
//           );
//         } else {
//           if (myitems.length == 0) {
//             return Scaffold(
//               floatingActionButton: FloatingActionButton(
//                 onPressed: showalertdialog,
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: Colors.amberAccent[700],
//                 elevation: 5,
//               ),
//               floatingActionButtonLocation:
//                   FloatingActionButtonLocation.centerFloat,
// //APPBAR 1

//               appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(190),
//                   child: AppBar(
//                     backgroundColor: Colors.white,
//                     elevation: 0,
//                     title: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 newDt,
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 40,
//                                   color: const Color(0xff9b8fb1),
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Text("Day 1",
//                                   style: TextStyle(
//                                     fontFamily: 'Protipo Compact',
//                                     fontSize: 40,
//                                     color: const Color(0xff9b8fb1),
//                                     fontWeight: FontWeight.w300,
//                                   ))
//                             ]),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(newDt1,
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 35,
//                                   color: const Color(0xffbadfca),
//                                   fontWeight: FontWeight.w200,
//                                 )),
//                             Container(
//                               child: FutureBuilder<WeatherModel>(
//                                 future: getWeather(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasData) {
//                                     WeatherModel model = snapshot.data;
//                                     return Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Text(
//                                           '${model.main.temp.round()} ˚C',
//                                           style: TextStyle(
//                                             fontFamily: 'Protipo Compact',
//                                             fontSize: 35,
//                                             color: const Color(0xffbadfca),
//                                             fontWeight: FontWeight.w200,
//                                           ),
//                                         )
//                                       ],
//                                     );
//                                   } else if (snapshot.hasError)
//                                     return Text(
//                                       '${snapshot.error}',
//                                       style: TextStyle(
//                                           fontSize: 30,
//                                           color: Colors.red,
//                                           fontFamily: 'Protipo Compact'),
//                                     );
//                                   return CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Upcoming Tasks',
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 34,
//                                   color: const Color(0xff9b8fb1),
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               )
//                             ]),
//                         SizedBox(
//                           height: 20,
//                         )
//                       ],
//                     ),
//                     toolbarHeight: toolbarHeight,
//                   )),
//               backgroundColor: Colors.white,
//               body: Center(
//                 child: Text(
//                   "No Tasks Added",
//                   style: TextStyle(fontFamily: "Raleway", fontSize: 20.0),
//                 ),
//               ),
//             );
//           } else {
//             return Scaffold(
//               floatingActionButton: FloatingActionButton(
//                 onPressed: showalertdialog,
//                 child: Icon(
//                   Icons.add,
//                   color: Colors.white,
//                 ),
//                 backgroundColor: Colors.amberAccent[700],
//                 elevation: 5,
//               ),
//               floatingActionButtonLocation:
//                   FloatingActionButtonLocation.centerFloat,
// //APPBAR 2

//               appBar: PreferredSize(
//                   preferredSize: Size.fromHeight(190.0),
//                   child: AppBar(
//                     backgroundColor: Colors.white,
//                     elevation: 0,
//                     title: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 newDt,
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 40,
//                                   color: const Color(0xff9b8fb1),
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                               Text("Day 1",
//                                   style: TextStyle(
//                                     fontFamily: 'Protipo Compact',
//                                     fontSize: 40,
//                                     color: const Color(0xff9b8fb1),
//                                     fontWeight: FontWeight.w300,
//                                   ))
//                             ]),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(newDt1,
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 35,
//                                   color: const Color(0xffbadfca),
//                                   fontWeight: FontWeight.w200,
//                                 )),
//                             Container(
//                               child: FutureBuilder<WeatherModel>(
//                                 future: getWeather(),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.hasData) {
//                                     WeatherModel model = snapshot.data;
//                                     return Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         Text(
//                                           '${model.main.temp.round()} ˚C',
//                                           style: TextStyle(
//                                             fontFamily: 'Protipo Compact',
//                                             fontSize: 35,
//                                             color: const Color(0xffbadfca),
//                                             fontWeight: FontWeight.w200,
//                                           ),
//                                         )
//                                       ],
//                                     );
//                                   } else if (snapshot.hasError)
//                                     return Text(
//                                       '${snapshot.error}',
//                                       style: TextStyle(
//                                           fontSize: 30,
//                                           color: Colors.red,
//                                           fontFamily: 'Protipo Compact'),
//                                     );
//                                   return CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 25,
//                         ),
//                         Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Upcoming Tasks',
//                                 style: TextStyle(
//                                   fontFamily: 'Protipo Compact',
//                                   fontSize: 34,
//                                   color: const Color(0xff9b8fb1),
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               )
//                             ]),
//                         SizedBox(
//                           height: 20,
//                         )
//                       ],
//                     ),
//                     toolbarHeight: toolbarHeight,
//                   )),
//               backgroundColor: Colors.white,
//               body: SingleChildScrollView(
//                 child: Column(
//                   children: children,
//                 ),
//               ),
//             );
//           }
//         }
//       },
//       future: query(),
//     );
//   }
// }
