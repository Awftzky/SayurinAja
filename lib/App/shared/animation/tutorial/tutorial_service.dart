import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';
import 'package:sayurinaja/App/shared/widgets/button/skip_button.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

// Enum untuk mengatur posisi dialog tutorial (di atas atau di bawah target)
enum ContentAlign {
  top,
  bottom,
}

class TutorialService {
  final List<TargetFocus> _targets = [];

  // Callback yang akan dipanggil dari luar (misal: HomeController)
  VoidCallback? _onCompleteCallback;
  VoidCallback? _onSkipCallback;

  /// Menambahkan target tutorial baru
  /// Fitur baru: Otomatis menghitung nomor langkah saat ini.
  void addTarget({
    required GlobalKey key,
    required String description,
    ContentAlign align = ContentAlign.bottom,
  }) {
    final int currentStep = _targets.length + 1;

    _targets.add(
      TargetFocus(
        identify: key.toString(),
        keyTarget: key,
        contents: [
          TargetContent(
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
                    mainAxisSize: MainAxisSize.min, // Agar tinggi container pas
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FITUR BARU: Penanda Langkah ("1 dari 6")
                      Text(
                        "$currentStep dari ${_targets.length}",
                        style: TextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Deskripsi fitur
                      SizedBox(
                        height: 60.h, // Beri tinggi maksimal agar layout stabil
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Tombol Aksi (Lewati & Selanjutnya)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // FITUR BARU: Tombol Lewati di setiap langkah
                          TextButton(
                            onPressed: () {
                              controller.skip();
                            },
                            child: Text(
                              "Lewati Tur",
                              style: TextStyle(
                                color: AppColors.black.withOpacity(0.7),
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          MainButton(
                            text: "Selanjutnya",
                            fontWeight: FontWeight.w700,
                            width: 120.w,
                            height: 38.h,
                            textSize: 13.sp,
                            onPressed: () {
                              controller.next();
                            },
                          ),
                        ],
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

  /// Menampilkan dialog perkenalan di awal
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
                  "Mau tau ada fitur apa di halaman utama kita? Yuk ikuti tur singkat ini!",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 10.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    MainButton(
                      text: "Mulai Tur",
                      fontWeight: FontWeight.w500,
                      width: 247.w,
                      height: 38.h,
                      textSize: 13.sp,
                      onPressed: () {
                        Navigator.of(context).pop();
                        onStart(); // Memanggil callback untuk memulai tutorial
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
                        onSkip(); // Memanggil callback jika pengguna lewati dari awal
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Menampilkan dialog penutup di akhir
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pengenalan fitur sudah selesai. Sekarang kamu siap untuk menjelajahi aplikasi!",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                MainButton(
                  text: "Siap!",
                  fontWeight: FontWeight.w500,
                  width: 247.w,
                  height: 38.h,
                  textSize: 13.sp,
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Menandai tutorial selesai
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

  /// Fungsi utama untuk menampilkan tutorial
  void showTutorial(
    BuildContext context, {
    required VoidCallback onComplete,
    required VoidCallback onSkip,
  }) {
    if (_targets.isEmpty) {
      debugPrint('⚠️ No tutorial targets defined');
      return;
    }

    // Simpan callback dari controller untuk digunakan di tempat lain
    _onCompleteCallback = onComplete;
    _onSkipCallback = onSkip;

    TutorialCoachMark(
      targets: _targets,
      textSkip: "", // Kosongkan karena kita punya tombol lewati sendiri
      paddingFocus: 8,
      opacityShadow: 0.8,
      hideSkip: true, // Sembunyikan tombol lewati default dari paket
      onFinish: () {
        debugPrint('✅ Tutorial finished');
        showOutro(
            context); // Tampilkan dialog akhir setelah semua langkah selesai
      },
      onSkip: () {
        debugPrint('⏭️ Tutorial skipped');
        _onSkipCallback?.call(); // Panggil callback skip utama
        return true; // Return true untuk benar-benar menghentikan tur
      },
    ).show(context: context);
  }

  /// Menghapus semua target (berguna untuk inisialisasi ulang)
  void clearTargets() {
    _targets.clear();
  }
}
