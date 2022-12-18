import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesHelper {
  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "favorites.db");
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );

    print(path);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'create table FAV (nameDiscipline varchar(100) PRIMARY KEY, id_content constraint fk_fav_id_content foreign key (id_content) references content(id) );';
    await db.execute(sql);
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    if(oldVersion == 1 && newVersion == 2){
  }
}
}
