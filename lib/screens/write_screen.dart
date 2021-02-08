import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/home_provider.dart';
import 'package:dhh_client/widgets/custom_dialog.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:dhh_client/widgets/write/write_free_panel.dart';
import 'package:dhh_client/widgets/write/write_panel.dart';
import 'package:dhh_client/widgets/write/write_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _questionController.dispose();
    _questionFocus.dispose();
    super.dispose();
  }

  void _submit(
    bool _isFreeWrite,
    DiariesProvider diariesProvider,
    CharactersProvider charactersProvider,
    HomeProvider homeProvider,
  ) async {
    if (!_isFreeWrite) {
      if (_controller.text.length == 0) return;
      final result = await diariesProvider.addDiaryAndUpdateCharacter(
        question.id,
        _controller.text,
        charactersProvider,
        character,
        homeProvider,
      );
      if (result['status'] == Status.Error) {
        await showDialog(
          context: context,
          barrierColor: Colors.black54,
          barrierDismissible: false,
          builder: (context) => CustomDialog(result),
        );
        return;
      }
      Navigator.of(context).pop<Map>(result);
    } else {
      if (_controller.text.length == 0 || _questionController.text.length == 0)
        return;
      final result = await diariesProvider.addFreeDiary(
        character,
        _questionController.text,
        _controller.text,
      );
      if (result['status'] == Status.Error) {
        await showDialog(
          context: context,
          barrierColor: Colors.black54,
          barrierDismissible: false,
          builder: (context) => CustomDialog(result),
        );
        return;
      }
      Navigator.of(context).pop<Map>();
    }
  }

  void _onChanged() {
    setState(() {});
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
        onTap: () {
          _focus.unfocus();
          _questionFocus.unfocus();
        },
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
                    ? WriteFreePanel(character, _questionController,
                        _questionFocus, _onChanged)
                    : WritePanel(character, question),
                WriteTextField(_isFreeWrite, _controller, _focus, _onChanged),
                _buildSubmitButton(_screenSize, _isFreeWrite),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(Size _screenSize, bool _isFreeWrite) {
    bool disabled = false;
    if (_isFreeWrite)
      disabled =
          _controller.text.length == 0 || _questionController.text.length == 0;
    else
      disabled = _controller.text.length == 0;
    return Consumer3<DiariesProvider, CharactersProvider, HomeProvider>(
      builder:
          (context, diariesProvider, charactersProvider, homeProvider, child) {
        return Center(
          child: Container(
            child: CustomRaisedButton(
              '저장하기',
              onPressed: disabled
                  ? null
                  : () => _submit(
                        _isFreeWrite,
                        diariesProvider,
                        charactersProvider,
                        homeProvider,
                      ),
              color: Colors.black,
              alignment: Alignment.center,
              disabled: disabled,
            ),
            margin: EdgeInsets.only(bottom: _screenSize.height * 0.02702),
          ),
        );
      },
    );
  }
}
