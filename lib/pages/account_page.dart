import 'package:flutter/material.dart';
import 'package:project/api/get_user.dart';
import 'package:project/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _namaUser = "",
      _username = "",
      _jenisKelamin = "",
      _tglLahir = "",
      _noHp = "",
      _email = "";

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
        _username = value.username;
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
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.account_circle,
                  size: 150, color: Theme.of(context).primaryColor),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("nama: $_namaUser"),
                Text("username: $_username"),
                Text("jenis kelamin: $_jenisKelamin"),
                Text("email: $_email"),
                Text("no hp: $_noHp"),
                Text("tanggal lahir: $_tglLahir"),
              ],
            ),
          ),
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
    );
  }
}
