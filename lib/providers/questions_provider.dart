import 'package:dhh_client/models/question.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class QuestionsProvider with ChangeNotifier {
  Map<String, Question> _questionMap;
  final List<String> _characterIds;

  QuestionsProvider(this._characterIds, this._questionMap);

  Map<String, Question> get questionMap {
    Map<String, Question> retMap = Map();
    retMap.addAll(_questionMap);
    return retMap;
  }

  Future<void> setQuestionMap() async {
    final dataMapList =
        await DbService.getQuestionsByCharacterIds(_characterIds);
    dataMapList.forEach((dataMap) {
      _questionMap[dataMap['character_id'].toString()] =
          standardSerializers.deserializeWith(Question.serializer, dataMap);
    });
    notifyListeners();
  }

  Question getQuestionByCharacterId(int characterId) {
    return _questionMap[characterId.toString()];
  }
}
