import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  String _kodeTransaksi = "";

  getSessionKodeTransaksi() async {
    final prefs = await SharedPreferences.getInstance();
    final kodeTransaksi = prefs.getString('kode_transaksi') ?? '';
    setState(() {
      _kodeTransaksi = kodeTransaksi;
    });
  }

  _launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+6285851964930',
      text:
          "Saya ingin mengkonfirmasi pembayaran tiket dengan \nkode booking  = $_kodeTransaksi  \nBukti Pembayaran : ",
    );
    await launch('$link');
  }

  @override
  void initState() {
    super.initState();
    getSessionKodeTransaksi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mohon untuk melakuakan pembayaran"),
            Text("id transaksi anda = $_kodeTransaksi"),
            ElevatedButton(
              onPressed: () {
                _launchWhatsApp();
              },
              child: Text("Bayar Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
