import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code/utility.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: false,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          _buildQrView(context, size),
          Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  barcode != null ? '${barcode!.code}' : 'Scan a code',
                  maxLines: 3,
                  style: const TextStyle(fontSize: 30),
                ),
              )),
          Positioned(
              top: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        },
                        icon: FutureBuilder<bool?>(
                          initialData: false,
                          future: controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Icon(snapshot.data!
                                  ? Icons.flash_on
                                  : Icons.flash_off);
                            } else {
                              return Container();
                            }
                          },
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context, Size size) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: size.width * 0.8,
          borderLength: 20,
          borderWidth: 10,
          borderColor: Colors.black));

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
