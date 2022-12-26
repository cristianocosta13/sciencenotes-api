import 'package:sqflite/sqflite.dart';
import 'package:sciencenotes/domain/messages.dart';
import 'package:sciencenotes/data/DBhelper.dart';

class MessageDao {
  Future<void> saveMessage({required Messages message}) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    await db.insert('message', message.toJson());
  }

  Future<List<Messages>> listMessages() async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();
    String sql = 'SELECT * '
        'FROM message;';
    final result = await db.rawQuery(sql);

    List<Messages> lista = <Messages>[];
    for (var json in result) {
      Messages message = Messages.fromJson(json);
      lista.add(message);
    }
    return lista;
  }
}