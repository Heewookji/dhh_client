import 'package:dhh_client/services/db_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

class QuestionSql {
  static Future<List<Map<String, dynamic>>> getQuestionsByCharacterIds(
      List<int> characterIds) async {
    final db = await DbService.database();
    String idsString =
        characterIds.toString().replaceAll('[', '(').replaceAll(']', ')');
    return db.rawQuery(''
        'select q.* from question q '
        'left outer join diary d on q.id = d.question_id '
        'where q.character_id in $idsString and d.id is null '
        'group by q.character_id '
        'having q.id = min(q.id) '
        '');
  }

  static Future<int> getNotAnsweredCountByCharacterId(int characterId) async {
    final db = await DbService.database();
    return sql.Sqflite.firstIntValue(await db.rawQuery(''
        'select count(*) from question q '
        'left outer join diary d on q.id = d.question_id '
        'where q.character_id = $characterId and d.id is null '
        ''));
  }

  static Future<List<Map<String, dynamic>>> getQuestionsByDiaryIds(
      List<int> diaryIds) async {
    final db = await DbService.database();
    String idsString =
        diaryIds.toString().replaceAll('[', '(').replaceAll(']', ')');
    return db.rawQuery(''
        'select d.id as diary_id, q.* from diary d '
        'inner join question q on q.id = d.question_id '
        'where d.id in $idsString '
        '');
  }
}
