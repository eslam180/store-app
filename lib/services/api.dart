import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> header = {};

    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // هنا بيحول الداتا ال راجعه من الجيسون فايل لديكود  جيسون

      return jsonDecode(response.body);
    } else {
      throw Exception(
        'trere was an error with status code ${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'trere was an error with status code ${response.statusCode}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> header = {};
    header.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }

    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: header,
    );

    if (response.statusCode == 200) {
      // هنا بيحول الداتا ال راجعه من الجيسون فايل لديكود  جيسون

      return jsonDecode(response.body);
    } else {
      throw Exception(
        'trere was an error with status code ${response.statusCode}',
      );
    }
  }
}
