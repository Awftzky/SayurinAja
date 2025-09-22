import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              SizedBox(
                width: 215.w,
                height: 222.h,
                child: Image.asset(
                  "assets/images/comingsoon.png",
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 30.h),

              // Main title text
              Text(
                "Fitur ini sedang dalam tahap pengembangan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),

              SizedBox(height: 15.h),

              // Subtitle text
              Text(
                "Ditunggu ya karena fitur fitur keren akan datang buat kalian",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
