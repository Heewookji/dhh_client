import 'package:dhh_client/providers/characters_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: screenSize.height * 0.2,
            child: Text(
              '푸쉬 알림을 통해\n 규칙적인 일기 습관을 만들어요.',
              textAlign: TextAlign.center,
            ),
            color: Colors.black26,
          ),
          SizedBox(
            height: screenSize.height * 0.5,
            child: Stack(
              children: [
                FutureBuilder(
                  future:
                      Provider.of<CharactersProvider>(context, listen: false)
                          .setCharacters(),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return Container();
                    return Consumer<CharactersProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                          itemCount: provider.characters.length,
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: screenSize.height * 0.1,
                              child: Text(provider.characters[i].name),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
