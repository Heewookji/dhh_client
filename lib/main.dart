import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/home_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:dhh_client/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setTimezone();
    DbService.printPath();
    NotificationService.initLocalNotification(context);
  }

  Future<void> setTimezone() async {
    tz.initializeTimeZones();
    final localTimezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTimezone));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
        ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ChangeNotifierProvider(create: (_) => DiariesProvider()),
        ChangeNotifierProvider(create: (_) => DiaryDetailProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          buttonTheme: ButtonThemeData(buttonColor: Colors.black),
          appBarTheme: AppBarTheme(color: Colors.transparent, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(create: (_) => CharactersProvider()),
                  ChangeNotifierProvider(create: (_) => QuestionsProvider()),
                ],
                child: HomeScreen(),
              ),
          WriteScreen.routeName: (ctx) => WriteScreen(),
          DiaryListScreen.routeName: (ctx) => DiaryListScreen(),
        },
      ),
    );
  }
}
