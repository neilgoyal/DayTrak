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
<<<<<<< HEAD
      bottomNavigationBar: CustomNavigationBar(
      isFloating: false,
      scaleFactor: 0.3,
      iconSize: 30.0,
      elevation: 3,
      selectedColor: Colors.amber,
      strokeColor: Colors.white,
      // bubbleCurve: Curves.easeOutExpo,
      // scaleCurve: Curves.easeOutExpo,
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
=======
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
>>>>>>> f2b31297ee602a2b6aab300061414c73d9f004ea
        setState(() {
          _currentIndex = value;
          _tabController.index = _currentIndex;
        });
      },
<<<<<<< HEAD
    )
=======
      icons: [Icons.home_filled, Icons.access_time, Icons.settings],
      textStyle: TextStyle(color: Colors.black),
>>>>>>> f2b31297ee602a2b6aab300061414c73d9f004ea
    );
  }

 

  
}
