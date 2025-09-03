import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/register/register_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/section/auth/social_auth_section.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
      ),
      body: Center(
        child: Container(
          width: 352.w,
          height: 634.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Satu langkah lagi menuju kesegaran',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                    )),
                SizedBox(height: 10.h),
                Padding(
                    padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Buat akunmu dan mulai dukung petani lokal hari ini.',
                      style: TextStyle(fontSize: 13.sp, color: AppColors.black),
                    )),

                SizedBox(height: 23.h),

                /// USERNAME ( AUTO RESPONSIVE )
                CustomInputAuth(
                  labelText: "Nama Pengguna",
                  width: 298,
                  height: 66,
                  borderColor: AppColors.black,
                  controller: controller.usernameController,
                ),
                // EMAIL
                SizedBox(height: 15.h), // Email
                CustomInputAuth(
                  labelText: "Email",
                  width: 298,
                  height: 66,
                  borderColor: AppColors.black,
                  controller: controller.emailController,
                ),

                SizedBox(height: 15.h),
                // PASSWORD
                CustomInputAuth(
                  labelText: "Kata Sandi",
                  width: 298,
                  height: 66,
                  borderColor: AppColors.black,
                  controller: controller.passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 17.h),

                // BUTTON REGISTER
                Obx(() => MainButton(
                      text: "Mendaftar",
                      width: 208,
                      height: 38,
                      isLoading: controller.isLoading.value,
                      // onPressed: controller.register, /// API INTEGRATION NEEDED
                      onPressed: () =>
                          Get.toNamed(Routes.EMAILVERIFICATION),
                    )),

                SizedBox(height: 15.h),

                // LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah mempunyai akun?",
                      style: TextStyle(color: AppColors.black, fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN); // PAGE BELUM ADA
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 21.h),

                Row(
                  children: [
                    Expanded(
                        child: Divider(thickness: 1, color: AppColors.black)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "atau masuk dengan",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(thickness: 1, color: AppColors.black)),
                  ],
                ),

                SizedBox(height: 17.h),

                const SocialAuthSection(),

                SizedBox(height: 21.h),

                Padding(
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Text(
                    'Dengan mendaftar untuk membuat akun, Anda menerima persyaratan layanan dan kebijakan privasi kami.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
