import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class FakeSearchBar extends StatelessWidget {
  final VoidCallback onTap;
  final String hintText;
  final double? height;
  final double? width;

  const FakeSearchBar({
    super.key,
    required this.onTap,
    this.hintText = "Cari...", // DEFAULT
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: height ?? 48,
        width: width ?? double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.black),
            const SizedBox(width: 8),
            Text(
              hintText,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
