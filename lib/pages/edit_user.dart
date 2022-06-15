import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/api/update_user.dart';
import 'package:project/notification/alert.dart';
// import 'package:project/notification/toast.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/theme/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  String? _idUser, _tglLahir;

  final _formKey = GlobalKey<FormState>();
  final _alert = ShowAlert();

  var _namaController = TextEditingController();
  var _emailController = TextEditingController();
  var _noHpController = TextEditingController();

  _getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idUser = prefs.getString('id_user').toString();
      String namaUser = prefs.getString('nama_user').toString();
      _tglLahir = prefs.getString('tgl_lahir').toString();
      String noHp = prefs.getString('no_hp').toString();
      String email = prefs.getString('email').toString();

      _namaController = TextEditingController(text: namaUser);
      _emailController = TextEditingController(text: email);
      _noHpController = TextEditingController(text: noHp);
    });
  }

  _updateUser() {
    UpdateUser.updateUser(_idUser.toString(), _namaController.text,
            _emailController.text, _noHpController.text, _tglLahir.toString())
        .then((value) {
      setState(() {
        if (value.kode == 1) {
          _alert.coolAlertSucces(value.pesan, context, "OK");
          _logOut();
        } else {
          _alert.coolAlertFail(value.pesan, context, "OK");
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

  _logOut() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("is_login");
      pref.clear();
    });
    await Future.delayed(const Duration(seconds: 3));
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
          content: const Text("Apakah anda yakin ingin mengubah profil?"),
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
                _updateUser();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getUserSession();
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
        title: const Text("Edit Profil"),
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
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            color: Color(int.parse(Warna.colorGrey)),
          ),
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
                    prefixIcon:
                        const Icon(Icons.person, color: Color(0xFF00797C)),
                    labelText: "Nama",
                    labelStyle: TextStyle(
                      color: Color(int.parse(Warna.colorPrimary)),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF00797C),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                    prefixIcon: const Icon(Icons.email_outlined,
                        color: Color(0xFF00797C)),
                    labelText: "Masukkan Email Anda",
                    labelStyle: TextStyle(
                      color: Color(int.parse(Warna.colorPrimary)),
                    ),
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
                        const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _noHpController,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nomor HP Anda",
                    prefixIcon:
                        const Icon(Icons.phone, color: Color(0xFF00797C)),
                    labelText: "Nomor HP",
                    labelStyle: TextStyle(
                      color: Color(int.parse(Warna.colorPrimary)),
                    ),
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
                        const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Data tidak boleh kosong";
                    } else if (!GetUtils.isPhoneNumber(value)) {
                      return "Nomor HP tidak valid";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: TextEditingController(text: _tglLahir),
                  decoration: InputDecoration(
                    hintText: "Masukan Tanggal lahir anda",
                    // prefixIcon: const Icon(Icons.date_range),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.date_range,
                          color: Color(0xFF00797C)),
                      onPressed: () {
                        _tanggal();
                      },
                    ),
                    labelText: "Tanggal lahir",
                    labelStyle: TextStyle(
                      color: Color(int.parse(Warna.colorPrimary)),
                    ),
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
                        const EdgeInsetsDirectional.fromSTEB(16, 5, 0, 5),
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
              ElevatedButton(
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 1, 121, 125),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showDialog();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
