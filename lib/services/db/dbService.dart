import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:path/path.dart';
import 'dbInitializer.dart';

class DBService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabaseFactory().getDatabasesPath(), 'chat_ai.db');

    if (isDesktop()) {
      // FFI: escritorio
      return await getDatabaseFactory().openDatabase(path, options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE user (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              email TEXT UNIQUE NOT NULL,
              password TEXT NOT NULL,
              name TEXT,
              gender TEXT
            );
          ''');

          await db.execute('''
            CREATE TABLE chat (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              userId INTEGER NOT NULL,
              title TEXT,
              createdAt TEXT,
              FOREIGN KEY(userId) REFERENCES user(id)
            );
          ''');

          await db.execute('''
            CREATE TABLE message (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              chatId INTEGER NOT NULL,
              sender TEXT,
              content TEXT,
              timestamp TEXT,
              FOREIGN KEY(chatId) REFERENCES chat(id)
            );
          ''');
        },
      ));
    } else {
      // Android/iOS
      return await openDatabase(path, version: 1, onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE NOT NULL,
            password TEXT NOT NULL,
            name TEXT,
            gender TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE chat (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER NOT NULL,
            title TEXT,
            createdAt TEXT,
            FOREIGN KEY(userId) REFERENCES user(id)
          );
        ''');

        await db.execute('''
          CREATE TABLE message (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            chatId INTEGER NOT NULL,
            sender TEXT,
            content TEXT,
            timestamp TEXT,
            FOREIGN KEY(chatId) REFERENCES chat(id)
          );
        ''');
      });
    }
  }
}