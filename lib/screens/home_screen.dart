import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/providers/questions_provider.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBusy = true;
  @override
  void initState() {
    super.initState();
    doFuture();
  }

  void doFuture() async {
    await Provider.of<CharactersProvider>(context, listen: false)
        .setCharacters();
    await Provider.of<QuestionsProvider>(context, listen: false)
        .setQuestionMap();
    setState(() {
      _isBusy = false;
    });
  }

  void _navigateWriteScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      WriteScreen.routeName,
      arguments: {
        'characterId': 1,
        'question': 'question',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: [
          IconButton(
            icon: Icon(Icons.dynamic_feed),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildAlarmPanel(screenSize),
          _buildCharacterHome(context, screenSize),
          _buildBottomButton(context, screenSize),
        ],
      ),
    );
  }

  Widget _buildCharacterHome(BuildContext context, Size screenSize) {
    return Container(
      color: Colors.black12,
      height: screenSize.height * 0.5,
      child: Stack(
        children: [
          if (_isBusy)
            Container()
          else
            Consumer<CharactersProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.characters.length,
                  itemBuilder: (context, i) {
                    final character = provider.characters[i];
                    final questionMap =
                        Provider.of<QuestionsProvider>(context).questionMap;
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(character.name),
                          Text(questionMap[character.id.toString()].text),
                          Container(
                            height: screenSize.height * 0.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(character.statusImageUrl),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  Container _buildAlarmPanel(Size screenSize) {
    return Container(
      alignment: Alignment.center,
      height: screenSize.height * 0.2,
      child: Text(
        '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
        textAlign: TextAlign.center,
      ),
      color: Colors.black26,
    );
  }

  _buildBottomButton(BuildContext context, Size screenSize) {
    return SafeArea(
      child: Container(
        height: screenSize.height * 0.1,
        child: FlatButton(
          onPressed: () => _navigateWriteScreen(context),
          child: Text('일기쓰기'),
        ),
      ),
    );
  }
}
