import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  static const Offset outerShadow = Offset(3, 3);
  static final BoxBorder border = Border.all(width: 2, color: Colors.black);
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
            Radius.circular(10.0),
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
