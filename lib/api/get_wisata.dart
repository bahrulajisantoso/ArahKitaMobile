import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/wisata.dart';

// class Wisata {
//   String? id, nama, kategori, deskripsi, lokasi, hargaTiket;

//   Wisata(
//       {this.id,
//       this.nama,
//       this.kategori,
//       this.deskripsi,
//       this.lokasi,
//       this.hargaTiket});

//   factory Wisata.fromJson(Map<String, dynamic> object) {
//     return Wisata(
//         id: object['id'].toString(),
//         nama: object['nama_wisata'],
//         kategori: object['kategori'],
//         deskripsi: object['deskripsi'],
//         lokasi: object['lokasi'],
//         hargaTiket: object['harga_tiket']);
//   }

//   static Future<List<Wisata>> getWisatas() async {
//     Uri apiURL = Uri.parse('http://10.0.2.2/flutter/wisata.php');

//     var response = await http.get(apiURL);
//     var responseData = jsonDecode(response.body);
//     List<dynamic> listWisata = (responseData as Map<String, dynamic>)['data'];

//     List<Wisata> wisatas = [];
//     for (int i = 0; i < listWisata.length; i++) {
//       wisatas.add(Wisata.fromJson(listWisata[i]));
//     }
//     return wisatas;
//   }
// }

// factory Wisata.fromJson(Map<String, dynamic> object) {
//     return Wisata(
//         id: object['id'].toString(),
//         nama: object['nama_wisata'],
//         kategori: object['kategori'],
//         deskripsi: object['deskripsi'],
//         lokasi: object['lokasi'],
//         hargaTiket: object['harga_tiket']);
//   }

class GetWisata {
  static Future<List<Wisata>> getWisatas() async {
    Uri apiURL = Uri.parse('http://10.0.2.2/flutter/wisata.php');

    var response = await http.get(apiURL);
    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> listWisata = (responseData as Map<String, dynamic>)['data'];

      List<Wisata> wisatas = [];
      for (int i = 0; i < listWisata.length; i++) {
        wisatas.add(Wisata.fromJson(listWisata[i]));
      }

      // Iterable iterable = jsonDecode(response.body);
      // List<Wisata> wisatas =
      //     iterable.map((model) => Wisata.fromJson(model)).toList();
      return wisatas;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.statusCode);
    }
  }
}
