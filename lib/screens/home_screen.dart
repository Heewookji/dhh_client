import 'dart:math';

import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBusy = true;
  int _chosenLocation = -1;
  Character _chosenCharacter;
  Question _chosenQuestion;
  final _locationPoints = const {
    1: Point(1, 2),
    2: Point(1, 2),
    3: Point(1, 2),
    4: Point(1, 2),
  };

  @override
  void initState() {
    super.initState();
    _doFuture();
  }

  void _doFuture() async {
    await Provider.of<CharactersProvider>(context, listen: false)
        .setHomeCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
    setState(() {
      _isBusy = false;
    });
  }

  void _navigateDiaryListScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(DiaryListScreen.routeName);
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
      _chosenLocation = -1;
    });
  }

  void _navigateWriteScreen(BuildContext context) async {
    await Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': _chosenCharacter,
        'question': _chosenQuestion,
      },
    );
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
      _chosenLocation = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: [
          IconButton(
            icon: Icon(Icons.dynamic_feed),
            onPressed: () => _navigateDiaryListScreen(context),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildPanel(context, screenSize),
          _buildCharacterHome(context, screenSize),
          _buildBottomButton(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context, Size screenSize) {
    return Container(
      alignment: Alignment.center,
      height: screenSize.height * 0.2,
      color: _chosenCharacter != null
          ? Color(_chosenCharacter.color)
          : Colors.black26,
      child: _chosenQuestion != null
          ? Text(_chosenQuestion.text)
          : Text(
              '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
              textAlign: TextAlign.center,
            ),
    );
  }

  Widget _buildCharacterHome(BuildContext context, Size screenSize) {
    return Container(
      color: Colors.black12,
      height: screenSize.height * 0.5,
      child: Stack(
        children: [
          if (_isBusy)
            Container()
          else
            Consumer2<CharactersProvider, QuestionsProvider>(
              builder: (context, charactersProvider, questionsProvider, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: charactersProvider.characters.length,
                  itemBuilder: (context, i) {
                    final character = charactersProvider.characters[i];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _chosenLocation = i;
                          _chosenCharacter = character;
                          _chosenQuestion = questionsProvider
                              .questionMap[character.id.toString()];
                        });
                      },
                      child: Column(
                        children: [
                          Text(character.name),
                          Container(
                            height: screenSize.height * 0.1,
                            color: Color(character.color),
                            child: Image.asset(character.statusImageUrl),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  _buildBottomButton(BuildContext context, Size screenSize) {
    return SafeArea(
      child: Container(
        height: screenSize.height * 0.1,
        child: FlatButton(
          onPressed: _chosenQuestion == null
              ? null
              : () => _navigateWriteScreen(context),
          child: Text('일기쓰기'),
        ),
      ),
    );
  }
}
