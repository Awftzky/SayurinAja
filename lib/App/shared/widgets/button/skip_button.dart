import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class SkipButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final bool isLoading;
  final VoidCallback onPressed;
  final double? textSize;
  final FontWeight fontWeight;

  const SkipButton({
    super.key,
    this.text = "Lewati",
    this.width = double.infinity,
    this.height = 50,
    this.isLoading = false,
    this.textSize,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
  });

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) => _animationController.forward();
  void _onTapUp(TapUpDetails details) => _animationController.reverse();
  void _onTapCancel() => _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.text,
      enabled: !widget.isLoading,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.isLoading ? null : widget.onPressed,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.black,
                    width: 1.w,
                  ),
                ),
                width: widget.width.w,
                height: widget.height.h,
                child: Center(
                  child: widget.isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            color: AppColors.black,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          widget.text,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: (widget.textSize ?? 16).sp,
                            fontWeight: widget.fontWeight,
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
