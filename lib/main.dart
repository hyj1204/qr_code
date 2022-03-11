import 'package:flutter/material.dart';
import 'package:qr_code/qr_code_screen.dart';
import 'package:qr_code/scanner_screen.dart';
import 'package:qr_code/utility.dart';
import 'package:qr_code/widgets.dart/sized_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey, fixedSize: Size(size.width - 40, 50)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const QRCodeScreen()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.qr_code),
                    SizedBox(width: 8),
                    Text('Show QR code'),
                  ]),
            ),
            const SizedBoxLevel2(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey, fixedSize: Size(size.width - 40, 50)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScannerScreen()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.qr_code_scanner_outlined),
                    SizedBox(width: 8),
                    Text(
                      'Scan QR code',
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
