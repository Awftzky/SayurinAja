import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/button/skip_button.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

enum TutorialAlign {
  top,
  bottom,
}

class TutorialService {
  final List<TargetFocus> _targets = [];
  VoidCallback? _onCompleteCallback;
  VoidCallback? _onSkipCallback;

  void addTarget({
    required GlobalKey key,
    required String description,
    TutorialAlign align = TutorialAlign.bottom,
  }) {
    _targets.add(
      TargetFocus(
        identify: key.toString(),
        keyTarget: key,
        contents: [
          TargetContent(
            align: align == TutorialAlign.bottom
                ? ContentAlign.bottom
                : ContentAlign.top,
            builder: (context, controller) {
              return Material(
                color: Colors.transparent,
                child: Container(
                  width: 325.w,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 60.h,
                          maxHeight: 150.h,
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            textAlign: TextAlign.center,
                            description,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      MainButton(
                        text: "Selanjutnya",
                        fontWeight: FontWeight.w700,
                        width: 247.w,
                        height: 38.h,
                        textSize: 13.sp,
                        onPressed: () => controller.next(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void showIntro(BuildContext context,
      {required VoidCallback onStart, required VoidCallback onSkip}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 325.w,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Selamat datang di halaman utama SayurinAja!",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Mau tau ada fitur apa di halaman utama kita? Yuk ikuti tur singkat ini!",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                MainButton(
                  text: "Mulai Tur",
                  fontWeight: FontWeight.w500,
                  width: 247.w,
                  height: 38.h,
                  textSize: 13.sp,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onStart();
                  },
                ),
                SizedBox(height: 17.h),
                SkipButton(
                  fontWeight: FontWeight.w500,
                  width: 247.w,
                  height: 38.h,
                  textSize: 13.sp,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onSkip();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showOutro(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            width: 325.w,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Pengenalan fitur cukup sampai situ saja, kamu seharusnya sudah paham penggunaannya. Apakah siap untuk menggunakan aplikasi?",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                MainButton(
                  text: "Siap dong!",
                  fontWeight: FontWeight.w500,
                  width: 247.w,
                  height: 38.h,
                  textSize: 13.sp,
                  onPressed: () {
                    Navigator.of(context).pop();
                    _onCompleteCallback?.call();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showTutorial(
    BuildContext context, {
    required VoidCallback onComplete,
    required VoidCallback onSkip,
  }) {
    if (_targets.isEmpty) {
      debugPrint('⚠️ No tutorial targets defined');
      return;
    }

    _onCompleteCallback = onComplete;
    _onSkipCallback = onSkip;

    TutorialCoachMark(
            targets: _targets,
            colorShadow: AppColors.transparent,
            paddingFocus: 8,
            opacityShadow: 0.8,
            onClickTarget: (target) {
              _scrollToTarget(target.keyTarget);
            },
            onFinish: () {
              showOutro(context);
              _clearCallbacks();
            },
            onSkip: () {
              _onSkipCallback?.call();
              _clearCallbacks();

              return true;
            },
            focusAnimationDuration: Duration.zero,
            pulseAnimationDuration: Duration.zero,
            hideSkip: true,
            unFocusAnimationDuration: Duration.zero)
        .show(context: context);
  }

  void _scrollToTarget(GlobalKey? targetKey) {
    if (targetKey?.currentContext == null) return;

    try {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: Duration.zero,
        alignment: 0.3,
      );
    } catch (e) {
      debugPrint('⚠️ Error scrolling: $e');
    }
  }

  void clearTargets() {
    _targets.clear();
  }

  /// CLEANER
  void _clearCallbacks() {
    _onCompleteCallback = null;
    _onSkipCallback = null;
  }
}
