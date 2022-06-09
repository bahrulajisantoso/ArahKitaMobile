import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/api/add_user.dart';
import 'package:project/notification/toast.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/theme/color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _toast = ShowToast();

  final _namaController = TextEditingController();
  // final _jenisKelController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _tglLahirController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmPasswordController = TextEditingController();
  String? _tglLahir;

  void _addUser() async {
    AddUser.createUser(
      _namaController.text.trim().toLowerCase(),
      // _jenisKelController.text.trim().toLowerCase(),
      _emailController.text.trim().toLowerCase(),
      _noHpController.text.trim().toLowerCase(),
      _tglLahir,
      _passwordController.text.trim(),
    ).then((value) {
      // print(value);
      setState(() {
        if (value.kode == 201) {
          _toast.showToast(value.pesan);
          Navigator.pop(context);
        } else {
          _toast.showToast(value.pesan);
        }
      });
    });
  }

  _tanggal() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: "Pilih Tanggal Lahir",
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    ).then((date) {
      setState(() {
        if (date != null) {
          _tglLahir = DateFormat('dd/MM/yyy').format(date);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: (IconThemeData(
          color: Color(int.parse(Warna.colorPrimary)),
          size: 30,
        )),
        backgroundColor: Color(int.parse(Warna.colorGrey)),
        title: const Text("Register"),
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
            preferredSize: Size.fromHeight(2.0)),
      ),
      backgroundColor: Color(0xFFDADADA),
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _namaController,
                      decoration: InputDecoration(
                        hintText: "Masukan nama anda",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF00797C),
                        ),
                        labelText: "Nama",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  //   child: TextFormField(
                  //     controller: _jenisKelController,
                  //     decoration: InputDecoration(
                  //       hintText: "Masukan jenis kelamin Anda",
                  //       prefixIcon: const Icon(Icons.supervisor_account_rounded,
                  //           color: Color(0xFF00797C)),
                  //       labelText: "Jenis kelamin",
                  //       labelStyle: TextStyle(
                  //         color: Color(int.parse(Warna.colorPrimary)),
                  //       ),
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: Color(0xFF00797C),
                  //           width: 2,
                  //         ),
                  //       ),
                  //       focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: Color(0xFF00797C),
                  //           width: 2,
                  //         ),
                  //       ),
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //       contentPadding:
                  //           EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
                  //     ),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Data tidak boleh kosong";
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Masukan email anda",
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Color(0xFF00797C)),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        } else if (!GetUtils.isEmail(value)) {
                          return "Email tidak valid";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _noHpController,
                      decoration: InputDecoration(
                        hintText: "Masukkan nomor hp anda",
                        prefix: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text("+62"),
                        ),
                        prefixIcon:
                            const Icon(Icons.phone, color: Color(0xFF00797C)),
                        labelText: "Nomor hp",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Data tidak boleh kosong";
                        } else if (!GetUtils.isPhoneNumber(value)) {
                          return "Nomor hp tidak valid";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      controller: _tglLahir == null
                          ? _tglLahirController
                          : TextEditingController(text: _tglLahir),
                      decoration: InputDecoration(
                        hintText: "Pilih tanggal lahir anda",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        // prefixIcon: const Icon(Icons.date_range),
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.date_range,
                              color: Color(0xFF00797C)),
                          onPressed: () {
                            _tanggal();
                          },
                        ),
                        labelText: "Tanggal lahir",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Minimal 8 karakter",
                        prefixIcon:
                            const Icon(Icons.lock, color: Color(0xFF00797C)),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: _konfirmPasswordController,
                      decoration: InputDecoration(
                        hintText: "Konfirmasi password",
                        labelStyle: TextStyle(
                          color: Color(int.parse(Warna.colorPrimary)),
                        ),
                        prefixIcon:
                            const Icon(Icons.lock, color: Color(0xFF00797C)),
                        labelText: "Konfirmasi password",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF00797C),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF00797C),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addUser();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
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
    );
  }
}
