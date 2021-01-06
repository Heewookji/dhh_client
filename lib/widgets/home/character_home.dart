import 'dart:math';

import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterHome extends StatefulWidget {
  final Function(Character, QuestionsProvider) _chooseCharacter;
  CharacterHome(this._chooseCharacter);
  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterHome> {
  bool _isBusy = true;
  List<Point<double>> _locationPoints;

  @override
  void initState() {
    super.initState();
    doFuture();
  }

  void doFuture() async {
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

  void _characterLocationInit(Size screenSize) {
    _locationPoints = [
      //npc
      Point(screenSize.width * 0.1, screenSize.height * 0),
      Point(screenSize.width * 0.6, screenSize.height * 0.15),
      Point(screenSize.width * 0.1, screenSize.height * 0.3),
      //character
      Point(screenSize.width * 0.4, screenSize.height * 0),
      Point(screenSize.width * 0.7, screenSize.height * 0),
      Point(screenSize.width * 0.3, screenSize.height * 0.15),
      Point(screenSize.width * 0.4, screenSize.height * 0.3),
      Point(screenSize.width * 0.7, screenSize.height * 0.3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _characterLocationInit(screenSize);
    return Container(
      color: Colors.black12,
      height: screenSize.height * 0.5,
      child: Consumer2<CharactersProvider, QuestionsProvider>(
        builder: (context, charactersProvider, questionsProvider, child) {
          return Stack(
            children: [
              if (_isBusy)
                Container()
              else
                for (int i = 0; i < charactersProvider.characters.length; i++)
                  Positioned(
                    left: _locationPoints[i].x,
                    top: _locationPoints[i].y,
                    child: _buildCharacter(
                      charactersProvider.characters[i],
                      questionsProvider,
                      screenSize,
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }

  GestureDetector _buildCharacter(Character character,
      QuestionsProvider questionsProvider, Size screenSize) {
    return GestureDetector(
      onTap: () => widget._chooseCharacter(character, questionsProvider),
      child: Column(
        children: [
          Text(character.name),
          Container(
            color: Color(character.color),
            child: Image.asset(
              character.statusImageUrl,
              width: screenSize.width * 0.2,
              height: screenSize.width * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
