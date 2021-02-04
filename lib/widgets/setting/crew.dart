import 'package:flutter/material.dart';

import '../custom_raised_button.dart';

class Crew extends StatelessWidget {
  final Size _screenSize;
  Crew(this._screenSize);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: Text(
            'MEMBER',
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01081),
        ),
        Container(
          child: CustomRaisedButton(
            '헤이즐 : UX/UI Designer',
            color: Colors.black,
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '제이 : UX/UI Designer',
            color: Colors.black,
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '우유튀김 : Planer, Developer',
            color: Colors.black,
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
      ],
    );
  }
}
