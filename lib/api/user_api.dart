import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sciencenotes/domain/users.dart';
import 'package:http/http.dart';

class UserApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<List<Users>> listUsers() async {
    Uri url = Uri.http(_baseUrl, "/findAll");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    
    List<Users> list = <Users>[];
    for (var userDTO in json['users']) {
      print(userDTO);
      Users user = Users(
          image: userDTO['image'],
          email: userDTO['email'],
          password: userDTO['password'],
          name: userDTO['name'],
          username: userDTO['username'],
          birthdate: userDTO['birthdate'],
          id: 0,
      );
      list.add(user);
    }

    return list;
  }
}
