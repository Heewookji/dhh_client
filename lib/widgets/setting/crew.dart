import 'package:flutter/material.dart';

import '../custom_raised_button.dart';

class Crew extends StatelessWidget {
  final Size _bodySize;
  Crew(this._bodySize);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text('CREW'),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.01082),
        ),
        Container(
          child: CustomRaisedButton(
            Colors.black,
            text: '전다영',
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            Colors.black,
            text: '이현지',
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            Colors.black,
            text: '지희욱',
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
      ],
    );
  }
}
