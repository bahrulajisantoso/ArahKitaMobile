import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/api/get_wisata.dart';
import 'package:project/model/wisata.dart';
import 'package:project/pages/detail_wisata_page.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  List<Wisata> _wisatas = [];
  final imgBaseUrl = "http://10.0.2.2/flutter/img/";

  @override
  void initState() {
    super.initState();
    _cekLogin();
    _getData();
  }

  _getData() async {
    _wisatas = await GetWisata.getWisatas();
    setState(() {
      _wisatas;
    });
  }

  _cekLogin() async {
    String idUser;
    bool isLogin;
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool("is_login") ?? false;
    idUser = pref.getString("id_user") ?? "";
    setState(() {
      if (isLogin == false) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) {
            return const Login();
          }),
        );
      } else {
        Navigator.of(context);
      }
    });
  }

  Future<void> sessionDetailWisata() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("id_wisata", _wisatas[_index].id.toString());
      pref.setString("nama_wisata", _wisatas[_index].namaWisata.toString());
      pref.setString("kategori", _wisatas[_index].kategori.toString());
      pref.setString("lokasi", _wisatas[_index].lokasi.toString());
      pref.setString("harga_tiket", _wisatas[_index].hargaTiket.toString());
      pref.setString("deskripsi", _wisatas[_index].deskripsi.toString());
      pref.setString("gambar_1", _wisatas[_index].gambar1.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Warna.colorGrey)),
        title: const Text("Dashboard"),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Center(
                                child: Text(
                                  "text $i",
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      // carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        aspectRatio: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  // scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: _wisatas.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "$imgBaseUrl/${_wisatas[index].gambar1}",
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                              child: Column(
                                children: [
                                  Text(
                                    _wisatas[index].namaWisata.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Column(
                                children: [
                                  Text(
                                    _wisatas[index].kategori.toString(),
                                    style: const TextStyle(
                                        color: Color(0xFF525252),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                              child: Column(
                                children: [
                                  Text(
                                    'Rp.' +
                                        _wisatas[index].hargaTiket.toString() +
                                        ',-',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF525252),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        sessionDetailWisata();
                        _index = index;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailWisata();
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
