import 'package:flutter/material.dart';
import 'package:project/api/get_tiket.dart';
import 'package:project/model/tiket.dart';
import 'package:project/pages/detail_tiket.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int _index = 0;
  List<Tiket> _tikets = [];

  Future<void> _sessionDetailTiket() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("nama_wisata", _tikets[_index].namaWisata.toString());
      pref.setString("nama_pembeli", _tikets[_index].namaPembeli.toString());
      pref.setString("jumlah_tiket", _tikets[_index].jumlahTiket.toString());
      pref.setString("total_harga", _tikets[_index].totalHarga.toString());
      pref.setString("kode_tiket", _tikets[_index].kodeTiket.toString());
      pref.setString("tgl_tiket", _tikets[_index].tglTiket.toString());
    });
  }

  _getDataTiket() async {
    String idUser;
    SharedPreferences pref = await SharedPreferences.getInstance();
    idUser = pref.getString("id_user") ?? "";
    _tikets = await GetTiket.getTikets(idUser);
    setState(() {
      _tikets;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataTiket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Warna.colorGrey)),
        title: const Text("Tiket"),
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
      body: _tikets.isEmpty
          ? Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(Warna.colorGrey),
                ),
              ),
              child: Center(
                child: Text("Tidak ada tiket"),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(Warna.colorGrey),
                ),
              ),
              child: ListView.builder(
                  itemCount: _tikets.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'E-tiket',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF525252),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 2,
                                        thickness: 2,
                                        color: Color(0xFF01797D),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Kode Tiket : ' +
                                                  _tikets[index]
                                                      .kodeTiket
                                                      .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF525252),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              _tikets[index]
                                                  .namaWisata
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Jumlah Tiket : ' +
                                                  _tikets[index]
                                                      .jumlahTiket
                                                      .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF525252),
                                                fontSize: 15,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.date_range,
                                                    size: 17,
                                                    color: Color(0xFF525252),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0),
                                                    child: Text(
                                                      _tikets[index]
                                                          .tglTiket
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 13),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Card(
                                          color: Color.fromARGB(
                                              255, 219, 228, 218),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  _tikets[index]
                                                      .status
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color.fromARGB(
                                                        255, 1, 139, 10),
                                                    fontSize: 13,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w600,
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
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          _index = index;
                          _sessionDetailTiket();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailTiket();
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ),
    );
  }
}
