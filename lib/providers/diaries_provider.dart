import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/sql/diary_sql.dart';
import 'package:flutter/cupertino.dart';

class DiariesProvider with ChangeNotifier {
  List<Diary> _diaries = [];
  Diary topDiary;
  List<Diary> get diaries => [..._diaries];
  List<int> get diaryIds => diaries.map((d) => d.id).toList();

  Future<int> getDiaryCount() async {
    final count = await DiarySql.getAllDiariesCount();
    return count;
  }

  Future<void> setTopDiary() async {
    final dataMap = await DiarySql.getTopDiary();
    topDiary = dataMap == null
        ? null
        : standardSerializers.deserializeWith(Diary.serializer, dataMap);
    notifyListeners();
  }

  Future<void> setAllDiaries() async {
    final dataMapList = await DiarySql.getAllDiariesOrderByCreatedAt();
    _diaries = dataMapList
        .map((dataMap) =>
            standardSerializers.deserializeWith(Diary.serializer, dataMap))
        .toList();
    notifyListeners();
  }

  Future<void> setDiariesByCharacterId(int characterId) async {
    final dataMapList = await DiarySql.getDiariesByCharacterId(characterId);
    _diaries = dataMapList
        .map((dataMap) =>
            standardSerializers.deserializeWith(Diary.serializer, dataMap))
        .toList();
    notifyListeners();
  }

  Future<Map<String, dynamic>> addDiaryAndUpdateCharacter(
    int questionId,
    String text,
    CharactersProvider characterProvider,
    Character character,
  ) async {
    final result = await DiarySql.addDiaryAndUpdateCharacter(
      standardSerializers.serializeWith(
        Diary.serializer,
        Diary((b) => b
          ..text = text
          ..createdAt = DateTime.now().toUtc()
          ..questionId = questionId),
      ),
      character,
    );
    setTopDiary();
    characterProvider.setHomeCharacters();
    return result;
  }
}
