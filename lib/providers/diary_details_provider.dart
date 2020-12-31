import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/question.dart';
import 'package:flutter/cupertino.dart';

class DiaryDetailProvider with ChangeNotifier {
  List<Map<Type, Object>> setDiaryDetails(List<Character> characters,
      Map<String, Question> questionMap, List<Diary> diaries) {
    List<Map<Type, Object>> list = List();
    diaries.forEach((diary) {
      Map<Type, Object> innerMap = Map();
      final question = questionMap[diary.id.toString()];
      final character =
          characters.firstWhere((c) => c.id == question.characterId);
      innerMap[Diary] = diary;
      innerMap[Question] = question;
      innerMap[Character] = character;
      list.add(innerMap);
    });
    return list;
  }
}
