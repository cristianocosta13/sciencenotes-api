import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RegisterApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> registerUser(int code, String email, String name, String image,
      String username, String birthdate, String password) async {
    Uri url = Uri.http(_baseUrl, "/createUser/$code/$email/$name/$image/"
        "$username/$birthdate/$password");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['created'] == true) {
      return true;
    }
    return false;
  }
}