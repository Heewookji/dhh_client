import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final bool _isSubmittedToday;
  final Question _chosenQuestion;
  HomePanel(this._isSubmittedToday, this._chosenQuestion);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: screenSize.height * 0.2,
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
