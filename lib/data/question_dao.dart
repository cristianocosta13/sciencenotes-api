

import 'package:sciencenotes/data/DBhelper.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/question.dart';
import 'package:sqflite/sqflite.dart';

class QuestionDao {

  Future<void> addQuestion({required Question question}) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    await db.insert('question', question.toJson());
  }


  Future<List<Question>> getLastId(int id) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT *, MAX(id) FROM question WHERE id_content=? ;'; //retorna o maior id, por consequencia o ultimo
    final result = await db.rawQuery(sql, [id]);

    List<Question> list = <Question>[];
    Question question = Question.fromJson(result[0]);
    list.add(question);

    return list;
  }

  selectDiscipline(Content content){ //chama na question_page para retornar a lista de questões daquele conteúdo
    if(content.id_discipline == 1){
      var list = listQuestionsPhysical(content);
      return list;
    }else if (content.id_discipline==2){
      var list = listQuestionsChemical(content);
      return list;
    }else{
      var list = listQuestionsBiology(content);
      return list;
    }
  }

  Future<List<Question>> listQuestionsPhysical(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Question> aux = <Question>[];
    List<Question> list = <Question>[];
    aux = await selectQuestionsByContent(content, db, list, 11);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 12);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 13);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 14);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 15);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 16);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 17);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 18);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 19);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 110);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Question>> listQuestionsChemical(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Question> aux = <Question>[];
    List<Question> list = <Question>[];
    aux = await selectQuestionsByContent(content, db, list, 21);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 22);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 23);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 24);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 25);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 26);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 27);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 28);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 29);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 210);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Question>> listQuestionsBiology(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Question> aux = <Question>[];
    List<Question> list = <Question>[];
    aux = await selectQuestionsByContent(content, db, list, 31);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 32);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 33);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 34);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 35);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 36);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 37);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 38);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 39);
    list = aux.isEmpty ? list : aux;
    aux = await selectQuestionsByContent(content, db, list, 310);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Question>> selectQuestionsByContent(Content content, Database db, List<Question> list, int id) async {
    if(content.id==id){
      String sql = 'SELECT * FROM question WHERE id_content=?;';
      final result = await db.rawQuery(sql, [id]);
      for(var json in result){
        Question question = Question.fromJson(json);
        list.add(question);
      }
    }
    return list;
  }

}