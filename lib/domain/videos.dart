import 'package:flutter/material.dart';

class Videos {
  late int id;
  late String urlImage;
  late String tituloVideo;
  late String tempoDuracao;
  late String urlVideo;
  late int idContent;

  Videos({
    required this.id,
    required this.urlImage,
    required this.tituloVideo,
    required this.tempoDuracao,
    required this.urlVideo,
    required this.idContent,
  });

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    urlImage = json['urlImage'];
    tituloVideo = json['tituloVideo'];
    tempoDuracao = json['tempoDuracao'];
    urlVideo = json['urlVideo'];
    idContent = json['idContent'];
  }

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['urlImage'] = urlImage;
    data['tituloVideo'] = tituloVideo;
    data['tempoDuracao'] = tempoDuracao;
    data['urlVideo'] = urlVideo;
    data['idContent'] = this.idContent;
    return data;
  }
}
