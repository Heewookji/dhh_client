import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/home/character_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSubmittedToday = true;
  Character _chosenCharacter;
  Question _chosenQuestion;

  @override
  void initState() {
    super.initState();
    _doFuture();
  }

  void _doFuture() async {
    final topDiary = await Provider.of<DiariesProvider>(context, listen: false)
        .getTopDiary();
    _isSubmittedToday =
        (topDiary != null && topDiary.createdAt.day == DateTime.now().day);
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
    if (result != null) {
      _isSubmittedToday = true;
      if (result['isFirstSubmit']) print('first');
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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.dynamic_feed),
            onPressed: () => _navigateDiaryListScreen(context),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildPanel(context, screenSize),
          CharacterHome(_chooseCharacter),
          _buildBottomButton(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context, Size screenSize) {
    return Container(
      alignment: Alignment.center,
      height: screenSize.height * 0.2,
      child: _isSubmittedToday
          ? null
          : _chosenQuestion != null
              ? Text(_chosenQuestion.text)
              : Text(
                  '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
                  textAlign: TextAlign.center,
                ),
    );
  }

  _buildBottomButton(BuildContext context, Size screenSize) {
    return SafeArea(
      child: Container(
        height: screenSize.height * 0.15,
        alignment: Alignment.center,
        child: _isSubmittedToday
            ? null
            : Container(
                height: screenSize.height * 0.06,
                width: screenSize.width * 0.8,
                child: RaisedButton(
                  onPressed: _chosenQuestion == null
                      ? null
                      : () => _navigateWriteScreen(context),
                  child: Text(
                    '일기쓰기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
      ),
    );
  }
}
