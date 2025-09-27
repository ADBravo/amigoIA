import '../../../models/user/userModel.dart';
import '../../../services/db/dbService.dart';
import 'package:sqflite/sqflite.dart';


class UserController {
  Future<UserModel?> getUser() async {
    final db = await DBService.database;
    final result = await db.query('user');
    if (result.isEmpty) return null;
    return UserModel.fromMap(result.first);
  }

  Future<void> setUserName(String name) async {
    final db = await DBService.database;
    await db.insert('user', {'id': 1, 'name': name}, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateUserName(String name) async {
    final db = await DBService.database;
    await db.update('user', {'name': name}, where: 'id = ?', whereArgs: [1]);
  }
}