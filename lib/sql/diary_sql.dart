import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:dhh_client/sql/character_sql.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../constants.dart';

class DiarySql {
  static Future<int> getAllDiariesCount() async {
    final db = await DbService.database();
    return sql.Sqflite.firstIntValue(
      await db.rawQuery(''
          'select count(*) from diary'
          ''),
    );
  }

  static Future<List<Map<String, dynamic>>>
      getAllDiariesOrderByCreatedAt() async {
    final db = await DbService.database();
    return db.query('diary', orderBy: 'created_at desc');
  }

  static Future<List<Map<String, dynamic>>> getDiariesByCharacterId(
      int characterId) async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select d.* from diary d '
        'inner join question q on d.question_id = q.id '
        'inner join character c on q.character_id = c.id '
        'where c.id = ${characterId.toString()} '
        'order by d.created_at desc '
        '');
  }

  static Future<Map<String, dynamic>> getTopDiary() async {
    final db = await DbService.database();
    final data = await db.query('diary', orderBy: 'id desc', limit: 1);
    return data.isEmpty ? null : data[0];
  }

  static Future<Map<String, dynamic>> addDiaryAndUpdateCharacter(
    Map<String, dynamic> diary,
    Character character,
  ) async {
    final db = await DbService.database();
    final batch = db.batch();
    final Map<String, Object> result = {
      'submittedCharacter': character,
      'updated': false,
      'traveled': false,
      'finished': false,
      'allFinished': false,
    };
    batch.insert('diary', diary);
    final characterDiaries = await getDiariesByCharacterId(character.id);
    if ((characterDiaries.length + 1) % Constants.DIARY_STATUS_COUNT != 0) {
      await batch.commit();
      return result;
    }
    if (character.statusCode < Constants.FINAL_STATUS) {
      batch.update(
        'status',
        {'is_status_now': 0},
        where:
            'character_id = ${character.id.toString()} and code = ${character.statusCode.toString()}',
      );
      batch.update(
        'status',
        {'is_status_now': 1},
        where:
            'character_id = ${character.id.toString()} and code = ${(character.statusCode + 1).toString()}',
      );
      result['updated'] = true;
    } else {
      final allFinished = await CharacterSql.getCharacterAllFinished();
      if (allFinished) {
        batch.rawUpdate(''
            'update home set all_finished = 1'
            '');
        result['allFinished'] = true;
      }
      result['finished'] = true;
    }
    if (character.statusCode >= Constants.TRAVEL_STATUS) {
      batch.rawUpdate(''
          'update home set '
          'last_traveled_character_id = ${character.id.toString()}, '
          'last_traveled_at = datetime(\'now\',\'localtime\'), '
          'last_traveled_location_id = '
          '(select id from home_location where character_id = ${character.id.toString()})');
      batch.rawUpdate(''
          'update home_location set character_id = null '
          'where character_id = ${character.id.toString()}'
          '');
      result['traveled'] = true;
    }
    await batch.commit();
    return result;
  }
}
