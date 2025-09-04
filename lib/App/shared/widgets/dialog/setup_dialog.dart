import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

void showCustomDialog() {
  Get.dialog(
    BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.r, sigmaY: 4.r), // blur background
      child: Dialog(
        insetPadding: EdgeInsets.zero, // biar sesuai width custom
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
            width: 314.w,
            height: 406.h,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              gradient: AppGradients.onboarding,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20.h, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Berhasil! Kata Sandi kamu telah diperbarui.",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: 143.w,
                    height: 143.h,
                    child: Image.asset("assets/images/success.png"),
                  ),
                  SizedBox(height: 51.h),
                  MainButton(
                    text: "Kembali ke halaman masuk",
                    width: 230.w,
                    height: 46.h,
                    textSize: 13,
                    onPressed: () => Get.offAllNamed(Routes.LOGIN),
                  )
                ],
              ),
            )),
      ),
    ),
    barrierDismissible: true, // klik luar dialog untuk close
  );
}
