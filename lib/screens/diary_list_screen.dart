import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/diaries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryListScreen extends StatefulWidget {
  static final routeName = '/diary_list';

  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  bool _isBusy = true;

  @override
  void initState() {
    super.initState();
    doFuture();
  }

  void doFuture() async {
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
                    return Column(
                      children: [
                        _buildPanel(
                            theme, screenSize, diariesProvider.diaries.length),
                        _buildCharacterList(screenSize, charactersProvider),
                        _buildDiaryList(diariesProvider, screenSize),
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

  Container _buildCharacterList(
      Size screenSize, CharactersProvider charactersProvider) {
    return Container(
      height: screenSize.height * 0.1,
      child: ListView.builder(
        itemCount: charactersProvider.characters.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final characters = charactersProvider.characters;
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
                    backgroundColor:
                        character.isHome != 1 && character.isTravel != 1
                            ? Colors.black
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
          backgroundColor: Colors.black12,
          child: Text(
            '전체',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Expanded _buildDiaryList(DiariesProvider diariesProvider, Size screenSize) {
    return Expanded(
      child: ListView.builder(
        itemCount: diariesProvider.diaries.length,
        itemBuilder: (context, i) {
          final diaries = diariesProvider.diaries;
          final diary = diaries[i];
          return Container(
              margin: EdgeInsets.only(top: screenSize.height * 0.05),
              color: Colors.black12,
              height: screenSize.height * 0.2,
              child: Text(diary.text));
        },
      ),
    );
  }
}
