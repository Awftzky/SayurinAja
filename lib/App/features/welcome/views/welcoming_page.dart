import 'package:flutter/material.dart';
import 'package:sayurinaja/App/features/welcome/views/onboarding_page0.dart';
import 'package:sayurinaja/App/features/welcome/views/onboarding_page1.dart';
import 'package:sayurinaja/App/features/welcome/views/onboarding_page2.dart';
import 'package:sayurinaja/App/features/welcome/views/onboarding_page3.dart';
import 'package:sayurinaja/App/features/welcome/views/onboarding_page4.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_button.dart';
import 'package:sayurinaja/App/shared/widgets/indicator/onboarding_indicator_page.dart';
import 'package:sayurinaja/App/features/welcome/controller/welcoming_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WelcomingPage extends StatefulWidget {
  const WelcomingPage({super.key});

  @override
  State<WelcomingPage> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<WelcomingPage> {


  final List<Widget> _onboardingPages = [
    const OnboardingPage0(),
    const OnboardingPage1(),
    const OnboardingPage2(),
    const OnboardingPage3(),
    const OnboardingPage4()
  ];

  final WelcomingController stateX = Get.put(WelcomingController());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 24.h, horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: stateX.pageController,
                  onPageChanged: (index) {
                    stateX.onPageChanged(index);
                  },
                  children: _onboardingPages,
                ),
              ),
              SizedBox(height: 40.h),

              OnboardingIndicatorPage(
                  controller: stateX.pageController,
                  count: _onboardingPages.length
              ),

              SizedBox(height: 40.h),

              Obx(() => OnboardingIndicatorButton(
                text: stateX.buttonTexts[stateX.currentPageIndex.value],
                textSize: 16,
                onPressed: () {
                  stateX.nextPage();
                },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
