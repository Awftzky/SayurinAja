import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart'; // Pastikan path import benar

class ChangeLocationButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ChangeLocationButton({
    super.key,
    this.text = "Ganti Lokasi", // Nilai default jika tidak diisi
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
