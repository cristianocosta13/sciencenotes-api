import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sciencenotes/domain/mission.dart';

class MissionApi {
  final String _baseUrl = "science-notes.joscristiano.repl.co";

  Future<bool> addMission(String name, String description) async {
    Uri url = Uri.http(_baseUrl, "/addMission/$name/$description");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);
    if (json['created'] == true) {
      return true;
    }
    return false;
  }

  Future<List<Mission>> listMissions() async {
    Uri url = Uri.http(_baseUrl, "/allMissions");
    Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    var json = jsonDecode(response.body);

    List<Mission> list = <Mission>[];
    for (var mission in json['missions']) {
      Mission singleMission = Mission(name: mission['name'], description: mission['description'],);
      list.add(singleMission);
    }

    return list;
  }
}