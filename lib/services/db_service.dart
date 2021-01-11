import 'dart:io';
import 'dart:typed_data';

import 'package:dhh_client/constants.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbService {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    final dbExist = await sql.databaseExists('$dbPath/data.db');
    if (!dbExist) await _dbInit(dbPath);
    return sql.openDatabase(
      path.join(dbPath, 'data.db'),
      version: 1,
    );
  }

  static Future _dbInit(String dbPath) async {
    ByteData data = await rootBundle.load("assets/db/data.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File('$dbPath/data.db').writeAsBytes(bytes);
    final idMapList = await getHomeRandomIds(init: true);
    await updateHomeLocation(idMapList, init: true);
    await updateHomeModifiedAt();
    print('DB Init!');
  }

  static void printPath() async {
    final dbPath = await sql.getDatabasesPath();
    print(dbPath);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbService.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<int> updateById(
      String table, Map<String, Object> data, int id) async {
    final db = await DbService.database();
    return db.update(table, data, where: 'id = ${id.toString()}');
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbService.database();
    return db.query(table);
  }

  static Future<Map<String, dynamic>> getTopData(String table) async {
    final db = await DbService.database();
    final data = await db.query(table, orderBy: 'id desc', limit: 1);
    return data.isEmpty ? null : data[0];
  }

  //캐릭터
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

  static Future<void> updateHomeLocation(List<Map<String, dynamic>> idMapList,
      {bool init = false}) async {
    final db = await DbService.database();
    if (init) {
      for (int i = 1; i <= Constants.HOME_CHARACTER_COUNT; i++)
        await db.insert('home_location', {'id': i});
    }
    for (int i = 1; i <= idMapList.length; i++) {
      await db.rawUpdate(
          'update home_location set character_id = ${idMapList[i - 1]['id']} where id = $i');
    }
  }

  static Future<void> updateHomeModifiedAt() async {
    final db = await DbService.database();
    await db.rawUpdate('update home set modified_at = current_date');
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
    return result == null ? null : result[0];
  }

  static Future<int> setCharacterAtHomeById(int characterId) async {
    final db = await DbService.database();
    return await db.rawUpdate(''
        'update home_location set character_id = ${characterId.toString()} '
        'where character_id is null '
        '');
  }

  static Future<int> setCharacterAtTravelById(int characterId) async {
    final db = await DbService.database();
    return db.rawUpdate(''
        'update home_location set character_id = null '
        'where character_id = ${characterId.toString()}'
        '');
  }

  static Future<int> updateStatus(int characterId, int statusCode) async {
    final db = await DbService.database();
    final batch = db.batch();
    batch.update(
      'status',
      {'is_status_now': 0},
      where:
          'character_id = ${characterId.toString()} and code = ${statusCode.toString()}',
    );
    statusCode++;
    batch.update(
      'status',
      {'is_status_now': 1},
      where:
          'character_id = ${characterId.toString()} and code = ${statusCode.toString()}',
    );
    final result = await batch.commit();
    return result[0] as int;
  }

  //질문
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

  //일기
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
}
