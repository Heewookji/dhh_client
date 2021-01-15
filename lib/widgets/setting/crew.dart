import 'package:flutter/material.dart';

class Crew extends StatelessWidget {
  final Size _bodySize;
  Crew(this._bodySize);

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
            child: Text('CREW'),
            margin: EdgeInsets.only(bottom: _bodySize.height * 0.01082),
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
