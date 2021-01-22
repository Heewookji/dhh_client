import 'dart:math';

import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CharacterFinishedHome extends StatefulWidget {
  final Function(Character, QuestionsProvider) _chooseCharacter;
  CharacterFinishedHome(this._chooseCharacter);
  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterFinishedHome> {
  List<Point<double>> _locationPoints;

  static List<Point<double>> getLocationPoints(Size homeSize) {
    return [
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
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.only(top: _screenSize.height * 0.232),
      height: _screenSize.height * 0.5,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _locationPoints = getLocationPoints(constraints.biggest);
          return Consumer2<CharactersProvider, QuestionsProvider>(
            builder: (context, charactersProvider, questionsProvider, child) {
              return Stack(
                children: [
                  for (final character in charactersProvider.characters)
                    Positioned(
                      left: _locationPoints[character.locationId - 1].x,
                      top: _locationPoints[character.locationId - 1].y,
                      child: _buildCharacter(
                        character,
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
            child: SizedBox(
              height: homeSize.width * 0.2,
              width: homeSize.width * 0.2,
              child: SvgPicture.asset(
                character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
