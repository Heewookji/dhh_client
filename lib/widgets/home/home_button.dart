import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final bool _isSubmittedToday;
  final Question _chosenQuestion;
  final Function(BuildContext context) _navigateWriteScreen;
  final Size _bodySize;
  HomeButton(this._isSubmittedToday, this._chosenQuestion,
      this._navigateWriteScreen, this._bodySize);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: _bodySize.height * 0.25,
        alignment: Alignment.center,
        child: _isSubmittedToday
            ? null
            : Container(
                height: _bodySize.height * 0.2,
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
      ),
    );
  }
}
