import 'package:flutter/material.dart';
import 'package:project/api/login.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/register_page.dart';
import 'package:project/Notification/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _toast = ShowToast();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    LoginUser.loginUser(_emailController.text, _passwordController.text)
        .then((value) {
      if (value.kode == 200) {
        sessionLogin();
        // pref.setBool("is_login", true);
        _toast.showToast(value.pesan);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        _toast.showToast(value.pesan);
      }
    });
  }

  Future sessionLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setBool("is_login", true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset("images/akbaru.png"),
              Row(
                children: const <Widget>[
                  Text("Silahkan Masuk Untuk Melanjutkan"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Masukan email anda",
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  autofocus: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Masukan password anda",
                    prefixIcon: const Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else {
                      return null;
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
                    const Color.fromARGB(255, 1, 121, 125),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
              ),
              Row(
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
                      style: TextStyle(color: Color.fromARGB(255, 0, 10, 255)),
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
