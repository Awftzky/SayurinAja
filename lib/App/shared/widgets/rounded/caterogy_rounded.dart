import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class CategoryRounded extends StatefulWidget {
  final String assetImage;
  final String label;
  final VoidCallback onTap;
  final Key? highlightKey; // ✅ buat tutorial guide

  const CategoryRounded({
    super.key,
    required this.assetImage,
    required this.label,
    required this.onTap,
    this.highlightKey,
  });

  @override
  State<CategoryRounded> createState() => _CategoryRoundedState();
}

class _CategoryRoundedState extends State<CategoryRounded> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.primary,
          shape: const CircleBorder(),
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              child: InkWell(
                key: widget.highlightKey, // ✅ bisa dipasang di tutorial
                customBorder: const CircleBorder(),
                splashColor: AppColors.primary,
                child: Container(
                  width: 68.w,
                  height: 68.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      widget.assetImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
