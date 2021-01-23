import 'package:flutter/material.dart';

class CustomNavigationBarItem {
  CustomNavigationBarItem(
      {@required this.icon,
      Widget selectedIcon,
      this.title,
      Text selectedTitle,
      this.badgeCount = 0,
      this.showBadge = false})
      : selectedIcon = selectedIcon ?? icon,
        selectedTitle = selectedTitle ?? title;
  final Widget icon;
  final Widget selectedIcon;
  final Widget title;
  final Widget selectedTitle;
  final int badgeCount;
  final bool showBadge;
}
