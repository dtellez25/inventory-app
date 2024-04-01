import 'package:flutter/material.dart';
import 'package:inventory/qrScannerOverlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:inventory/resultScreen.dart';

const bgColor = Color(0xfffafafa);

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  MobileScannerController controller = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
              });
              controller.toggleTorch();
            },
            icon: Icon(
              Icons.flash_on,
              color: isFlashOn ? Colors.blue : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFrontCamera = !isFrontCamera;
              });
              controller.switchCamera();
            },
            icon: Icon(
              Icons.camera_front,
              color: isFrontCamera ? Colors.blue : Colors.grey,
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.black87),
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
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coloque el codigo QR en el area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.3,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "El escaneo iniciara automaticamente",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  MobileScanner(
                    controller:
                        controller, // Utiliza el controlador de MobileScannerController
                    allowDuplicates:
                        true, // Permite escanear el mismo código QR múltiples veces
                    onDetect: (barcode, args) async {
                      // Cuando se detecta un código QR, se ejecuta esta función de devolución de llamada

                      if (!isScanCompleted) {
                        // Verifica si el escaneo ya se ha completado
                        String code = barcode.rawValue ??
                            '---'; // Obtiene el valor del código QR escaneado

                        isScanCompleted = true;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              closeScreen: closeScreen,
                              code: code,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColour: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Desarrollado por JuegaOK",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
