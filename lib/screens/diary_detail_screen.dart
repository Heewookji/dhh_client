import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetailScreen extends StatefulWidget {
  static final routeName = '/diary_detail';

  @override
  _DiaryDetailScreenState createState() => _DiaryDetailScreenState();
}

class _DiaryDetailScreenState extends State<DiaryDetailScreen> {
  Character character;
  Question question;
  Diary diary;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    character = arguments['character'];
    question = arguments['question'];
    diary = arguments['diary'];
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(character.color),
      body: Column(
        children: [
          _buildPanel(theme, screenSize),
          _buildTextField(screenSize),
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
            Text(DateFormat.yMd().format(DateTime.now())),
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
      color: Colors.black12,
      child: Text(diary.text),
    );
  }
}
