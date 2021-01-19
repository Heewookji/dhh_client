import 'package:flutter/material.dart';

import '../../constants.dart';

class DiaryListPanel extends StatelessWidget {
  final int allDiariesCount;

  DiaryListPanel(this.allDiariesCount);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
      ),
      alignment: Alignment.topLeft,
      child: Text(
        '${allDiariesCount.toString()}개 \n추억이\n쌓였어요',
        style: _theme.textTheme.headline6,
      ),
      margin: EdgeInsets.only(bottom: _screenSize.height * 0.03378),
    );
  }
}
