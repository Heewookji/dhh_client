import 'package:flutter/material.dart';

class CustomFillAnimation extends AnimatedWidget {
  final Size _size;
  final Color _color;
  final Offset _location;
  final Animation<double> _animation;

  CustomFillAnimation(
    this._size,
    this._animation,
    this._color,
    this._location,
  ) : super(listenable: _animation);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(
        _location,
        _animation.value,
      ),
      child: Container(
        width: _size.width,
        height: _size.height,
        color: _color,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  final Offset _location;
  final double _value;

  MyCustomClipper(this._location, this._value);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: _location ?? Offset(0, 0),
        radius: (size.height * _value) / 1.2,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
