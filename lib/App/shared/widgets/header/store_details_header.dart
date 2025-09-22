import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/clippers/header_clipper.dart';

class StoreDetailsHeader extends StatelessWidget {
  final double height;
  final Color color;
  final double cornerRadius;

  const StoreDetailsHeader({
    super.key,
    this.height = 142,
    this.color = AppColors.primary,
    this.cornerRadius = 32,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HeaderClipper(cornerRadius: cornerRadius.r),
      child: Container(
        width: double.infinity,
        height: height.h,
        color: color,
      ),
    );
  }
}
