import 'dart:io';
import 'dart:typed_data';

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
    final db = await sql.openDatabase(
      path.join(dbPath, 'data.db'),
      version: 1,
    );
    final idMapList = await db.rawQuery(
        'select id from character order by is_npc desc,random() limit 7 ');
    await updateHomeLocation(idMapList);
    await updateHomeModifiedAt();
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
  static Future<void> updateHomeLocation(
      List<Map<String, dynamic>> idMapList) async {
    final db = await DbService.database();
    for (int i = 1; i <= idMapList.length; i++) {
      await db.rawUpdate(
          'update home_location set character_id = ${idMapList[i - 1]['id']} where id = $i');
    }
  }

  static Future<void> updateHomeModifiedAt() async {
    final db = await DbService.database();
    await db.rawUpdate('update home set modified_at = current_date');
  }

  static Future<List<Map<String, dynamic>>> getHomeRandomIds() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select id from character c '
        'where '
        '(select count(*) from home_location h where c.id = h.character_id) = 1 '
        'order by '
        'c.is_npc desc, '
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

  static Future<Map<String, dynamic>> setRandomCharacterAtHome(
      {int avoidCharacterId}) async {
    final db = await DbService.database();
    final randomResult = await db.rawQuery(''
        'select c.*, s.* from character c '
        'left outer join home_location hl on c.id = hl.character_id '
        'inner join status s on c.id = s.character_id '
        'where s.is_status_now = 1 and c.is_npc = 0 '
        'and (select s.code from status s where s.character_id = c.id and s.is_status_now = 1 order by s.code desc limit 1) '
        '< (select s2.code from status s2 order by s2.code desc limit 1) '
        'and hl.id is null '
        '${avoidCharacterId == null ? '' : 'and c.id != ${avoidCharacterId.toString()}'} '
        'order by s.code != 1, random() limit 1 '
        '');
    final randomCharacter = randomResult[0];
    final updateResult = await db.rawUpdate(''
        'update home_location set character_id = ${randomCharacter['id']} '
        'where character_id is null '
        '');
    return updateResult == 1 ? randomCharacter : null;
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
