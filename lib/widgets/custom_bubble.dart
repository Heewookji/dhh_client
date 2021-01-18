import 'dart:math';

import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  static const Offset outerShadow = Offset(3, 3);
  static final BoxBorder border = Border.all(width: 2, color: Colors.black);

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

class BubblePainter extends CustomPainter {
  static const List<String> bubbles = [
    'M26.743.344c1.293-.235 2.639-.367 4.04-.386C50.829-.31 70.894.004 90.94 0c19.332-.003 38.665 0 57.997 0h145.756s22.307 1.023 22.307 22.504c0 9.43.006 18.86.001 28.292-.005 7.975 1.442 17.472-2.464 24.697-6.037 11.169-18.126 10.78-28.346 14.796-6.603 2.594-9.823 9.106-13.84 14.621-4.492 6.17-7.204-.257-9.835-4.486-4.665-7.498-10.63-13.141-19.653-13.141-6.592 0-13.186-.062-19.779-.065-13.804-.007-27.603.185-41.407.07-17.182-.143-34.353.08-51.533.138-16.925.057-33.854-.692-50.775-.22-16.664.469-32.993.41-49.632-1.087-8.843-.793-14.027-3.564-19.695-10.796-6.753-8.614-8.946-20.91-8.946-31.683C1.095 26.973 8.71 3.62 26.743.344z',
  ];
  @override
  void paint(Canvas canvas, Size size) {
    final bubbleSize = Size(size.width, size.height * 0.8);
    final tailSize = Size(size.width * 0.1, size.height - bubbleSize.height);
    final fillet = bubbleSize.width * 0.1;
    final tailStartPoint = Point(size.width * 0.7, bubbleSize.height);
    //bubble body
    final bubblePath = Path()
      ..moveTo(0, fillet)
      // 왼쪽 위에서 왼쪽 아래 라인
      ..lineTo(0, bubbleSize.height - fillet)
      ..quadraticBezierTo(0, bubbleSize.height, fillet, bubbleSize.height)
      // 왼쪽 아래에서 오른쪽 아래 라인
      ..lineTo(bubbleSize.width - fillet, bubbleSize.height)
      ..quadraticBezierTo(bubbleSize.width, bubbleSize.height, bubbleSize.width,
          bubbleSize.height - fillet)
      // 오른쪽 아래에서 오른쪽 위 라인
      ..lineTo(bubbleSize.width, fillet)
      ..quadraticBezierTo(bubbleSize.width, 0, bubbleSize.width - fillet, 0)
      // 오른쪽 위에서 왼쪽 아래 라인
      ..lineTo(fillet, 0)
      ..quadraticBezierTo(0, 0, 0, fillet);
    // bubble tail
    final tailPath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..cubicTo(
        tailStartPoint.x + (tailSize.width * 0.2),
        tailStartPoint.y,
        tailStartPoint.x + (tailSize.width * 0.6),
        tailStartPoint.y + (tailSize.height * 0.2),
        tailStartPoint.x + tailSize.width / 2, // 목적지 x
        tailStartPoint.y + tailSize.height, // 목적지 y
      )
      ..cubicTo(
        (tailStartPoint.x + tailSize.width / 2) + (tailSize.width * 0.2),
        tailStartPoint.y + tailSize.height,
        tailStartPoint.x + tailSize.width,
        tailStartPoint.y + (tailSize.height * 0.3),
        tailStartPoint.x + tailSize.width, // 목적지 x
        tailStartPoint.y, // 목적지 y
      );
    // add tail to bubble body
    bubblePath.addPath(tailPath, Offset(0, 0));
    // paint setting
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final outLinePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    // draw
    canvas.drawPath(bubblePath.shift(Offset(3, 3)), shadowPaint);
    canvas.drawPath(bubblePath, paint);
    canvas.drawPath(bubblePath, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
      ..strokeWidth = 2;
    final shadowPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path();
    // Path number 1
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
    canvas.drawPath(path.shift(Offset(3, 3)), shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, outLinePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
