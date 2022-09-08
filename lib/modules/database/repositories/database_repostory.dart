import 'package:sqflite/sqflite.dart';

import '../../home/models/cep_model.dart';
import '../config/database_config.dart';

abstract class DatabaseRepository {
  final Future<Database> _database = DatabaseConfig.instance.database;

  Future<int> create(dynamic object) async {
    var db = await _database;
    var result = await db.insert('Address', object.toJson());
    return result;
  }

  Future<Map<String, dynamic>?> read({
    required String table,
    required String field,
    required String arg,
  }) async {
    var db = await _database;
    var results = await db.query(table, where: 'cep = ?', whereArgs: [arg]);
    if (results.isEmpty) {
      return null;
    }
    return results.first;
  }

  Future<int> update(CEPModel object) async {
    var db = await _database;
    var result = await db.update(object.runtimeType.toString(), object.toJson(),
        where: 'cep = ?', whereArgs: [object.cep]);
    return result;
  }

  Future<int> delete(int cep, String tableName) async {
    var db = await _database;
    int result = await db.delete(tableName, where: 'cep = ?', whereArgs: [cep]);
    return result;
  }
}
