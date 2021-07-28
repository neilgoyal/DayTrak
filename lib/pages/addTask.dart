import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:schoolcalendar/DataBase/globals.dart' as globals;
import '/Provider/theme_provider.dart';
import 'package:schoolcalendar/DataBase/database.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

class Addtask2Page extends StatefulWidget {
  @override
  _Addtask2State createState() => _Addtask2State();
}

class _Addtask2State extends State<Addtask2Page>
    with SingleTickerProviderStateMixin {
  TextEditingController _todoTitleController = TextEditingController();
  bool validated1 = true;
  DateTime? selectedDate;
  DateTime? selectedTime;
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
  }

  selectedTodoDate(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return Container(
              child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.single,
            enablePastDates: false,
            showActionButtons: true,
            onSubmit: (Object value) {
              if (value is DateTime) {
                selectedDate = value;
                Navigator.pop(context);
              }
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ));
        });
  }

  selectedTodoTime(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: Column(children: [
                Container(
                    height:
                        MediaQuery.of(context).copyWith().size.height / 3 - 70,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime(1969, 1, 1, 4, 20),
                        minuteInterval: 1,
                        onDateTimeChanged: (DateTime newDateTime) {
                          selectedTime = newDateTime;
                        })),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CupertinoButton(
                      child: Text('OK'),
                      onPressed: () {
                        if (selectedTime == null) {
                          selectedTime = DateTime(1969, 1, 1, 4, 20);
                        }
                        if (selectedDate == null) {
                          selectedDate = DateTime.now();
                        }
                        Navigator.pop(context);
                      }),
                  CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        selectedTime = null;
                        Navigator.pop(context);
                      })
                ])
              ]));
        });
  }

  // ignore: unused_element
  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }

  void addatask() async {
    if (_todoTitleController.text.isEmpty) {
      validated1 = false;
    } else {
      await DatabaseService.addItem(
          title: _todoTitleController.text,
          time: (selectedTime != null
              ? DateFormat('hh:mm a').format(selectedTime!)
              : "No Time"),
          date: selectedDate != null
              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
              : "No Date");
      _todoTitleController.text = '';
      selectedDate = null;
      selectedTime = null;
      validated1 = true;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Reminders',
              style: TextStyle(
                fontSize: globals.h6,
              ),
            ),
          ),
          body: Column(children: [
            Flexible(
                child: StreamBuilder<QuerySnapshot>(
              stream: DatabaseService.readItems(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  if (snapshot.data!.docs.isEmpty) {
                    return Container(
                        padding:
                            EdgeInsets.only(top: 0.0, left: 12.0, right: 12.0),
                        child: Column(children: [
                          Stack(children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                child: Column(children: [
                                  SizedBox(
                                    height: globals.l5,
                                  ),
                                  SizedBox(
                                    height: globals.l4,
                                  ),
                                  SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: FlareActor("assets/book.flr",
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                        animation: "Neil"),
                                  )
                                ])),
                            Container(
                                alignment: Alignment.center,
                                child: Column(children: [
                                  SizedBox(
                                    height: globals.l4,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          size: globals.h7,
                                          color: Colors.black54,
                                        )
                                      ]),
                                  SizedBox(
                                    height: globals.h6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Click '+' to add a task",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: "Protipo Compact",
                                            fontSize: globals.h6,
                                            fontWeight: FontWeight.w200),
                                      ),
                                    ],
                                  ),
                                ]))
                          ])
                        ]));
                  } else
                    return Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var tasks = snapshot.data!.docs[index];
                          String docID = snapshot.data!.docs[index].id;
                          String title = tasks['title'];
                          String description1 =
                              concisedate(tasks['date'], tasks['time'])[0];
                          String description2 =
                              concisedate(tasks['date'], tasks['time'])[1];
                          return Ink(
                            child: Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              child: Container(
                                padding: EdgeInsets.all(0.0),
                                child: ListTile(
                                    horizontalTitleGap: 7,
                                    minLeadingWidth: 0,
                                    leading: AnimatedIconButton(
                                      size: 30,
                                      onPressed: () async {
                                        Future.delayed(
                                            Duration(milliseconds: 520),
                                            () async {
                                          HapticFeedback.heavyImpact();
                                          await DatabaseService.deleteItem(
                                              docId: docID);
                                        });
                                      },
                                      duration:
                                          const Duration(milliseconds: 370),
                                      splashColor: Colors.transparent,
                                      icons: const <AnimatedIconItem>[
                                        AnimatedIconItem(
                                          icon: Icon(CupertinoIcons.circle,
                                              color: Colors.black54),
                                        ),
                                        AnimatedIconItem(
                                          icon: Icon(
                                              CupertinoIcons.checkmark_alt,
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                      title,
                                      maxLines: 3,
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(fontSize: globals.h5),
                                    ),
                                    trailing: (concisedate(tasks['date'],
                                                tasks['time'])[0]) !=
                                            ""
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                                Text(
                                                  description1,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: globals.h10,
                                                      color: concisedate(
                                                          tasks['date'],
                                                          tasks['time'])[2]),
                                                ),
                                                if ((concisedate(tasks['date'],
                                                        tasks['time'])[1]) !=
                                                    "")
                                                  Text(
                                                    description2,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: globals.h10,
                                                        color: concisedate(
                                                            tasks['date'],
                                                            tasks['time'])[2]),
                                                  )
                                              ])
                                        : null),
                              ),
                              actions: <Widget>[],
                              secondaryActions: <Widget>[
                                Column(children: [
                                  Expanded(
                                      child: SlideAction(
                                    color: Colors.red[400],
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () async {
                                          HapticFeedback.heavyImpact();
                                          await DatabaseService.deleteItem(
                                              docId: docID);
                                        },
                                        child: Text('DELETE',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily:
                                                    'Protipo Compact'))),
                                  ))
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
          ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                HapticFeedback.heavyImpact();
                _modalBottomSheetMenu(context);
              },
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
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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
                            onSubmitted: (term) {
                              addatask();
                            },
                            controller: _todoTitleController,
                            decoration: InputDecoration(
                              hintText: "Add a Reminder",
                              errorText: validated1 ? null : "Enter a Task",
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
                                        size: globals.h4,
                                      )),
                                  Text(selectedDate != null
                                      ? DateFormat.yMMMMd()
                                          .format(selectedDate!)
                                      : ''),
                                  IconButton(
                                      onPressed: () {
                                        selectedTodoTime(context);
                                      },
                                      icon: Icon(
                                        CupertinoIcons.clock,
                                        size: globals.h4,
                                      )),
                                  Text(selectedTime != null
                                      ? DateFormat.jm().format(selectedTime!)
                                      : '')
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       CupertinoIcons.flag,
                                  //       size: h4,
                                  //     )),
                                ]),
                                Row(
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent,
                                          shadowColor: Colors.transparent,
                                        ),
                                        onPressed: () {
                                          HapticFeedback.heavyImpact();
                                          setState(() {
                                            addatask();
                                          });
                                        },
                                        child: Text('SAVE',
                                            style:
                                                TextStyle(color: Colors.black)))
                                  ],
                                )
                              ])),
                    ]));
          });
        });
  }
}
