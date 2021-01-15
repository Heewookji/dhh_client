import 'package:dhh_client/constants.dart';
import 'package:dhh_client/screens/alarm_screen.dart';
import 'package:dhh_client/screens/info_screen.dart';
import 'package:dhh_client/widgets/setting/about.dart';
import 'package:dhh_client/widgets/setting/crew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SettingScreen extends StatelessWidget {
  static final routeName = '/setting';

  void _navigateAlarmScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(AlarmScreen.routeName);
  }

  void _navigateInfoScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(InfoScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
            About(_bodySize, _navigateAlarmScreen, _navigateInfoScreen),
            Crew(_bodySize),
          ],
        ),
      ),
    );
  }
}
