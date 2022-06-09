import 'package:flutter/material.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String _kodeTransaksi = "",
      _namaWisata = "",
      _tglTiket = "",
      _jumlahTiket = "",
      _totalHarga = "";

  getSessionTransaksi() async {
    final prefs = await SharedPreferences.getInstance();
    final kodeTransaksi = prefs.getString('kode_transaksi') ?? '';
    final namaWisata = prefs.getString('nama_wisata') ?? '';
    final tglTiket = prefs.getString('tgl_tiket') ?? '';
    final jumlahTiket = prefs.getString('jumlah_tiket') ?? '';
    final totalHarga = prefs.getString('total_harga') ?? '';
    setState(() {
      _kodeTransaksi = kodeTransaksi;
      _namaWisata = namaWisata;
      _tglTiket = tglTiket;
      _jumlahTiket = jumlahTiket;
      _totalHarga = totalHarga;
    });
  }

  _launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+6285755292978',
      text:
          "Saya ingin mengkonfirmasi pembayaran tiket dengan \nkode booking  = $_kodeTransaksi  \nBukti Pembayaran : ",
    );
    await launch('$link');
  }

  @override
  void initState() {
    super.initState();
    getSessionTransaksi();
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
        title: const Text("Pembayaran"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(int.parse(Warna.colorPrimary)),
        ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(int.parse(Warna.colorPrimary)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Center(
                        child: Text(
                          _namaWisata + ' x ' + _jumlahTiket,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Center(
                        child: Text(
                          _tglTiket,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Container(
                                width: 350,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0x0FFFFFFF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Text(
                                        'Silahkan melakukan transfer ke :',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: ClipRect(
                                      child: Image.asset(
                                        "assets/images/bri.png",
                                        height: 20,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(47, 5, 47, 0),
                              child: Container(
                                width: 350,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        '2531-2345-9875-08',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 5),
                                    child: Text(
                                      'Jumlah Bayar :',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(47, 0, 47, 0),
                              child: Container(
                                width: 350,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: Text(
                                        'Rp. $_totalHarga,-',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 20, 10, 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 250, 221, 2),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  // padding: EdgeInsetsDirectional.fromSTEB(
                                  //     0, 0, 0, 0),
                                  padding: EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Text(
                                          // 'Jika sudah melakukan transfer sesuai total harga, silahkan\nmelakukan konfirmasi ke admin dengan klik tombol\n\"Hubungi Admin\" dan menunggu validasi dari admin paling lambat 1 jam setelah mengirim bukti transfer.',
                                          'PENTING!',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          // 'Jika sudah melakukan transfer sesuai total harga, silahkan\nmelakukan konfirmasi ke admin dengan klik tombol\n\"Hubungi Admin\" dan menunggu validasi dari admin paling lambat 1 jam setelah mengirim bukti transfer.',
                                          ' Mohon transfer sesuai dengan jumlah yang tertera',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //button hubungi

                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Sudah Menyelesaikan Transaksi ?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 5, 10, 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(int.parse(Warna.colorGrey)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  // padding: EdgeInsetsDirectional.fromSTEB(
                                  //     0, 0, 0, 0),
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Klik Hubungi Admin untuk konfirmasi Pembayaran \n\Setelah Pembayaran Anda dikonfirmasi, Kami akan mencetak\n\e-tiket Anda ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          _launchWhatsApp();
                                        },
                                        child: Text("Hubungi Admin"),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 1, 121, 125),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
