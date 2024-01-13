import 'package:effective_mobile_test_tasck/shared/body_number.dart';
import 'package:flutter/material.dart';

class ScreenNumber extends StatelessWidget {
  const ScreenNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Steigenberger Makadi')),
      ),
      body: BodyNumber(),
    );
  }
}
