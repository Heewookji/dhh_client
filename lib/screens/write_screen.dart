import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WriteScreen extends StatefulWidget {
  static final routeName = '/write';

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    Character character = arguments['character'];
    Question question = arguments['question'];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _buildPanel(theme, screenSize, question, character),
          _buildTextField(screenSize),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size screenSize, Question question,
      Character character) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(DateFormat.yMd().format(DateTime.now())),
            Text(character.name),
          ],
        ),
        Text(
          question.text,
          style: theme.textTheme.headline2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('질문에 답하기'),
            Container(
              height: screenSize.height * 0.2,
              child: Image.asset(character.statusImageUrl),
            )
          ],
        ),
      ],
    );
  }

  Container _buildTextField(Size screenSize) {
    return Container(
      height: screenSize.height * 0.5,
      color: Colors.black12,
      child: TextFormField(
        maxLines: 100,
        controller: _controller,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return FlatButton(
      child: Text('저장하기'),
      onPressed: _controller.text.length == 0 ? null : () {},
    );
  }
}
