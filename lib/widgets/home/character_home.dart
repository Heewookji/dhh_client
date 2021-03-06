import 'dart:math';

import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CharacterHome extends StatefulWidget {
  final Function(Character, QuestionsProvider, Offset) _chooseCharacter;
  final Function(Character, Offset) _chooseCharacterAfterSubmitted;
  final bool _isSubmittedToday;

  CharacterHome(
    this._chooseCharacter,
    this._isSubmittedToday,
    this._chooseCharacterAfterSubmitted,
  );
  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterHome> {
  List<Point<double>> _locationPoints;

  static List<Point<double>> getLocationPoints(Size homeSize) {
    return [
      //character
      Point(homeSize.width * 0.08, homeSize.height * 0.68),
      Point(homeSize.width * 0.62, homeSize.height * 0.54),
      Point(homeSize.width * 0.27, homeSize.height * 0.37),
      Point(homeSize.width * 0.12, homeSize.height * 0.03),
      Point(homeSize.width * 0.48, homeSize.height * 0.03),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: _screenSize.height * 0.232),
      width: (_screenSize.height * 0.5) * 0.8777,
      height: _screenSize.height * 0.5,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _locationPoints = getLocationPoints(constraints.biggest);
          return Consumer2<CharactersProvider, QuestionsProvider>(
            builder: (context, charactersProvider, questionsProvider, child) {
              return Stack(
                overflow: Overflow.visible,
                children: [
                  SizedBox(
                    width: (_screenSize.height * 0.5) * 0.8777,
                    height: _screenSize.height * 0.5,
                    child: SvgPicture.asset(
                      'assets/images/background.svg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  for (final character in charactersProvider.characters)
                    Positioned(
                      left: _locationPoints[character.locationId - 1].x,
                      bottom: _locationPoints[character.locationId - 1].y,
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
      onTapDown: widget._isSubmittedToday
          ? (detail) => widget._chooseCharacterAfterSubmitted(
              character, detail.globalPosition)
          : (detail) => widget._chooseCharacter(
              character, questionsProvider, detail.globalPosition),
      child: Column(
        children: [
          Container(
            child: SizedBox(
              height: homeSize.height * 0.3,
              width: homeSize.height * 0.3,
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
