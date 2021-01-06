import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final _isSubmittedToday;
  final _chosenQuestion;
  final Function(BuildContext context) _navigateWriteScreen;
  HomeButton(
      this._isSubmittedToday, this._chosenQuestion, this._navigateWriteScreen);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: screenSize.height * 0.15,
        alignment: Alignment.center,
        child: _isSubmittedToday
            ? null
            : Container(
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.8,
                child: RaisedButton(
                  onPressed: _chosenQuestion == null
                      ? null
                      : () => _navigateWriteScreen(context),
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
