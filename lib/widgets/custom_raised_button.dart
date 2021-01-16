import 'package:flutter/material.dart';

class CustomRaisedButton extends StatefulWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final Alignment alignment;
  final EdgeInsets padding;

  CustomRaisedButton(
    this.color, {
    this.text,
    this.onPressed,
    this.padding,
    this.alignment,
  });

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: Container(
        alignment: widget.alignment,
        padding: widget.padding,
        height: 44,
        decoration:
            pressed ? _buildPressedBoxDecoration() : _buildBoxDecoration(),
        child: Text(
          widget.text,
          style: theme.textTheme.button.merge(
            TextStyle(
              color: widget.color == Colors.white ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          pressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          pressed = false;
        });
      },
      onTapDown: (detail) {
        setState(() {
          pressed = true;
        });
      },
    );
  }

  BoxDecoration _buildBoxDecoration() {
    if (widget.color == Colors.white)
      return BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 1, color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
          ),
        ],
      );
    else
      return BoxDecoration(
        color: Color(0xFF2B2B2B),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 1, color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
          ),
        ],
      );
  }

  BoxDecoration _buildPressedBoxDecoration() {
    if (widget.color == Colors.white)
      return BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 1, color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(4, 4),
          ),
        ],
      );
    else
      return BoxDecoration(
        color: Color(0xFF2B2B2B),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        border: Border.all(width: 1, color: Colors.black),
      );
  }
}
