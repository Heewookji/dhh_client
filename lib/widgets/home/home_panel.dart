import 'package:auto_size_text/auto_size_text.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/widgets/home/custom_home_bubble.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final Question _chosenQuestion;
  final Character _chosenCharacter;
  final Offset _pressedLocation;
  final Animation<double> _panelAnimation;
  final bool _isSubmittedToday;
  HomePanel(
    this._chosenQuestion,
    this._chosenCharacter,
    this._pressedLocation,
    this._panelAnimation,
    this._isSubmittedToday,
  );

  Tail _getTailByPressedLocation(Size _screenSize) {
    if (_pressedLocation == null) return Tail.Right;
    double x = _pressedLocation.dx;
    double width = _screenSize.width;
    if (x <= width / 3)
      return Tail.Left;
    else if (x <= 2 * (width / 3))
      return Tail.Center;
    else
      return Tail.Right;
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: _screenSize.height * 0.04324),
      child: AnimatedBuilder(
        animation: _panelAnimation,
        builder: (ctx, child) => Opacity(
          opacity: _chosenCharacter == null ? 1.0 : _panelAnimation.value,
          child: CustomHomeBubble(
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: _screenSize.width * 0.05,
                vertical: _screenSize.height * 0.01,
              ),
              alignment: Alignment.center,
              child: AutoSizeText(
                _chosenQuestion != null
                    ? _panelAnimation.value >= 0.93
                        ? _chosenQuestion.text
                        : ''
                    : _panelAnimation.value >= 0.93 ||
                            _panelAnimation.value == 0
                        ? _isSubmittedToday
                            ? '오늘은 이미 일기를 썼어. 내일 다시 봐!'
                            : '오늘은 어떤 몽글이와 일기를 써볼까? 원하는 몽글이를 선택해봐!'
                        : '',
                style: _theme.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            _chosenCharacter == null
                ? Colors.white
                : Color(_chosenCharacter.color),
            _chosenCharacter == null
                ? Size(
                    _screenSize.width,
                    _screenSize.height * 0.167,
                  )
                : Size(
                    _panelAnimation.value * _screenSize.width,
                    _panelAnimation.value * _screenSize.height * 0.167,
                  ),
            padding: EdgeInsets.only(
              bottom: _screenSize.height * 0.03,
            ),
            tail: _getTailByPressedLocation(_screenSize),
          ),
        ),
      ),
    );
  }
}
