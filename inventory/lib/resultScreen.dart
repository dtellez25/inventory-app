
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory/qrScanner.dart';
import 'package:qr_flutter/qr_flutter.dart';


class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen({Key? key, required this.closeScreen, required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              closeScreen();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black87,
            )),
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
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //muestra el codigo Qr escaneado
              QrImageView(
                data: code,
                size: 150,
                version: QrVersions.auto,
              ),


        ),
      ),
    );
  }
}
