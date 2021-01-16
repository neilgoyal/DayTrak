import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'pages/timetable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    _tabController =
        new MotionTabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Home", "TimeTable", "Settings"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.black,
          tabSelectedColor: Color.fromRGBO(223, 164, 160, 1),
          onTabItemSelected: (int value) {
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [(Icons.home_filled), (Icons.access_time), (Icons.settings)],
          textStyle: TextStyle(color: Colors.black),
        ),
        body: new Stack(
          children: <Widget>[
            MotionTabBarView(
              controller: _tabController,
              children: <Widget>[
                Container(
                  child: Center(child: HomePage()),
                ),
                Container(
                  child: Center(child: TimetablePage()),
                ),
                Container(
                  child: Center(child: SettingsPage()),
                ),
              ],
            ),
            PageView(
              children: [
                HomePage(),
                TimetablePage(),
                SettingsPage(),
              ],
            )
          ],
        ));
  }
}
