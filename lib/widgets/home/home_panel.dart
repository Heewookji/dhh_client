import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class HomePanel extends StatelessWidget {
  final Question _chosenQuestion;
  final Size _bodySize;
  final bool _isSubmittedToday;
  HomePanel(this._chosenQuestion, this._bodySize, this._isSubmittedToday);

  @override
  Widget build(BuildContext context) {
//    return SvgPicture.asset(
//      'assets/images/bubble.svg',
//      color: Colors.amber,
//    );
    return Container(
      alignment: Alignment.center,
      height: _bodySize.height * 0.25,
      child: false
          ? null
          : _chosenQuestion != null
              ? Text(_chosenQuestion.text)
              : Text(
                  '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
    );
  }
}
