import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCard extends StatelessWidget {
  static const Offset outerShadow = Constants.SHADOW_OFFSET;
  static final BoxBorder border =
      Border.all(width: Constants.BORDER_WIDTH, color: Colors.black);
  final Widget child;
  final Function onPressed;
  final Alignment alignment;
  final EdgeInsets padding;
  final Color color;

  CustomCard(
    this.child, {
    this.onPressed,
    this.padding,
    this.alignment,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.FILLET),
          ),
          border: border,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: outerShadow,
            ),
          ],
        ),
        alignment: alignment,
        padding: padding,
        child: child,
      ),
      onTap: () {
        if (onPressed != null) onPressed();
      },
    );
  }
}
