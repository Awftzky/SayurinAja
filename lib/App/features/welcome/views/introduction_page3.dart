import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionPage3 extends StatelessWidget {
  const IntroductionPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 300.w,
          height: 76.h,
          child: Image.asset(
            'assets/images/introduction3_logo.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 73.h,
        )
      ],
    ));
  }
}
