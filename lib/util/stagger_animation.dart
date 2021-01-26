import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({
    Key key,
    this.controller,
    this.color,
    this.screenSize,
  })  : zoomOut = Tween(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.999,
              curve: Curves.easeOutCirc,
            ),
          ),
        ),
        super(key: key);

  final AnimationController controller;
  final Animation zoomOut;
  final Color color;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      height: screenSize.height * (zoomOut.value / 100),
      width: screenSize.width * (zoomOut.value / 100),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
      ),
    );
  }
}
