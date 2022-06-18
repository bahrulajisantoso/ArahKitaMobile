import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:project/api/add_transaksi.dart';
import 'package:project/api/get_user.dart';
import 'package:project/api/global.dart';
import 'package:project/notification/toast.dart';
import 'package:project/pages/pembayaran_page.dart';
import 'package:project/theme/color.dart';
import 'package:project/theme/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormTransaction extends StatefulWidget {
  final String? gambar1;
  const FormTransaction({Key? key, this.gambar1}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  String _idWisata = "",
      _namaWisata = "",
      _kategori = "",
      _lokasi = "",
      _hargaTiket = "",
      _kodeTransaksi = "";

  String _idUser = "", _namaUser = "", _noHp = "", _email = "";
  final _imgBaseUrl = Url.imageBaseUrl;
  int _jumlahTiket = 1;
  int _totalHarga = 0;
  String _tglTiket = DateFormat('dd/MM/yyy').format(DateTime.now());
  final _toast = ShowToast();
  bool _isLoading = true;

  Future _sessionTransaksi() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("kode_transaksi", _kodeTransaksi);
      pref.setString("nama_wisata", _namaWisata);
      pref.setString("tgl_tiket", _tglTiket);
      pref.setString("jumlah_tiket", _jumlahTiket.toString());
      pref.setString("total_harga", _totalHarga.toString());
    });
  }

  _getSessionWisata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _namaWisata = pref.getString("nama_wisata").toString();
      _kategori = pref.getString("kategori").toString();
      _lokasi = pref.getString("lokasi").toString();
      _hargaTiket = pref.getString("harga_tiket").toString();

      _totalHarga = int.parse(_hargaTiket.toString());
    });
  }

  _getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idUser = pref.getString("id_user") ?? "";
    String idWisata = pref.getString("id_wisata") ?? "";
    GetUser.getUser(idUser).then((value) {
      if (mounted) {
        setState(() {
          idUser = idUser;
          _idWisata = idWisata;
          _namaUser = value.namaUser;
          _noHp = value.noHp;
          _email = value.email;
          _isLoading = false;
        });
      }
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

  _tanggal() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 30)))
        .then((date) {
      setState(() {
        if (date != null) {
          _tglTiket = DateFormat('dd/MM/yyy').format(date);
        }
      });
    });
  }

  _transaksi() {
    final String _createdAt = (DateTime.now().toString());
    AddTransaksi.createTransaksi(_idUser, _idWisata, _kodeTiket(), _tglTiket,
            "$_jumlahTiket", "$_totalHarga", _createdAt)
        .then((value) {
      setState(() {
        if (value.kode == 201) {
          _kodeTransaksi = value.kodeTransaksi;
          _sessionTransaksi();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const PembayaranPage(),
            ),
          );
        } else {
          _toast.showToast(value.pesan);
        }
      });
    });
  }

  _kodeTiket() {
    String kode = _idWisata;
    for (int i = 0; i < 6; i++) {
      kode += Random().nextInt(9).toString();
    }
    return kode;
  }

  @override
  void initState() {
    super.initState();
    _getSessionWisata();
    _getUser();
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
        title: const Text("Transaksi"),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color(int.parse(Warna.colorPrimary)),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Color(int.parse(Warna.colorPrimary)),
              height: 2.0,
            ),
            preferredSize: const Size.fromHeight(2.0)),
      ),
      body: _isLoading
          ? const Loading()
          : SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(int.parse(Warna.colorGrey)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //data wisata
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Container(
                          child: const Text(
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
                        decoration: const BoxDecoration(),
                        child: Padding(
                          // padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 10, 30, 0),
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
                                Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          "$_imgBaseUrl${widget.gambar1}"),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          "$_namaWisata",
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "$_kategori",
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF525252),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "$_lokasi",
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF525252),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                        child: Container(
                          child: const Text(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 10, 30, 0),
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
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 2, 0, 0),
                                          child: Container(
                                            width: 300,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: const Text(
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
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '$_namaUser',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 2, 0, 0),
                                          child: Container(
                                            width: 300,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: const Text(
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
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '$_email',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 2, 0, 0),
                                          child: Container(
                                            width: 300,
                                            height: 20,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: const Text(
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
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '$_noHp',
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            30, 20, 20, 10),
                        child: Container(
                          child: const Text(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 30, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.date_range,
                                      color: Color(0xFF01797D),
                                    ),
                                    onPressed: () {
                                      _tanggal();
                                    },
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Text(
                                      _tglTiket,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //detail tiket
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 20, 20, 0),
                        child: Container(
                          child: const Text(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20, 5, 0, 0),
                                child: Container(
                                  child: const Text(
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    120, 0, 0, 0),
                                child: Container(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      IconButton(
                                        onPressed: () {
                                          if (_jumlahTiket == 1) {
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 10, 20, 0),
                        child: Container(
                          child: const Text(
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 10, 30, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 0, 0),
                                  child: Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            '$_namaWisata'
                                            ' '
                                            'x'
                                            ' '
                                            '$_jumlahTiket',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            'Rp.' '$_hargaTiket' ',-',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
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
                                const Divider(
                                  height: 2,
                                  thickness: 2,
                                  color: Color(0xFFDADADA),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 0, 0),
                                  child: Container(
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: const Text(
                                            'Total Harga',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            'Rp.' '$_totalHarga' ',-',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
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
                          child: SizedBox(
                            height: 50.0,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 1, 121, 125),
                                ),
                              ),
                              onPressed: () {
                                _transaksi();
                              },
                              child: const Text(
                                "Lanjut ke pembayaran",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
