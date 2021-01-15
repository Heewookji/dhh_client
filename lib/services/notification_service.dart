import 'package:dhh_client/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification(BuildContext context) async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
            );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) => _clickedNotification(payload, context),
    );
  }

  static Future<void> _clickedNotification(
      String payload, BuildContext context) async {
    if (payload != null) debugPrint('notification payload: $payload');
    await Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  static Future<void> showNotification() async {
    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(iOS: iosNotificationDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, '심심이', '오늘 무슨 일 했는지 말해줄 수 있어?', platformChannelSpecifics,
        payload: 'item x');
  }

  static Future<void> setScheduledNotification() async {
    final localTimezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.TZDateTime targetDateTIme =
        tz.TZDateTime.from(DateTime.now(), tz.getLocation(localTimezone));
    final tz.TZDateTime nowDateTIme = tz.TZDateTime.now(tz.local);
    if (targetDateTIme.isBefore(nowDateTIme))
      targetDateTIme = targetDateTIme.add(const Duration(seconds: 10));
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      '심심이',
      '오늘 무슨 일 했는지 말해줄 수 있어?',
      targetDateTIme,
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description'),
        iOS: IOSNotificationDetails(),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
