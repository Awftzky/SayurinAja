import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroductionPage1 extends StatelessWidget {
  const IntroductionPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 600.w,
          height: 211.h,
          child: Image.asset(
            'assets/images/introduction1_logo.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    ));
  }
}
