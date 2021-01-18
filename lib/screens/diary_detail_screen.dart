import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: Column(
        children: [
          _buildPanel(theme, _screenSize),
          _buildTextField(_screenSize),
        ],
      ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size screenSize) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(DateFormat.yMd().format(diary.createdAt)),
            Text(character.name),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            question.text,
            style: theme.textTheme.headline2,
            textAlign: TextAlign.left,
          ),
        ),
        Container(height: screenSize.height * 0.2),
      ],
    );
  }

  Container _buildTextField(Size screenSize) {
    return Container(
      alignment: Alignment.topLeft,
      height: screenSize.height * 0.5,
      child: Text(diary.text),
    );
  }
}
