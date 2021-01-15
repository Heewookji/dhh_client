import 'package:flutter/material.dart';

class RootTheme {
  static ThemeData rootThemeBuilder() {
    return ThemeData(
      primaryColor: Colors.white,
      canvasColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.black,
        splashColor: Colors.white,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      fontFamily: 'NanumSquareRound',
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 64, fontWeight: FontWeight.w900),
        headline2: TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
        headline3: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
        headline6: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
        subtitle1: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
        subtitle2: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        button: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
