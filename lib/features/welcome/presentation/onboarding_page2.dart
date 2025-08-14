import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

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
        const SizedBox(height: 25),

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 117,
            height: 105,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const SizedBox(height: 25),

        const Text(
          'Janji Kami untuk Dapur Anda!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Sebagai pengguna awal, inilah komitmen kami untuk Anda: Kesegaran tanpa kompromi, Kemudahan yang menghemat waktu Anda, dan Kepercayaan penuh dalam setiap transaksi.',
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