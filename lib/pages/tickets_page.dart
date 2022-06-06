import 'package:flutter/material.dart';
import 'package:project/api/get_tiket.dart';
import 'package:project/model/tiket.dart';
import 'package:project/pages/detail_tiket.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int _index = 0;
  List<Tiket> _tikets = [];

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
        title: const Text("Ticket Page"),
      ),
      body: ListView.builder(
          itemCount: _tikets.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      QrImage(
                        data: _tikets[index].idTiket,
                        version: QrVersions.auto,
                        size: 100.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _tikets[index].namaWisata.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                            Text(
                              _tikets[index].namaPembeli.toString(),
                              style: const TextStyle(fontSize: 20),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailTiket();
                    },
                  ),
                );
              },
            );
          }),
    );
  }
}
