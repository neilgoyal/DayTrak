import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    fontFamily: 'Nunito Sans',
    primaryColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(

    ),
    iconTheme: IconThemeData(color: Colors.grey.shade400, opacity: 0.8),
  ); 

  static final lightTheme = ThemeData(
    fontFamily: 'Nunito Sans',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.black, opacity: 0.8),
  );
}
