import 'package:flutter/material.dart';
import 'package:project/pages/form_transaction_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailWisata extends StatefulWidget {
  final String? namaWisata, kategori, lokasi, hargaTiket, deskripsi, gambar1;

  const DetailWisata(
      {Key? key,
      this.namaWisata,
      this.kategori,
      this.lokasi,
      this.hargaTiket,
      this.deskripsi,
      this.gambar1})
      : super(key: key);

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  final imgBaseUrl = "http://10.0.2.2/flutter/img/";

  Future<void> sessionFormTransaction() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama_wisata", widget.namaWisata.toString());
    pref.setString("kategori", widget.kategori.toString());
    pref.setString("lokasi", widget.lokasi.toString());
    pref.setString("harga_tiket", widget.hargaTiket.toString());
    pref.setString("deskripsi", widget.deskripsi.toString());
    pref.setString("gambar_1", widget.gambar1.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Wisata"),
      ),
      body: Column(
        children: <Widget>[
          Image.network("$imgBaseUrl${widget.gambar1}",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2),
          Text(widget.namaWisata.toString()),
          Text(widget.kategori.toString()),
          Text(widget.lokasi.toString()),
          Text(widget.hargaTiket.toString()),
          Text(widget.deskripsi.toString()),
          ElevatedButton(
            onPressed: () {
              sessionFormTransaction();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FormTransaction(),
                ),
              );
            },
            child: const Text("pesan"),
          )
        ],
      ),
    );
  }
}
