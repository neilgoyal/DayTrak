import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:schoolcalendar/globals.dart' as globals;
import '../globals.dart';
import 'package:flutter/cupertino.dart';
import '/Provider/theme_provider.dart';
import '../database.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Addtask2Page extends StatefulWidget {
  @override
  _Addtask2State createState() => _Addtask2State();
}

class _Addtask2State extends State<Addtask2Page> {
  TextEditingController _todoTitleController = TextEditingController(),
      _todoDateController = TextEditingController();
  String errtext1 = "", errtext2 = "";
  bool validated1 = true, validated2 = true;

  selectedTodoDate(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return Container(child: SfDateRangePicker());
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: Scaffold(
          appBar: AppBar(
            elevation: 2.5,
            title: Text(
              'Reminders',
              style: TextStyle(
                fontSize: h6,
              ),
            ),
          ),
          // body: Container(
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //       Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           children: [
          //             FloatingActionButton(
          //                 backgroundColor: Colors.amberAccent[700],
          //                 onPressed: () async {
          //                   await DatabaseService.addItem(
          //                       title: "sample", date: "test");
          //                 },
          //                 child: Icon(
          //                   Icons.add,
          //                   size: h1,
          //                   color: Colors.black54,
          //                 ))
          //           ]),
          //       SizedBox(
          //         height: h1,
          //       )
          //     ]))
//         ));
//   }
//
          body: Column(children: [
            Flexible(
                child: StreamBuilder<QuerySnapshot>(
              stream: DatabaseService.readItems(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var tasks = snapshot.data!.docs[index];
                        // ignore: unused_local_variable
                        String docID = snapshot.data!.docs[index].id;
                        String title = tasks['title'];
                        String description = tasks['date'];
                        return Ink(
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              child: ListTile(
                                horizontalTitleGap: 7,
                                minLeadingWidth: 0,
                                // shape: Border(
                                //   bottom: BorderSide(
                                //       color: Colors.grey, width: 1.5),
                                // ),
                                leading: Icon(CupertinoIcons.circle, size: h5),
                                title: Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: h5),
                                ),
                                trailing: Text(
                                  description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: h10),
                                ),
                              ),
                            ),
                            actions: <Widget>[],
                            secondaryActions: <Widget>[
                              Column(children: [
                                Expanded(
                                  child: SlideAction(
                                    color: Colors.grey,
                                    child: Icon(Icons.ac_unit),
                                  ),
                                )
                              ])
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.grey,
                    ),
                  ),
                );
              },
            )),
            // Divider(
            //   thickness: 1.5,
            //   indent: 60,
            //   endIndent: 10,
            //   color: Colors.grey.shade600,
            // )
          ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () => _modalBottomSheetMenu(context),
              child: Icon(Icons.add),
              backgroundColor: Colors.amberAccent[700]),
        ));
  }

  void _modalBottomSheetMenu(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      child: TextField(
                          cursorColor: Colors.black54,
                          autofocus: true,
                          controller: _todoTitleController,
                          decoration: InputDecoration(
                            hintText: "Add a Reminder",
                            errorText: validated1 ? null : errtext1,
                            fillColor: Colors.white,
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                IconButton(
                                    onPressed: () {
                                      selectedTodoDate(context);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.calendar_today,
                                      size: h4,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.clock,
                                      size: h4,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.flag,
                                      size: h4,
                                    )),
                              ]),
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () {},
                                      child: Text('SAVE',
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              )
                            ])),
                    Text("hellp", style: TextStyle(fontSize: 175)),
                  ]));
        });
  }
}
