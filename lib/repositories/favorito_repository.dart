import 'package:star_wars_app/db/app_database.dart';
import 'package:star_wars_app/models/favorito.dart';

class FavoritoRepository {
  Future<Favorito> create(Favorito favorito) async {
    final db = await AppDatabase.instance.database;

    final id = await db.insert(tableFavoritos, favorito.toJson());

    return favorito.copy(id: id);
  }

  Future<Favorito> getById(int id) async {
    final db = await AppDatabase.instance.database;

    final maps = await db.query(
      tableFavoritos,
      columns: FavoritoFields.values,
      where: '${FavoritoFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Favorito.fromJson(maps.first);
    } else {
      throw Exception('Id $id não encontrado');
    }
  }

  Future<List<Favorito>> getAll() async {
    final db = await AppDatabase.instance.database;

    final result = await db.query(tableFavoritos);

    return result.map((json) => Favorito.fromJson(json)).toList();
  }

  Future<int> update(Favorito favotiro) async {
    final db = await AppDatabase.instance.database;

    return db.update(
      tableFavoritos,
      favotiro.toJson(),
      where: '${FavoritoFields.id} = ?',
      whereArgs: [favotiro.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await AppDatabase.instance.database;

    return await db.delete(
      tableFavoritos,
      where: '${FavoritoFields.id} = ?',
      whereArgs: [id],
    );
  }
}
