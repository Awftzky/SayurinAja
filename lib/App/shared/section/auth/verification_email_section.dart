import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/input/verification_input.dart';
import 'package:sayurinaja/App/core/mixins/otp_controller_mixin.dart';

class VerificationEmailSection extends StatelessWidget {
  final int length;
  final double boxWidth;
  final double boxHeight;
  final double spacing;
  final OtpControllerMixin controller;

  const VerificationEmailSection({
    super.key,
    required this.length,
    required this.controller,
    this.boxWidth = 50,
    this.boxHeight = 51,
    this.spacing = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: index == length - 1 ? 0 : spacing.r,
          ),
          child: Obx(() => VerificationInput(
                index: index,
                width: boxWidth,
                height: boxHeight,
                textController: controller.textControllers[index],
                focusNode: controller.focusNodes[index],
                focused: controller.isFocused[index].value,
                filled: controller.isFilled[index].value,
                onChanged: (value) => controller.onInputChanged(index, value),
              )),
        );
      }),
    );
  }
}
