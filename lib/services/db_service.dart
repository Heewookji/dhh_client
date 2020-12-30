import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DbService {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'data.db'),
      version: 1,
      onCreate: (db, version) {
        print('init ' + dbPath);
        ddl(db);
      },
    );
  }

  static void printPath() async {
    final dbPath = await sql.getDatabasesPath();
    print(dbPath);
  }

  static void ddl(sql.Database db) {
    db.execute(
        'CREATE TABLE `character` (`id` INTEGER	NOT NULL primary key autoincrement '
        ',`name`	varchar(15)	NOT NULL,`description`	longtext	NULL,`is_home`	bit(1)	NOT NULL	DEFAULT false	,`is_travel`'
        '	bit(1)	NOT NULL	DEFAULT false	,`is_starter`	bit(1)	NOT NULL	DEFAULT false);');
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbService.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbService.database();
    return db.query(table);
  }

  //캐릭터
  static Future<List<Map<String, dynamic>>> getHomeCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select * from character c '
        'inner join status s on c.id = s.character_id '
        'where s.is_status_now = 1 and c.is_home = 1;'
        '');
  }

  static Future<List<Map<String, dynamic>>> getAllCharacters() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select * from '
        '(select * from '
        '(select c.*, s.*, d.created_at from character c '
        'inner join status s on c.id = s.character_id '
        'inner join question q on c.id = q.character_id '
        'left outer join diary d on q.id = d.question_id '
        'where s.is_status_now = 1 '
        'order by d.created_at desc '
        ') t '
        'group by t.id) t2 '
        'order by t2.created_at desc, t2.is_home = 0, t2.is_travel = 0 '
        '');
  }

  //질문
  static Future<List<Map<String, dynamic>>> getQuestionsByCharacterIds(
      List<String> characterIds) async {
    final db = await DbService.database();
    String idsString =
        characterIds.toString().replaceAll('[', '(').replaceAll(']', ')');
    return db.rawQuery(''
        'select *  from question q '
        'where q.character_id in $idsString '
        'and (select count(*) from diary d where d.question_id = q.id) == 0 '
        'group by q.character_id '
        '');
  }

  //일기
  static Future<List<Map<String, dynamic>>>
      getAllDiariesOrderByCreatedAt() async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select d.*, c.color from diary d '
        'inner join question q on d.question_id = q.id '
        'inner join character c on q.character_id = c.id '
        '');
  }

  static Future<List<Map<String, dynamic>>> getDiariesByCharacterId(
      int characterId) async {
    final db = await DbService.database();
    return db.rawQuery(''
        'select d.*, c.color from diary d '
        'inner join question q on d.question_id = q.id '
        'inner join character c on q.character_id = c.id '
        'where c.id = ${characterId.toString()} '
        'order by d.created_at desc '
        '');
  }
}
