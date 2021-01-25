import 'package:dhh_client/constants.dart';
import 'package:dhh_client/services/notification_service.dart';
import 'package:dhh_client/widgets/custom_card.dart';
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
  DateTime _initialDateTime;
  DateTime _scheduleDateTime;

  void _setAlarmSchedule() async {
    if (_scheduleDateTime == null) _scheduleDateTime = _initialDateTime;
    await NotificationService.setScheduledNotification(_scheduleDateTime);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            left: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            right: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            top: _screenSize.height * Constants.BODY_HEIGHT_PADDING_PERCENT,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '알람시간\n설정할래요.',
                style: theme.textTheme.headline6,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  width: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  child: SvgPicture.asset(
                    'assets/images/1-1.svg',
                  ),
                ),
                margin: EdgeInsets.only(
                  bottom: _screenSize.height * 0.03243,
                ),
              ),
              Container(
                child: Text(
                  '알람 받고싶은 시간을 선택해주세요.',
                  style: theme.textTheme.bodyText1,
                ),
                margin: EdgeInsets.only(bottom: _screenSize.height * 0.01621),
              ),
              Container(
                height: _screenSize.height * 0.4,
                child: CustomCard(
                  FutureBuilder<DateTime>(
                    future: NotificationService.getCurrentNotification(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Container();
                      _initialDateTime =
                          snapshot.data ?? DateTime.now().toLocal();
                      return CupertinoTheme(
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
                      );
                    },
                  ),
                ),
              ),
              Container(
                child: CustomRaisedButton(
                  '설정하기',
                  color: Colors.black,
                  onPressed: _setAlarmSchedule,
                  alignment: Alignment.center,
                ),
                margin: EdgeInsets.only(
                  top: _screenSize.height * 0.03243,
                  bottom: _screenSize.height * 0.03243,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
