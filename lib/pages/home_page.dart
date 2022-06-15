import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/api/get_wisata.dart';
import 'package:project/api/global.dart';
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
  final _imgBaseUrl = Url.imageBaseUrl;
  bool _isLoading = true;

  _getData() async {
    _wisatas = await GetWisata.getWisatas();
    if (mounted) {
      setState(() {
        _wisatas;
        _isLoading = false;
      });
    }
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
      pref.setString("gambar_1", _wisatas[_index].gambar2.toString());
      pref.setString("gambar_1", _wisatas[_index].gambar3.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _cekLogin();
    _getData();
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
            preferredSize: const Size.fromHeight(2.0)),
      ),
      body: _isLoading
          ? Center(
              child: SpinKitCircle(
                color: Color(int.parse(Warna.colorPrimary)),
                size: 60.0,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                    // color: Color(int.parse(Warna.colorGrey)),
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                              items: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                        "assets/images/selamatdatang.jpg"),
                                  ),
                                ),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset("assets/images/slide2.png"),
                                  ),
                                ),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child:
                                        Image.asset("assets/images/slide3.png"),
                                  ),
                                ),
                              ],
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 1.0,
                                // aspectRatio: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                        itemCount: _wisatas.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          "$_imgBaseUrl/${_wisatas[index].gambar1}",
                                          width: 200,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context,
                                              child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: SpinKitCircle(
                                                color: Color(int.parse(
                                                    Warna.colorPrimary)),
                                                size: 60.0,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 5, 20, 0),
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 10, 20, 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Rp.' +
                                              _wisatas[index]
                                                  .hargaTiket
                                                  .toString() +
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
                                    return DetailWisata(
                                      gambar1: _wisatas[index].gambar1,
                                      gambar2: _wisatas[index].gambar2,
                                      gambar3: _wisatas[index].gambar3,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
