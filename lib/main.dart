import 'package:flutter/material.dart';
import 'package:project/pages/account_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/tickets_page.dart';
import 'package:project/pages/transactions_page.dart';
import 'package:project/theme/color.dart';

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
    const TransactionPage(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
            backgroundColor: Color(0xFF01797D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: "",
            backgroundColor: Color(0xFF01797D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: "",
            backgroundColor: Color(0xFF01797D),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "",
            backgroundColor: Color(0xFF01797D),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
