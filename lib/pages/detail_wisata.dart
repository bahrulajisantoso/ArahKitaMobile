import 'package:flutter/material.dart';
import 'package:project/pages/form_transaction.dart';

class DetailWisata extends StatefulWidget {
  final String? nama, lokasi, harga;

  const DetailWisata({Key? key, this.nama, this.lokasi, this.harga})
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
          Text(widget.nama.toString()),
          Text(widget.lokasi.toString()),
          Text(widget.harga.toString()),
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
