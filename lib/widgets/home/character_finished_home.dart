import 'dart:math';

import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/home/custom_home_bubble.dart';
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
  static const double bubbleWidth = 100;
  static const double bubbleHeight = 48;
  List<Point<double>> _locationPoints;
  int chosenId;

  static List<Point<double>> getLocationPoints(Size homeSize) {
    return [
      //character
      Point(homeSize.width * 0.12, homeSize.height * 0.775),
      Point(homeSize.width * 0.4, homeSize.height * 0.74),
      Point(homeSize.width * 0.66, homeSize.height * 0.618),
      Point(homeSize.width * 0.05, homeSize.height * 0.54),
      Point(homeSize.width * 0.41, homeSize.height * 0.54),
      Point(homeSize.width * 0.48, homeSize.height * 0.33),
      Point(homeSize.width * 0.05, homeSize.height * 0.25),
      Point(homeSize.width * 0.35, homeSize.height * 0.115),
      Point(homeSize.width * 0.67, homeSize.height * 0.115),
      Point(homeSize.width * 0.08, homeSize.height * 0.02),
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
          bottom: _screenSize.height * 0.02162,
        ),
        width: (_screenSize.height * 0.85) * 0.5411,
        height: _screenSize.height * 0.85,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            _locationPoints = getLocationPoints(constraints.biggest);
            final characterWidth = constraints.biggest.height * 0.15;
            return Consumer<CharactersProvider>(
              builder: (context, charactersProvider, child) {
                return Stack(
                  overflow: Overflow.visible,
                  children: [
                    SizedBox(
                      width: (_screenSize.height * 0.85) * 0.5411,
                      height: _screenSize.height * 0.85,
                      child: SvgPicture.asset(
                          'assets/images/background_finished.svg'),
                    ),
                    for (int i = 0;
                        i < charactersProvider.characters.length;
                        i++)
                      Positioned(
                        left: _locationPoints[i].x -
                            ((bubbleWidth - characterWidth <= 0
                                    ? 0
                                    : bubbleWidth - characterWidth) /
                                2),
                        bottom: _locationPoints[i].y,
                        child: _buildCharacterAndBubble(
                          _theme,
                          charactersProvider.characters[i],
                          characterWidth,
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

  Column _buildCharacterAndBubble(ThemeData theme, Character character,
      double characterWidth, int chosenId) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => chooseCharacter(character),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                child: SizedBox(
                  height: characterWidth,
                  width: characterWidth,
                  child: SvgPicture.asset(
                    character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
                  ),
                ),
                margin: EdgeInsets.only(top: 15),
              ),
              _buildBubble(character, chosenId),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBubble(Character character, int chosenId) {
    return Stack(
      children: [
        Container(width: bubbleWidth),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOutCirc,
          width: character.id == chosenId ? bubbleWidth : 0,
          height: character.id == chosenId ? bubbleHeight : 0,
          child: character.id == chosenId &&
//              !widget._isSubmittedToday
                  true
              ? CustomHomeBubble(
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
