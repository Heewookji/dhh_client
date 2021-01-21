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
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: 'NanumSquareRound',
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w900,
          height: 1.4,
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          height: 1.4,
          color: Colors.black,
        ),
        subtitle2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          height: 1.4,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          height: 1.4,
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 1.4,
          color: Colors.black,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 1.4,
          color: Colors.black,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
