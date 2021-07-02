import 'package:flutter/material.dart';
import 'package:schoolcalendar/globals.dart';
import '/Provider/theme_provider.dart';


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
            'Tasks',
            style: TextStyle(
              fontSize: h6,
            ),
          ),
        ),
        
      

      )

    );
  }
 
}

