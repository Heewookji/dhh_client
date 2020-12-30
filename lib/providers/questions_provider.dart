import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class QuestionsProvider with ChangeNotifier {
  Map<String, Question> _questionMap = {};

  Map<String, Question> get questionMap => Map()..addAll(_questionMap);

  Future<void> setQuestionMap(List<int> _characterIds) async {
    final dataMapList =
        await DbService.getQuestionsByCharacterIds(_characterIds);
    dataMapList.forEach((dataMap) {
      _questionMap[dataMap['character_id'].toString()] =
          standardSerializers.deserializeWith(Question.serializer, dataMap);
    });
    notifyListeners();
  }
}
