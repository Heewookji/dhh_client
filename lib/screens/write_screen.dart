import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/home_provider.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:dhh_client/widgets/custom_dialog.dart';
import 'package:dhh_client/widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatefulWidget {
  static final routeName = '/write';
  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
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
    ThemeData theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    Map<String, Object> arguments = ModalRoute.of(context).settings.arguments;
    character = arguments['character'];
    question = arguments['question'];
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
                _buildPanel(theme, _screenSize),
                _buildTextField(theme, _screenSize),
                _buildSubmitButton(context, _screenSize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size _screenSize) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('y년 M월 d일').format(DateTime.now()),
                style: theme.textTheme.caption,
              ),
              Text(
                character.name,
                style: theme.textTheme.caption,
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01621),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            question.text,
            style: theme.textTheme.subtitle1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height:
                _screenSize.height * Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
            width:
                _screenSize.height * Constants.CHARACTER_IMAGE_HEIGHT_PERCENT,
            child: SvgPicture.asset(
              character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            '질문에 답하기',
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01351),
        ),
      ],
    );
  }

  Widget _buildTextField(ThemeData theme, Size _screenSize) {
    return Container(
      child: CustomCard(
        Container(
          height: _screenSize.height * 0.3,
          child: TextFormField(
            controller: _controller,
            focusNode: _focus,
            style: theme.textTheme.bodyText2,
            autocorrect: false,
            enableSuggestions: false,
            scrollPhysics: BouncingScrollPhysics(),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              helperStyle: TextStyle(height: 0),
            ),
            maxLength: 2000,
            maxLines: 100,
          ),
          padding: EdgeInsets.only(
            left: _screenSize.width * 0.0444,
            right: _screenSize.width * 0.0444,
            bottom: _screenSize.height * 0.02162,
          ),
        ),
      ),
      margin: EdgeInsets.only(bottom: _screenSize.height * 0.02702),
    );
  }

  Widget _buildSubmitButton(BuildContext context, Size _screenSize) {
    return Consumer3<DiariesProvider, CharactersProvider, HomeProvider>(
      builder:
          (context, diariesProvider, charactersProvider, homeProvider, child) {
        return Container(
          child: CustomRaisedButton(
            '저장하기',
            onPressed: () async {
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
                  builder: (context) => CustomDialog(result),
                );
                return;
              }
              Navigator.of(context).pop<Map>(result);
            },
            color: Colors.black,
            alignment: Alignment.center,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02702),
        );
      },
    );
  }
}
