import 'package:flutter/material.dart';

class ToDo {
  late String afazerText;
  late String dataText;
  late int isDone;

  ToDo({
    required this.afazerText,
    required this.dataText,
    this.isDone = 0,
  });

  ToDo.fromJson(Map<String, dynamic> json) { //cria um construtor nomeado
    /*quando recupero algum pacote, o converto a partir do Json
    esse método recebe o Json e tem uma estrutura Map
    conjunto de chave (String) e valor (dynamic)*/
    afazerText = json['afazerText'];
    dataText = json['dataText'];
    isDone = json['isDone'];
  }

  Map<String, dynamic> toJson() { //converto o pacote p/ json p/ salvá-lo
    /*se eu quiser salvar meu banco, porque o sqflite só vai me aceitar o json*/
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['afazerText'] = afazerText;
    data['dataText'] = dataText;
    data['isDone'] = isDone;
    return data;
  }
}
