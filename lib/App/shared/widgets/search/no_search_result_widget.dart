import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class NoSearchResultWidget extends StatelessWidget {
  final String query; // PENCARIAN

  const NoSearchResultWidget({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 240.w,
            height: 161.h,
            child: Image.asset(
              "assets/images/notfound.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Apa yang kamu cari gaada nih',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              textAlign: TextAlign.center,
              'Coba cari lagi yang kamu mau soalnya yang kamu cari tidak ada', // TEXT
              style: TextStyle(fontSize: 13.sp, color: AppColors.black),
            ),
          )
        ],
      ),
    );
  }
}
