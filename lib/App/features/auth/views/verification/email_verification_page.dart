import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/section/auth/verification_email_section.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/features/auth/controller/verification/email_verification_controller.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 106.h),

            /// Gambar di atas
            SizedBox(
              width: 91.w,
              height: 91.h,
              child: Image.asset(
                "assets/images/mail.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 28.h),

            // 🔹 Kontainer di tengah
            Center(
              child: Container(
                width: 350.w,
                height: 401.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                padding: EdgeInsets.fromLTRB(15.r, 0, 15.r, 30.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Masukkan Kode Verifikasi",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Obx(
                      () => Text(
                        "Kami telah mengirimkan 4 digit kode ke email anda (${controller.otp.value}) ",
                        style:
                            TextStyle(fontSize: 13.sp, color: AppColors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // 🔹 Input 4 digit
                    VerificationEmailSection(
                      length: controller.otpLength,
                      controller: controller,
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      "Tidak menerima kode?",
                      style: TextStyle(fontSize: 13.sp, color: AppColors.black),
                    ),
                    SizedBox(height: 5.h),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Kirim ulang kode",
                        style: TextStyle(
                            fontSize: 13.sp, color: AppColors.primary),
                      ),
                    ),

                    SizedBox(height: 40.h),

                    MainButton(
                      text: "Verifikasi",
                      width: 208.w,
                      height: 38.h,
                      onPressed: () {
                        controller.verifyOTP(controller.getOtp());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
