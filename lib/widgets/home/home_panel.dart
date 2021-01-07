import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final bool _isSubmittedToday;
  final Question _chosenQuestion;
  final Size _bodySize;
  HomePanel(this._isSubmittedToday, this._chosenQuestion, this._bodySize);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: _bodySize.height * 0.2,
      child: _isSubmittedToday
          ? null
          : _chosenQuestion != null
              ? Text(_chosenQuestion.text)
              : Text(
                  '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
                  textAlign: TextAlign.center,
                ),
    );
  }
}
