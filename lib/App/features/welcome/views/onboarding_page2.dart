import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            width: 117.w,
            height: 105.h,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        SizedBox(height: 41.h),

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 117.w,
            height: 105.h,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        SizedBox(height: 71.h),

        const Text(
          'Janji Kami untuk Dapur Anda!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 17.h),
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