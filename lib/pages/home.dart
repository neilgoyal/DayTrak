import 'package:flutter/material.dart';
import 'package:schoolcalendar/addtask.dart';
import 'package:flutter/cupertino.dart';
import 'settings.dart';
import 'timetable.dart';
import 'package:schoolcalendar/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double lenght = MediaQuery.of(context).size.height;
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
    globals.s1 = width * 0.3;
    globals.s2 = width * 0.275;
    globals.s3 = width * 0.25;
    globals.s4 = width * 0.225;
    globals.s5 = width * 0.13;
    globals.w = width * 0.85;
    globals.l1 = lenght * 0.34;
    globals.l2 = lenght * 0.1;
    globals.l3 = lenght * 0.75;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: [
            Addtask1(),
            TimetablePage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromRGBO(250, 250, 250, 1),
          ),
          margin: EdgeInsets.only(bottom: 15),
          child: TabBar(
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
            ],
            unselectedLabelColor: Color.fromRGBO(150, 150, 150, 1),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            indicator:
                CircleTabIndicator(color: const Color(0xffbadfca), radius: 3.5),
          ),
        ),
      ),
    );
  }
}
