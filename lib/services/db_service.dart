import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbService {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'data.db'),
      version: 1,
      onCreate: (db, version) {
        print('init' + dbPath);
        ddl(db);
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbService.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbService.database();
    final path = await sql.getDatabasesPath();
    print(path);
    return db.query(table);
  }

  static void ddl(sql.Database db) {
    db.execute(
        'CREATE TABLE `character` (`id` INTEGER	NOT NULL primary key autoincrement '
        ',`name`	varchar(15)	NOT NULL,`description`	longtext	NULL,`is_home`	bit(1)	NOT NULL	DEFAULT false	,`is_travel`'
        '	bit(1)	NOT NULL	DEFAULT false	,`is_starter`	bit(1)	NOT NULL	DEFAULT false);');
  }
}
