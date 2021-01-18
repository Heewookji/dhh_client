import 'package:flutter/material.dart';

class RootTheme {
  static ThemeData rootThemeBuilder() {
    return ThemeData(
      primaryColor: Colors.white,
      canvasColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      fontFamily: 'NanumSquareRound',
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w900,
        ),
        headline2:
            TextStyle(fontSize: 56, fontWeight: FontWeight.w900, height: 1.4),
        headline3:
            TextStyle(fontSize: 45, fontWeight: FontWeight.w900, height: 1.4),
        headline6:
            TextStyle(fontSize: 34, fontWeight: FontWeight.w900, height: 1.4),
        subtitle1:
            TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.4),
        subtitle2:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.4),
        bodyText1:
            TextStyle(fontSize: 14, fontWeight: FontWeight.w700, height: 1.4),
        bodyText2:
            TextStyle(fontSize: 16, fontWeight: FontWeight.w900, height: 1.4),
        caption:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w700, height: 1.4),
        button: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
