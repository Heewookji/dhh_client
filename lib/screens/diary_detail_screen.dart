import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class DiaryDetailScreen extends StatelessWidget {
  final Character character;
  final Question question;
  final Diary diary;

  DiaryDetailScreen(this.character, this.question, this.diary);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(character.color),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            left: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            right: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
            top: _screenSize.height * Constants.BODY_HEIGHT_PADDING_PERCENT,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('y년 M월 d일').format(diary.createdAt),
                          style: theme.textTheme.caption,
                        ),
                        Text(
                          character.name,
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                    margin:
                        EdgeInsets.only(bottom: _screenSize.height * 0.01351),
                  ),
                  Container(
                    child: CustomCard(
                      Text(
                        question.text,
                        style: theme.textTheme.subtitle1,
                      ),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(_screenSize.width * 0.0444),
                    ),
                    margin:
                        EdgeInsets.only(bottom: _screenSize.height * 0.02162),
                  ),
                ],
              ),
              CustomCard(
                Text(diary.text),
                padding: EdgeInsets.symmetric(
                  vertical: _screenSize.height * 0.02162,
                  horizontal: _screenSize.width * 0.0444,
                ),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
