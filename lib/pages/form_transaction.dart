import 'package:flutter/material.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({Key? key}) : super(key: key);

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Transaction'),
      ),
      body: const Center(
        child: Text('Form Transaction'),
      ),
    );
  }
}
