import 'package:dhh_client/models/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../custom_character_button.dart';

class CharacterList extends StatelessWidget {
  final List<Character> _characters;
  final Character _chosenCharacter;
  final Function(Character) _setDiariesAndQuestions;

  CharacterList(
    this._characters,
    this._chosenCharacter,
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
                width: _screenSize.width * 0.138,
                height: _screenSize.width * 0.138,
                margin: EdgeInsets.only(right: _screenSize.width * 0.044),
                child: CustomCharacterButton(
                  SvgPicture.asset(
                    character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
                  ),
                  Color(character.color),
                  _chosenCharacter != null &&
                      _chosenCharacter.id == character.id,
                  onPressed: () => _setDiariesAndQuestions(character),
                  padding: EdgeInsets.all(_screenSize.width * 0.022),
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
          width: _screenSize.width * 0.138,
          height: _screenSize.width * 0.138,
          margin: EdgeInsets.only(right: _screenSize.width * 0.05),
          child: CustomCharacterButton(
            Container(
              alignment: Alignment.center,
              child: Text(
                'ALL',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Colors.black,
            _chosenCharacter == null,
            onPressed: () => _setDiariesAndQuestions(null),
          ),
        ),
      ],
    );
  }
}
