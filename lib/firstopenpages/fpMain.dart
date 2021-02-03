import 'package:flutter/material.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';

class FpMain extends StatefulWidget {
  @override
  _FpMain createState() => _FpMain();
}

class _FpMain extends State<FpMain> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            Fp1Page(),
            Fp2Page(),
          ],
        ),
      ),
    ));
  }
}
