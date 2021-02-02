import 'package:dhh_client/widgets/Bubbles.dart';
import 'package:flutter/material.dart';

enum Tail {
  Left,
  Center,
  Right,
}

class CustomHomeBubble extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Size size;
  final Alignment alignment;
  final EdgeInsets padding;
  final Color color;
  final Tail tail;

  CustomHomeBubble(
    this.child,
    this.color,
    this.size, {
    this.onPressed,
    this.padding,
    this.alignment,
    this.tail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: CustomPaint(
              painter: _buildBubble(color),
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            child: child,
            alignment: alignment,
            padding: padding,
          ),
        ],
      ),
      onTap: () {
        if (onPressed != null) onPressed();
      },
    );
  }

  CustomPainter _buildBubble(Color color) {
    switch (tail) {
      case Tail.Right:
        return MainBubble0(color);
      case Tail.Center:
        return MainBubble1(color);
      case Tail.Left:
        return MainBubble2(color);
      default:
        return MainSmallBubble();
    }
  }
}
