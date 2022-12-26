import 'package:sciencenotes/data/DBhelper.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sqflite/sqflite.dart';

class ContentDao {

  Future<List<Content>> listContentPhysical() async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE id_discipline=1;';
    final result = await db.rawQuery(sql);

    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }

  Future<List<Content>> listContentChemical() async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE id_discipline=2;';
    final result = await db.rawQuery(sql);

    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }

  Future<List<Content>> listContentBiology() async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE id_discipline=3;';
    final result = await db.rawQuery(sql);

    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }


  Future<List<Content>> findContentPhysical(String title) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE title=?;';
    final result = await db.rawQuery(sql, [title]);

    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }

  Future<List<Content>> findContentChemical(String title) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE title=?;';
    final result = await db.rawQuery(sql, [title]);

    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }

  Future<List<Content>> findContentBiology(String title) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM content WHERE title=?;';
    final result = await db.rawQuery(sql, [title]);
    List<Content> list = <Content>[];
    for(var json in result){
      Content content = Content.fromJson(json);
      list.add(content);
    }

    return list;
  }
}