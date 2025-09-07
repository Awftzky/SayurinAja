import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class VerificationInput extends StatelessWidget {
  final int index;
  final double width;
  final double height;
  final TextEditingController textController;
  final FocusNode focusNode;
  final bool focused;
  final bool filled;
  final Function(String value)? onChanged;

  const VerificationInput({
    super.key,
    required this.index,
    required this.width,
    required this.height,
    required this.textController,
    required this.focusNode,
    required this.focused,
    required this.filled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
        controller: textController,
        focusNode: focusNode,
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
        onChanged: onChanged,
      ),
    );
  }
}
