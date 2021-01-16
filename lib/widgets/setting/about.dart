import 'package:dhh_client/widgets/custom_raised_button.dart';
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
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.01082),
          ),
          Container(
            child: CustomRaisedButton(
              Colors.white,
              text: '앱에 대해 알고 싶어요.',
              onPressed: () => _navigateInfo(context),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: _bodySize.width * 0.04),
            ),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
          ),
          CustomRaisedButton(
            Colors.white,
            text: '알람시간 바꿀래요.',
            onPressed: () => _navigateAlarm(context),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: _bodySize.width * 0.04),
          ),
        ],
      ),
    );
  }
}
