import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Page"),
      ),
      body: ListView.builder(
          itemCount: null,
          itemBuilder: (context, index) {
            return ListTile(
              leading: QrImage(
                data: "s322322",
                size: 100,
              ),
              title: Text("Ticket ${index + 1}"),
              onTap: () {
                Null;
              },
            );
          }),
    );
  }
}
