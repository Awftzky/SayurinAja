import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/forgot/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/input/custom_input_auth.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/dialog/setup_dialog.dart';

class ForgotPasswordSetupPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      appBar: AppBar(backgroundColor: AppColors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 123.h),
          SizedBox(
            width: 196.w,
            height: 191.h,
            child: Image.asset("assets/images/logo.png"),

            /// TODO : NEED REPLACE
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
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Pastikan Kata Sandi baru Anda kuat dan mudah diingat.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                CustomInputAuth(
                  width: 278.w,
                  height: 46.h,
                  labelText: "Kata sandi baru",
                  controller: controller.newPasswordController,
                ),
                SizedBox(height: 13.h),
                Obx(() => Wrap(
                      spacing: 8.r,
                      children: [
                        ChoiceChip(
                          label: const Text("≥ 8 karakter"),
                          selected: controller.hasMinLength,
                          selectedColor: Colors.green.shade200,
                          onSelected: null, // BUKAN UNTUK ON PRESS
                        ),
                        ChoiceChip(
                          label: const Text("Huruf + Angka"),
                          selected: controller.hasNumberAndLetter,
                          selectedColor: Colors.green.shade200,
                          onSelected: null, // BUKAN UNTUK ON PRESS
                        ),
                      ],
                    )),
                SizedBox(height: 13.h),
                CustomInputAuth(
                  width: 278.w,
                  height: 46.h,
                  labelText: "Konfirmasi kata sandi baru",
                  controller: controller.confirmPasswordController,
                ),
                SizedBox(height: 31.h),
                MainButton(
                  text: "Simpan kata sandi Baru ",
                  onPressed: () {
                    showCustomDialog();
                  },
                  width: 324.w,
                  height: 46.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
