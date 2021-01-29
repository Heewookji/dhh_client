import 'package:dhh_client/models/character.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../custom_card.dart';

class WriteFreePanel extends StatelessWidget {
  final Character character;
  final TextEditingController _controller;
  final FocusNode _focus;

  WriteFreePanel(this.character, this._controller, this._focus);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('y년 M월 d일').format(DateTime.now()),
                style: theme.textTheme.caption,
              ),
              Text(
                character.name,
                style: theme.textTheme.caption,
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02162),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '제목',
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01351),
        ),
        Container(
          child: CustomCard(
            Container(
              height: _screenSize.height * 0.16756,
              child: TextFormField(
                controller: _controller,
                focusNode: _focus,
                style: theme.textTheme.bodyText2,
                autocorrect: false,
                enableSuggestions: false,
                scrollPhysics: BouncingScrollPhysics(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  helperStyle: TextStyle(height: 0),
                ),
                maxLength: 50,
                maxLines: 5,
              ),
              padding: EdgeInsets.only(
                left: _screenSize.width * 0.0444,
                right: _screenSize.width * 0.0444,
                bottom: _screenSize.height * 0.02162,
              ),
            ),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.04864),
        ),
      ],
    );
  }
}
