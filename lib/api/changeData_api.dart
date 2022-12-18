import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class UpdateApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> updateUser(String email, String name, String image, String username, String birthdate) async {
    Uri url = Uri.http(_baseUrl, "/changeData/$email/$name/$image/$username/$birthdate");
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
