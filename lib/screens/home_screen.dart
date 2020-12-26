import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/screens/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: [
          IconButton(
            icon: Icon(Icons.dynamic_feed),
            onPressed: () {
              Provider.of<CharactersProvider>(context, listen: false)
                  .insertCharacter();
            },
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
          FutureBuilder(
            future: Provider.of<CharactersProvider>(context, listen: false)
                .setCharacters(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Container();
              return Consumer<CharactersProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.characters.length,
                    itemBuilder: (context, i) {
                      final character = provider.characters[i];
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Text(character.name),
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
          onPressed: () => Navigator.of(context).pushNamed(
            WriteScreen.routeName,
            arguments: {
              'characterId': 1,
              'question': 'question',
            },
          ),
          child: Text('일기쓰기'),
        ),
      ),
    );
  }
}
