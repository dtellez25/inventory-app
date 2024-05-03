// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:inventory/qrScanner.dart';
import '../dataTable.dart';

class adminHome extends StatefulWidget {
  const adminHome({super.key});

  @override
  State<adminHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<adminHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    const QRScanner(),
    const dataTable(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food N Stuff"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        selectedItemColor: Colors.white, // Set the icon color to white
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Inventory")
        ],
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
