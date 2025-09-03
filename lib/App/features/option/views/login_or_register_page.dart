import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_button.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:get/get.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            24.w, 0, 24.w, 90.h), // kiri, atas, kanan, bawah
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.asset("assets/images/basket.png"),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Image.asset("assets/images/leaf.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Text(
                "Anda Sudah Hampir Sampai!",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28.h),
              Text(
                "Ciptakan akun untuk mulai mengisi keranjang Anda, atau masuk untuk melanjutkan petualangan rasa Anda.",
                style: TextStyle(fontSize: 13.sp, color: AppColors.lightGray),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              OnboardingIndicatorButton(
                text: "Ayo Kita Mulai",
                textSize: 16,
                onPressed: () => Get.toNamed(Routes.REGISTER),
              ),
              SizedBox(height: 34.h),
              Text(
                "Sudah menjadi bagian dari komunitas kami?",
                style: TextStyle(fontSize: 13.sp, color: AppColors.white),
              ),
              SizedBox(height: 5.h),
              TextButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text(
                  "Masuk disini",
                  style: TextStyle(fontSize: 13.sp, color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
