import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/user.dart';

class AddUser {
  static Future createUser(
    String nama,
    String username,
    String email,
    String noHp,
    String tglLahir,
    String password,
  ) async {
    Uri _apiURL = Uri.parse('http://10.0.2.2/flutter/register.php');

    // var response = await http.post(apiURL);

    final response = await http.post(_apiURL, body: {
      "nama": nama,
      "username": username,
      "email": email,
      "no_hp": noHp,
      "tgl_lahir": tglLahir,
      "password": password,
    });

    // var jsonObject = jsonDecode(apiResult.body);

    if (response.statusCode == 200) {
      return true;
      // return User.fromJson(jsonDecode(response.body));
      // return PostResult.createPostResult(jsonObject);
    } else {
      throw Exception('Failed to create User.');
    }
  }
}
