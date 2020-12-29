import 'package:dhh_client/models/diary.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:flutter/cupertino.dart';

class DiariesProvider with ChangeNotifier {
  DiariesProvider();

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
