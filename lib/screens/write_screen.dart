import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatefulWidget {
  static final routeName = '/write';
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _controller = TextEditingController();
  Character character;
  Question question;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final appBar = AppBar();
    final _mediaQuery = MediaQuery.of(context);
    final _bodySize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height -
          appBar.preferredSize.height -
          _mediaQuery.padding.top -
          _mediaQuery.padding.bottom,
    );
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    character = arguments['character'];
    question = arguments['question'];
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPanel(theme, _bodySize),
            _buildTextField(_bodySize),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size bodySize) {
    return Container(
      height: bodySize.height * 0.5,
      child: Column(
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('질문에 답하기'),
              Container(
                height: bodySize.height * 0.2,
                child: Image.asset(character.statusImageUrl),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(Size bodySize) {
    return Container(
      height: bodySize.height * 0.35,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
      ),
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

  Widget _buildSubmitButton(BuildContext context) {
    return Consumer2<DiariesProvider, CharactersProvider>(
      builder: (context, diariesProvider, charactersProvider, child) {
        return FlatButton(
          child: Text('저장하기'),
          onPressed: _controller.text.length == 0
              ? null
              : () async {
                  final isFirstSubmit = diariesProvider.topDiary == null;
                  await diariesProvider.addDiary(question.id, _controller.text);
                  final statusUpdated =
                      await charactersProvider.updateCharacterByDiaryCount(
                          character.id, character.statusCode);
                  final newCharacterAtHome =
                      await charactersProvider.updateRandomCharacterHome();
                  Navigator.of(context).pop<Map>({
                    'isFirstSubmit': isFirstSubmit,
                    'statusUpdated': statusUpdated == 1,
                    'characterTraveled': statusUpdated == 1 &&
                        character.statusCode >=
                            CharactersProvider.TRAVEL_STATUS,
                    'newCharacterAtHome': newCharacterAtHome == 1,
                  });
                },
        );
      },
    );
  }
}
