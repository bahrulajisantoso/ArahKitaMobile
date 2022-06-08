import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/api/update_user.dart';
import 'package:project/notification/toast.dart';
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
  final _toast = ShowToast();

  var _namaController = TextEditingController();
  var _jenisKelController = TextEditingController();
  var _emailController = TextEditingController();
  var _noHpController = TextEditingController();

  getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _idUser = prefs.getString('id_user').toString();
      String namaUser = prefs.getString('nama_user').toString();
      String jenisKelamin = prefs.getString('jenis_kelamin').toString();
      _tglLahir = prefs.getString('tgl_lahir').toString();
      String noHp = prefs.getString('no_hp').toString();
      String email = prefs.getString('email').toString();

      _namaController = TextEditingController(text: namaUser);
      _emailController = TextEditingController(text: email);
      _noHpController = TextEditingController(text: noHp);
      _jenisKelController = TextEditingController(text: jenisKelamin);
    });
  }

  _updateUser() {
    UpdateUser.updateUser(
            _idUser.toString(),
            _namaController.text,
            _jenisKelController.text,
            _emailController.text,
            _noHpController.text,
            _tglLahir.toString())
        .then((value) {
      setState(() {
        if (value.kode == 1) {
          _toast.showToast(value.pesan);
          _logOut();
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
    getUserSession();
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
            preferredSize: Size.fromHeight(2.0)),
      ),
      body: Form(
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
                    prefixIcon: const Icon(Icons.supervisor_account_rounded),
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
                    prefixIcon: const Icon(Icons.phone),
                    labelText: "Nomor HP",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
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
                      icon: const Icon(
                        Icons.date_range,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        _tanggal();
                      },
                    ),
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
