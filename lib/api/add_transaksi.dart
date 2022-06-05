import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project/model/transaksi_response.dart';

class AddTransaksi {
  static Future<TransaksiResponse> createTransaksi(
    String idUser,
    // namaUser,
    idWisata,
    // namaWisata,
    tglTiket,
    jumlahTiket,
    totalHarga,
    createdAt,
  ) async {
    Uri _apiURL = Uri.parse("http://10.0.2.2/flutter/add_transaksi.php");

    var response = await http.post(
      _apiURL,
      body: {
        "user_mobile_id": idUser,
        // "nama_user": namaUser,
        "wisata_id": idWisata,
        // "nama_wisata": namaWisata,
        "tgl_tiket": tglTiket,
        "jumlah_tiket": jumlahTiket,
        "total_harga": totalHarga,
        "created_at": createdAt,
      },
    );

    if (response.statusCode == 200) {
      return TransaksiResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create User");
    }
  }
}
