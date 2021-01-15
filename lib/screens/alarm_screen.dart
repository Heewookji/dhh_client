import 'package:dhh_client/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlarmScreen extends StatelessWidget {
  static final routeName = '/alarm';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height,
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal:
                  _bodySize.width * Constants.BODY_WIDTH_PADDING_PERCENT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Text(
                  '알람시간\n바꿀래요.',
                  style: theme.textTheme.headline6,
                ),
                margin: EdgeInsets.only(
                  top: _bodySize.height * 0.03243,
                  bottom: _bodySize.height * 0.03243,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: _bodySize.height * 0.13513,
                  child: Image.asset(
                    'assets/images/1-1.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                margin: EdgeInsets.only(
                  bottom: _bodySize.height * 0.04324,
                ),
              ),
              Container(
                child: Text('알람 받고싶은 시간을 선택해주세요.'),
                margin: EdgeInsets.only(bottom: _bodySize.height * 0.01082),
              ),
              Container(
                height: _bodySize.height * 0.3,
                child: Card(
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: theme.textTheme.subtitle1,
                      ),
                    ),
                    child: CupertinoDatePicker(
                      onDateTimeChanged: (dateTime) {},
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
