import 'package:dhh_client/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlarmScreen extends StatelessWidget {
  static final routeName = '/alarm';

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _bodySize.width * Constants.BODY_WIDTH_PADDING_PERCENT),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
