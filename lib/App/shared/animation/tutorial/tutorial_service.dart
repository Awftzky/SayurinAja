import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/button/skip_button.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TutorialService {
  final List<TargetFocus> _targets = [];

  /// Tambah target tutorial
  void addTarget({
    required GlobalKey key,
    required String description,
    ContentAlign align = ContentAlign.bottom,
  }) {
    _targets.add(
      TargetFocus(
        identify: key.toString(),
        keyTarget: key,
        contents: [
          TargetContent(
            align: align,
            builder: (context, controller) {
              return Material(
                color: Colors.transparent,
                child: Center(
                  /// CONTAINER SIZE TUTORIAL
                  child: Container(
                    width: 325.w,
                    height: 161.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///  Deskripsi TUTORIAL
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              description, // ISINYA DI HOME CONTROLLER
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700),
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
                          onPressed: () {
                            controller.next();
                          },
                        )

                        /// 🔘 Tombol Aksi
                        ///
                        ///
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     TextButton(
                        //       onPressed: () => controller.skip(),
                        //       child: const Text(
                        //         "Skip",
                        //         style: TextStyle(color: Colors.redAccent),
                        //       ),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () => controller.next(),
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.green,
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 16,
                        //           vertical: 8,
                        //         ),
                        //       ),
                        //       child: const Text(
                        //         "Selanjutnya",
                        //         style: TextStyle(color: Colors.white),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  /// 🚀 Intro sebelum masuk tutorial
  void showIntro(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // supaya ga bisa tutup pakai tap luar
      builder: (context) {
        return Center(
          child: Container(
            width: 325.w,
            height: 262.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  "Mau tau ada fitur apa di halaman utama kita? Yuk klik selanjutnya",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                /// Tombol aksi
                Column(
                  children: [
                    MainButton(
                      text: "Selanjutnya",
                      fontWeight: FontWeight.w500,
                      width: 247.w,
                      height: 38.h,
                      textSize: 13.sp,
                      onPressed: () {
                        Navigator.of(context).pop();
                        showTutorial(context);
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
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// Tampilkan tutorial
  void showTutorial(BuildContext context) {
    if (_targets.isEmpty) return;

    TutorialCoachMark(
      targets: _targets,
      colorShadow: Colors.black.withOpacity(0.8),
      textSkip: "",
      paddingFocus: 8,
      opacityShadow: 0.8,
      onFinish: () => debugPrint("Tutorial selesai"),
      onClickTarget: (target) =>
          debugPrint("Target diklik: ${target.identify}"),
      onSkip: () => true,
    ).show(context: context);
  }

  void clearTargets() {
    _targets.clear();
  }
}
