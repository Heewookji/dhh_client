import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/widgets/custom_main_bubble.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final Question _chosenQuestion;
  final Character _chosenCharacter;
  final bool _isSubmittedToday;
  HomePanel(
      this._chosenQuestion, this._chosenCharacter, this._isSubmittedToday);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: _screenSize.height * 0.04324),
      alignment: Alignment.topCenter,
      child: false
          ? null
          : CustomMainBubble(
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  _chosenQuestion != null
                      ? _chosenQuestion.text
                      : '푸쉬 알림을 통해\n규칙적인 일기 습관을 만들어요.',
                  style: _theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              _chosenCharacter == null
                  ? Colors.white
                  : Color(_chosenCharacter.color),
              Size(double.infinity, _screenSize.height * 0.167),
              padding: EdgeInsets.only(
                bottom: _screenSize.height * 0.03,
              ),
              bubbleNumber: 0,
            ),
    );
  }
}
