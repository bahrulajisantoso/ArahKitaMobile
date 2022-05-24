import 'package:flutter/material.dart';
import 'package:project/pages/form_transaction.dart';

class DetailWisata extends StatefulWidget {
  final String? namaWisata, kategori, lokasi, hargaTiket, deskripsi;

  const DetailWisata(
      {Key? key,
      this.namaWisata,
      this.kategori,
      this.lokasi,
      this.hargaTiket,
      this.deskripsi})
      : super(key: key);

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Wisata"),
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          Text(widget.namaWisata.toString()),
          Text(widget.kategori.toString()),
          Text(widget.lokasi.toString()),
          Text(widget.hargaTiket.toString()),
          Text(widget.deskripsi.toString()),
          ElevatedButton(
            onPressed: () {
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
