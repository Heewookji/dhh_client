import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_detail_screen.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/home_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    DbService.printPath();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
        ChangeNotifierProvider(create: (_) => QuestionsProvider()),
        ChangeNotifierProvider(
          create: (_) => DiariesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
          DiaryDetailScreen.routeName: (ctx) => DiaryDetailScreen(),
        },
      ),
    );
  }
}

//CharactersProviderangeNotifierProxyProvider<CharactersProvider,
//    QuestionsProvider>(
//update: (ctx, characters, previous) {
//return QuestionsProvider(
//characters.characters
//    .map((c) => c.id.toString())
//    .toList(),
//previous != null ? previous.questionMap : Map(),
//);
//},
//create: null,
//),
