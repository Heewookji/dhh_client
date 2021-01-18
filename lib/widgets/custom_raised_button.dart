import 'package:dhh_client/constants.dart';
import 'package:dhh_client/util/inner_shadow.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatefulWidget {
  final Color color;
  final String text;
  final Function onPressed;
  final Alignment alignment;
  final EdgeInsets padding;

  CustomRaisedButton(
    this.text, {
    this.color = Colors.white,
    this.onPressed,
    this.padding,
    this.alignment,
  });

  @override
  _CustomRaisedButtonState createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  static const Color black = Color(0xFF2B2B2B);
  static const Offset outerShadow = Constants.SHADOW_OFFSET;
  static const Offset innerShadow = Constants.INNER_SHADOW_OFFSET;
  static final BoxBorder border =
      Border.all(width: Constants.BORDER_WIDTH, color: Colors.black);
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      child: pressed ? _buildPressedButton(theme) : _buildButton(theme),
      onTap: () {
        setState(() {
          pressed = false;
        });
        if (widget.onPressed != null) widget.onPressed();
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

  Widget _buildButton(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color == Colors.white ? Colors.white : black,
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
      alignment: widget.alignment,
      padding: widget.padding,
      height: 44,
      child: Text(
        widget.text,
        style: theme.textTheme.button.merge(
          TextStyle(
            color: widget.color == Colors.white ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPressedButton(ThemeData theme) {
    return InnerShadow(
      color: widget.color == Colors.white ? Color(0xFF464646) : Colors.black,
      offset: innerShadow,
      blur: 0.5,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color == Colors.white
              ? Color(0xFFB5B5B5)
              : Color(0xFF464646),
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.FILLET),
          ),
          border: border,
        ),
        alignment: widget.alignment,
        padding: widget.padding == null
            ? EdgeInsets.only(top: 4, left: 4)
            : EdgeInsets.only(
                top: widget.padding.top + 4, left: widget.padding.left + 4),
        height: 44,
        child: Text(
          widget.text,
          style: theme.textTheme.button.merge(
            TextStyle(
              color: widget.color == Colors.white
                  ? Color(0xFF545454)
                  : Color(0xFF7D7D7D),
            ),
          ),
        ),
      ),
    );
  }
}
