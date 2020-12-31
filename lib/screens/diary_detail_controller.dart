import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/screens/diary_detail_screen.dart';
import 'package:flutter/material.dart';

class DiaryDetailController extends StatefulWidget {
  final initialPage;
  final List<Map<Type, Object>> diaryDetails;

  DiaryDetailController(this.initialPage, this.diaryDetails);

  @override
  _DiaryDetailControllerState createState() => _DiaryDetailControllerState();
}

class _DiaryDetailControllerState extends State<DiaryDetailController> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.initialPage, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        for (final diaryDetail in widget.diaryDetails)
          DiaryDetailScreen(
            diaryDetail[Character],
            diaryDetail[Question],
            diaryDetail[Diary],
          ),
      ],
    );
  }
}
