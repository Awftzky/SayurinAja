import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class EmailVerificationSuccessPage extends StatelessWidget {
  const EmailVerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 106.h),

          SizedBox(
            width: 91.w,
            height: 91.h,
            child: Image.asset(
              "assets/images/mail.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 28.h),

          // 🔹 Kontainer di tengah (dibungkus Center biar ga ikut ke kiri)
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
                    "Pendaftaran Berhasil! Selamat datang di SayurinAja!, ...",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),

                    /// TUNGGU WARNA
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 31.h),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SizedBox(
                      width: 159.w,
                      height: 139.h,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),

                      /// TODO : IMAGE AKAN DIGANTI
                    ),
                  ),
                  SizedBox(height: 50.h),
                  MainButton(
                    text: "Ke halaman masuk",
                    width: 257.w,
                    height: 42.h,
                    onPressed: () {
                      Get.offNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
