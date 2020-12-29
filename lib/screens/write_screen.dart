import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  static final routeName = '/write';

  @override
  Widget build(BuildContext context) {
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    Character character = arguments['character'];
    Question question = arguments['question'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(character.name),
          Text(question.text),
        ],
      ),
    );
  }
}
