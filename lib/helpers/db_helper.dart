import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    sql.openDatabase(path.join(dbPath, 'places.db'));
  }
}
