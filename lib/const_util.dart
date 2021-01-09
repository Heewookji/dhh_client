import 'dart:math';

import 'package:flutter/material.dart';

class ConstUtil {
  ConstUtil._();
  static const int HOME_CHARACTER_COUNT = 9;
  static const int TRAVEL_STATUS = 3;
  static const int FINAL_STATUS = 6;
  static const int DIARY_STATUS_COUNT = 5;

  static List<Point<double>> getCharacterLocation(Size homeSize) {
    return [
      //npc
      Point(homeSize.width * 0.1, homeSize.height * 0.05),
      Point(homeSize.width * 0.6, homeSize.height * 0.35),
      Point(homeSize.width * 0.1, homeSize.height * 0.65),
      Point(homeSize.width * 0, homeSize.height * 0.35),
      //character
      Point(homeSize.width * 0.4, homeSize.height * 0.05),
      Point(homeSize.width * 0.7, homeSize.height * 0.05),
      Point(homeSize.width * 0.3, homeSize.height * 0.35),
      Point(homeSize.width * 0.4, homeSize.height * 0.65),
      Point(homeSize.width * 0.7, homeSize.height * 0.65),
    ];
  }
}
