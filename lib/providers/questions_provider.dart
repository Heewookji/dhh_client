import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class QuestionsProvider with ChangeNotifier {
  Map<String, Question> _questionMap = {};

  Map<String, Question> get questionMap => Map()..addAll(_questionMap);

  Future<void> setQuestionMapByCharacterIds(List<int> characterIds) async {
    final dataMapList =
        await DbService.getQuestionsByCharacterIds(characterIds);
    dataMapList.forEach((dataMap) {
      _questionMap[dataMap['character_id'].toString()] =
          standardSerializers.deserializeWith(Question.serializer, dataMap);
    });
    notifyListeners();
  }

  Future<void> setQuestionMapByDiaryIds(List<int> diaryIds) async {
    final dataMapList = await DbService.getQuestionsByDiaryIds(diaryIds);
    dataMapList.forEach((dataMap) {
      _questionMap[dataMap['diary_id'].toString()] =
          standardSerializers.deserializeWith(Question.serializer, dataMap);
    });
    notifyListeners();
  }
}
