import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  static final routeName = '/write';

  @override
  Widget build(BuildContext context) {
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    int characterId = arguments['characterId'];
    String question = arguments['question'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(characterId.toString()),
          Text(question),
        ],
      ),
    );
  }
}
