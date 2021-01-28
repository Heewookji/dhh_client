import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/diary_details_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_detail_controller.dart';
import 'package:dhh_client/widgets/custom_fill_animation.dart';
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

class _DiaryListScreenState extends State<DiaryListScreen>
    with TickerProviderStateMixin {
  final _diaryScroll = ScrollController();
  AnimationController _animationController;
  Animation<double> _animation;
  bool _isBusy = true;
  Character _chosenCharacter;
  Offset _pickedLocation;
  Color _pastColor;

  @override
  void initState() {
    super.initState();
    _doFuture();
  }

  @override
  void dispose() {
    _diaryScroll.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _doFuture() async {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuart,
      ),
    );
    await Provider.of<CharactersProvider>(context, listen: false)
        .setAllCharacters();
    await _setDiariesAndQuestions(null, init: true);
    setState(() {
      _isBusy = false;
    });
  }

  Future<void> _setDiariesAndQuestions(Character character,
      {init = false}) async {
    if (character == null) {
      await Provider.of<DiariesProvider>(context, listen: false)
          .setAllDiaries();
      await Provider.of<QuestionsProvider>(context, listen: false)
          .setQuestionMapByDiaryIds(
              Provider.of<DiariesProvider>(context, listen: false).diaryIds);
    } else {
      await Provider.of<DiariesProvider>(context, listen: false)
          .setDiariesByCharacterId(character.id);
      await Provider.of<QuestionsProvider>(context, listen: false)
          .setQuestionMapByDiaryIds(
              Provider.of<DiariesProvider>(context, listen: false).diaryIds);
    }
    _chosenCharacter = character;
    if (!init) {
      _diaryScroll.animateTo(
        0,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeOutCirc,
      );
    }
  }

  Future<void> _setDiariesAndQuestionsPlayAnimation(
      Character character, Offset pickedLocation) async {
    if ((_chosenCharacter != null &&
            character != null &&
            character.id == _chosenCharacter.id) ||
        _animationController.isAnimating) return;
    _setDiariesAndQuestions(character);
    _animationController.reset();
    _pickedLocation = pickedLocation;
    await _animationController.forward();
    _pastColor =
        _chosenCharacter != null ? Color(_chosenCharacter.color) : Colors.white;
    return true;
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
    final _appBar = AppBar();
    final _topPadding =
        _screenSize.height * Constants.BODY_HEIGHT_PADDING_PERCENT +
            _appBar.preferredSize.height +
            MediaQuery.of(context).padding.top;
    return _isBusy
        ? Scaffold(appBar: _appBar)
        : Consumer4<CharactersProvider, DiariesProvider, QuestionsProvider,
            DiaryDetailProvider>(
            builder: (context, charactersProvider, diariesProvider,
                questionProvider, diaryDetailProvider, child) {
              final characters = charactersProvider.characters;
              final diaries = diariesProvider.diaries;
              final questionMap = questionProvider.questionMap;
              final diaryDetails = diaryDetailProvider.setDiaryDetails(
                  characters, questionMap, diaries);
              return Scaffold(
                appBar: _appBar,
                extendBodyBehindAppBar: true,
                body: _isBusy
                    ? Center(child: CircularProgressIndicator())
                    : Stack(
                        children: [
                          Container(
                            color: _pastColor,
                          ),
                          CustomFillAnimation(
                            _screenSize,
                            _animation,
                            _chosenCharacter != null
                                ? Color(_chosenCharacter.color)
                                : Colors.white,
                            _pickedLocation,
                          ),
                          Container(
//                        color: _chosenCharacter != null
//                            ? Color(_chosenCharacter.color)
//                            : Colors.white,
                            padding: EdgeInsets.only(top: _topPadding),
                            child: Column(
                              children: [
                                DiaryListPanel(diaries.length),
                                CharacterList(
                                  characters,
                                  _chosenCharacter,
                                  _setDiariesAndQuestionsPlayAnimation,
                                ),
                                DiaryList(
                                  diaryDetails,
                                  _navigateDiaryDetailScreen,
                                  _diaryScroll,
                                  _chosenCharacter,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              );
            },
          );
  }
}
