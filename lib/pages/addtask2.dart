import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart';
import '/Provider/theme_provider.dart';
import '../database.dart';

class TechBorder extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderWidth, leftBorderLength, rightBorderLength;
  TechBorder({
    required this.child,
    required this.borderColor,
    required this.borderWidth,
    required this.leftBorderLength,
    required this.rightBorderLength,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: borderColor, width: borderWidth),
                  right: BorderSide(color: borderColor, width: borderWidth)),
              color: Colors.transparent),
        ),
        Container(
            color: Colors.transparent,
            child: Stack(children: [
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      color: borderColor,
                      width: leftBorderLength,
                      height: borderWidth)),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      color: borderColor,
                      width: leftBorderLength,
                      height: borderWidth)),
              Positioned(
                  right: 0,
                  child: Container(
                      color: borderColor,
                      width: rightBorderLength,
                      height: borderWidth)),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      color: borderColor,
                      width: rightBorderLength,
                      height: borderWidth)),
            ])),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: child,
        )
      ],
    );
  }
}

class Addtask2Page extends StatefulWidget {
  @override
  _Addtask2State createState() => _Addtask2State();
}

class _Addtask2State extends State<Addtask2Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
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
// }
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
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    separatorBuilder: (context, index) => Divider(
                      indent: 50,
                      color: Colors.grey.shade600,
                      thickness: 1.5,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var tasks = snapshot.data!.docs[index];
                      // ignore: unused_local_variable
                      String docID = snapshot.data!.docs[index].id;
                      String title = tasks['title'];
                      String description = tasks['date'];
                      return Ink(
                        child: ListTile(
                          horizontalTitleGap: 7,
                          minLeadingWidth: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          leading:
                              Icon(CupertinoIcons.check_mark_circled, size: 30),
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
          Divider(
            thickness: 1.5,
            indent: 60,
            endIndent: 10,
            color: Colors.grey.shade600,
          )
        ]),
      ),
    );
  }
}
