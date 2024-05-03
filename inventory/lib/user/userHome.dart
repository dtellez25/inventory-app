import 'package:flutter/material.dart';
import 'package:inventory/qrScanner.dart';

class userHome extends StatefulWidget {
  const userHome({super.key});

  @override
  State<userHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<userHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    const QRScanner(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food N Stuff"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
