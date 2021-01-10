import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'pages/timetable.dart';
import 'package:flutter_svg/svg.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    TimetablePage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 15),
          child: new TabBar(
            tabs: [
              Tab(
                icon: SvgPicture.asset('assets/icons/icon_home.svg'),
              ),
              Tab(
                icon: SvgPicture.asset('assets/icons/icon_timetable.svg'),
              ),
              Tab(
                icon: SvgPicture.asset('assets/icons/icon_settings.svg'),
              ),
            ],
            unselectedLabelColor: Colors.orange,
            labelColor: Colors.black,
            indicatorColor: Colors.amberAccent[700],
          ),
        ),
      ),
    );
  }
}
