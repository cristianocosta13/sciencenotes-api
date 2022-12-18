import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecoverPasswordApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> recoverPassword(String email, String newPassword) async {
    Uri url = Uri.http(_baseUrl, "/recoverPassword/$email/$newPassword");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['updated'] == true) {
      return true;
    }
    return false;
  }
}