import 'package:dhh_client/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingScreen extends StatelessWidget {
  static final routeName = '/setting';
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height,
    );
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _bodySize.width * Constants.BODY_WIDTH_PADDING_PERCENT),
        child: Column(
          children: [
            _buildAbout(_bodySize),
            _buildCrew(_bodySize),
          ],
        ),
      ),
    );
  }

  Container _buildAbout(Size _bodySize) {
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
              onPressed: () {},
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCrew(Size _bodySize) {
    return Container(
      padding: EdgeInsets.only(
        top: _bodySize.height * 0.03243,
        bottom: _bodySize.height * 0.05405,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text('CREW'),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.01062),
          ),
          Container(
            child: RaisedButton(
              child: Text(
                '전다영',
                textAlign: TextAlign.end,
              ),
              onPressed: () {},
            ),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
          ),
          Container(
            child: RaisedButton(
              child: Text(
                '이현지',
                textAlign: TextAlign.end,
              ),
              onPressed: () {},
            ),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
          ),
          Container(
            child: RaisedButton(
              child: Text(
                '지희욱',
                textAlign: TextAlign.end,
              ),
              onPressed: () {},
            ),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.02162),
          ),
        ],
      ),
    );
  }
}
