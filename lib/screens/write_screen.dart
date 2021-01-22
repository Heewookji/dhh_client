import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/widgets/write/write_free_panel.dart';
import 'package:dhh_client/widgets/write/write_panel.dart';
import 'package:dhh_client/widgets/write/write_submit_button.dart';
import 'package:dhh_client/widgets/write/write_text_field.dart';
import 'package:flutter/material.dart';

class WriteScreen extends StatefulWidget {
  static final routeName = '/write';
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  final TextEditingController _questionController = TextEditingController();
  final FocusNode _questionFocus = FocusNode();
  Character character;
  Question question;

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    character = arguments['character'];
    question = arguments['question'];
    final _isFreeWrite = question == null;
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => _focus.unfocus(),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(
              left: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
              right: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
              top: _screenSize.height * Constants.BODY_HEIGHT_PADDING_PERCENT,
            ),
            child: Column(
              children: [
                _isFreeWrite
                    ? WriteFreePanel(
                        character, _questionController, _questionFocus)
                    : WritePanel(character, question),
                WriteTextField(_controller, _focus),
                WriteSubmitButton(character, question, _controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
