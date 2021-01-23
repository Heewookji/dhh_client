import 'dart:math';

import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/custom_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CharacterFinishedHome extends StatefulWidget {
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
    return SafeArea(
      child: Container(
        color: Colors.black12,
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
                    for (final character in charactersProvider.characters)
                      Positioned(
                        left: _locationPoints[character.id - 1].x,
                        top: _locationPoints[character.id - 1].y,
                        child: _buildCharacter(
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

  Column _buildCharacter(Character character, Size homeSize, int chosenId) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          width: character.id != chosenId ? homeSize.width * 0.2 : 0,
          height: character.id != chosenId ? homeSize.width * 0.1 : 0,
          margin: EdgeInsets.only(bottom: homeSize.height * 0.01),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          width: character.id == chosenId ? homeSize.width * 0.2 : 0,
          height: character.id == chosenId ? homeSize.width * 0.1 : 0,
          child: character.id == chosenId
              ? CustomBubble(
                  FlatButton(
                    child: Text(''),
                    onPressed: () => _navigateFreeWriteScreen(character),
                  ),
                  Colors.white,
                  Size(homeSize.width * 0.2, homeSize.width * 0.1),
                )
              : Container(),
          margin: EdgeInsets.only(bottom: homeSize.height * 0.01),
        ),
        GestureDetector(
          onTap: () => chooseCharacter(character),
          child: Container(
            color: Color(character.color),
            child: SizedBox(
              height: homeSize.width * 0.2,
              width: homeSize.width * 0.2,
              child: SvgPicture.asset(
                character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
