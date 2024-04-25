import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 1) {
        // Ensures the counter doesn't go below 1
        counter--;
      }
    });
  }

  void delete() {
    // Add your delete logic here
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
                'Scanned Code: ${widget.code}',
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
                  const SizedBox(
                      width: 40), // Spacing between counter and delete button
                  ElevatedButton(
                    onPressed: delete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Background color
                      foregroundColor:
                          Colors.white, // Text Color (Foreground color)
                    ),
                    child: const Text('items retrieved'),
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
