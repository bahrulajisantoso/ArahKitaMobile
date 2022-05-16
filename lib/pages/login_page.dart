import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/pages/register_page.dart';
import 'package:project/Notification/toast.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final toast = ShowToast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Silahkan Masuk Untuk Melanjutkan'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan email anda",
                    labelText: "Email",

                    // icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan password anda",
                    labelText: "Password",
                    // icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                  },
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "MASUK",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 1, 121, 125),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Main(),
                      ),
                    );
                    toast.showToast('Login berhasil');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Belum punya akun?'),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Register(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
