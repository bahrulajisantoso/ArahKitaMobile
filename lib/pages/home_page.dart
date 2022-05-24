import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/api/get_wisata.dart';
import 'package:project/model/wisata.dart';
import 'package:project/pages/detail_wisata.dart';
import 'package:project/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Wisata> _wisatas = [];
  // String? _namaWisata, _kategori, _lokasi, _hargaTiket, _deskrpsi;

  getData() async {
    _wisatas = await GetWisata.getWisatas();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> sessionData() async {
    String namaWisata, kategori, lokasi, hargaTiket, deskripsi;

    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("nama_wisata", _wisatas[_index].namaWisata.toString());
    pref.setString("kategori", _wisatas[_index].kategori.toString());
    pref.setString("lokasi", _wisatas[_index].lokasi.toString());
    pref.setString("harga_tiket", _wisatas[_index].hargaTiket.toString());
    pref.setString("deskripsi", _wisatas[_index].deskripsi.toString());

    namaWisata = pref.getString("nama_wisata").toString();
    kategori = pref.getString("kategori").toString();
    lokasi = pref.getString("lokasi").toString();
    hargaTiket = pref.getString("harga_tiket").toString();
    deskripsi = pref.getString("deskripsi").toString();

    if (namaWisata == "" &&
        kategori == "" &&
        lokasi == "" &&
        hargaTiket == "" &&
        deskripsi == "") {
      throw Exception('Failed to load data');
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailWisata(
            namaWisata: namaWisata,
            kategori: kategori,
            lokasi: lokasi,
            hargaTiket: hargaTiket,
            deskripsi: deskripsi,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            decoration: null,
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            // margin:
                            //     const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              // borderRadius:
                              //     BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Center(
                              child: Text(
                                'text $i',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                  // carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    aspectRatio: 2.0,
                    // initialPage: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              // scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
              ),
              itemCount: _wisatas.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Center(
                          child: FlutterLogo(
                            size: 100,
                          ),
                        ),
                        Text(
                          _wisatas[index].namaWisata.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          _wisatas[index].lokasi.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          _wisatas[index].hargaTiket.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    sessionData();
                    _index = index;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
