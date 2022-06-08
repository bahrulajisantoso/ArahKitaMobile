import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailTiket extends StatefulWidget {
  const DetailTiket({Key? key}) : super(key: key);

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  String? _namaWisata,
      _namaPembeli,
      _jumlahTiket,
      _totalHarga,
      _kodeTiket,
      _tglTiket;

  _getSessionTiket() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _namaWisata = prefs.getString('nama_wisata');
      _namaPembeli = prefs.getString('nama_pembeli');
      _jumlahTiket = prefs.getString('jumlah_tiket');
      _totalHarga = prefs.getString('total_harga');
      _kodeTiket = prefs.getString('kode_tiket');
      _tglTiket = prefs.getString('tgl_tiket');
    });
  }

  @override
  void initState() {
    super.initState();
    _getSessionTiket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Tiket'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_namaWisata.toString()),
            Text(_namaPembeli.toString()),
            Text(_jumlahTiket.toString()),
            Text(_totalHarga.toString()),
            Text(_tglTiket.toString()),
            QrImage(
              data: _kodeTiket.toString(),
              version: QrVersions.auto,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
