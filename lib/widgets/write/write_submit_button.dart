import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_dialog.dart';
import '../custom_raised_button.dart';

class WriteSubmitButton extends StatelessWidget {
  final Character character;
  final Question question;
  final TextEditingController _controller;

  WriteSubmitButton(this.character, this.question, this._controller);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Consumer3<DiariesProvider, CharactersProvider, HomeProvider>(
      builder:
          (context, diariesProvider, charactersProvider, homeProvider, child) {
        return Container(
          child: CustomRaisedButton(
            '저장하기',
            onPressed: () async {
              if (_controller.text.length == 0) return;
              final result = await diariesProvider.addDiaryAndUpdateCharacter(
                question.id,
                _controller.text,
                charactersProvider,
                character,
                homeProvider,
              );
              if (result['status'] == Status.Error) {
                await showDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  builder: (context) => CustomDialog(result),
                );
                return;
              }
              Navigator.of(context).pop<Map>(result);
            },
            color: Colors.black,
            alignment: Alignment.center,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02702),
        );
      },
    );
  }
}
