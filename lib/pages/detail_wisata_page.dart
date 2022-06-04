import 'package:flutter/material.dart';
import 'package:project/pages/form_transaction_page.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailWisata extends StatefulWidget {
  const DetailWisata({Key? key}) : super(key: key);

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
  String? _namaWisata, _kategori, _lokasi, _hargaTiket, _deskripsi, _gambar1;
  final imgBaseUrl =
      "http://10.0.2.2/arahkita/Arah_kita_web/storage/app/public/";

  getSession() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaWisata = pref.getString("nama_wisata").toString();
      _kategori = pref.getString("kategori").toString();
      _lokasi = pref.getString("lokasi").toString();
      _hargaTiket = pref.getString("harga_tiket").toString();
      _deskripsi = pref.getString("dekripsi").toString();
      _gambar1 = pref.getString("gambar_1").toString();
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
        title: const Text("Detail Wisata"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(Warna.colorGrey)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Container(
                        width: 500,
                        height: 300,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Text(
                            _namaWisata.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Text(
                            _kategori.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF525252),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            _lokasi.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF525252),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Container(
                            child: Text(
                              'Rp.' + _hargaTiket.toString() + ',-',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF525252),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Container(

                              // child: FFButtonWidget(
                              //   onPressed: () {
                              //     print('Btn-PesanTiket pressed ...');
                              //   },
                              //   text: 'Pesan Tiket',
                              //   options: FFButtonOptions(
                              //     width: 130,
                              //     height: 40,
                              //     color: Color(0xFF01797D),
                              //     style: te(
                              //           fontFamily: 'Poppins',
                              //           color: Colors.white,
                              //         ),
                              //     borderSide: BorderSide(
                              //       color: Colors.transparent,
                              //       width: 1,
                              //     ),
                              //     borderRadius: 20,
                              //   ),
                              // ),
                              ),
                        ),

                        //button pesan
                        ElevatedButton(
                          onPressed: () {
                            // sessionFormTransaction();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const FormTransaction(),
                              ),
                            );
                          },
                          child: const Text("Pesan Tiket"),
                        ),

                        //tentang wisata
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                          child: Container(
                            child: Text(
                              'Tentang' ' ' + _namaWisata.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            _deskripsi.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF525252),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Image.network("$imgBaseUrl${widget.gambar1}",
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height / 2),
            // Text(widget.namaWisata.toString()),
            // Text(widget.kategori.toString()),
            // Text(widget.lokasi.toString()),
            // Text(widget.hargaTiket.toString()),
            // Text(widget.deskripsi.toString()),
          ],
        ),
      ),
    );
  }
}
