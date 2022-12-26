import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sciencenotes/domain/messages.dart';

class ForumApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> sendMessage(String message) async {
    Uri url = Uri.http(_baseUrl, "/sendMessage/$message");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['sent'] == true) {
      return true;
    }
    return false;
  }

  Future<List<Messages>> listMessages() async {
    Uri url = Uri.http(_baseUrl, "/listMessages");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);

    List<Messages> list = <Messages>[];
    for (var msg in json['messages']) {
      Messages message = Messages(message: msg['message']);
      list.add(message);
    }

    return list;
  }

}
