import 'package:flutter/material.dart';

class PamtechLogo extends StatelessWidget {
  const PamtechLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pamtech_logo.png',
      height: 120,
      fit: BoxFit.contain,
    );
  }
}
