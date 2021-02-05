import 'package:dhh_client/constants.dart';
import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/providers/home_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/diary_list_screen.dart';
import 'package:dhh_client/screens/setting_screen.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:dhh_client/widgets/custom_dialog.dart';
import 'package:dhh_client/widgets/home/character_finished_home.dart';
import 'package:dhh_client/widgets/home/character_home.dart';
import 'package:dhh_client/widgets/home/home_button.dart';
import 'package:dhh_client/widgets/home/home_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool _isBusy = true;
  bool _isSubmittedToday;
  Character _chosenCharacter;
  Question _chosenQuestion;
  Offset _pressedLocation;
  AnimationController _panelAnimationController;
  Animation<double> _panelAnimation;

  @override
  void initState() {
    super.initState();
    _doInitFuture();
  }

  @override
  void dispose() {
    _panelAnimationController.dispose();
    super.dispose();
  }

  void _doInitFuture() async {
    _panelAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _panelAnimation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(
        parent: _panelAnimationController,
        curve: Curves.easeOutCirc,
      ),
    );
    await Provider.of<HomeProvider>(context, listen: false).setAllFinished();
    await _newCharacterComeIfPossible();
    await Provider.of<DiariesProvider>(context, listen: false).setTopDiary();
    setState(() {
      _isBusy = false;
    });
  }

  Future<void> _newCharacterComeIfPossible() async {
    final diaryCount =
        await Provider.of<DiariesProvider>(context, listen: false)
            .getDiaryCount();
    final result = await Provider.of<CharactersProvider>(context, listen: false)
        .setNewCharacterIfPossible(diaryCount);
    print(result);
    if (result['newCharacter'] != null) {
      await showDialog(
        context: context,
        barrierColor: Colors.black54,
        builder: (context) => CustomDialog(result),
      );
    }
    if (Provider.of<HomeProvider>(context, listen: false).allFinished != null &&
        Provider.of<HomeProvider>(context, listen: false).allFinished) {
      await Provider.of<CharactersProvider>(context, listen: false)
          .setAllCharacters();
      return;
    }
    await Provider.of<CharactersProvider>(context, listen: false)
        .setHomeCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
  }

  void _chooseCharacter(Character character,
      QuestionsProvider questionsProvider, Offset pressedLocation) {
    _panelAnimationController.reset();
    _panelAnimationController.forward();
    setState(() {
      _chosenCharacter = character;
      _chosenQuestion = questionsProvider.questionMap[character.id.toString()];
      _pressedLocation = pressedLocation;
    });
  }

  void _navigateDiaryListScreen() async {
    await Navigator.of(context).pushNamed(DiaryListScreen.routeName);
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
    });
  }

  void _navigateSettingScreen() async {
    await Navigator.of(context).pushNamed(SettingScreen.routeName);
  }

  void _navigateWriteScreen() async {
    final result = await Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'character': _chosenCharacter,
        'question': _chosenQuestion,
      },
    ) as Map;
    setState(() {
      _chosenCharacter = _chosenQuestion = null;
    });
    print(result);
    if (result != null &&
        (result['traveled'] || result['finished'] || result['allFinished'])) {
      if (result['allFinished']) {
        showDialog(
          context: context,
          barrierColor: Colors.black54,
          builder: (context) => CustomDialog(result),
        );
      } else {
        await showDialog(
          context: context,
          barrierColor: Colors.black54,
          builder: (context) => CustomDialog(result),
        );
      }
    }
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMapByCharacterIds(
            Provider.of<CharactersProvider>(context, listen: false)
                .characterIds);
    if (result != null)
      Future.delayed(Duration(seconds: 1), () => _newCharacterComeIfPossible());
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _appBar = AppBar(
      title: SvgPicture.asset(
        'assets/images/logo.svg',
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.widgets),
          onPressed: () => _navigateDiaryListScreen(),
        ),
        IconButton(
          icon: Icon(Icons.circle),
          onPressed: () => _navigateSettingScreen(),
        ),
      ],
    );
    final _screenSize = Size(
      _mediaQuery.size.width,
      _mediaQuery.size.height -
          _mediaQuery.padding.top -
          _mediaQuery.padding.bottom -
          _appBar.preferredSize.height,
    );
    final topDiary = Provider.of<DiariesProvider>(context).topDiary;
    _isSubmittedToday =
        topDiary != null && topDiary.createdAt.day == DateTime.now().day;
    final _allFinished =
        Provider.of<HomeProvider>(context, listen: false).allFinished;
    return Scaffold(
      appBar: _appBar,
      body: _isBusy
          ? Center()
          : Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _allFinished
                        ? CharacterFinishedHome(_isSubmittedToday)
                        : CharacterHome(
                            _chooseCharacter,
                          ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: _screenSize.width *
                        Constants.BODY_WIDTH_PADDING_PERCENT,
                    right: _screenSize.width *
                        Constants.BODY_WIDTH_PADDING_PERCENT,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _allFinished
                          ? Container()
                          : HomePanel(
                              _chosenQuestion,
                              _chosenCharacter,
                              _pressedLocation,
                              _panelAnimation,
                            ),
                      _allFinished
                          ? Container()
                          : HomeButton(
                              _chosenQuestion,
                              _navigateWriteScreen,
                              _isSubmittedToday,
                            ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
