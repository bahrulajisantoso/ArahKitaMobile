import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/gambar.dart';

class GetGambar {
  static Future<Gambar> getGambar(String id) async {
    Uri _apiURL = Uri.parse("http://10.0.2.2/flutter/gambar.php");

    var response = await http.post(
      _apiURL,
      body: {
        "id": id,
      },
    );

    if (response.statusCode == 200) {
      return Gambar.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to read Gambar");
    }
  }
}
