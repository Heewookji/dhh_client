import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_detail_controller.dart';
import 'package:dhh_client/widgets/custom_bubble.dart';
import 'package:dhh_client/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DiaryListScreen extends StatefulWidget {
  static final routeName = '/diary_list';

  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  bool _isBusy = true;
  int _chosenCharacterId;

  @override
  void initState() {
    super.initState();
    _doFuture();
  }

  void _doFuture() async {
    await Provider.of<CharactersProvider>(context, listen: false)
        .setAllCharacters();
    await _setDiariesAndQuestions(null);
    setState(() {
      _isBusy = false;
    });
  }

  Future<void> _setDiariesAndQuestions(int id) async {
    if (id == null) {
      await Provider.of<DiariesProvider>(context, listen: false)
          .setAllDiaries();
      await Provider.of<QuestionsProvider>(context, listen: false)
          .setQuestionMapByDiaryIds(
              Provider.of<DiariesProvider>(context, listen: false).diaryIds);
    } else {
      await Provider.of<DiariesProvider>(context, listen: false)
          .setDiariesByCharacterId(id);
      await Provider.of<QuestionsProvider>(context, listen: false)
          .setQuestionMapByDiaryIds(
              Provider.of<DiariesProvider>(context, listen: false).diaryIds);
    }
    _chosenCharacterId = id;
  }

  void _navigateDiaryDetailScreen(BuildContext context,
      List<Map<Type, Object>> diaryDetails, int initialPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiaryDetailController(initialPage, diaryDetails),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: _isBusy
          ? Center(child: CircularProgressIndicator())
          : Consumer4<CharactersProvider, DiariesProvider, QuestionsProvider,
              DiaryDetailProvider>(
              builder: (context, charactersProvider, diariesProvider,
                  questionProvider, diaryDetailProvider, child) {
                final characters = charactersProvider.characters;
                final diaries = diariesProvider.diaries;
                final questionMap = questionProvider.questionMap;
                final diaryDetails = diaryDetailProvider.setDiaryDetails(
                    characters, questionMap, diaries);
                return Container(
                  padding: EdgeInsets.only(
                    top: _screenSize.height *
                        Constants.BODY_HEIGHT_PADDING_PERCENT,
                  ),
                  child: Column(
                    children: [
                      _buildPanel(theme, _screenSize, diaries.length),
                      _buildCharacterList(_screenSize, characters),
                      _buildDiaryList(_screenSize, diaryDetails),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size _screenSize, int allDiariesCount) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        '${allDiariesCount.toString()}개 \n추억이\n쌓였어요',
        style: theme.textTheme.headline6,
      ),
      margin: EdgeInsets.only(bottom: _screenSize.height * 0.03378),
    );
  }

  Container _buildCharacterList(Size _screenSize, List<Character> characters) {
    return Container(
      height: _screenSize.height * 0.0675 + Constants.SHADOW_WIDTH * 2,
      margin: EdgeInsets.only(bottom: _screenSize.height * 0.03378),
      child: ListView.builder(
        itemCount: characters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final character = characters[i];
          return Row(
            children: [
              if (i == 0) _buildAllCharacterButton(_screenSize),
              Container(
                margin: EdgeInsets.only(right: _screenSize.width * 0.044),
                child: CustomCard(
                  SizedBox(
                    width: _screenSize.width * 0.138,
                    height: _screenSize.width * 0.138,
                    child: SvgPicture.asset(
                      character.statusImageUrl +
                          Constants.CHARACTER_IMAGE_FORMAT,
                    ),
                  ),
//                    color: _chosenCharacterId == character.id
//                        ? Color(character.color)
//                        : Colors.black12,
                  onPressed: () => _setDiariesAndQuestions(character.id),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAllCharacterButton(Size _screenSize) {
    return Row(
      children: [
        SizedBox(
          width: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        ),
        Container(
          margin: EdgeInsets.only(right: _screenSize.width * 0.05),
          child: CustomCard(
            SizedBox(
              width: _screenSize.width * 0.138,
              height: _screenSize.width * 0.138,
              child: Text(
                'ALL',
                style: TextStyle(
                  color:
                      _chosenCharacterId == null ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
//          backgroundColor:
//              _chosenCharacterId == null ? Colors.black : Colors.black12,
            onPressed: () => _setDiariesAndQuestions(null),
          ),
        )
      ],
    );
  }

  Expanded _buildDiaryList(
      Size _screenSize, List<Map<Type, Object>> diaryDetails) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        ),
        child: ListView.builder(
          itemCount: diaryDetails.length,
          itemBuilder: (context, i) {
            final character = diaryDetails[i][Character] as Character;
            return Container(
              height: _screenSize.height * 0.135,
              padding: EdgeInsets.only(
                top: Constants.BORDER_WIDTH,
                left: Constants.BORDER_WIDTH,
                bottom: _screenSize.height * 0.02,
                right: Constants.SHADOW_WIDTH,
              ),
              child: CustomBubble(
                Container(),
                onPressed: () => _navigateDiaryDetailScreen(
                  context,
                  diaryDetails,
                  i,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
