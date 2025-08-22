import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
        SizedBox(height: 28.h),
        const Text(
          'Kami membangun platform ini di atas fondasi Keadilan. Kami berjanji untuk memberikan akses pasar langsung dan menciptakan peluang bagi para petani untuk bertumbuh sejahtera bersama kami.',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 54.h),

        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 117.w,
            height: 105.h,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
       SizedBox(height: 38.h),

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 117.w,
            height: 105.h,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],
    );
  }
}