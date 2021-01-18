import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_detail_controller.dart';
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
          ? Container()
          : Consumer4<CharactersProvider, DiariesProvider, QuestionsProvider,
              DiaryDetailProvider>(
              builder: (context, charactersProvider, diariesProvider,
                  questionProvider, diaryDetailProvider, child) {
                final characters = charactersProvider.characters;
                final diaries = diariesProvider.diaries;
                final questionMap = questionProvider.questionMap;
                final diaryDetails = diaryDetailProvider.setDiaryDetails(
                    characters, questionMap, diaries);
                return Column(
                  children: [
                    _buildPanel(theme, _screenSize, diaries.length),
                    _buildCharacterList(_screenSize, characters),
                    _buildDiaryList(_screenSize, diaryDetails),
                  ],
                );
              },
            ),
    );
  }

  Widget _buildPanel(ThemeData theme, Size screenSize, int allDiariesCount) {
    return Container(
      height: screenSize.height * 0.25,
      child: Row(
        children: [
          Text(
            '${allDiariesCount.toString()}개 \n추억이\n쌓였어요',
            style: theme.textTheme.headline2,
          ),
        ],
      ),
    );
  }

  Container _buildCharacterList(Size screenSize, List<Character> characters) {
    return Container(
      height: screenSize.height * 0.1,
      child: ListView.builder(
        itemCount: characters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final character = characters[i];
          return Row(
            children: [
              if (i == 0) _buildAllCharacterButton(screenSize),
              GestureDetector(
                onTap: () => _setDiariesAndQuestions(character.id),
                child: Container(
                  margin: EdgeInsets.only(right: screenSize.width * 0.05),
                  child: CircleAvatar(
                    maxRadius: screenSize.width * 0.1,
                    child: SvgPicture.asset(
                      character.statusImageUrl +
                          Constants.CHARACTER_IMAGE_FORMAT,
                    ),
                    backgroundColor: _chosenCharacterId == character.id
                        ? Color(character.color)
                        : Colors.black12,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildAllCharacterButton(Size screenSize) {
    return GestureDetector(
      onTap: () => _setDiariesAndQuestions(null),
      child: Container(
        margin: EdgeInsets.only(right: screenSize.width * 0.05),
        child: CircleAvatar(
          maxRadius: screenSize.width * 0.1,
          backgroundColor:
              _chosenCharacterId == null ? Colors.black : Colors.black12,
          child: Text(
            '전체',
            style: TextStyle(
              color: _chosenCharacterId == null ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildDiaryList(
      Size screenSize, List<Map<Type, Object>> diaryDetails) {
    return Expanded(
      child: ListView.builder(
        itemCount: diaryDetails.length,
        itemBuilder: (context, i) {
          final character = diaryDetails[i][Character] as Character;
          final question = diaryDetails[i][Question] as Question;
          return GestureDetector(
            onTap: () => _navigateDiaryDetailScreen(
              context,
              diaryDetails,
              i,
            ),
            child: Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              height: screenSize.height * 0.15,
              color: Color(character.color),
              child: Text(question.text),
            ),
          );
        },
      ),
    );
  }
}
