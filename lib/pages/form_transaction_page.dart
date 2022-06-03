import 'package:flutter/material.dart';
import 'package:project/pages/pembayaran_page.dart';
import 'package:project/theme/color.dart';
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
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(int.parse(Warna.colorGrey)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //data wisata
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 20, 0),
                  child: Container(
                    child: Text(
                      'Detail Wisata',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF01797D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    // padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FlutterLogo(),
                                // child: Image.asset(
                                //   'assets/images/blawan.jpg',
                                //   width: 100,
                                //   height: 100,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                            child: Container(
                              width: 200,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 20,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      "$_namaWisata",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 20,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      "$_kategori",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF525252),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 20,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      "$_lokasi",
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF525252),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //detail pemesan tiket
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 20, 0),
                  child: Container(
                    child: Text(
                      'Detail Pemesan Tiket',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF01797D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Container(
                                      width: 300,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Nama',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF525252),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Sugeng Widodo',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Container(
                                      width: 300,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Email',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF525252),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'sugengwidodo23@gmail.com',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 2, 0, 0),
                                    child: Container(
                                      width: 300,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Text(
                                        'Nomor Handphone',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF525252),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      '+6283834860600',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //tanggal tiket
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 20, 10),
                  child: Container(
                    child: Text(
                      'Tanggal Tiket',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF01797D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Text(
                                '1 Juli 2022',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                          //   child: FlutterFlowIconButton(
                          //     borderColor: Colors.transparent,
                          //     borderRadius: 30,
                          //     borderWidth: 1,
                          //     buttonSize: 60,
                          //     icon: Icon(
                          //       Icons.edit,
                          //       color: FlutterFlowTheme.of(context).primaryColor,
                          //       size: 20,
                          //     ),
                          //     onPressed: () {
                          //       print('IconButton pressed ...');
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                //detail tiket
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 20, 0),
                  child: Container(
                    child: Text(
                      'Detail Tiket',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF01797D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                          child: Container(
                            child: Text(
                              'Jumlah Tiket',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(120, 0, 0, 0),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //detail harga
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 10, 20, 0),
                  child: Container(
                    child: Text(
                      'Detail Harga',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF01797D),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      '$_namaWisata'
                                      ' '
                                      'x'
                                      ' '
                                      '$_jumlahTiket',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Rp.' '$_hargaTiket' ',-',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 2,
                            color: Color(0xFFDADADA),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Total Harga',
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      'Rp.' '$_totalHarga' ',-',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        color: Color(0xFF01797D),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 1, 121, 125),
                        ),
                      ),
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
                ),

                // Image.network(
                //   "$imgBaseUrl$_gambar1",
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height / 2,
                // ),
                // Text(_gambar1.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
