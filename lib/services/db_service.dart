import 'dart:io';
import 'dart:typed_data';

import 'package:dhh_client/sql/character_sql.dart';
import 'package:dhh_client/sql/home_sql.dart';
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
    try {
      ByteData data = await rootBundle.load("assets/db/data.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File('$dbPath/data.db').writeAsBytes(bytes);
      final idMapList = await CharacterSql.getHomeRandomIds(init: true);
      await HomeSql.updateHomeLocation(idMapList, init: true);
      print('DB Init!');
    } catch (e, trace) {
      print(e);
      print(trace);
    }
  }

  static void printPath() async {
    final dbPath = await sql.getDatabasesPath();
    print(dbPath);
  }
}
