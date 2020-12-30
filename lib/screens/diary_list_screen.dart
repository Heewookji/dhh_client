import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:dhh_client/screens/diary_detail_screen.dart';
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
    await _setDiaries(null);
    setState(() {
      _isBusy = false;
    });
  }

  Future<void> _setDiaries(int id) async {
    if (id == null)
      await Provider.of<DiariesProvider>(context, listen: false)
          .setAllDiaries();
    else
      await Provider.of<DiariesProvider>(context, listen: false)
          .setDiariesByCharacterId(id);
    _chosenCharacterId = id;
  }

  void _navigateDiaryDetailScreen(
      BuildContext context, character, question, diary) {
    Navigator.pushNamed(context, DiaryDetailScreen.routeName, arguments: {
      'character': character,
      'question': question,
      'diary': diary,
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: _isBusy
          ? Container()
          : Consumer<CharactersProvider>(
              builder: (context, charactersProvider, child) {
                return Consumer<DiariesProvider>(
                  builder: (context, diariesProvider, child) {
                    final characters = charactersProvider.characters;
                    final diaries = diariesProvider.diaries;
                    return Column(
                      children: [
                        _buildPanel(theme, screenSize, diaries.length),
                        _buildCharacterList(screenSize, characters),
                        _buildDiaryList(diaries, screenSize, characters),
                      ],
                    );
                  },
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
                onTap: () => _setDiaries(character.id),
                child: Container(
                  margin: EdgeInsets.only(right: screenSize.width * 0.05),
                  child: CircleAvatar(
                    maxRadius: screenSize.width * 0.1,
                    child: Image.asset(character.statusImageUrl),
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
      onTap: () => _setDiaries(null),
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
      List<Diary> diaries, Size screenSize, List<Character> characters) {
    return Expanded(
      child: ListView.builder(
        itemCount: diaries.length,
        itemBuilder: (context, i) {
          final diary = diaries[i];
          return GestureDetector(
            onTap: () => _navigateDiaryDetailScreen(context, null, null, null),
            child: Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              color: Color(diary.color),
              height: screenSize.height * 0.15,
              child: Text(diary.createdAt.toString()),
            ),
          );
        },
      ),
    );
  }
}
