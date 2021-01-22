import 'package:flutter/material.dart';

import '../custom_card.dart';

class WriteTextField extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode _focus;
  WriteTextField(this._controller, this._focus);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      child: CustomCard(
        Container(
          height: _screenSize.height * 0.3,
          child: TextFormField(
            controller: _controller,
            focusNode: _focus,
            style: theme.textTheme.bodyText2,
            autocorrect: false,
            enableSuggestions: false,
            scrollPhysics: BouncingScrollPhysics(),
            keyboardType: TextInputType.text,
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
    );
  }
}
