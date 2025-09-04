import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/forgot/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class ForgotPasswordEmailPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        useGradient: false,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 123.h),
            SizedBox(
              width: 192.w,
              height: 201.h,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: 44.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kamu lupa kata sandi?",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.r, 0, 20.r, 0),
                      child: Text(
                        "Tidak masalah. Masukkan email Anda yang terdaftar, kami akan kirimkan kode verifikasi untuk mengatur ulang password Anda.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.black,
                        ),
                      )),
                  SizedBox(
                    height: 27.h,
                  ),
                  CustomInputAuth(
                      width: 278.w,
                      height: 46.h,
                      labelText: "Email",
                      controller: controller.emailController),
                  SizedBox(
                    height: 31.h,
                  ),
                  MainButton(
                    text: "Kirim kode verifikasi",
                    onPressed: () {
                      Get.toNamed(
                          Routes.FORGOTPASSWORDVERIFICATION); // API INTEGRATION
                    },
                    width: 294.w,
                    height: 46.h,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
