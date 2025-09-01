import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class OnboardingIndicatorButton extends StatefulWidget {
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

  @override
  State<OnboardingIndicatorButton> createState() =>
      _OnboardingIndicatorButtonState();
}

class _OnboardingIndicatorButtonState extends State<OnboardingIndicatorButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 2.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _onTapCancel() {
    _animationController.reverse();
  }

  Widget _buildMainButton() {
    final width = widget.skipButton ? 180.w : 308.w;
    final height = widget.skipButton ? 50.h : 50.h;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: _isHovered ? AppColors.primary : AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary20,
                    blurRadius: _elevationAnimation.value,
                    offset: Offset(0, _elevationAnimation.value / 2),
                  ),
                ],
              ),
              child: SizedBox(
                width: width,
                height: height,
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: widget.textSize.sp, // SUDAH SP TEXT SIZE
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// SKIP BUTTON
  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: widget.onSkip ?? () {},
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
    if (widget.skipButton) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSkipButton(),
          SizedBox(width: 10.w),
          _buildMainButton(),
        ],
      );
    } else {
      return _buildMainButton();
    }
  }
}
