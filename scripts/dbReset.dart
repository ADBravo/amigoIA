import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final dbPath = await databaseFactory.getDatabasesPath();
  final fullPath = p.join(dbPath, 'chat_ai.db');

  final db = await databaseFactory.openDatabase(fullPath);

  final tables = await db.rawQuery(
    "SELECT name FROM sqlite_master WHERE type='table'",
  );
  for (final table in tables) {
    final name = table['name'];
    if (name != null && name != 'sqlite_sequence') {
      print('🧹 Borrando tabla: $name');
      await db.execute('DROP TABLE IF EXISTS $name');
    }
  }

  await db.close();
  print('✅ Base de datos completamente borrada.');
}
