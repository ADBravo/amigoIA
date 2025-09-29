import 'dart:io';
import 'package:sqflite/sqflite.dart' as mobile;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as ffi;

bool isDesktop() => Platform.isWindows || Platform.isLinux || Platform.isMacOS;

DatabaseFactory getDatabaseFactory() {
  if (isDesktop()) {
    ffi.sqfliteFfiInit();
    return ffi.databaseFactoryFfi;
  } else {
    return mobile.databaseFactory;
  }
}