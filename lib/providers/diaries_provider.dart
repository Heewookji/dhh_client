import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class DiariesProvider with ChangeNotifier {
  List<Diary> _diaries = [];
  Diary topDiary;
  List<Diary> get diaries => [..._diaries];
  List<int> get diaryIds => diaries.map((d) => d.id).toList();

  Future<void> setTopDiary() async {
    final dataMap = await DbService.getTopData('diary');
    topDiary = dataMap == null
        ? null
        : standardSerializers.deserializeWith(Diary.serializer, dataMap);
    notifyListeners();
  }

  Future<void> setAllDiaries() async {
    final dataMapList = await DbService.getAllDiariesOrderByCreatedAt();
    _diaries = dataMapList
        .map((dataMap) =>
            standardSerializers.deserializeWith(Diary.serializer, dataMap))
        .toList();
    notifyListeners();
  }

  Future<void> setDiariesByCharacterId(int characterId) async {
    final dataMapList = await DbService.getDiariesByCharacterId(characterId);
    _diaries = dataMapList
        .map((dataMap) =>
            standardSerializers.deserializeWith(Diary.serializer, dataMap))
        .toList();
    notifyListeners();
  }

  Future<void> addDiary(int questionId, String text) async {
    await DbService.insert(
      'diary',
      standardSerializers.serializeWith(
        Diary.serializer,
        Diary((b) => b
          ..text = text
          ..createdAt = DateTime.now().toUtc()
          ..questionId = questionId),
      ),
    );
    setTopDiary();
  }
}
