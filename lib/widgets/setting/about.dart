import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final Size _bodySize;
  final Function(BuildContext) _navigateAlarm;
  final Function(BuildContext) _navigateInfo;

  About(this._bodySize, this._navigateAlarm, this._navigateInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: _bodySize.height * 0.03243,
        bottom: _bodySize.height * 0.05405,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text('ABOUT'),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.01062),
          ),
          Container(
            child: RaisedButton(
              color: Colors.white,
              splashColor: Colors.black,
              child: Text(
                '앱에 대해 알고 싶어요.',
                textAlign: TextAlign.end,
              ),
              onPressed: () => _navigateAlarm(context),
            ),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
          ),
          RaisedButton(
            color: Colors.white,
            splashColor: Colors.black,
            child: Text(
              '알람시간 바꿀래요.',
              textAlign: TextAlign.end,
            ),
            onPressed: () => _navigateInfo(context),
          ),
        ],
      ),
    );
  }
}
