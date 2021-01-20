import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../custom_bubble.dart';

class DiaryList extends StatelessWidget {
  final List<Map<Type, Object>> _diaryDetails;
  final Function(BuildContext, List<Map<Type, Object>>, int)
      _navigateDiaryDetailScreen;
  final _scrollController;

  DiaryList(
    this._diaryDetails,
    this._navigateDiaryDetailScreen,
    this._scrollController,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _screenSize.width * Constants.BODY_WIDTH_PADDING_PERCENT,
        ),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _diaryDetails.length,
          itemBuilder: (context, i) {
            final character = _diaryDetails[i][Character] as Character;
            final diary = _diaryDetails[i][Diary] as Diary;
            final evenList = [0, 2];
            final oddList = [1, 3];
            final bubbleNumber = i % 2 == 1
                ? (oddList..shuffle()).first
                : (evenList..shuffle()).first;
            return Container(
              key: Key(diary.id.toString()),
              padding: EdgeInsets.only(
                top: Constants.BORDER_WIDTH,
                left: Constants.BORDER_WIDTH,
                bottom: _screenSize.height * 0.02,
                right: Constants.SHADOW_WIDTH,
              ),
              child: CustomBubble(
                SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(
                    character.statusImageUrl + Constants.CHARACTER_IMAGE_FORMAT,
                  ),
                ),
                Colors.white,
                Size(double.infinity, _screenSize.height * 0.135),
                onPressed: () {
                  _navigateDiaryDetailScreen(
                    context,
                    _diaryDetails,
                    i,
                  );
                },
                bubbleNumber: bubbleNumber,
              ),
            );
          },
        ),
      ),
    );
  }
}
