import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/forgot/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';


class ForgotPasswordSetupPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        useGradient: false,
        appBar: AppBar(backgroundColor: AppColors.transparent,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 123.h),
            SizedBox(
              width: 196.w,
              height: 191.h,
              child: Image.asset(""),
            ),
            SizedBox(height: 10.h),


            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Atur Kata Sandi baru kamu",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h,),

                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "Pastikan Kata Sandi baru Anda kuat dan mudah diingat.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.black,
                        ),
                      )
                  ),
                  SizedBox(height: 14.h,),

                  CustomInputAuth(
                      width: 278,
                      height: 46,
                      labelText: "Kata sandi baru",
                      controller: controller.newPasswordController),
                  SizedBox(height: 13.h,),

                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text(
                        "( ) Minimal 8 karakter",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.black,
                        ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      "( ) Gunakan kombinasi huruf dan angka",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),

                  CustomInputAuth(
                      width: 278,
                      height: 46,
                      labelText: "Konfirmasi kata sandi baru",
                      controller: controller.confirmPasswordController),
                  SizedBox(height: 31.h,),


                  MainButton(
                    text: "Simpan kata sandi Baru ",
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGIN); // API INTEGRATION & MEMANGGIL SCAFFOLD MASSANGER
                    },
                    width: 324,
                    height: 46,
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
