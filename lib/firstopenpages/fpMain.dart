import 'package:flutter/material.dart';
import 'package:schoolcalendar/firstopenpages/fp1.dart';
import 'package:schoolcalendar/firstopenpages/fp2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FpMain extends StatefulWidget {
  @override
  _FpMain createState() => _FpMain();
}

class _FpMain extends State<FpMain> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Fp1Page(),
        Fp2Page(),
        Container(
            child: SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: ScrollingDotsEffect(
                  activeStrokeWidth: 2.6,
                  activeDotScale: .4,
                  radius: 8,
                  spacing: 10,
                )))
      ],
    );
  }
}
