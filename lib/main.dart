import 'package:flutter/material.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:schoolcalendar/pages/home.dart';
import 'package:schoolcalendar/pages/settings.dart';
import 'package:schoolcalendar/pages/timetable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          TimetablePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return MotionTabBar(
      labels: ["Home", "TimeTable", "Settings"],
      initialSelectedTab: "Home",
      tabIconColor: Colors.black,
      tabSelectedColor: Color.fromRGBO(223, 164, 160, 1),
      onTabItemSelected: (int value) {
        setState(() {
          _currentIndex = value;
          _tabController.index = _currentIndex;
        });
      },
      icons: [Icons.home_filled, Icons.access_time, Icons.settings],
      textStyle: TextStyle(color: Colors.black),
    );
  }
}
