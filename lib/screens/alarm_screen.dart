import 'package:dhh_client/constants.dart';
import 'package:dhh_client/services/notification_service.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class AlarmScreen extends StatefulWidget {
  static final routeName = '/alarm';

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  DateTime _initialDateTime;
  DateTime _scheduleDateTime;
  bool _isBusy = true;

  @override
  void initState() {
    super.initState();
    _doFuture();
  }

  void _doFuture() async {
    final _currentNotification =
        await NotificationService.getCurrentNotification();
    _initialDateTime = _currentNotification ?? DateTime.now().toLocal();
    setState(() {
      _isBusy = false;
    });
  }

  void _setAlarmSchedule() async {
    if (_scheduleDateTime == null) _scheduleDateTime = _initialDateTime;
    await NotificationService.setScheduledNotification(_scheduleDateTime);
    _doFuture();
  }

  String _doFormatHM(DateTime date) {
    return _isBusy
        ? '   0시 0분'
        : (DateFormat('a').format(date) == 'AM' ? '오전 ' : '오후 ') +
            DateFormat('h시').format(date) +
            (DateFormat('m').format(date) == '0'
                ? '에\n알람이 울립니다.'
                : ' ${DateFormat('m').format(date)}분에\n알람이 울립니다.');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    final _panelText = _doFormatHM(_initialDateTime);
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
                _panelText,
                style: theme.textTheme.subtitle1,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  width: _screenSize.height *
                      Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
                  child: SvgPicture.asset(
                    'assets/images/future_4.svg',
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
                  _isBusy
                      ? Container()
                      : CupertinoTheme(
                          data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle:
                                  theme.textTheme.subtitle1,
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
