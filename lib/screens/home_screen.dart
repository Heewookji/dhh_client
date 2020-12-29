import 'dart:math';

import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
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
    doFuture();
  }

  void doFuture() async {
    await Provider.of<CharactersProvider>(context, listen: false)
        .setCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMap();
    setState(() {
      _isBusy = false;
    });
  }

  void _navigateWriteScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': _chosenCharacter,
        'question': _chosenQuestion,
      },
    );
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
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildAlarmPanel(context, screenSize),
          _buildCharacterHome(context, screenSize),
          _buildBottomButton(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildAlarmPanel(BuildContext context, Size screenSize) {
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
            Consumer<CharactersProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.characters.length,
                  itemBuilder: (context, i) {
                    final character = provider.characters[i];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _chosenLocation = i;
                          _chosenCharacter = character;
                          _chosenQuestion = Provider.of<QuestionsProvider>(
                                  context,
                                  listen: false)
                              .questionMap[character.id.toString()];
                        });
                      },
                      child: Column(
                        children: [
                          Text(character.name),
                          Container(
                            height: screenSize.height * 0.1,
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
          onPressed: () => _navigateWriteScreen(context),
          child: Text('일기쓰기'),
        ),
      ),
    );
  }
}
