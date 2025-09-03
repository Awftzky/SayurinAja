import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_button.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/welcoming_scaffold.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/welcome/controller/welcoming_controller.dart';

class WelcomingPage extends GetView<WelcomingController> {
  const WelcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WelcomingScaffold(
      body: Column(
        children: [
          // Center the logo and text section
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 346.w,
                    height: 346.h,
                    child: Image.asset('assets/images/transparentlogo.png'),
                  ),
                  Positioned(
                    bottom: 30.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Selamat Datang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 31.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Kesegaran dimulai disini!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///  Button
          Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: OnboardingIndicatorButton(
                text: "Mulai",
                textSize: 16,
                onPressed: () => Get.toNamed(Routes.WELCOMINGPRESENT)),
          ),
        ],
      ),
    );
  }
}
