import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:schoolcalendar/addtask1.dart';
import 'package:schoolcalendar/pages/home.dart';
import 'package:schoolcalendar/pages/settings.dart';
import 'package:schoolcalendar/pages/timetable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Navigation Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody for floating bar get better perfomance
      body: PageView(
        children: <Widget>[
          HomePage(),
          TimetablePage(),
          SettingsPage(),
        ],
      ),
      extendBody: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return _buildBorderRadiusDesign();
  }

  Widget _buildBorderRadiusDesign() {
    return CustomNavigationBar(
      isFloating: true,
      scaleFactor: 0.3,
      iconSize: 30.0,
      elevation: 3,
      selectedColor: Colors.amber,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Colors.white,
      borderRadius: Radius.circular(17),
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home_filled),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.access_time),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.settings),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
