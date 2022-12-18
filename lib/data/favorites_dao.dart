import 'package:sciencenotes/data/DBhelper.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/favorites.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sciencenotes/data/DBhelper.dart';

class FavoritesDAO {
  Future<void> addFavorites({required Favorites favorites}) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();
    await db.insert('FAV', favorites.toJson());
  }
  
  Future<List<Favorites>> selectFavorites() async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();
    List<Favorites> lista = <Favorites>[];
    String sql = 'SELECT * FROM FAV;';
    final result = await db.rawQuery(sql);
    print(result);
    for (var json in result) {
      Favorites fav = Favorites.fromJson(json);
      lista.add(fav);
    }

    return lista;
  }
}
