import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ExclusivityUserApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> singleEmail(String email) async {
    Uri url = Uri.http(_baseUrl, "/findByEmail/$email");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['single'] == true) {
      return true;
    }
    return false;
  }

  Future<bool> singleUser(String username) async {
    Uri url = Uri.http(_baseUrl, "/findByUser/$username");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['single'] == true) {
      return true;
    }
    return false;
  }
}
