import 'package:dhh_client/models/character.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../custom_bubble.dart';

class DiaryList extends StatelessWidget {
  final List<Map<Type, Object>> _diaryDetails;
  final Function(BuildContext, List<Map<Type, Object>>, int)
      _navigateDiaryDetailScreen;

  DiaryList(this._diaryDetails, this._navigateDiaryDetailScreen);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        ),
        child: ListView.builder(
          itemCount: _diaryDetails.length,
          itemBuilder: (context, i) {
            final character = _diaryDetails[i][Character] as Character;
            return Container(
              height: _screenSize.height * 0.135,
              padding: EdgeInsets.only(
                top: Constants.BORDER_WIDTH,
                left: Constants.BORDER_WIDTH,
                bottom: _screenSize.height * 0.02,
                right: Constants.SHADOW_WIDTH,
              ),
              child: CustomBubble(
                Container(),
                color: character.color,
                onPressed: () => _navigateDiaryDetailScreen(
                  context,
                  _diaryDetails,
                  i,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
