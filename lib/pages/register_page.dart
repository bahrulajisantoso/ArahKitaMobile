import 'package:flutter/material.dart';
import 'package:project/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan username anda",
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username",
                    // icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
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
                    hintText: "Masukan email anda",
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    // icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
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
                    hintText: "Masukan no hp anda",
                    prefixIcon: Icon(Icons.phone),
                    labelText: "No hp",
                    // icon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
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
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    // icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Masukan konfirmasi password anda",
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Konfirmasi password",
                    // icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Konfirmasi password tidak boleh kosong";
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text("Submit", style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Data sudah di submit"),
                      ),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: <Widget>[
                    const Text('Sudah punya akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Builder(
                          builder: (context) => const Login(),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
