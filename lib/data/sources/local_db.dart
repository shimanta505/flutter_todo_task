import 'package:sqflite/sqflite.dart';

class LocalDb {
  // Get a location using getDatabasesPath

  late String _path;
  static late Database _database;

  static const String _tableName = 'TodoTable'; //TodoTable

  initDb() async {
    final databasesPath = await getDatabasesPath();
    print(databasesPath);
    _path = '$databasesPath/drutoLoan.db';
    await _createDb();
  }

  _createDb() async {
    _database = await openDatabase(
      _path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY,title TEXT,description TEXT,created_at TEXT,status TEXT)',
        );
      },
    );
  }

  static dbInsertIntoTodoTable({
    required String title,
    required String description,
    required String created,
    required String status,
  }) async {
    await _database.transaction((txn) async {
      // int id = await txn.rawInsert(
      //   'INSERT INTO $_tableName(title,description,created_at,status) VALUES($title,$description,$created,$status)',
      // );
      int id = await txn.rawInsert(
        'INSERT INTO TodoTable(title, description, created_at, status) VALUES(?, ?, ?, ?)',
        [title, description, created, status],
      );
      print(id);
    });
  }

  static Future<List<Map<String, dynamic>>> getDbTodoTableList() async {
    return await _database.rawQuery("SELECT * FROM $_tableName");
  }
}
