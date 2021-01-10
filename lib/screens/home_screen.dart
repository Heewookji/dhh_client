import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/home/character_home.dart';
import 'package:dhh_client/widgets/home/home_button.dart';
import 'package:dhh_client/widgets/home/home_dialog.dart';
import 'package:dhh_client/widgets/home/home_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBusy = true;
  bool _isSubmittedToday;
  Character _chosenCharacter;
  Question _chosenQuestion;

  @override
  void initState() {
    super.initState();
    _doInitFuture();
  }

  void _doInitFuture() async {
    await Provider.of<CharactersProvider>(context, listen: false)
        .setHomeCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
    await Provider.of<DiariesProvider>(context, listen: false).setTopDiary();
    setState(() {
      _isBusy = false;
    });
  }

  void _chooseCharacter(
      Character character, QuestionsProvider questionsProvider) {
    setState(() {
      _chosenCharacter = character;
      _chosenQuestion = questionsProvider.questionMap[character.id.toString()];
    });
  }

  void _navigateDiaryListScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(DiaryListScreen.routeName);
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
    });
  }

  void _navigateWriteScreen(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': _chosenCharacter,
        'question': _chosenQuestion,
      },
    ) as Map;
    if (result != null && result['newCharacter'] != null) {
      showDialog(
        context: context,
        barrierColor: Colors.black54,
        builder: (context) => HomeDialog(result),
      );
    }
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
      Provider.of<CharactersProvider>(context, listen: false).characterIds,
    );
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('App Name'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.dynamic_feed),
          onPressed: () => _navigateDiaryListScreen(context),
        ),
      ],
    );
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height -
          appBar.preferredSize.height -
          _mediaQuery.padding.top -
          _mediaQuery.padding.bottom,
    );
    final topDiary = Provider.of<DiariesProvider>(context).topDiary;
    _isSubmittedToday =
        topDiary != null && topDiary.createdAt.day == DateTime.now().day;
    return Scaffold(
      appBar: appBar,
      body: _isBusy
          ? Center()
          : Column(
              children: <Widget>[
                HomePanel(
                  _chosenQuestion,
                  _bodySize,
                  _isSubmittedToday,
                ),
                CharacterHome(_chooseCharacter, _bodySize),
                HomeButton(
                  _chosenQuestion,
                  _navigateWriteScreen,
                  _bodySize,
                  _isSubmittedToday,
                ),
              ],
            ),
    );
  }
}
