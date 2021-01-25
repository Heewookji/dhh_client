import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/providers/characters_provider.dart';
import 'package:dhh_client/sql/diary_sql.dart';
import 'package:dhh_client/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

import 'home_provider.dart';

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
    HomeProvider homeProvider,
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
    await setTopDiary();
    await homeProvider.setAllFinished();
    await characterProvider.setHomeCharacters();
    return result;
  }

  Future<Map<String, dynamic>> addFreeDiary(
    Character character,
    String question,
    String diary,
  ) async {
    Map<String, dynamic> result = {'status': null};
    try {
      await DiarySql.addQuestionAndDiary(character, question, diary);
      await setTopDiary();
    } catch (e) {
      result = {'status': Status.Error};
    }
    return result;
  }
}
