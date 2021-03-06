import 'package:flutter/material.dart';

import '../constants.dart';

class ListBubble0 extends CustomPainter {
  final Color color;

  ListBubble0(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path = Path();
    path.moveTo(size.width * 0.86, 0);
    path.cubicTo(
        size.width * 0.86, 0, size.width * 0.1, 0, size.width * 0.1, 0);
    path.cubicTo(
        size.width * 0.05, 0, 0, size.height * 0.13, 0, size.height * 0.3);
    path.cubicTo(
        0, size.height * 0.3, 0, size.height * 0.64, 0, size.height * 0.64);
    path.cubicTo(0, size.height * 0.74, size.width * 0.03, size.height * 0.82,
        size.width * 0.06, size.height * 0.82);
    path.cubicTo(size.width * 0.06, size.height * 0.82, size.width * 0.09,
        size.height * 0.82, size.width * 0.09, size.height * 0.82);
    path.cubicTo(size.width * 0.09, size.height * 0.82, size.width * 0.12,
        size.height * 0.82, size.width * 0.13, size.height * 0.82);
    path.cubicTo(size.width * 0.16, size.height * 0.83, size.width * 0.16,
        size.height * 0.85, size.width * 0.17, size.height * 0.86);
    path.cubicTo(size.width * 0.19, size.height * 0.9, size.width / 5,
        size.height * 0.95, size.width * 0.23, size.height * 0.98);
    path.cubicTo(size.width * 0.25, size.height, size.width / 4, size.height,
        size.width / 4, size.height);
    path.cubicTo(size.width * 0.26, size.height, size.width * 0.27, size.height,
        size.width * 0.26, size.height);
    path.cubicTo(size.width * 0.28, size.height * 0.99, size.width * 0.27,
        size.height * 0.94, size.width * 0.27, size.height * 0.94);
    path.cubicTo(size.width * 0.27, size.height * 0.94, size.width / 4,
        size.height * 0.82, size.width * 0.27, size.height * 0.82);
    path.cubicTo(size.width * 0.27, size.height * 0.82, size.width * 0.87,
        size.height * 0.82, size.width * 0.87, size.height * 0.82);
    path.cubicTo(size.width * 0.94, size.height * 0.82, size.width,
        size.height * 0.65, size.width, size.height * 0.44);
    path.cubicTo(size.width, size.height * 0.44, size.width, size.height * 0.42,
        size.width, size.height * 0.42);
    path.cubicTo(size.width, size.height * 0.19, size.width * 0.94, 0,
        size.width * 0.86, 0);
    path.cubicTo(
        size.width * 0.86, 0, size.width * 0.86, 0, size.width * 0.86, 0);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ListBubble1 extends CustomPainter {
  final Color color;

  ListBubble1(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path = Path();
    path.moveTo(size.width * 0.92, 0);
    path.cubicTo(
        size.width * 0.92, 0, size.width * 0.12, 0, size.width * 0.12, 0);
    path.cubicTo(size.width * 0.07, 0, size.width * 0.06, size.height * 0.07,
        size.width * 0.05, size.height * 0.15);
    path.cubicTo(size.width * 0.05, size.height * 0.15, 0, size.height * 0.51,
        0, size.height * 0.64);
    path.cubicTo(0, size.height * 0.74, size.width * 0.03, size.height * 0.82,
        size.width * 0.06, size.height * 0.82);
    path.cubicTo(size.width * 0.06, size.height * 0.82, size.width * 0.73,
        size.height * 0.82, size.width * 0.73, size.height * 0.82);
    path.cubicTo(size.width * 0.73, size.height * 0.82, size.width * 0.73,
        size.height * 0.82, size.width * 0.73, size.height * 0.82);
    path.cubicTo(size.width * 0.73, size.height * 0.82, size.width * 0.75,
        size.height * 0.82, size.width * 0.75, size.height * 0.82);
    path.cubicTo(size.width * 0.77, size.height * 0.82, size.width * 0.79,
        size.height * 0.87, size.width * 0.79, size.height * 0.94);
    path.cubicTo(size.width * 0.79, size.height, size.width * 0.8, size.height,
        size.width * 0.81, size.height);
    path.cubicTo(size.width * 0.83, size.height * 0.99, size.width * 0.84,
        size.height * 0.93, size.width * 0.84, size.height * 0.94);
    path.cubicTo(size.width * 0.85, size.height * 0.9, size.width * 0.86,
        size.height * 0.88, size.width * 0.87, size.height * 0.86);
    path.cubicTo(size.width * 0.88, size.height * 0.84, size.width * 0.89,
        size.height * 0.83, size.width * 0.9, size.height * 0.825);
    path.cubicTo(size.width * 0.91, size.height * 0.82, size.width * 0.92,
        size.height * 0.82, size.width * 0.92, size.height * 0.82);
    path.cubicTo(size.width * 0.92, size.height * 0.82, size.width * 0.95,
        size.height * 0.82, size.width * 0.95, size.height * 0.82);
    path.cubicTo(size.width * 0.98, size.height * 0.82, size.width,
        size.height * 0.76, size.width, size.height * 0.68);
    path.cubicTo(size.width, size.height * 0.68, size.width, size.height * 0.23,
        size.width, size.height * 0.23);
    path.cubicTo(size.width, size.height * 0.1, size.width * 0.96, 0,
        size.width * 0.92, 0);
    path.cubicTo(
        size.width * 0.92, 0, size.width * 0.92, 0, size.width * 0.92, 0);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ListBubble2 extends CustomPainter {
  final Color color;

  ListBubble2(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path = Path();
    path.moveTo(size.width, size.height * 0.62);
    path.cubicTo(size.width, size.height * 0.51, size.width * 0.96,
        size.height * 0.19, size.width * 0.96, size.height * 0.19);
    path.cubicTo(size.width * 0.95, size.height * 0.11, size.width * 0.93, 0,
        size.width * 0.9, 0);
    path.cubicTo(
        size.width * 0.9, 0, size.width * 0.13, 0, size.width * 0.13, 0);
    path.cubicTo(
        size.width * 0.06, 0, 0, size.height * 0.17, 0, size.height * 0.38);
    path.cubicTo(
        0, size.height * 0.38, 0, size.height * 0.44, 0, size.height * 0.44);
    path.cubicTo(0, size.height * 0.63, size.width * 0.05, size.height * 0.8,
        size.width * 0.12, size.height * 0.82);
    path.cubicTo(size.width * 0.15, size.height * 0.84, size.width * 0.16,
        size.height * 0.85, size.width * 0.17, size.height * 0.87);
    path.cubicTo(size.width * 0.19, size.height * 0.9, size.width / 5,
        size.height * 0.95, size.width * 0.23, size.height * 0.98);
    path.cubicTo(size.width * 0.24, size.height, size.width / 4, size.height,
        size.width / 4, size.height);
    path.cubicTo(size.width * 0.28, size.height, size.width * 0.27,
        size.height * 0.94, size.width * 0.27, size.height * 0.94);
    path.cubicTo(size.width * 0.27, size.height * 0.94, size.width / 4,
        size.height * 0.82, size.width * 0.27, size.height * 0.82);
    path.cubicTo(size.width * 0.27, size.height * 0.82, size.width * 0.93,
        size.height * 0.82, size.width * 0.93, size.height * 0.82);
    path.cubicTo(size.width * 0.97, size.height * 0.82, size.width,
        size.height * 0.73, size.width, size.height * 0.62);
    path.cubicTo(size.width, size.height * 0.62, size.width, size.height * 0.62,
        size.width, size.height * 0.62);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ListBubble3 extends CustomPainter {
  final Color color;

  ListBubble3(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(size.width * 0.92, 0);
    path.cubicTo(
        size.width * 0.92, 0, size.width * 0.08, 0, size.width * 0.08, 0);
    path.cubicTo(
        size.width * 0.04, 0, 0, size.height * 0.11, 0, size.height * 0.24);
    path.cubicTo(
        0, size.height * 0.24, 0, size.height * 0.57, 0, size.height * 0.57);
    path.cubicTo(0, size.height * 0.71, size.width * 0.04, size.height * 0.82,
        size.width * 0.08, size.height * 0.82);
    path.cubicTo(size.width * 0.08, size.height * 0.82, size.width * 0.73,
        size.height * 0.82, size.width * 0.73, size.height * 0.82);
    path.cubicTo(size.width * 0.73, size.height * 0.82, size.width * 0.73,
        size.height * 0.82, size.width * 0.73, size.height * 0.82);
    path.cubicTo(size.width * 0.73, size.height * 0.82, size.width * 0.75,
        size.height * 0.82, size.width * 0.75, size.height * 0.82);
    path.cubicTo(size.width * 0.77, size.height * 0.82, size.width * 0.79,
        size.height * 0.87, size.width * 0.79, size.height * 0.94);
    path.cubicTo(size.width * 0.79, size.height, size.width * 0.8, size.height,
        size.width * 0.82, size.height * 0.98);
    path.cubicTo(size.width * 0.82, size.height * 0.98, size.width * 0.84,
        size.height * 0.93, size.width * 0.84, size.height * 0.93);
    path.cubicTo(size.width * 0.85, size.height * 0.9, size.width * 0.86,
        size.height * 0.88, size.width * 0.87, size.height * 0.865);
    path.cubicTo(size.width * 0.88, size.height * 0.85, size.width * 0.89,
        size.height * 0.84, size.width * 0.9, size.height * 0.83);
    path.cubicTo(size.width * 0.91, size.height * 0.82, size.width * 0.92,
        size.height * 0.82, size.width * 0.92, size.height * 0.82);
    path.cubicTo(size.width * 0.92, size.height * 0.82, size.width * 0.92,
        size.height * 0.82, size.width * 0.92, size.height * 0.82);
    path.cubicTo(size.width * 0.97, size.height * 0.82, size.width,
        size.height * 0.72, size.width, size.height * 0.59);
    path.cubicTo(size.width, size.height * 0.59, size.width, size.height * 0.24,
        size.width, size.height * 0.24);
    path.cubicTo(size.width, size.height * 0.11, size.width * 0.96, 0,
        size.width * 0.92, 0);
    path.cubicTo(
        size.width * 0.92, 0, size.width * 0.92, 0, size.width * 0.92, 0);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainBubble0 extends CustomPainter {
  final Color color;

  MainBubble0(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(size.width * 0.05, size.height * 0.04);
    path.cubicTo(size.width * 0.05, size.height * 0.04, size.width * 0.07, 0,
        size.width * 0.1, 0);
    path.cubicTo(
        size.width * 0.82, 0, size.width * 0.84, 0, size.width * 0.86, 0);
    path.cubicTo(
        size.width * 0.93, 0, size.width, 0, size.width, size.height / 5);
    path.cubicTo(size.width, size.height * 0.7, size.width, size.height * 0.63,
        size.width, size.height * 0.66);
    path.cubicTo(size.width, size.height * 0.81, size.width * 0.93,
        size.height * 0.8, size.width * 0.9, size.height * 0.84);
    path.cubicTo(size.width * 0.88, size.height * 0.86, size.width * 0.87,
        size.height * 0.92, size.width * 0.86, size.height * 0.97);
    path.cubicTo(size.width * 0.84, size.height * 1.03, size.width * 0.84,
        size.height * 0.97, size.width * 0.83, size.height * 0.93);
    path.cubicTo(size.width * 0.81, size.height * 0.86, size.width * 0.79,
        size.height * 0.84, size.width * 0.76, size.height * 0.84);
    path.cubicTo(size.width * 0.19, size.height * 0.84, size.width * 0.11,
        size.height * 0.85, size.width * 0.09, size.height * 0.83);
    path.cubicTo(size.width * 0.07, size.height * 0.82, size.width * 0.04,
        size.height * 0.81, size.width * 0.02, size.height * 0.71);
    path.cubicTo(
        0, size.height * 0.63, 0, size.height * 0.54, 0, size.height * 0.41);
    path.cubicTo(0, size.height * 0.17, size.width * 0.01, size.height * 0.12,
        size.width * 0.05, size.height * 0.04);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainBubble1 extends CustomPainter {
  final Color color;

  MainBubble1(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path = Path();
    path.moveTo(size.width * 0.43, size.height * 0.81);
    path.cubicTo(size.width * 0.49, size.height * 0.81, size.width * 0.49,
        size.height, size.width * 0.51, size.height);
    path.cubicTo(size.width * 0.54, size.height, size.width * 0.51,
        size.height * 0.81, size.width * 0.58, size.height * 0.81);
    path.cubicTo(size.width * 0.58, size.height * 0.81, size.width * 0.93,
        size.height * 0.81, size.width * 0.93, size.height * 0.81);
    path.cubicTo(size.width * 0.97, size.height * 0.81, size.width,
        size.height * 0.74, size.width, size.height * 0.64);
    path.cubicTo(size.width, size.height * 0.64, size.width, size.height * 0.17,
        size.width, size.height * 0.17);
    path.cubicTo(size.width, size.height * 0.07, size.width * 0.97, 0,
        size.width * 0.93, 0);
    path.cubicTo(
        size.width * 0.93, 0, size.width * 0.09, 0, size.width * 0.09, 0);
    path.cubicTo(size.width * 0.06, 0, size.width * 0.03, size.height * 0.06,
        size.width * 0.03, size.height * 0.14);
    path.cubicTo(size.width * 0.03, size.height * 0.14, 0, size.height * 0.62,
        0, size.height * 0.62);
    path.cubicTo(0, size.height * 0.72, size.width * 0.03, size.height * 0.81,
        size.width * 0.07, size.height * 0.81);
    path.cubicTo(size.width * 0.07, size.height * 0.81, size.width * 0.43,
        size.height * 0.81, size.width * 0.43, size.height * 0.81);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainBubble2 extends CustomPainter {
  final Color color;

  MainBubble2(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path = Path();
    path.moveTo(size.width * 0.83, 0);
    path.cubicTo(size.width * 0.88, 0, size.width * 0.93, -0.01,
        size.width * 0.96, size.height * 0.06);
    path.cubicTo(size.width, size.height * 0.13, size.width, size.height * 0.19,
        size.width, size.height * 0.31);
    path.cubicTo(size.width, size.height * 0.35, size.width, size.height * 0.51,
        size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.64, size.width, size.height * 0.69,
        size.width * 0.98, size.height * 0.75);
    path.cubicTo(size.width * 0.97, size.height * 0.79, size.width * 0.95,
        size.height * 0.82, size.width * 0.93, size.height * 0.84);
    path.cubicTo(size.width * 0.92, size.height * 0.85, size.width * 0.9,
        size.height * 0.86, size.width * 0.88, size.height * 0.86);
    path.cubicTo(size.width * 0.88, size.height * 0.86, size.width / 5,
        size.height * 0.86, size.width / 5, size.height * 0.86);
    path.cubicTo(size.width * 0.14, size.height * 0.86, size.width / 5,
        size.height, size.width * 0.18, size.height);
    path.cubicTo(size.width * 0.15, size.height, size.width * 0.13,
        size.height * 0.93, size.width * 0.1, size.height * 0.9);
    path.cubicTo(size.width * 0.07, size.height * 0.86, 0, size.height * 0.8, 0,
        size.height * 0.59);
    path.cubicTo(0, size.height * 0.32, 0, size.height / 5, 0, size.height / 5);
    path.cubicTo(
        0, size.height / 5, size.width * 0.001, 0, size.width * 0.1, 0);
    path.cubicTo(size.width * 0.13, 0, size.width * 0.16, 0, size.width / 5, 0);
    path.cubicTo(size.width / 4, 0, size.width * 0.31, 0, size.width * 0.36, 0);
    path.cubicTo(
        size.width * 0.42, 0, size.width * 0.49, 0, size.width * 0.55, 0);
    path.cubicTo(
        size.width * 0.6, 0, size.width * 0.65, 0, size.width * 0.69, 0);
    path.cubicTo(
        size.width * 0.72, 0, size.width * 0.75, 0, size.width * 0.77, 0);
    path.cubicTo(
        size.width * 0.79, 0, size.width * 0.81, 0, size.width * 0.83, 0);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MainSmallBubble extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = Constants.BORDER_WIDTH;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(size.width / 4, size.height * 0.02);
    path.cubicTo(size.width / 4, size.height * 0.02, size.width * 0.9,
        size.height * 0.02, size.width * 0.9, size.height * 0.02);
    path.cubicTo(size.width * 0.9, size.height * 0.02, size.width * 0.98,
        size.height * 0.04, size.width, size.height * 0.14);
    path.cubicTo(size.width, size.height * 0.75, size.width, size.height * 0.8,
        size.width, size.height * 0.8);
    path.cubicTo(size.width, size.height * 0.87, size.width * 0.98,
        size.height * 0.89, size.width * 0.95, size.height * 0.89);
    path.cubicTo(size.width * 0.94, size.height * 0.89, size.width * 0.93,
        size.height * 0.89, size.width * 0.92, size.height * 0.9);
    path.cubicTo(size.width * 0.85, size.height, size.width * 0.84,
        size.height * 1.03, size.width * 0.84, size.height * 1.02);
    path.cubicTo(size.width * 0.84, size.height, size.width * 0.85,
        size.height * 0.95, size.width * 0.84, size.height * 0.93);
    path.cubicTo(size.width * 0.83, size.height * 0.9, size.width * 0.81,
        size.height * 0.9, size.width * 0.8, size.height * 0.9);
    path.cubicTo(size.width * 0.08, size.height * 0.91, size.width * 0.06,
        size.height * 0.91, size.width * 0.04, size.height * 0.89);
    path.cubicTo(size.width * 0.02, size.height * 0.87, size.width * 0.01,
        size.height * 0.83, size.width * 0.01, size.height * 0.79);
    path.cubicTo(size.width * 0.01, size.height * 0.39, size.width * 0.02,
        size.height * 0.34, size.width * 0.02, size.height * 0.28);
    path.cubicTo(size.width * 0.02, size.height * 0.23, size.width * 0.02,
        size.height * 0.18, size.width * 0.03, size.height * 0.14);
    path.cubicTo(size.width * 0.05, size.height * 0.07, size.width * 0.08,
        size.height * 0.02, size.width * 0.13, size.height * 0.02);
    path.cubicTo(size.width * 0.13, size.height * 0.02, size.width / 4,
        size.height * 0.02, size.width / 4, size.height * 0.02);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
