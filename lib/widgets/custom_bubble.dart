import 'package:flutter/material.dart';

import '../constants.dart';

class CustomBubble extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Alignment alignment;
  final EdgeInsets padding;

  CustomBubble(
    this.child, {
    this.onPressed,
    this.padding,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: alignment,
        padding: padding,
        child: SizedBox(
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
      onTap: () {
        if (onPressed != null) onPressed();
      },
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
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
    path.moveTo(size.width * 0.08, 0);
    path.cubicTo(
        size.width * 0.09, 0, size.width * 0.09, 0, size.width * 0.1, 0);
    path.cubicTo(
        size.width * 0.16, 0, size.width * 0.22, 0, size.width * 0.29, 0);
    path.cubicTo(
        size.width * 0.35, 0, size.width * 0.41, 0, size.width * 0.47, 0);
    path.cubicTo(
        size.width * 0.47, 0, size.width * 0.93, 0, size.width * 0.93, 0);
    path.cubicTo(size.width * 0.93, 0, size.width, size.height * 0.01,
        size.width, size.height / 5);
    path.cubicTo(size.width, size.height * 0.3, size.width, size.height * 0.38,
        size.width, size.height * 0.47);
    path.cubicTo(size.width, size.height * 0.54, size.width, size.height * 0.63,
        size.width, size.height * 0.7);
    path.cubicTo(size.width * 0.98, size.height * 0.8, size.width * 0.94,
        size.height * 0.8, size.width * 0.91, size.height * 0.84);
    path.cubicTo(size.width * 0.88, size.height * 0.86, size.width * 0.87,
        size.height * 0.92, size.width * 0.86, size.height * 0.97);
    path.cubicTo(size.width * 0.85, size.height * 1.03, size.width * 0.84,
        size.height * 0.97, size.width * 0.83, size.height * 0.93);
    path.cubicTo(size.width * 0.82, size.height * 0.86, size.width * 0.8,
        size.height * 0.81, size.width * 0.77, size.height * 0.81);
    path.cubicTo(size.width * 0.75, size.height * 0.81, size.width * 0.73,
        size.height * 0.81, size.width * 0.71, size.height * 0.81);
    path.cubicTo(size.width * 0.66, size.height * 0.81, size.width * 0.62,
        size.height * 0.81, size.width * 0.57, size.height * 0.81);
    path.cubicTo(size.width * 0.52, size.height * 0.81, size.width * 0.47,
        size.height * 0.81, size.width * 0.41, size.height * 0.81);
    path.cubicTo(size.width * 0.36, size.height * 0.81, size.width * 0.3,
        size.height * 0.8, size.width / 4, size.height * 0.81);
    path.cubicTo(size.width / 5, size.height * 0.81, size.width * 0.15,
        size.height * 0.81, size.width * 0.09, size.height * 0.8);
    path.cubicTo(size.width * 0.07, size.height * 0.79, size.width * 0.05,
        size.height * 0.76, size.width * 0.03, size.height * 0.7);
    path.cubicTo(size.width * 0.01, size.height * 0.62, 0, size.height / 2, 0,
        size.height * 0.4);
    path.cubicTo(0, size.height / 4, size.width * 0.03, size.height * 0.03,
        size.width * 0.08, 0);
    path.cubicTo(
        size.width * 0.08, 0, size.width * 0.08, 0, size.width * 0.08, 0);
    canvas.drawPath(path.shift(Constants.SHADOW_OFFSET), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
