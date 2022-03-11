import 'package:flutter/material.dart';
import 'package:qr_code/scanner_screen.dart';
import 'package:qr_code/utility.dart';
import 'package:qr_code/widgets.dart/sized_box.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        centerTitle: false,
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'some texts here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBoxLevel2(),
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
              ),
              const SizedBoxLevel1(),
              const Text(
                'username',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBoxLevel1(),
              const Text(
                'Info text here',
                style: textStyleSubtitle,
              ),
              const SizedBoxLevel2(),
              QrImage(
                data: 'Here_is_a_QR_Code',
                size: size.width / 1.5,
                backgroundColor: Colors.white,
              ),
              const SizedBoxLevel2(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey, fixedSize: Size(size.width - 20, 50)),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScannerScreen(),
                      fullscreenDialog: true));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 8),
                      Text('Allow Camera Scan'),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
