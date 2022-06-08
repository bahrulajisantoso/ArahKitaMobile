import 'package:flutter/material.dart';
import 'package:project/theme/color.dart';
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
        iconTheme: (IconThemeData(
          color: Color(int.parse(Warna.colorPrimary)),
          size: 30,
        )),
        backgroundColor: Color(int.parse(Warna.colorGrey)),
        title: const Text("Detail Tiket"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(int.parse(Warna.colorPrimary)),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
        bottom: PreferredSize(
            child: Container(
              color: Color(int.parse(Warna.colorPrimary)),
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(2.0)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(Warna.colorGrey)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            _namaWisata.toString(),
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 290,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            _tglTiket.toString(),
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF919191),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 30.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(
                      //         Icons.date_range,
                      //         size: 17,
                      //         color: Color(0xFF525252),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 5.0),
                      //         child: Text(
                      //           _tglTiket.toString(),
                      //           style: const TextStyle(fontSize: 13),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Divider(
                        height: 3,
                        thickness: 3,
                        color: Color(0xFFDADADA),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: 290,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            'Nama',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          _namaPembeli.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: 290,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            'Jumlah Tiket',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          _jumlahTiket.toString(),
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: 290,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            'Total Harga',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 290,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Text(
                          "Rp" + _totalHarga.toString() + ",-",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: QrImage(
                          data: _kodeTiket.toString(),
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                        child: Container(
                          width: 290,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            'Dipesan dan dibayarkan oleh Arah Kita',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF8A8A8A),
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
