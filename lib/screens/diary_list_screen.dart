import 'package:dhh_client/models/diary.dart';
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
    Provider.of<CharactersProvider>(context, listen: false).setAllCharacters();
    Provider.of<DiariesProvider>(context, listen: false).setAllDiariesCount();
    setState(() {
      _isBusy = false;
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
                    return Column(
                      children: [
                        _buildPanel(
                            theme, screenSize, diariesProvider.allDiariesCount),
                        Container(
                          height: screenSize.height * 0.1,
                          child: ListView.builder(
                            itemCount: charactersProvider.characters.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              final character =
                                  charactersProvider.characters[i];
                              return Container(
                                margin: EdgeInsets.only(
                                    right: screenSize.width * 0.05),
                                child: CircleAvatar(
                                  maxRadius: screenSize.width * 0.1,
                                  child: Image.asset(character.statusImageUrl),
                                  backgroundColor: character.isHome != 1 &&
                                          character.isTravel != 1
                                      ? Colors.black
                                      : Colors.black12,
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder<List<Diary>>(
                            future: diariesProvider.getAllDiaries(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return Center(
                                    child: CircularProgressIndicator());
                              return ListView.builder(
                                itemCount: diariesProvider.allDiariesCount,
                                itemBuilder: (context, i) {
                                  final diary = snapshot.data[i];
                                  return Container(
                                      margin: EdgeInsets.only(
                                          top: screenSize.height * 0.05),
                                      color: Colors.black12,
                                      height: screenSize.height * 0.2,
                                      child: Text(diary.text));
                                },
                              );
                            },
                          ),
                        )
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
      color: Colors.black12,
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
}
