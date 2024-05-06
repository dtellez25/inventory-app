// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class ResultScreen extends StatefulWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen({
    Key? key,
    required this.closeScreen,
    required this.code,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int counter = 1; // Default counter value
  late String scannedCode; // Variable to store the scanned code

  @override
  void initState() {
    super.initState();
    scannedCode = widget.code; // Storing the scanned code upon initialization
  }

  void incrementCounter() async {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() async {
    setState(() {
      counter--;
    });
  }

  void delete() async {
    // Change to a POST request with appropriate body or query parameters
    final response = await http.post(
      Uri.parse(
          'http://10.252.176.91:3000/updateData/$scannedCode?quantity=$counter'),
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      print(
          'Failed to delete the item: Status code: ${response.statusCode}, Body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.closeScreen();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: widget.code,
                version: QrVersions.auto,
                size: 150,
              ),
              const SizedBox(height: 20),
              Text(
                'Scanned Code: $scannedCode',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: decrementCounter,
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$counter', style: const TextStyle(fontSize: 18)),
                  IconButton(
                    onPressed: incrementCounter,
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: delete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Background color
                      foregroundColor:
                          Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('Retrieve Items'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
