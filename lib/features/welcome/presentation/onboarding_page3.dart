import 'package:flutter/material.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Janji Kami untuk Pahlawan Pangan Kita' ,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Kami membangun platform ini di atas fondasi Keadilan. Kami berjanji untuk memberikan akses pasar langsung dan menciptakan peluang bagi para petani untuk bertumbuh sejahtera bersama kami.',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 40),

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

      ],
    );
  }
}