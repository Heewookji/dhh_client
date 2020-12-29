import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class DiariesProvider with ChangeNotifier {
  int _allDiariesCount = 0;

  int get allDiariesCount => _allDiariesCount;

  Future<void> setAllDiariesCount() async {
    _allDiariesCount = await DbService.getCount('diary');
    notifyListeners();
  }

  Future<List<Diary>> getAllDiaries() async {
    final dataMapList = await DbService.getData('diary');
    return dataMapList.map((dataMap) {
      return standardSerializers.deserializeWith(Diary.serializer, dataMap);
    }).toList();
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
  }
}
