import 'package:flutter/material.dart';
import 'package:inventory/qrScanner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int currentIndex = 0;

  List<Widget> screens = [
    const QRScanner(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food & Stuff"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
