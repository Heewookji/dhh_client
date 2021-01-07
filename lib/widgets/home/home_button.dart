import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final Question _chosenQuestion;
  final Function(BuildContext context) _navigateWriteScreen;
  final Size _bodySize;
  final _isSubmittedToday;
  HomeButton(this._chosenQuestion, this._navigateWriteScreen, this._bodySize,
      this._isSubmittedToday);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _bodySize.height * 0.2,
      alignment: Alignment.center,
      child: _isSubmittedToday
          ? null
          : Container(
              height: _bodySize.height * 0.075,
              child: _chosenQuestion == null
                  ? null
                  : RaisedButton(
                      onPressed: () => _navigateWriteScreen(context),
                      child: Text(
                        '일기쓰기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
    );
  }
}
