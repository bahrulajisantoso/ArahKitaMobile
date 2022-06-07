import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/register_response.dart';
import 'package:project/model/update_user_respones.dart';

class UpdateUser {
  static Future<ResponseUpdateUser> updateUser(
    String idUser,
    nama,
    jeniKelamin,
    email,
    noHp,
    tglLahir,
  ) async {
    Uri _apiURL = Uri.parse("http://10.0.2.2/flutter/update_user.php");

    var response = await http.post(
      _apiURL,
      body: {
        "id": idUser,
        "nama": nama,
        "jenis_kelamin": jeniKelamin,
        "email": email,
        "no_hp": noHp,
        "tgl_lahir": tglLahir,
      },
    );

    if (response.statusCode == 200) {
      return ResponseUpdateUser.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update User");
    }
  }
}
