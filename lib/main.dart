import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';
import 'package:schoolcalendar/firstopenpages/fp3.dart';
import 'pages/home.dart';
import 'pages/settings.dart';
import 'pages/timetable.dart';
import 'package:schoolcalendar/globals.dart' as globals;

void main() {
  runApp(MyApp());
}

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

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius + 2);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    TimetablePage(),
    SettingsPage(),
    Fp1Page(),
    Fp2Page(),
    Fp3Page(),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    globals.h1 = width * 0.115;
    globals.h2 = width * 0.1;
    globals.h3 = width * 0.09;
    globals.h4 = width * 0.079;
    globals.h5 = width * 0.069;
    globals.h6 = width * 0.065;
    globals.h7 = width * 0.06;
    globals.h8 = width * 0.055;
    globals.h9 = width * 0.05;
    globals.h10 = width * 0.045;

    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
          margin: EdgeInsets.only(bottom: 15),
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  CupertinoIcons.house,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.list_dash,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.settings_solid,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.phone,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.phone,
                  size: 35,
                ),
              ),
              Tab(
                icon: Icon(
                  CupertinoIcons.phone,
                  size: 35,
                ),
              ),
            ],
            unselectedLabelColor: Color.fromRGBO(150, 150, 150, 1),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            indicator:
                CircleTabIndicator(color: const Color(0xffbadfca), radius: 3.5),
            // indicator:
            //     CircleTabIndicator(color: Colors.transparent, radius: 3.5),
            enableFeedback: true,
          ),
        ),
      ),
    );
  }
}
