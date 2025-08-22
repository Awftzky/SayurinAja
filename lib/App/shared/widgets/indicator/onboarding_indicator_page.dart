import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicatorPage extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingIndicatorPage({
    super.key,
    required this.controller,
    required this.count
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: Colors.grey.shade300,
        activeDotColor: const Color(0xFF3EA35D),
        dotHeight: 9.0,
        dotWidth: 26,
      ),
    );
  }
}
