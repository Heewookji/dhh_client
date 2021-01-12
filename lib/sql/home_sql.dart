import 'package:dhh_client/services/db_service.dart';

import '../constants.dart';

class HomeSql {
  static Future<List<Map<String, dynamic>>> getHomeData() async {
    final db = await DbService.database();
    return db.query('home');
  }

  static Future<void> updateHomeLocation(List<Map<String, dynamic>> idMapList,
      {bool init = false}) async {
    final db = await DbService.database();
    final batch = db.batch();
    if (init) {
      for (int i = 1; i <= Constants.HOME_CHARACTER_COUNT; i++)
        batch.insert('home_location', {'id': i});
    }
    for (int i = 1; i <= idMapList.length; i++) {
      batch.rawUpdate(
          'update home_location set character_id = ${idMapList[i - 1]['id']} where id = $i');
    }
    batch.rawUpdate('update home set modified_at = current_date');
    return await batch.commit();
  }

  static Future<void> updateHomeAllFinished() async {
    final db = await DbService.database();
    await db.rawUpdate('update ');
  }
}
