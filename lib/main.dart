import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
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
            ],
            unselectedLabelColor: Color.fromRGBO(150, 150, 150, 1),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            // indicator: CircleTabIndicator(color: const Color(0xffbadfca), radius: 3.5),
            indicator:
                CircleTabIndicator(color: Colors.transparent, radius: 3.5),
            enableFeedback: true,
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/rendering.dart';
// import 'pages/home.dart';
// import 'pages/settings.dart';
// import 'pages/timetable.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'School planner',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final BorderRadius _borderRadius = const BorderRadius.only(
//     topLeft: Radius.circular(25),
//     topRight: Radius.circular(25),
//   );

//   ShapeBorder bottomBarShape = const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(25)),
//   );
//   SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
//   EdgeInsets padding = const EdgeInsets.all(12);

//   int _selectedItemPosition = 0;
//   SnakeShape snakeShape = SnakeShape.circle;

//   bool showSelectedLabels = false;
//   bool showUnselectedLabels = false;

//   Color selectedColor = Colors.black;
//   Gradient selectedGradient =
//       const LinearGradient(colors: [Colors.red, Colors.amber]);

//   Color unselectedColor = Colors.blueGrey;
//   Gradient unselectedGradient =
//       const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

//   Color containerColor;
//   List<Color> containerColors = [
//     const Color(0xFFFDE1D7),
//     const Color(0xFFE4EDF5),
//     const Color(0xFFE7EEED),
//     const Color(0xFFF4E4CE),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         onPageChanged: _onPageChanged,
//         children: <Widget>[
//           HomePage(),
//           TimetablePage(),
//           SettingsPage(),
//         ],
//       ),
//       bottomNavigationBar: SnakeNavigationBar.color(
//         behaviour: snakeBarStyle,
//         snakeShape: snakeShape,
//         shape: bottomBarShape,
//         padding: padding,
//         snakeViewColor: selectedColor,
//         selectedItemColor:
//             snakeShape == SnakeShape.indicator ? selectedColor : null,
//         unselectedItemColor: Colors.blueGrey,
//         showUnselectedLabels: showUnselectedLabels,
//         showSelectedLabels: showSelectedLabels,
//         currentIndex: _selectedItemPosition,
//         onTap: (index) => setState(() => _selectedItemPosition = index),
//         items: [
//           const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.access_time), label: 'Timetable'),
//           const BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//         selectedLabelStyle: const TextStyle(fontSize: 14),
//         unselectedLabelStyle: const TextStyle(fontSize: 10),
//       ),
//     );
//   }

//   void _onPageChanged(int page) {
//     containerColor = containerColors[page];
//     switch (page) {
//       case 0:
//         setState(() {
//           snakeBarStyle = SnakeBarBehaviour.floating;
//           snakeShape = SnakeShape.circle;
//           padding = const EdgeInsets.all(12);
//           bottomBarShape =
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25));
//           showSelectedLabels = false;
//           showUnselectedLabels = false;
//         });
//         break;
//       case 1:
//         setState(() {
//           snakeBarStyle = SnakeBarBehaviour.pinned;
//           snakeShape = SnakeShape.circle;
//           padding = EdgeInsets.zero;
//           bottomBarShape = RoundedRectangleBorder(borderRadius: _borderRadius);
//           showSelectedLabels = false;
//           showUnselectedLabels = false;
//         });
//         break;

//       case 2:
//         setState(() {
//           snakeBarStyle = SnakeBarBehaviour.pinned;
//           snakeShape = SnakeShape.rectangle;
//           padding = EdgeInsets.zero;
//           bottomBarShape = BeveledRectangleBorder(borderRadius: _borderRadius);
//           showSelectedLabels = true;
//           showUnselectedLabels = true;
//         });
//         break;
//       case 3:
//         setState(() {
//           snakeBarStyle = SnakeBarBehaviour.pinned;
//           snakeShape = SnakeShape.indicator;
//           padding = EdgeInsets.zero;
//           bottomBarShape = null;
//           showSelectedLabels = false;
//           showUnselectedLabels = false;
//         });
//         break;
//     }
//   }
// }

// class PagerPageWidget extends StatelessWidget {
//   final String text;
//   final String description;
//   final Image image;
//   final TextStyle titleStyle =
//       const TextStyle(fontSize: 40, fontFamily: 'SourceSerifPro');
//   final TextStyle subtitleStyle = const TextStyle(
//     fontSize: 20,
//     fontFamily: 'Ubuntu',
//     fontWeight: FontWeight.w200,
//   );

//   const PagerPageWidget({
//     Key key,
//     this.text,
//     this.description,
//     this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       child: SafeArea(
//         child: OrientationBuilder(builder: (context, orientation) {
//           return orientation == Orientation.portrait
//               ? _portraitWidget()
//               : _horizontalWidget(context);
//         }),
//       ),
//     );
//   }

//   Widget _portraitWidget() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(text, style: titleStyle),
//             const SizedBox(height: 16),
//             Text(description, style: subtitleStyle),
//           ],
//         ),
//         image
//       ],
//     );
//   }

//   Widget _horizontalWidget(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Container(
//           width: MediaQuery.of(context).size.width / 2,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Text(text, style: titleStyle),
//               Text(description, style: subtitleStyle),
//             ],
//           ),
//         ),
//         Expanded(child: image)
//       ],
//     );
//   }
// }
