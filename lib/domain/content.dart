import 'package:flutter/material.dart';
import 'package:sciencenotes/domain/question.dart';
import 'package:sciencenotes/domain/resume.dart';
import 'package:sciencenotes/domain/videos.dart';

class Content {
  late int id;
  late String image;
  late String title;
  late int colorButton;
  late int colorContent;
  late String introduction;
  late int id_discipline;

  Content(
      { required this.id,
        required this.image,
        required this.title,
        required this.colorButton,
        required this.colorContent,
        required this.introduction,
        required this.id_discipline});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    colorButton = int.parse(json['colorButton']);
    colorContent = int.parse(json['colorContent']);
    introduction = json['introduction'];
    id_discipline = json['id_discipline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['colorButton'] = colorButton.toString();
    data['colorContent'] = colorContent.toString();
    data['introduction'] = this.introduction;
    data['id_discipline'] = this.id_discipline;
    return data;
  }
}
/*
class Content {
  final String image;
  final String title;
  final String introduction;
  final Resume resume;
  final String aplicacao;
  final String equacao;
  final Color colorButton;
  final Color colorContent;
  final List<Question> question;
  final List<Videos> videos;

  Content({
    required this.image,
    required this.title,
    required this.introduction,
    required this.resume,
    required this.aplicacao,
    required this.equacao,
    required this.colorButton,
    required this.colorContent,
    required this.question,
    required this.videos,
  });
}
 */