import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/input/verification_input.dart';
import 'package:sayurinaja/App/features/auth/controller/verification/email_verification_controller.dart';

class VerificationEmailSection extends StatelessWidget {
  final int length;
  final double boxWidth;
  final double boxHeight;
  final double spacing;

  const VerificationEmailSection({
    super.key,
    required this.length,
    this.boxWidth = 50,
    this.boxHeight = 51,
    this.spacing = 25,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    controller.initFields(length);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index == length - 1 ? 0 : spacing.r,
          ),
          child: VerificationInput(
            index: index,
            width: boxWidth,
            height: boxHeight,
          ),
        );
      }),
    );
  }
}
