import 'package:dhh_client/constants.dart';
import 'package:dhh_client/services/notification_service.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class AlarmScreen extends StatefulWidget {
  static final routeName = '/alarm';

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  DateTime _initialDateTime = DateTime.now();
  DateTime _scheduleDateTime;

  void _setAlarmSchedule() async {
    if (_scheduleDateTime == null) _scheduleDateTime = _initialDateTime;
    await NotificationService.setScheduledNotification(_scheduleDateTime);
  }

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
                  width: _bodySize.height * 0.13513,
                  child: SvgPicture.asset(
                    'assets/images/1-1.svg',
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
                      initialDateTime: _initialDateTime,
                      onDateTimeChanged: (dateTime) {
                        _scheduleDateTime = dateTime;
                      },
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),
                ),
              ),
              Container(
                child: CustomRaisedButton(
                  '설정',
                  onPressed: _setAlarmSchedule,
                  alignment: Alignment.center,
                ),
                margin: EdgeInsets.only(top: _bodySize.height * 0.03243),
              ),
              Container(
                child: CustomRaisedButton(
                  '알람보기',
                  color: Colors.black,
                  onPressed: () {
                    NotificationService.getCurrentNotification();
                  },
                  alignment: Alignment.center,
                ),
                margin: EdgeInsets.only(top: _bodySize.height * 0.03243),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
