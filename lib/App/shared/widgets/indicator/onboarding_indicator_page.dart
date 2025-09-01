import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class OnboardingIndicatorPage extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingIndicatorPage({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: AppColors.lightGray,
        activeDotColor: AppColors.primary,
        dotHeight: 9.0,
        dotWidth: 26,
        expansionFactor: 2.46,
        spacing: 12.0,
        // Enhanced animation settings
        paintStyle: PaintingStyle.fill,
        strokeWidth: 0,
      ),
    );
  }
}
