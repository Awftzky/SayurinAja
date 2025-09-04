import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/forgot/forgot_password_controller.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/section/auth/verification_email_section.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class ForgotPasswordVerificationPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordVerificationPage({super.key});

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
              width: 179.w,
              height: 176.h,
              child: Image.asset("assets/images/forgoticon2.png"),

              /// IMAGE
            ),
            SizedBox(height: 44.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Masukkan kode verifikasi ",
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
                        "Kami telah mengirimkan 6 digit kode melalui email ke ..@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.black,
                        ),
                      )),
                  SizedBox(
                    height: 23.h,
                  ),
                  VerificationEmailSection(
                    length: 6,
                    boxHeight: 46.h,
                    boxWidth: 46.w,
                    spacing: 10.r,
                  ),
                  SizedBox(height: 14.h),
                  Text("Tidak menerima kode?",
                      style:
                          TextStyle(fontSize: 13.sp, color: AppColors.black)),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      /// KIRIM ULANG CODE
                    },
                    child: Text(
                      "Kirim ulang kode",
                      style:
                          TextStyle(fontSize: 13.sp, color: AppColors.primary),
                    ),
                  ),
                  SizedBox(height: 23.h),
                  MainButton(
                    text: "Verifikasi",
                    onPressed: () {
                      Get.offAllNamed(
                          Routes.FORGOTPASSWORDSETUP); // API INTEGRATION
                    },
                    width: 255.w,
                    height: 46.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
