import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class WritePanel extends StatelessWidget {
  final Character character;
  final Question question;

  WritePanel(this.character, this.question);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('y년 M월 d일').format(DateTime.now()),
                style: theme.textTheme.caption,
              ),
              Text(
                character.name,
                style: theme.textTheme.caption,
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01621),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            question.text,
            style: theme.textTheme.subtitle1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height:
                _screenSize.height * Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
            width:
                _screenSize.height * Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
            child: SvgPicture.asset(
              character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            '질문에 답하기',
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01351),
        ),
      ],
    );
  }
}
