import 'dart:convert';
import 'package:http/http.dart' as http;

class Wisata {
  String? id, nama, kategori, deskripsi, lokasi, hargaTiket;

  Wisata(
      {this.id,
      this.nama,
      this.kategori,
      this.deskripsi,
      this.lokasi,
      this.hargaTiket});

  factory Wisata.fromJson(Map<String, dynamic> object) {
    return Wisata(
        id: object['id'].toString(),
        nama: object['nama_wisata'],
        kategori: object['kategori'],
        deskripsi: object['deskripsi'],
        lokasi: object['lokasi'],
        hargaTiket: object['harga_tiket']);
  }

  static Future<List<Wisata>> getWisatas() async {
    Uri apiURL = Uri.parse('http://10.0.2.2/flutter/wisata.php');

    var response = await http.get(apiURL);
    var responseData = jsonDecode(response.body);
    List<dynamic> listWisata = (responseData as Map<String, dynamic>)['data'];

    List<Wisata> wisatas = [];
    for (int i = 0; i < listWisata.length; i++) {
      wisatas.add(Wisata.fromJson(listWisata[i]));
    }
    return wisatas;
  }
}
