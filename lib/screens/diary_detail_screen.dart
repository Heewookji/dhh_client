import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetailScreen extends StatelessWidget {
  static final routeName = '/diary_detail';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    Character character = arguments['character'];
    Question question = arguments['question'];
    Diary diary = arguments['diary'];
    return Scaffold(
      appBar: AppBar(),
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
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [Text('질문에 답하기'), Container()],
        ),
      ],
    );
  }

  Container _buildTextField(Size screenSize) {
    return Container(
      height: screenSize.height * 0.5,
      color: Colors.black12,
    );
  }
}
