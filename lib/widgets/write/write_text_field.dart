import 'package:flutter/material.dart';

import '../custom_card.dart';

class WriteTextField extends StatelessWidget {
  final bool _isFreeWrite;
  final TextEditingController _controller;
  final FocusNode _focus;
  final Function _onChanged;
  WriteTextField(
      this._isFreeWrite, this._controller, this._focus, this._onChanged);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            _isFreeWrite ? '내용' : '질문에 답하기',
            style: theme.textTheme.bodyText1,
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.01351),
        ),
        Container(
          child: CustomCard(
            Container(
              height: _screenSize.height * 0.44,
              child: TextFormField(
                controller: _controller,
                focusNode: _focus,
                style: theme.textTheme.bodyText2,
                onChanged: (text) => _onChanged(),
                autocorrect: false,
                enableSuggestions: false,
                scrollPhysics: BouncingScrollPhysics(),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  helperStyle: TextStyle(height: 0),
                ),
                maxLength: 2000,
                maxLines: 100,
              ),
              padding: EdgeInsets.only(
                left: _screenSize.width * 0.0444,
                right: _screenSize.width * 0.0444,
                bottom: _screenSize.height * 0.02162,
              ),
            ),
          ),
          margin: EdgeInsets.only(bottom: _screenSize.height * 0.02702),
        ),
      ],
    );
  }
}
