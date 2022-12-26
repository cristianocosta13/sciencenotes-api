import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sciencenotes/domain/users.dart';
import 'package:http/http.dart';

class UserApi {
  String baseUrl = "";

  Future<List<Users>> listUsers() async {
    Uri url = Uri.http(baseUrl, "/api/findAll");
    Response response = await http.get(url);

    List<Users> lista = <Users>[];
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);

      for (var json in result) {
        Users user = Users.fromApiJson(json);
        lista.add(user);
      }
    }

    return lista;
  }
}