import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/setting_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/home/character_home.dart';
import 'package:dhh_client/widgets/home/character_out_dialog.dart';
import 'package:dhh_client/widgets/home/home_button.dart';
import 'package:dhh_client/widgets/home/home_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/Home';

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
    _newCharacterComeIfPossible();
    await Provider.of<DiariesProvider>(context, listen: false).setTopDiary();
    setState(() {
      _isBusy = false;
    });
  }

  Future<void> _newCharacterComeIfPossible() async {
    final diaryCount =
        await Provider.of<DiariesProvider>(context, listen: false)
            .getDiaryCount();
    final result = await Provider.of<CharactersProvider>(context, listen: false)
        .setNewCharacterIfPossible(diaryCount);
    print(result);
    if (result['newCharacter'] != null) {
      await showDialog(
        context: context,
        barrierColor: Colors.black54,
        builder: (context) => CharacterOutDialog(result),
      );
    }
    await Provider.of<CharactersProvider>(context, listen: false)
        .setHomeCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
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

  void _navigateSettingScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(SettingScreen.routeName);
  }

  void _navigateWriteScreen(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': _chosenCharacter,
        'question': _chosenQuestion,
      },
    ) as Map;
    print(result);
    if (result != null &&
        (result['traveled'] || result['finished'] || result['allFinished'])) {
      await showDialog(
        context: context,
        barrierColor: Colors.black54,
        builder: (context) => CharacterOutDialog(result),
      );
    }
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
    });
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
    if (result != null)
      Future.delayed(Duration(seconds: 1), () => _newCharacterComeIfPossible());
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final topDiary = Provider.of<DiariesProvider>(context).topDiary;
    _isSubmittedToday =
        topDiary != null && topDiary.createdAt.day == DateTime.now().day;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.widgets),
            onPressed: () => _navigateDiaryListScreen(context),
          ),
          IconButton(
            icon: Icon(Icons.circle),
            onPressed: () => _navigateSettingScreen(context),
          ),
        ],
      ),
      body: _isBusy
          ? Center()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HomePanel(
                    _chosenQuestion,
                    _screenSize,
                    _isSubmittedToday,
                  ),
                  CharacterHome(_chooseCharacter, _screenSize),
                  HomeButton(
                    _chosenQuestion,
                    _navigateWriteScreen,
                    _screenSize,
                    _isSubmittedToday,
                  ),
                ],
              ),
            ),
    );
  }
}
