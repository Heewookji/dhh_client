import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:dhh_client/sql/character_sql.dart';
import 'package:dhh_client/sql/question_sql.dart';
import 'package:dhh_client/widgets/custom_dialog.dart';
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
    final Map<String, Object> result = {
      'status': Status.CharacterOut,
      'submittedCharacter': character,
      'updated': false,
      'traveled': false,
      'finished': false,
      'allFinished': false,
    };
    try {
      final db = await DbService.database();
      final batch = db.batch();
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
        final notFinishedCharacterCount =
            await CharacterSql.getNotFinishedCharacterCount();
        final notAnsweredCount =
            await QuestionSql.getNotAnsweredCountByCharacterId(character.id);
        final allFinished =
            notFinishedCharacterCount == 1 && notAnsweredCount == 1;
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
            'last_traveled_at = datetime(\'now\',\'localtime\') '
            '');
        batch.rawUpdate(''
            'update home_location set character_id = null '
            'where character_id = ${character.id.toString()} '
            '');
        result['traveled'] = true;
      }
      await batch.commit();
    } catch (e, trace) {
      print(trace);
      return {
        'status': Status.Error,
        'submittedCharacter': character,
        'updated': false,
        'traveled': false,
        'finished': false,
        'allFinished': false,
      };
    }
    return result;
  }

  static Future<void> addQuestionAndDiary(
    Character character,
    String question,
    String diary,
  ) async {
    final db = await DbService.database();
    await db.transaction((txn) async {
      final questionId = await txn.rawInsert(
          'insert into question(character_id, text) values(${character.id.toString()}, \'$question\') ');
      await txn.rawInsert(
          'insert into diary(question_id, text, created_at) values(${questionId.toString()}, \'${diary.toString()}\', ${DateTime.now().toUtc().microsecondsSinceEpoch}) ');
    });
  }
}
