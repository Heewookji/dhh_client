import 'package:dhh_client/constants.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_detail_controller.dart';
import 'package:dhh_client/widgets/diary_list/character_list.dart';
import 'package:dhh_client/widgets/diary_list/diary_list.dart';
import 'package:dhh_client/widgets/diary_list/diary_list_panel.dart';
import 'package:flutter/material.dart';
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
                      DiaryListPanel(diaries.length),
                      CharacterList(
                        characters,
                        _chosenCharacterId,
                        _setDiariesAndQuestions,
                      ),
                      DiaryList(
                        diaryDetails,
                        _navigateDiaryDetailScreen,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
