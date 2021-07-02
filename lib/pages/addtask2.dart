import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart';
import '/Provider/theme_provider.dart';
import '../database.dart';

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
            body: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                            backgroundColor: Colors.amberAccent[700],
                            onPressed: () async {
                              await DatabaseService.addItem(
                                  title: "sample", date: "test");
                            },
                            child: Icon(
                              Icons.add,
                              size: h1,
                              color: Colors.black54,
                            ))
                      ]),
                  SizedBox(
                    height: h1,
                  )
                ]))));
  }
}
