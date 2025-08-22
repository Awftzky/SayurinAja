import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
            width: 83.w, /// TANYAKAN KOK NDA SINKRON DENGAN PAGE SEBELUMNYA
            height: 85.h,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        SizedBox(height: 80.h),
        const Text(
          'Jadilah Bagian dari Pertumbuhan Kami',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 25.h),
        const Text(
          'Anda adalah salah satu orang pertama yang kami undang. Setiap pesanan dan masukan dari Anda akan sangat berarti untuk membantu kami membangun ekosistem ini bersama. Siap memulai perjalanan ini?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 81.h),

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 83.w,
            height: 85.h, /// TANYAKAN KOK NDA SINKRON DENGAN PAGE SEBELUMNYA
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],
    );
  }
}