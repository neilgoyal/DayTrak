import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../globals.dart';
import '/Provider/theme_provider.dart';
import '../database.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Addtask2Page extends StatefulWidget {
  @override
  _Addtask2State createState() => _Addtask2State();
}

class _Addtask2State extends State<Addtask2Page> {
  TextEditingController _todoTitleController = TextEditingController();
  String errtext1 = "", errtext2 = "";
  bool validated1 = true, validated2 = true;
  DateTime? selectedDate;

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
                print(selectedDate);
                Navigator.pop(context);
              }
            },
            onCancel: () {
              Navigator.pop(context);
            },
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'Reminders',
              style: TextStyle(
                fontSize: h6,
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
                } else if (snapshot.data!.docs.isEmpty) {
                  return Container(
                      padding:
                          EdgeInsets.only(top: 0.0, left: 12.0, right: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: l1,
                            ),
                            Text(
                              "You're all done!  ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Protipo Compact",
                                  fontSize: h6,
                                  fontWeight: FontWeight.w200),
                            ),
                            Icon(
                              CupertinoIcons.smiley,
                              size: h6,
                              color: Colors.black54,
                            )
                          ]));
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
                        String description = DateFormat('EEE, MMM d')
                            .format(DateTime.parse(tasks['date']));
                        // DateTime parseDate =
                        //     new DateFormat("yyyy-MM-dd").parse(description);
                        // var inputDate = DateTime.parse(parseDate.toString());
                        // var outputFormat = DateFormat('MM/dd/yyyy');
                        // var outputDate = outputFormat.format(inputDate);
                        // print(outputDate);
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
                                  color: Colors.red[400],
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      onPressed: () async {
                                        await DatabaseService.deleteItem(
                                            docId: docID);
                                      },
                                      child: Text('DELETE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Protipo Compact'))),
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
                                Text(selectedDate != null
                                    ? DateFormat.yMMMMd().format(selectedDate!)
                                    : ''),
                                // IconButton(
                                //     onPressed: () {},
                                //     icon: Icon(
                                //       CupertinoIcons.clock,
                                //       size: h4,
                                //     )),
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
                                      onPressed: () async {
                                        await DatabaseService.addItem(
                                            title: _todoTitleController.text,
                                            date: DateFormat('yyyy-MM-dd')
                                                .format(selectedDate!));
                                        _todoTitleController.text = '';
                                        Navigator.pop(context);
                                      },
                                      child: Text('SAVE',
                                          style:
                                              TextStyle(color: Colors.black)))
                                ],
                              )
                            ])),
                  ]));
        });
  }
}
