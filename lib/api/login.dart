import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/api/global.dart';
import 'package:project/model/login_response.dart';

class LoginUser {
  static Future<LoginResponse> loginUser(String email, password) async {
    Uri _apiURL = Uri.parse("${Url.baseURL}login.php");

    var response = await http.post(
      _apiURL,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to login User");
    }
  }
}
