import 'package:dhh_client/services/db_service.dart';

import '../constants.dart';

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

  static Future<Map<String, dynamic>> getHomeRandomCharacter(
      {int avoidCharacterId}) async {
    final db = await DbService.database();
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
        '${avoidCharacterId == null ? '' : 'and c.id != ${avoidCharacterId.toString()}'} '
        'order by s.code != 1, random() limit 1 '
        '');
    return result.length == 0 ? null : result[0];
  }

  static Future<int> setCharacterAtHomeById(int characterId) async {
    final db = await DbService.database();
    return await db.rawUpdate(''
        'update home_location set character_id = ${characterId.toString()} '
        'where character_id is null '
        '');
  }
}
