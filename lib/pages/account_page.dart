import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/api/get_user.dart';
// import 'package:project/notification/alert.dart';
import 'package:project/notification/toast.dart';
import 'package:project/pages/edit_user.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? _namaUser, _tglLahir, _noHp, _email;
  // final _alert = ShowAlert();
  final _toast = ShowToast();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idUser = pref.getString("id_user") ?? "";
    GetUser.getUser(idUser).then((value) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _namaUser = value.namaUser;
          _tglLahir = value.tglLahir;
          _noHp = value.noHp;
          _email = value.email;
        });
      }
    });
  }

  _userSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama_user", _namaUser.toString());
    pref.setString("tgl_lahir", _tglLahir.toString());
    pref.setString("no_hp", _noHp.toString());
    pref.setString("email", _email.toString());
  }

  _logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.clear();
    });
    _toast.showToast("Berhasil Logout");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Login(),
      ),
      (route) => false,
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah anda yakin ingin keluar?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Ya"),
              onPressed: () {
                _logOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Warna.colorGrey)),
        title: const Text("Account"),
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
          : Container(
              decoration: BoxDecoration(
                color: Color(int.parse(Warna.colorWhite)),
              ),
              child: Container(
                padding: const EdgeInsetsDirectional.all(30),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Icon(Icons.account_circle,
                            size: 140, color: Color(0xFF00797C)),
                        TextButton(
                          onPressed: () {
                            _userSession();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const EditUserPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Ubah Profile",
                            style: TextStyle(
                                color: Color(0xFF00797C),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Color(0xFFDADADA),
                                ),
                            child: const Text(
                              'Nama',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00797C)),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                          decoration: const BoxDecoration(
                              // color: Color(0xFFDADADA),
                              ),
                          child: Text(
                            '$_namaUser',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF01797D),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Color(0xFFDADADA),
                                ),
                            child: const Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00797C),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                          decoration: const BoxDecoration(
                              // color: Color(0xFFDADADA),
                              ),
                          child: Text(
                            '$_email',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF01797D),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Color(0xFFDADADA),
                                ),
                            child: const Text(
                              'Tanggal Lahir',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00797C),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                          decoration: const BoxDecoration(
                              // color: Color(0xFFDADADA),
                              ),
                          child: Text(
                            '$_tglLahir',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF01797D),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Color(0xFFDADADA),
                                ),
                            child: const Text(
                              'Nomor Handphone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00797C),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 5),
                          decoration: const BoxDecoration(
                              // color: Color(0xFFDADADA),
                              ),
                          child: Text(
                            '$_noHp',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 2,
                          color: Color(0xFF01797D),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _showDialog();
                          },
                          child: const Text(
                            "KELUAR",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 1, 121, 125),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
