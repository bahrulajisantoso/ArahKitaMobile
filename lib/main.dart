import 'package:flutter/material.dart';
import 'package:project/pages/account_page.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/tickets_page.dart';
import 'package:project/pages/transactions_page.dart';

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
            label: "Home",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.compare_arrows),
              label: "Transactions",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: "Ticket",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Account",
              backgroundColor: Colors.red),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
