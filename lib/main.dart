import 'package:flutter/material.dart';
import 'package:project/pages/account_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/tickets_page.dart';
import 'package:project/theme/color.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Main(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  final screens = [
    const HomePage(),
    const TicketPage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        color: Color(int.parse(Warna.colorPrimary)),
        backgroundColor: Color(int.parse(Warna.colorWhite)),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Color(int.parse(Warna.colorWhite))),
          Icon(Icons.airplane_ticket,
              size: 30, color: Color(int.parse(Warna.colorWhite))),
          Icon(Icons.account_circle,
              size: 30, color: Color(int.parse(Warna.colorWhite))),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
