import 'package:sciencenotes/data/DBhelper.dart';
import 'package:sciencenotes/domain/content.dart';
import 'package:sciencenotes/domain/resume.dart';
import 'package:sqflite/sqflite.dart';

class ResumeDao {

  Future<void> addResume({required Resume resume}) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    await db.insert('resume', resume.toJson());
  }


  Future<List<Resume>> getLastId(int id) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT *, MAX(id) FROM resume WHERE id_content=? ;'; //retorna o maior id, por consequencia o ultimo
    final result = await db.rawQuery(sql, [id]);

    List<Resume> list = <Resume>[];
    Resume resume = Resume.fromJson(result[0]);
    list.add(resume);

    return list;
  }

  selectDiscipline(Content content){ //chama na resume_page para retornar a lista de resumos daquele conteúdo
    if(content.id_discipline == 1){
      var list = listResumePhysical(content);
      return list;
    }else if (content.id_discipline==2){
      var list = listResumeChemical(content);
      return list;
    }else{
      var list = listResumeBiology(content);
      return list;
    }
  }

  Future<List<Resume>> listResumePhysical(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Resume> aux = <Resume>[];
    List<Resume> list = <Resume>[];
    aux = await selectResumeByContent(content, db, list, 11);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 12);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 13);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 14);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 15);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 16);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 17);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 18);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 19);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 110);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Resume>> listResumeChemical(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Resume> aux = <Resume>[];
    List<Resume> list = <Resume>[];
    aux = await selectResumeByContent(content, db, list, 21);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 22);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 23);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 24);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 25);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 26);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 27);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 28);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 29);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 210);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Resume>> listResumeBiology(Content content) async {
    Helper dbHelper = Helper();
    Database db = await dbHelper.initDB();

    List<Resume> aux = <Resume>[];
    List<Resume> list = <Resume>[];
    aux = await selectResumeByContent(content, db, list, 31);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 32);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 33);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 34);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 35);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 36);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 37);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 38);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 39);
    list = aux.isEmpty ? list : aux;
    aux = await selectResumeByContent(content, db, list, 310);
    list = aux.isEmpty ? list : aux;

    return list;
  }

  Future<List<Resume>> selectResumeByContent(Content content, Database db, List<Resume> list, int id) async {
    if(content.id==id){
      String sql = 'SELECT * FROM resume WHERE id_content=?;';
      final result = await db.rawQuery(sql, [id]);
      for(var json in result){
        Resume resume = Resume.fromJson(json);
        list.add(resume); print(resume);
      }
    }
    return list;
  }

}
