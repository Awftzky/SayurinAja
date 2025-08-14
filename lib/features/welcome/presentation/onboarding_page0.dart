import 'package:flutter/material.dart';

class OnboardingPage0 extends StatelessWidget {
  const OnboardingPage0({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 152,
          height: 144,
          child: Image.asset('assets/images/logo.png'),
        ),
        const SizedBox(height: 48),
        const Text(
          'Selamat Datang',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Kesegaran dimulai disini!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}