import 'package:dhh_client/services/db_service.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../constants.dart';

class HomeSql {
  static Future<List<Map<String, dynamic>>> getHomeData() async {
    final db = await DbService.database();
    return db.query('home');
  }

  static Future<bool> existEmptySpace() async {
    final db = await DbService.database();
    return sql.Sqflite.firstIntValue(
          await db.rawQuery(''
              'select count(*) from home_location '
              'where character_id is null '
              ''),
        ) !=
        0;
  }

  static Future<void> updateHomeLocation(List<Map<String, dynamic>> idMapList,
      {bool init = false}) async {
    final db = await DbService.database();
    final batch = db.batch();
    if (init) {
      for (int i = 1; i <= Constants.HOME_CHARACTER_COUNT; i++)
        batch.insert('home_location', {'id': i});
    }
    batch.rawUpdate('update home_location set character_id = null ');
    for (int i = 1; i <= idMapList.length; i++) {
      batch.rawUpdate(
          'update home_location set character_id = ${idMapList[i - 1]['id']} where id = $i');
    }
    batch.rawUpdate(
        'update home set modified_at = datetime(\'now\',\'localtime\') ');
    return await batch.commit();
  }
}
