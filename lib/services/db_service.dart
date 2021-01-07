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
    await db.rawUpdate(
      'update character set is_home = 1 where is_npc = 0 '
      'and id in (select id from character where is_npc = 0  order by random() limit 4)',
    );
    print('init!');
  }

  static void printPath() async {
    final dbPath = await sql.getDatabasesPath();
    print(dbPath);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbService.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<void> updateById(
      String table, Map<String, Object> data, int id) async {
    final db = await DbService.database();
    db.update(table, data, where: 'id = ${id.toString()}');
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
  static Future<List<Map<String, dynamic>>> getHomeCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select * from character c '
        'inner join status s on c.id = s.character_id '
        'where (s.is_status_now = 1 and c.is_home = 1) or c.is_npc = 1 '
        'order by '
        'c.is_npc desc, '
        'substr( '
        '(substr(CURRENT_DATE, 0, 5) * id * substr(CURRENT_DATE, 6, 2) * id * substr(CURRENT_DATE, 9, 2) * id), -3'
        '); '
        '');
  }

  static Future<List<Map<String, dynamic>>> getAllCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select c.*, s.*, d.created_at from character c '
        'inner join status s on c.id = s.character_id '
        'inner join question q on c.id = q.character_id '
        'left outer join diary d on q.id = d.question_id '
        'where s.is_status_now = 1 '
        'group by c.id '
        'having d.id = max(d.id) or d.id is null '
        'order by d.created_at desc, c.is_home = 0, c.is_travel = 0 '
        '');
  }

  static Future<int> updateRandomCharacterHome(
      {int traveledCharacterId}) async {
    final db = await DbService.database();
    return db.rawUpdate(''
        'update character set is_home = 1 '
        'where id = ( '
        'select id from character '
        'where is_home = 0 and is_npc = 0 '
        '${traveledCharacterId == null ? '' : 'and id != ${traveledCharacterId.toString()}'} '
        'order by random() limit 1 '
        ') '
        '');
  }

  static Future<int> updateStatus(
      String table, int characterId, int statusCode) async {
    final db = await DbService.database();
    final batch = db.batch();
    batch.update(table, {'is_status_now': 0},
        where:
            'character_id = ${characterId.toString()} and code = ${statusCode.toString()}');
    statusCode++;
    batch.update(table, {'is_status_now': 1},
        where:
            'character_id = ${characterId.toString()} and code = ${statusCode.toString()}');
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
