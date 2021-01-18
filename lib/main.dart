import 'package:flutter/material.dart';
import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
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
  MyHomePage({Key key}) : super(key: key);
  final titles = ['Home', 'TimeTable', 'Settings'];
  final colors = [
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  final icons = [Icons.home_filled, Icons.access_time, Icons.settings];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(initPosition: 0);
    _pageController =
        PageController(initialPage: 0, keepPage: false, viewportFraction: 1.0);
    _pageController.addListener(handlePageChange);
    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  void checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      userPageDragging = false;
    }
    if (userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
          // ignore: missing_return
          onNotification: (scrollNotification) {
            checkUserDragging(scrollNotification);
          },
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              HomePage(),
              TimetablePage(),
              SettingsPage(),
            ],
          ),
        ),
        bottomNavigationBar: BubbledNavigationBar(
          animationCurve: Curves.bounceIn,
          animationDuration: Duration(milliseconds: 800),
          controller: _menuPositionController,
          initialIndex: 0,
          itemMargin: EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: Colors.white,
          defaultBubbleColor: Color.fromRGBO(224, 163, 160, 1),
          onTap: (index) {
            _pageController.animateToPage(index,
                curve: Curves.easeInOutQuad,
                duration: Duration(milliseconds: 800));
          },
          items: widget.titles.map((title) {
            var index = widget.titles.indexOf(title);
            var color = widget.colors[index];
            return BubbledNavigationBarItem(
              icon: getIcon(index, color),
              activeIcon: getIcon(index, Colors.white),
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          }).toList(),
        ));
  }

  Padding getIcon(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Icon(widget.icons[index], size: 30, color: color),
    );
  }
}
