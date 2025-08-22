import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage0 extends StatelessWidget {
  const OnboardingPage0({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 152.w,
          height: 144.h,
          child: Image.asset('assets/images/logo.png'),
        ),
        SizedBox(height: 80.h),
        const Text(
          'Selamat Datang',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
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