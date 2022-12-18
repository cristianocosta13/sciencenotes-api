import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class EnterApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> findByUser(String username, String password) async {
    Uri url = Uri.http(_baseUrl, "/login/$username/$password");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    bool result;

    var json = jsonDecode(response.body);
    if (json['logado'] == true) {
       result = true;
    }else{
       result = false;
    }
    return result;
  }
}