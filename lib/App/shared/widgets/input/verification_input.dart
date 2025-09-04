import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/auth/controller/verification/email_verification_controller.dart';

class VerificationInput extends StatelessWidget {
  final int index;
  final double width;
  final double height;

  const VerificationInput({
    super.key,
    required this.index,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EmailVerificationController>();

    return Obx(() {
      bool focused = controller.isFocused[index];
      bool filled = controller.isFilled[index];

      Color backgroundColor;
      Color borderColor;

      if (filled) {
        backgroundColor = const Color(0xFF3EA35D);
        borderColor = const Color(0xFF50FF86);
      } else if (focused) {
        backgroundColor = const Color(0xFF3EA35D);
        borderColor = Colors.transparent;
      } else {
        backgroundColor = const Color(0xFF447553);
        borderColor = Colors.transparent;
      }

      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width.w,
        height: height.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          controller: controller.textControllers[index],
          focusNode: controller.focusNodes[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
        ),
      );
    });
  }
}
