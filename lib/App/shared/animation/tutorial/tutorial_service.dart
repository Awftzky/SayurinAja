import 'package:flutter/material.dart';
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
                  child: Container(
                    width: 247.w,
                    height: 135.h,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 📝 Deskripsi
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        /// 🔘 Tombol Aksi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () => controller.skip(),
                              child: const Text(
                                "Skip",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => controller.next(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              child: const Text(
                                "Selanjutnya",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
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
            width: 280.w,
            height: 200.h,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Butuh Panduan?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Kami akan menunjukkan langkah-langkah singkat agar kamu lebih mudah memahami aplikasi.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                /// Tombol aksi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        debugPrint("Tutorial dilewati");
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // tutup intro dulu
                        showTutorial(context); // lanjut ke tutorial
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
