import 'package:dhh_client/constants.dart';
import 'package:dhh_client/util/color_transformer.dart';
import 'package:dhh_client/util/inner_shadow.dart';
import 'package:flutter/material.dart';

class CustomCharacterButton extends StatefulWidget {
  final Color color;
  final Widget child;
  final Function onPressed;
  final Alignment alignment;
  final EdgeInsets padding;

  CustomCharacterButton(
    this.child,
    this.color, {
    this.onPressed,
    this.padding,
    this.alignment,
  });

  @override
  _CustomCharacterButtonState createState() => _CustomCharacterButtonState();
}

class _CustomCharacterButtonState extends State<CustomCharacterButton> {
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
        color: widget.color == Colors.black ? black : widget.color,
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
      child: widget.child,
    );
  }

  Widget _buildPressedButton(ThemeData theme) {
    return InnerShadow(
      color: Colors.black,
      offset: innerShadow,
      blur: 0.5,
      child: Container(
        decoration: BoxDecoration(
          color: widget.color == Colors.black
              ? Color(0xFF464646)
              : ColorTransformer.darken(widget.color, 0.125),
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
        child: widget.child,
      ),
    );
  }
}
