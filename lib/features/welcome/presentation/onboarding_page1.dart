import 'package:flutter/material.dart';

class OnboardingPage1 extends StatefulWidget {
  static const nameRoute = '/onboardingpage1';
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 152,
              height: 144,
              child: Image.asset('assets/images/logo.png'),
            ),
            const SizedBox(height: 48),

            const Text(
              'Kami Percaya , Makanan Adalah Jembatan!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              'Jembatan antara kerja keras petani dan senyuman di meja makan anda. Selamat Datang di awal dari sebuah rantai pasok yang lebih adil dan segar' ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
