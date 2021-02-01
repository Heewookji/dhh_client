import 'package:dhh_client/widgets/Bubbles.dart';
import 'package:flutter/material.dart';

class CustomMainBubble extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Size size;
  final Alignment alignment;
  final EdgeInsets padding;
  final Color color;
  final int bubbleNumber;

  CustomMainBubble(
    this.child,
    this.color,
    this.size, {
    this.onPressed,
    this.padding,
    this.alignment,
    this.bubbleNumber,
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
    switch (bubbleNumber) {
      case 0:
        return MainBubble0(color);
      case 1:
        return MainBubble1(color);
      case 2:
        return MainBubble2(color);
      default:
        return MainSmallBubble();
    }
  }
}
