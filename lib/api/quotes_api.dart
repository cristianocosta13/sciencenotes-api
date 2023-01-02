import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sciencenotes/pages/enter_page.dart';

class QuotesApi {
  final String _baseUrl = "api.kanye.rest";

  Future<String> Quote() async {
    Uri url = Uri.http(_baseUrl, "/");
    Response response = await http.get(url);

    var json = jsonDecode(response.body);
    print(json);
    if (json['quote'] != null ) {
      return json['quote'];
    }
    return 'Null';
  }
}