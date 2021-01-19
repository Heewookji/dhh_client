import 'package:dhh_client/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../custom_character_button.dart';

class CharacterList extends StatelessWidget {
  final List<Character> _characters;
  final int _chosenCharacterId;
  final Function(int) _setDiariesAndQuestions;

  CharacterList(
    this._characters,
    this._chosenCharacterId,
    this._setDiariesAndQuestions,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.0675 + Constants.SHADOW_WIDTH * 2,
      margin: EdgeInsets.only(bottom: _screenSize.height * 0.03378),
      child: ListView.builder(
        itemCount: _characters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final character = _characters[i];
          return Row(
            children: [
              if (i == 0) _buildAllCharacterButton(_screenSize),
              Container(
                margin: EdgeInsets.only(right: _screenSize.width * 0.044),
                child: SizedBox(
                  width: _screenSize.width * 0.138,
                  height: _screenSize.width * 0.138,
                  child: CustomCharacterButton(
                    SvgPicture.asset(
                      character.statusImageUrl +
                          Constants.CHARACTER_IMAGE_FORMAT,
                    ),
                    Color(character.color),
                    _chosenCharacterId == character.id,
                    onPressed: () => _setDiariesAndQuestions(character.id),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAllCharacterButton(Size _screenSize) {
    return Row(
      children: [
        SizedBox(
          width: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        ),
        Container(
          margin: EdgeInsets.only(right: _screenSize.width * 0.05),
          child: SizedBox(
            width: _screenSize.width * 0.138,
            height: _screenSize.width * 0.138,
            child: CustomCharacterButton(
              Text(
                'ALL',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Colors.black,
              _chosenCharacterId == null,
              onPressed: () => _setDiariesAndQuestions(null),
            ),
          ),
        )
      ],
    );
  }
}
