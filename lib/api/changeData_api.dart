import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sciencenotes/domain/users.dart';

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

  Future<Users> findUser(String email) async {
    Uri url = Uri.http(_baseUrl, "/findUser/$email");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);
    var json = jsonDecode(response.body);

    if (json['user'] == false) {
      return Users(image: '', email: '', password: '', name: '',
          username: '', birthdate: '', id: 0);
    }
    return Users(
        image: json['user']['image'],
        email: json['user']['email'],
        password: json['user']['password'],
        name: json['user']['name'],
        username: json['user']['username'],
        birthdate: json['user']['birthdate'],
        id: 0,
    );
  }
}
