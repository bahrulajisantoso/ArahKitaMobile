import 'package:flutter/material.dart';
import 'package:project/api/login.dart';
import 'package:project/main.dart';
import 'package:project/pages/register_page.dart';
import 'dart:async';
import 'package:project/Notification/toast.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _toast = ShowToast();
  // final _alert = ShowAlert();
  String _idUser = "";
  String _namaUser = "";
  bool _visiblePass = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    LoginUser.loginUser(_emailController.text, _passwordController.text)
        .then((value) {
      if (value.kode == 200) {
        _idUser = value.id.toString();
        _namaUser = value.nama.toString();
        _sessionLogin();
        _toast.showToast(value.pesan);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Main(),
          ),
        );
      } else {
        _toast.showToast(value.pesan);
      }
    });
  }

  Future _sessionLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("id_user", _idUser);
      pref.setString("nama_user", _namaUser);
      pref.setBool("is_login", true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDADADA),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 440,
                  height: 400,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.rectangle),
                  child: Image.asset(
                    'assets/images/1.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 40000,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDADADA),
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 3,
                  indent: 30,
                  endIndent: 30,
                  color: Color(0xFF00797C),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFDADADA),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Text(
                              'Silahkan masuk untuk melanjutkan',
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color:
                                          Color(int.parse(Warna.colorPrimary)),
                                    ),
                                    hintText: 'example@gmail.com',
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00797C),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00797C),
                                        width: 2,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 5, 0, 5),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Data tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _visiblePass,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _visiblePass = !_visiblePass;
                                        });
                                      },
                                      child: _visiblePass
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: Color(
                                                int.parse(Warna.colorPrimary),
                                              ),
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: Color(
                                                int.parse(Warna.colorPrimary),
                                              ),
                                            ),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color:
                                          Color(int.parse(Warna.colorPrimary)),
                                    ),
                                    hintText: 'Masukan password',
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00797C),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00797C),
                                        width: 2,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16, 5, 0, 5),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Data tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ElevatedButton(
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromARGB(255, 1, 121, 125),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _login();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text("Belum punya akun?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const Register(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 10, 255)),
                                ),
                              ),
                            ],
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
    );
  }
}
