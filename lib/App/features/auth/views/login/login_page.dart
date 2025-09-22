import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/section/auth/social_auth_section.dart';
import 'package:sayurinaja/App/features/auth/controller/login/login_controller.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          // Logo di atas
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SizedBox(
                width: 300.w,
                height: 300.h,
                child: Image.asset(
                  'assets/images/transparentlogo_2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Form container di bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "Selamat datang kembali!",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Text(
                        "Senang melihatmu lagi. Yuk, lanjutkan berburu yang segar segar.",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 13.sp, color: AppColors.black),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Email
                    CustomInputAuth(
                      labelText: "Email",
                      controller: controller.emailController,
                      width: 298,
                      height: 66,
                    ),
                    SizedBox(height: 15.h),

                    // Password
                    CustomInputAuth(
                      labelText: "Kata sandi",
                      controller: controller.passwordController,
                      obscureText: true,
                      width: 298,
                      height: 66,
                    ),
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30.w),
                        child: GestureDetector(
                          onTap: () => Get.toNamed(Routes.FORGOTPASSWORDEMAIL),
                          child: Text(
                            "Lupa kata sandi?",
                            style: TextStyle(
                                fontSize: 10.sp, color: AppColors.primary),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Button Masuk
                    Obx(() => MainButton(
                          text: "Masuk",
                          width: 208,
                          height: 42,
                          isLoading: controller.isLoading.value,
                          onPressed: () => controller.login(),
                        )),

                    SizedBox(height: 25.h),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                          child:
                              Divider(color: AppColors.black, thickness: 0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(
                            "Atau masuk dengan",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                              Divider(color: AppColors.black, thickness: 0.5),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    const SocialAuthSection(),

                    SizedBox(height: 31.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum mempunyai akun?",
                          style: TextStyle(
                              color: AppColors.black, fontSize: 13.sp),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.REGISTER);
                          },
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
