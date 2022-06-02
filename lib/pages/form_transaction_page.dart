import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({Key? key}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  String? _namaWisata, _kategori, _lokasi, _hargaTiket, _gambar1;
  final imgBaseUrl = "http://10.0.2.2/flutter/img/";

  getSession() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaWisata = pref.getString("nama_wisata").toString();
      _kategori = pref.getString("kategori").toString();
      _lokasi = pref.getString("lokasi").toString();
      _hargaTiket = pref.getString("harga_tiket").toString();
      _gambar1 = pref.getString("gambar_1").toString();
    });
  }

  @override
  void initState() {
    getSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Transaction"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // Image.network(
            //   "$imgBaseUrl$_gambar1",
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height / 2,
            // ),
            Text(_namaWisata.toString()),
            Text(_kategori.toString()),
            Text(_lokasi.toString()),
            Text(_hargaTiket.toString()),
            // Text(_gambar1.toString()),
          ],
        ),
      ),
    );
  }
}
