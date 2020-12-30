import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class Component11 extends StatelessWidget {
  Component11({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromSize(
          bounds: Rect.fromLTWH(0.0, 0.0, 338.0, 287.0),
          size: Size(338.0, 287.0),
          pinLeft: true,
          pinRight: true,
          pinTop: true,
          pinBottom: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.0),
              gradient: LinearGradient(
                begin: Alignment(-1.0, -1.0),
                end: Alignment(1.0, 0.79),
                colors: [const Color(0xbfd270aa), const Color(0xbfd99175)],
                stops: [0.0, 1.0],
              ),
              border: Border.all(width: 1.0, color: const Color(0xbf707070)),
            ),
          ),
        ),
      ],
    );
  }
}
