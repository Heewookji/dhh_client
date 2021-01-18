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
          child: Text('MEMBER'),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '이현지 : UX/UI Designer',
            color: Colors.black,
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '전다영 : UX/UI Designer',
            color: Colors.black,
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '지희욱 : Planer, Developer',
            color: Colors.black,
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
