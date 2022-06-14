import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/api/global.dart';
import 'package:project/model/tiket.dart';

class GetTiket {
  static Future<List<Tiket>> getTikets(String idUser) async {
    Uri apiURL = Uri.parse("${Url.baseURL}tiket.php");

    var response = await http.post(
      apiURL,
      body: {
        "user_mobile_id": idUser,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> listTiket;

      if (json.decode(response.body)["data"] == null) {
        return [];
      } else {
        listTiket = json.decode(response.body)["data"];

        (json.decode(response.body) as Map<String, dynamic>)['data'];

        List<Tiket> tikets = [];
        for (int i = 0; i < listTiket.length; i++) {
          tikets.add(Tiket.fromJson(listTiket[i]));
        }
        return tikets;
      }
    } else {
      throw Exception("Failed to load tiket");
    }
  }
}
