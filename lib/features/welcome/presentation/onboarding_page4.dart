import 'package:flutter/material.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 117,
            height: 105,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 48),
        const Text(
          'Jadilah Bagian dari Pertumbuhan Kami',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Anda adalah salah satu orang pertama yang kami undang. Setiap pesanan dan masukan dari Anda akan sangat berarti untuk membantu kami membangun ekosistem ini bersama. Siap memulai perjalanan ini?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 48),

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 117,
            height: 105,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],
    );
  }
}