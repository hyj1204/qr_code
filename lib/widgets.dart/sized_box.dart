import 'package:flutter/material.dart';

class SizedBoxLevel1 extends StatelessWidget {
  const SizedBoxLevel1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class SizedBoxLevel2 extends StatelessWidget {
  const SizedBoxLevel2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
    );
  }
}
