import 'dart:ui';

class Constants {
  Constants._();
  static const int HOME_CHARACTER_COUNT = 5;
  static const int TRAVEL_STATUS = 3;
  static const int FINAL_STATUS = 6;
  static const int DIARY_STATUS_COUNT = 5;
  static const double BORDER_WIDTH = 2;
  static const double SHADOW_WIDTH = 3;
  static const Offset SHADOW_OFFSET = Offset(SHADOW_WIDTH, SHADOW_WIDTH);
  static const Offset INNER_SHADOW_OFFSET =
      Offset(SHADOW_WIDTH + 1, SHADOW_WIDTH + 1);
  static const double FILLET = 10;
  static const String CHARACTER_IMAGE_FORMAT = '.svg';
  static const double BODY_WIDTH_PADDING_PERCENT = 0.0611;
  static const double BODY_HEIGHT_PADDING_PERCENT = 0.01621;
  static const double CHARACTER_IMAGE_HEIGHT_PERCENT = 0.14864;
}
