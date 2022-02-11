import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:star_wars_app/models/favorito.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();

  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableFavoritos (
 ${FavoritoFields.id} $idType,
 ${FavoritoFields.nome} $textType
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
