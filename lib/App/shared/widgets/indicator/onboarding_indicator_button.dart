import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class OnboardingIndicatorButton extends StatelessWidget {
  final String text;
  final int textSize;
  final VoidCallback onPressed;

  const OnboardingIndicatorButton({
    super.key ,
    required this.text,
    required this.textSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        fixedSize: Size(311, 50)
      ),

      child: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontSize: textSize.toDouble(),
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}