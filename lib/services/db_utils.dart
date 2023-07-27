import 'dart:async';
import 'package:book_world/models/books.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbUtils{
  static final DbUtils _dbUtils = DbUtils._internal();


  DbUtils._internal();


  factory DbUtils(){
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'books_database.db');
    var dbUsers = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbUsers;
  }


  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE Books(id INTEGER PRIMARY KEY, name TEXT, yazar TEXT)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('books');
  }

  Future<void> insertBook(Books book) async {
    final Database? db = await this.db;
    await db?.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Books>> books() async {
    final Database? db = await this.db;
    final List<Map<String, Object?>>? maps = await db?.query('books');
    return List.generate(maps!.length, (i) {
      return Books(
        id:int.parse(maps[i]['id'].toString()),
        name: maps[i]['name'].toString(),
        yazar: maps[i]['yazar'].toString(),
      );
    });
  }

  Future<void> updateBook(Books book) async {
    final db = await this.db;
    await db?.update(
      'books',
      book.toMap(),
      where: "id = ?",
      whereArgs: [book.id],
    );
  }

  Future<void> deleteBook(int id) async {
    final db = await this.db;
    await db?.delete(
      'books',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}

