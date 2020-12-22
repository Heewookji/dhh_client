import 'package:flutter/material.dart';

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
          Stack(
            children: [
              Container(
                height: screenSize.height * 0.5,
                color: Colors.black12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
