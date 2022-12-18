import 'package:flutter/material.dart';

class Question {
  late int id;
  late String institute;
  late String question;
  late String alt1;
  late String alt2;
  late String alt3;
  late String alt4;
  late String alt5;
  late int colorQuestion;
  late int alterCorrect;
  late int idContent;

  Question(
      {required this.id,
      required this.institute,
      required this.question,
      required this.alt1,
      required this.alt2,
      required this.alt3,
      required this.alt4,
      required this.alt5,
      required this.colorQuestion,
      required this.alterCorrect,
      required this.idContent});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    institute = json['institute'];
    question = json['question'];
    alt1 = json['alt1'];
    alt2 = json['alt2'];
    alt3 = json['alt3'];
    alt4 = json['alt4'];
    alt5 = json['alt5'];
    colorQuestion = int.parse(json['colorQuestion']);
    alterCorrect = json['alter_correct'];
    idContent = json['id_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['institute'] = this.institute;
    data['question'] = this.question;
    data['alt1'] = this.alt1;
    data['alt2'] = this.alt2;
    data['alt3'] = this.alt3;
    data['alt4'] = this.alt4;
    data['alt5'] = this.alt5;
    data['colorQuestion'] = colorQuestion.toString();
    data['alter_correct'] = this.alterCorrect;
    data['id_content'] = this.idContent;
    return data;
  }
}

/*class Question {
  final String institute;
  final String question;
  final String alt1;
  final String alt2;
  final String alt3;
  final String alt4;
  final String alt5;
  final Color colorQuestion;
  final int alterCorrect;


  Question({
    required this.institute,
    required this.question,
    required this.alt1,
    required this.alt2,
    required this.alt3,
    required this.alt4, 
    required this.alt5,
    required this.colorQuestion,
    required this.alterCorrect,
  });
}
*/
