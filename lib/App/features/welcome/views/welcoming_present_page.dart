import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_button.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_page.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/features/welcome/controller/welcoming_controller.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/welcome/views/introduction_page1.dart';
import 'package:sayurinaja/App/features/welcome/views/introduction_page2.dart';
import 'package:sayurinaja/App/features/welcome/views/introduction_page3.dart';
import 'package:sayurinaja/App/features/welcome/views/introduction_page4.dart';

class WelcomingPresentPage extends GetView<WelcomingController> {
  const WelcomingPresentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: true,
      body: Column(
        children: [
          // Bagian atas: PageView untuk ilustrasi tiap page
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: const [
                IntroductionPage1(),
                IntroductionPage2(),
                IntroductionPage3(),
                IntroductionPage4(),
              ],
            ),
          ),

          // Bagian bawah: Container putih dengan layout terpisah
          Container(
            width: double.infinity,
            height: 472.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                /// TEXTT
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Obx(() {
                      final index = controller.currentPageIndex.value;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.titleText[index],
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            controller.subText[index],
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }),
                  ),
                ),

                // Area button & indicator - posisi tetap di bawah
                Container(
                  padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 60.h),
                  child: Column(
                    children: [
                      // Page indicator
                      OnboardingIndicatorPage(
                        controller: controller.pageController,
                        count: controller.titleText.length,
                      ),
                      SizedBox(height: 42.h),

                      Obx(() {
                        final index = controller.currentPageIndex.value;
                        return OnboardingIndicatorButton(
                          skipButton: index == 0,
                          onSkip: () => Get.offNamed(
                              Routes.AUTHOPTION), // NAVIGATE KE AUTH OPTION
                          text: controller.buttonTexts[index],
                          textSize: 16,
                          onPressed: controller.nextPage,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
