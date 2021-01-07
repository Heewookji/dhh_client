import 'dart:math';

import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterHome extends StatefulWidget {
  final Function(Character, QuestionsProvider) _chooseCharacter;
  final Size _bodySize;
  CharacterHome(this._chooseCharacter, this._bodySize);
  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterHome> {
  List<Point<double>> _locationPoints;

  void _characterLocationInit(Size homeSize) {
    _locationPoints = [
      //npc
      Point(homeSize.width * 0.1, homeSize.height * 0.05),
      Point(homeSize.width * 0.6, homeSize.height * 0.35),
      Point(homeSize.width * 0.1, homeSize.height * 0.65),
      //character
      Point(homeSize.width * 0.4, homeSize.height * 0.05),
      Point(homeSize.width * 0.7, homeSize.height * 0.05),
      Point(homeSize.width * 0.3, homeSize.height * 0.35),
      Point(homeSize.width * 0.4, homeSize.height * 0.65),
      Point(homeSize.width * 0.7, homeSize.height * 0.65),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: widget._bodySize.height * 0.55,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Consumer2<CharactersProvider, QuestionsProvider>(
            builder: (context, charactersProvider, questionsProvider, child) {
              _characterLocationInit(constraints.biggest);
              return Stack(
                children: [
                  for (int i = 0; i < charactersProvider.characters.length; i++)
                    Positioned(
                      left: _locationPoints[i].x,
                      top: _locationPoints[i].y,
                      child: _buildCharacter(
                        charactersProvider.characters[i],
                        questionsProvider,
                        constraints.biggest,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  GestureDetector _buildCharacter(
      Character character, QuestionsProvider questionsProvider, Size homeSize) {
    return GestureDetector(
      onTap: () => widget._chooseCharacter(character, questionsProvider),
      child: Column(
        children: [
          Container(
            color: Color(character.color),
            child: Image.asset(
              character.statusImageUrl,
              width: homeSize.width * 0.2,
              height: homeSize.width * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
