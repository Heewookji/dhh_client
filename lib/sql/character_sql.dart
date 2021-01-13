import 'package:dhh_client/models/character.dart';
import 'package:dhh_client/models/serializers.dart';
import 'package:dhh_client/services/db_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../constants.dart';
import 'home_sql.dart';

class CharacterSql {
  static Future<List<Map<String, dynamic>>> getHomeRandomIds(
      {bool init = false}) async {
    final db = await DbService.database();
    if (init)
      return db.rawQuery(
          'select id from character order by random() limit ${(Constants.HOME_CHARACTER_COUNT - 1).toString()} ');
    return db.rawQuery(''
        'select c.id from character c '
        'inner join home_location hl on c.id = hl.character_id '
        'order by '
        'random() '
        '');
  }

  static Future<List<Map<String, dynamic>>> getHomeCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select c.*, s.* from home_location h '
        'inner join character c on c.id = h.character_id '
        'inner join status s on c.id = s.character_id '
        'where s.is_status_now = 1 '
        'order by h.id '
        '');
  }

  static Future<List<Map<String, dynamic>>> getAllCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select c.*, s.*, d.created_at, '
        'case when s.code > 1 and h.id is null '
        'then 1 '
        'else 0 '
        'end as is_travel, '
        'case when h.id >= 1 '
        'then 1 '
        'else 0 '
        'end '
        'as is_home '
        'from character c '
        'left outer join home_location h on c.id = h.character_id '
        'inner join status s on c.id = s.character_id '
        'inner join question q on c.id = q.character_id '
        'left outer join diary d on q.id = d.question_id '
        'where s.is_status_now = 1 and (is_home = 1 or d.created_at is not null) '
        'group by c.id '
        'having d.id = max(d.id) or d.id is null '
        '');
  }

  static Future<Map<String, dynamic>> getHomeRandomCharacter() async {
    final db = await DbService.database();
    final lastDiaryData = await db.rawQuery(''
        'select c.id, d.created_at from diary d '
        'inner join question q on q.id = d.question_id '
        'inner join character c on q.character_id = c.id '
        'order by d.created_at desc '
        'limit 1 '
        '');
    final avoidCharacterId = lastDiaryData[0]['id'];
    final lastDiaryDate = DateTime.fromMillisecondsSinceEpoch(
        lastDiaryData[0]['created_at'],
        isUtc: true);
    print(lastDiaryDate);
    final result = await db.rawQuery(''
        'select c.*, s.*,'
        '( '
        'select count(*) from question q '
        'left outer join diary d on q.id = d.question_id '
        'where q.character_id = c.id and d.id is null '
        ') as not_answered '
        'from character c '
        'left outer join home_location hl on c.id = hl.character_id '
        'inner join status s on c.id = s.character_id '
        'where s.is_status_now = 1 '
        'and hl.id is null '
        'and not_answered > 0 '
        'and s.code <= ${Constants.FINAL_STATUS.toString()} '
        'order by '
        '${avoidCharacterId == null ? '' : 'c.id != ${avoidCharacterId.toString()} desc,'} '
        's.code = 1 desc, random() limit 1 '
        '');
    return result.length == 0 ? null : result[0];
  }

  static Future<bool> getCharacterAllFinished() async {
    final db = await DbService.database();
    return sql.Sqflite.firstIntValue(await db.rawQuery(''
            'select count(*) from character c '
            'inner join status s on c.id = s.character_id '
            'where s.is_status_now = 1 and s.code != ${Constants.FINAL_STATUS} '
            '')) ==
        0;
  }

  static Future<Map<String, Object>> setNewCharacterIfPossible(
      int diaryCount) async {
    final db = await DbService.database();
    final Map<String, Object> result = {
      'newCharacter': null,
      'firstSubmitted': diaryCount == 1,
    };
    if (!await getPossibilitySetNewCharacter(diaryCount)) return result;
    final dataMap = await getHomeRandomCharacter();
    if (dataMap == null) return result;
    final newCharacter =
        standardSerializers.deserializeWith(Character.serializer, dataMap);
    final emptyLocationId = sql.Sqflite.firstIntValue(
        await db.rawQuery('select last_traveled_location_id from home'));
    await db.rawUpdate(''
        'update home_location set character_id = ${newCharacter.id.toString()} '
        'where ${emptyLocationId == null ? 'character_id is null' : 'id = $emptyLocationId'} '
        '');
    result['newCharacter'] = newCharacter;
    return result;
  }

  static Future<bool> getPossibilitySetNewCharacter(int diaryCount) async {
    final homeData = await HomeSql.getHomeData();
    final allFinished = homeData[0]['all_finished'] == 1;
    final existEmptySpace = await HomeSql.existEmptySpace();
    return !allFinished && existEmptySpace && (diaryCount > 0);
  }
}
