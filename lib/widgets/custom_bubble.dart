import 'package:dhh_client/widgets/Bubbles.dart';
import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Size size;
  final Alignment alignment;
  final EdgeInsets padding;
  final Color color;
  final int bubbleNumber;

  CustomBubble(
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
    Size _screenSize = MediaQuery.of(context).size;
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
            alignment: bubbleNumber == null
                ? alignment
                : bubbleNumber % 2 == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            padding: bubbleNumber == null
                ? padding
                : bubbleNumber % 2 == 0
                    ? EdgeInsets.only(
                        bottom: _screenSize.height * 0.02,
                        left: _screenSize.width * 0.1,
                      )
                    : EdgeInsets.only(
                        bottom: _screenSize.height * 0.02,
                        right: _screenSize.width * 0.1,
                      ),
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
        return Bubble0(color);
      case 1:
        return Bubble1(color);
      case 2:
        return Bubble2(color);
      case 3:
        return Bubble3(color);
      default:
        return Bubble0(color);
    }
  }
}
