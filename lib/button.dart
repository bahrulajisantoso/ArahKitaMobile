import 'package:flutter/material.dart';

class Button {
  button(String text) {
    ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: null,
    );
  }
}
