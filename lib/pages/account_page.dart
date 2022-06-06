import 'package:flutter/material.dart';
import 'package:project/api/get_user.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? _namaUser, _username, _jenisKelamin, _tglLahir, _noHp, _email;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String idUser = pref.getString("id_user") ?? "";
    GetUser.getUser(idUser).then((value) {
      setState(() {
        _namaUser = value.namaUser;
        // _username = value.username;
        _jenisKelamin = value.jenisKelamin;
        _tglLahir = value.tglLahir;
        _noHp = value.noHp;
        _email = value.email;
      });
    });
  }

  _logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.clear();
    });

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const Login(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(Warna.colorGrey)),
        ),
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.account_circle,
                      size: 50, color: Theme.of(context).primaryColor),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                      child: Text(
                        'Nama',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF525252)),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Text(
                      '$_namaUser',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xFF01797D),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Text(
                      '$_email',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xFF01797D),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                      child: Text(
                        'Jenis Kelamin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Text(
                      '$_jenisKelamin',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xFF01797D),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                      child: Text(
                        'Tanggal Lahir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Text(
                      '$_tglLahir',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xFF01797D),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                      ),
                      child: Text(
                        'Nomor Handphone',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF525252),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Text(
                      '$_noHp',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Color(0xFF01797D),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       Text("nama: $_namaUser"),
              //       // Text("username: $_username"),
              //       Text("jenis kelamin: $_jenisKelamin"),
              //       Text("email: $_email"),
              //       Text("no hp: $_noHp"),
              //       Text("tanggal lahir: $_tglLahir"),
              //     ],
              //   ),
              // ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _logOut();
                  },
                  child: const Text("Keluar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
