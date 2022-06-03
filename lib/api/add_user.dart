import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/register_response.dart';

class AddUser {
  static Future<ResponseRegister> createUser(
    String nama,
    username,
    jeniKelamin,
    email,
    noHp,
    tglLahir,
    password,
  ) async {
    Uri _apiURL = Uri.parse("http://10.0.2.2/flutter/register.php");

    var response = await http.post(
      _apiURL,
      body: {
        "nama": nama,
        "username": username,
        "jenis_kelamin": jeniKelamin,
        "email": email,
        "no_hp": noHp,
        "tgl_lahir": tglLahir,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return ResponseRegister.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create User");
    }
  }
}
