import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Question _chosenQuestion;
  final Function() _navigateWriteScreen;
  final _isSubmittedToday;
  HomeButton(
    this._chosenQuestion,
    this._navigateWriteScreen,
    this._isSubmittedToday,
  );
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return _chosenQuestion == null || _isSubmittedToday
        ? Container()
        : SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(vertical: _screenSize.height * 0.03162),
              child: CustomRaisedButton(
                '일기쓰기',
                onPressed: () => _navigateWriteScreen(),
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
          );
  }
}
