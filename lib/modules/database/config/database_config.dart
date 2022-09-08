// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/cep_database_model.dart';

class DatabaseConfig {
  static const String _databaseName = "buscacep_database.db";
  static final DatabaseConfig instance = DatabaseConfig._singleton();
  static Database? _database;

  DatabaseConfig._singleton();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(path, onCreate: _createDB, version: 1);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT';

    await db.execute('''
      CREATE TABLE ${CEPDatabaseModel.TABLE_NAME} 
      (
          ${CEPDatabaseModel.ID} $idType,
          ${CEPDatabaseModel.CEP} $stringType,
          ${CEPDatabaseModel.LOGRADOURO} $stringType,
          ${CEPDatabaseModel.COMPLEMENTO} $stringType,
          ${CEPDatabaseModel.BAIRRO} $stringType,
          ${CEPDatabaseModel.LOCALIDATE} $stringType,
          ${CEPDatabaseModel.UF} $stringType,
          ${CEPDatabaseModel.IBGE} $stringType,
          ${CEPDatabaseModel.GIA} $stringType,
          ${CEPDatabaseModel.DDD} $stringType,
          ${CEPDatabaseModel.SIAFI} $stringType 
      )
      ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
