import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbService {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    print(dbPath);
    return sql.openDatabase(
      path.join(dbPath, 'data.db'),
      onCreate: (db, version) {
        return null;
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbService.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbService.database();
    return db.query(table);
  }
}
