import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/tiket.dart';

class GetTiket {
  static Future<List<Tiket>> getTikets(String idUser) async {
    Uri apiURL = Uri.parse("http://10.0.2.2/flutter/tiket.php");

    var response = await http.post(
      apiURL,
      body: {
        "user_mobile_id": idUser,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> listTiket =
          (json.decode(response.body) as Map<String, dynamic>)['data'];

      List<Tiket> tikets = [];
      for (int i = 0; i < listTiket.length; i++) {
        tikets.add(Tiket.fromJson(listTiket[i]));
      }
      return tikets;
    } else {
      throw Exception("Failed to load tiket");
    }
  }
}