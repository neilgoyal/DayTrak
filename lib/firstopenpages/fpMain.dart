import 'package:flutter/material.dart';

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
    return PageView();
  }
}
