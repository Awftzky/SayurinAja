import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class OnboardingIndicatorButton extends StatelessWidget {
  final String text;
  final int textSize;
  final VoidCallback onPressed;
  final bool skipButton;
  final VoidCallback? onSkip;

  const OnboardingIndicatorButton({
    super.key,
    required this.text,
    required this.textSize,
    required this.onPressed,
    this.skipButton = false,
    this.onSkip,
  });

  /// Skip Button
  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: onSkip ?? () {},
      child: Container(
        width: 153.w,
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary20,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.primary),
        ),
        child: Text(
          'Lewati',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = skipButton ? 175.w : 308.w;

    /// MAIN BUTTON
    final height = 50.h;

    if (skipButton) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSkipButton(),
          SizedBox(width: 10.w),
          MainButton(
            text: text,
            width: width,
            height: height,
            onPressed: onPressed,
          ),
        ],
      );
    } else {
      return MainButton(
        text: text,
        width: width,
        height: height,
        onPressed: onPressed,
      );
    }
  }
}
