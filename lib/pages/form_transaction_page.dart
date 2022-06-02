import 'package:flutter/material.dart';
import 'package:project/pages/pembayaran_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({Key? key}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  String? _namaWisata, _kategori, _lokasi, _hargaTiket, _gambar1;
  final imgBaseUrl = "http://10.0.2.2/flutter/img/";
  int _jumlahTiket = 0;
  int _totalHarga = 0;

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

  _tambahTotalHarga() {
    setState(() {
      _jumlahTiket++;
      _totalHarga = _jumlahTiket * int.parse(_hargaTiket.toString());
    });
  }

  _kurangTotalHarga() {
    setState(() {
      _jumlahTiket--;
      _totalHarga = _jumlahTiket * int.parse(_hargaTiket.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Transaction"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text("$_namaWisata"),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text("$_kategori"),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text("$_lokasi"),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text("$_hargaTiket"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("Tanggal"),
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.calendar_today),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("Jumlah Tiket"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  if (_jumlahTiket == 0) {
                    setState(() {
                      null;
                    });
                  } else {
                    setState(() {
                      _kurangTotalHarga();
                    });
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Text("$_jumlahTiket"),
              IconButton(
                onPressed: () {
                  if (_jumlahTiket >= 6) {
                    setState(() {
                      null;
                    });
                  } else {
                    setState(() {
                      _tambahTotalHarga();
                    });
                  }
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(2),
            child: Text("harga tiket"),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text("$_hargaTiket"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text("Total Harga"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("$_totalHarga"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PembayaranPage(),
                  ),
                );
              },
              child: const Text("Lanjut ke pembayaran"),
            ),
          ),

          // Image.network(
          //   "$imgBaseUrl$_gambar1",
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height / 2,
          // ),
          // Text(_gambar1.toString()),
        ],
      ),
    );
  }
}
