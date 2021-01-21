import 'package:dhh_client/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification(BuildContext context) async {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
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

  static Future<void> setScheduledNotification(
      DateTime scheduleDateTime) async {
    final targetDateTime = _nextInstanceOfScheduledTime(
        scheduleDateTime.hour, scheduleDateTime.minute);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'MONGLE',
      '오늘의 추억을 쌓을 시간이 됐어요!',
      targetDateTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
            'MONGLEID', 'MONGLE', 'MONGLE app notification'),
        iOS: IOSNotificationDetails(),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: targetDateTime.toIso8601String(),
    );
  }

  static tz.TZDateTime _nextInstanceOfScheduledTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now))
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    return scheduledDate;
  }

  static Future<DateTime> getCurrentNotification() async {
    final list =
        await _flutterLocalNotificationsPlugin.pendingNotificationRequests();
    if (list.isEmpty)
      print('notification empty!');
    else
      print(list[0].payload);
    return list.isEmpty ? null : DateTime.parse(list[0].payload).toLocal();
  }
}
