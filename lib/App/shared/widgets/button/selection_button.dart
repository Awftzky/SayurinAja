import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class SelectionButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isSelected;
  final String text;

  const SelectionButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: AppColors.primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.primary,
            fontSize: 10.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
