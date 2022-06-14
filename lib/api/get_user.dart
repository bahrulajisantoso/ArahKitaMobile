import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/api/global.dart';
import 'package:project/model/user.dart';

class GetUser {
  static Future<User> getUser(String idUser) async {
    Uri _apiURL = Uri.parse("${Url.baseURL}data_user.php");

    var response = await http.post(
      _apiURL,
      body: {
        "id": idUser,
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to read User");
    }
  }
}
