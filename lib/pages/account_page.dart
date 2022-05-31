import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  logOut() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("is_login");
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
              children: const <Widget>[
                Text("nama"),
                Text("username"),
                Text("jenis kelamin"),
                Text("email"),
                Text("no hp"),
                Text("tgl lahir"),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                logOut();
              },
              child: const Text("Keluar"))
        ],
      ),
    );
  }
}
