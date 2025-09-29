import '../../../models/user/userModel.dart';
import '../../../services/db/dbService.dart';
import 'package:sqflite/sqflite.dart';

class UserController {
  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return regex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.trim().isNotEmpty;
  }

  bool _isValidName(String name) {
    return name.trim().length >= 2;
  }

  Future<int> register(UserModel user) async {
    if (!_isValidEmail(user.email)) {
      throw FormatException('Correo inválido: debe contener @ y dominio');
    }
    if (!_isValidPassword(user.password)) {
      throw FormatException('Contraseña requerida');
    }
    if (!_isValidName(user.name)) {
      throw FormatException('Nombre demasiado corto');
    }

    final db = await DBService.database;
    return await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  Future<UserModel?> login(String email, String password) async {
    final db = await DBService.database;
    final result = await db.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isEmpty) return null;
    return UserModel.fromMap(result.first);
  }

  Future<UserModel?> getById(int id) async {
    final db = await DBService.database;
    final result = await db.query('user', where: 'id = ?', whereArgs: [id]);
    if (result.isEmpty) return null;
    return UserModel.fromMap(result.first);
  }

  Future<bool> updateNameSecure(
    int userId,
    String password,
    String newName,
  ) async {
    if (!_isValidName(newName)) return false;

    final db = await DBService.database;
    final result = await db.query(
      'user',
      where: 'id = ? AND password = ?',
      whereArgs: [userId, password],
    );
    if (result.isEmpty) return false;

    await db.update(
      'user',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [userId],
    );
    return true;
  }
}