import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/wisata.dart';

class GetWisata {
  static Future<List<Wisata>> getWisatas() async {
    Uri apiURL = Uri.parse("http://10.0.2.2/flutter/wisata.php");

    var response = await http.get(apiURL);
    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> listWisata = (responseData as Map<String, dynamic>)['data'];

      List<Wisata> wisatas = [];
      for (int i = 0; i < listWisata.length; i++) {
        wisatas.add(Wisata.fromJson(listWisata[i]));
      }
      return wisatas;
    } else {
      throw Exception("Failed to load wisata");
    }
  }
}
