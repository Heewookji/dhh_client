import 'dart:math';

import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/custom_main_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CharacterFinishedHome extends StatefulWidget {
  final _isSubmittedToday;

  CharacterFinishedHome(this._isSubmittedToday);

  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterFinishedHome> {
  List<Point<double>> _locationPoints;
  int chosenId;

  static List<Point<double>> getLocationPoints(Size homeSize) {
    return [
      //character
      Point(homeSize.width * 0.1, homeSize.height * 0.05),
      Point(homeSize.width * 0.4, homeSize.height * 0.05),
      Point(homeSize.width * 0.7, homeSize.height * 0.05),
      Point(homeSize.width * 0.1, homeSize.height * 0.25),
      Point(homeSize.width * 0.4, homeSize.height * 0.25),
      Point(homeSize.width * 0.7, homeSize.height * 0.25),
      Point(homeSize.width * 0.1, homeSize.height * 0.45),
      Point(homeSize.width * 0.4, homeSize.height * 0.45),
      Point(homeSize.width * 0.7, homeSize.height * 0.45),
      Point(homeSize.width * 0.7, homeSize.height * 0.65),
    ];
  }

  void chooseCharacter(Character character) {
    setState(() {
      chosenId = character.id;
    });
  }

  void _navigateFreeWriteScreen(Character character) async {
    await Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': character,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: _screenSize.height * 0.01621,
          bottom: _screenSize.height * 0.02162,
        ),
        height: _screenSize.height,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            _locationPoints = getLocationPoints(constraints.biggest);
            return Consumer<CharactersProvider>(
              builder: (context, charactersProvider, child) {
                return Stack(
                  children: [
                    SizedBox(
                      width: _screenSize.width,
                      height: _screenSize.height,
                      child: SvgPicture.asset(
                          'assets/images/finished_background.svg'),
                    ),
                    for (final character in charactersProvider.characters)
                      Positioned(
                        left: _locationPoints[character.id - 1].x,
                        top: _locationPoints[character.id - 1].y,
                        child: _buildCharacterAndBubble(
                          _theme,
                          character,
                          constraints.biggest,
                          chosenId,
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Column _buildCharacterAndBubble(
      ThemeData theme, Character character, Size homeSize, int chosenId) {
    final double bubbleWidth = 100;
    final double bubbleHeight = 48;
    return Column(
      children: [
        _buildBubble(character, chosenId, bubbleWidth, bubbleHeight, homeSize),
        GestureDetector(
          onTap: () => chooseCharacter(character),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: bubbleWidth,
              ),
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
        ),
      ],
    );
  }

  Column _buildBubble(Character character, int chosenId, double bubbleWidth,
      double bubbleHeight, Size homeSize) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutCirc,
          width: character.id != chosenId ? bubbleWidth : 0,
          height: character.id != chosenId ? bubbleHeight : 0,
          margin: character.id != chosenId
              ? EdgeInsets.only(bottom: homeSize.height * 0.01)
              : EdgeInsets.zero,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutCirc,
          width: character.id == chosenId ? bubbleWidth : 0,
          height: character.id == chosenId ? bubbleHeight : 0,
          child: character.id == chosenId &&
//              !widget._isSubmittedToday
                  true
              ? CustomMainBubble(
                  FlatButton(
                    child: Text(
                      '일기쓰기 >',
                      softWrap: false,
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => _navigateFreeWriteScreen(character),
                  ),
                  Colors.white,
                  Size(bubbleWidth, bubbleHeight),
                  padding: EdgeInsets.only(bottom: 2),
                  alignment: Alignment.center,
                )
              : Container(),
          margin: EdgeInsets.only(bottom: 5),
        ),
      ],
    );
  }
}
