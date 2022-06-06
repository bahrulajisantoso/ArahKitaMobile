import 'package:flutter/material.dart';

class DetailTiket extends StatefulWidget {
  const DetailTiket({Key? key}) : super(key: key);

  @override
  State<DetailTiket> createState() => _DetailTiket();
}

class _DetailTiket extends State<DetailTiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Detail Tiket"),
      ),
    );
  }
}
