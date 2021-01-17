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
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MotionTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController =
        MotionTabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
              tabController.index = value;
            });
          },
          icons: [(Icons.home_filled), (Icons.access_time), (Icons.settings)],
          textStyle: TextStyle(color: Colors.black),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (drawEndDetails) {
            print(drawEndDetails);
            if (drawEndDetails.primaryVelocity > 0.0 &&
                tabController.index > 0) {
              setState(() {
                tabController.animateTo(tabController.index - 1);
                DefaultTabController.of(context)
                    .animateTo(tabController.index - 1);
              });
            } else if (drawEndDetails.primaryVelocity < 0.0 &&
                tabController.index < 2) {
              setState(() {
                tabController.animateTo(tabController.index + 1);
                DefaultTabController.of(context)
                    .animateTo(tabController.index + 1);
              });
            }
          },
          child: MotionTabBarView(
            controller: tabController,
            children: <Widget>[
              HomePage(),
              TimetablePage(),
              SettingsPage(),
            ],
          ),
        ));
  }
}
