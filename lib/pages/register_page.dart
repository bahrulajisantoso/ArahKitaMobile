import 'package:flutter/material.dart';
import 'package:project/api/add_user.dart';
import 'package:project/notification/toast.dart';
import 'package:project/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _toast = ShowToast();

  final _namaController = TextEditingController();
  final _usernameController = TextEditingController();
  final _jenisKelController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmPasswordController = TextEditingController();

  void _addUser() async {
    AddUser.createUser(
      _namaController.text.trim().toLowerCase(),
      _usernameController.text.trim().toLowerCase(),
      _jenisKelController.text.trim().toLowerCase(),
      _emailController.text.trim().toLowerCase(),
      _noHpController.text.trim().toLowerCase(),
      _tglLahirController.text.trim().toLowerCase(),
      _passwordController.text.trim(),
    ).then((value) {
      // print(value);
      setState(() {
        if (value.kode == 1) {
          _toast.showToast(value.pesan);
          Navigator.pop(context);
        } else {
          _toast.showToast(value.pesan);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: "Masukan Nama Anda",
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Nama",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _usernameController,
                      decoration: InputDecoration(
                        hintText: "Masukan Username Anda",
                        prefixIcon: const Icon(Icons.account_circle),
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _jenisKelController,
                      decoration: InputDecoration(
                        hintText: "Masukan jenis kelamin Anda",
                        prefixIcon:
                            const Icon(Icons.supervisor_account_rounded),
                        labelText: "Jenis kelamin",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: "Masukkan Email Anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _noHpController,
                      decoration: InputDecoration(
                        hintText: "Masukkan Nomor HP Anda",
                        prefixIcon: const Icon(Icons.phone),
                        labelText: "Nomor HP",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _tglLahirController,
                      decoration: InputDecoration(
                        hintText: "Masukan Tanggal lahir anda",
                        prefixIcon: const Icon(Icons.date_range),
                        labelText: "Tanggal lahir",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Minimal 8 karakter",
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        } else if (value.length < 8) {
                          return "Password minimal 8 karakter";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _konfirmPasswordController,
                      decoration: InputDecoration(
                        hintText: "Masukan Password Anda",
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Konfirmasi Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        } else if (_passwordController.text !=
                            _konfirmPasswordController.text) {
                          return "Password tidak sama";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 1, 121, 125),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _addUser();
                        // Navigator.pop(
                        //   context,
                        //   Builder(
                        //     builder: (context) => const Login(),
                        //   ),
                        // );
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Sudah punya akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(
                            Builder(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                        child: const Text(
                          "Login",
                          style:
                              TextStyle(color: Color.fromARGB(255, 0, 10, 255)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
