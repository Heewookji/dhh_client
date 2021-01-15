import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/root_theme.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/home_screen.dart';
import 'package:dhh_client/screens/setting_screen.dart';
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
  Future _initFuture;
  final _homeCharacterProvider = CharactersProvider();
  final _homeQuestionProvider = QuestionsProvider();
  final _allCharacterProvider = CharactersProvider();
  final _allQuestionProvider = QuestionsProvider();

  @override
  void initState() {
    _initFuture = _doInitFuture();
    super.initState();
  }

  Future<void> _doInitFuture() async {
    tz.initializeTimeZones();
    final localTimezone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(localTimezone));
    DbService.printPath();
    await DbService.database();
    await NotificationService.initLocalNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _allCharacterProvider),
        ChangeNotifierProvider.value(value: _allQuestionProvider),
        ChangeNotifierProvider(create: (_) => DiariesProvider()),
        ChangeNotifierProvider(create: (_) => DiaryDetailProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: RootTheme.rootThemeBuilder(),
        home: FutureBuilder(
          future: _initFuture,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: _homeCharacterProvider),
                ChangeNotifierProvider.value(value: _homeQuestionProvider),
              ],
              child: HomeScreen(),
            );
          },
        ),
        routes: {
          WriteScreen.routeName: (ctx) => ChangeNotifierProvider.value(
                value: _homeCharacterProvider,
                builder: (context, child) => WriteScreen(),
              ),
          DiaryListScreen.routeName: (ctx) => DiaryListScreen(),
          SettingScreen.routeName: (ctx) => SettingScreen(),
        },
      ),
    );
  }
}
