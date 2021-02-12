import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            onPressed: () async {
              await launch('https://www.instagram.com/hazel_ux');
            },
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '제이 : UX/UI Designer',
            color: Colors.black,
            onPressed: () async {
              await launch('https://www.instagram.com/puxdjeon_21');
            },
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '우유튀김 : Developer',
            color: Colors.black,
            onPressed: () async {
              await launch('https://github.com/Heewookji');
            },
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          child: CustomRaisedButton(
            '앤도 라즈 : Sound Designer',
            color: Colors.black,
            onPressed: () async {
              await launch('https://andolaj.com');
            },
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _screenSize.width * 0.04),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
      ],
    );
  }
}
