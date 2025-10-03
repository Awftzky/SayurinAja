import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class MainBottomSheet extends StatelessWidget {
  final CheckoutController controller;
  final String buttonText;
  final String hintText;
  final String titleText;

  const MainBottomSheet(
      {super.key,
      required this.controller,
      this.buttonText = "Simpan",
      this.hintText = "Contoh: Pagar warna hitam, dekat masjid...",
      this.titleText = "Tambahkan Detail Alamat Kamu"});

  @override
  Widget build(BuildContext context) {
    return Material(
      // ANTI RENDERING ISSUE
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        // Tambahkan padding untuk safe area dan konten
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom +
              20.h, // Handle keyboard
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),

            Text(
              titleText,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),

            // 2. Garis Pemisah
            const Divider(thickness: 1),
            SizedBox(height: 16.h),

            // 3. Tempat Input
            TextField(
              // Hubungkan ke controller untuk menyimpan catatan alamat
              onChanged: (value) => controller.deliveryNotes.value = value,
              maxLines: 4, // Agar bisa untuk alamat yang panjang
              autofocus: true,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[400],
                ),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12.w),
              ),
            ),
            SizedBox(height: 16.h),

            // 4. Garis Pemisah
            const Divider(thickness: 1),
            SizedBox(height: 24.h),

            // 5. Row berisi Teks Adaptif dan MainButton
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Teks Adaptif (menggunakan Expanded)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Pembayaran",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Obx(() => Text(
                            "Rp ${controller.total.toStringAsFixed(0)}", // Ambil total dari controller
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),

                // Main Button
                SizedBox(
                  width: 206.w,
                  child: MainButton(
                    text: buttonText,
                    fontWeight: FontWeight.w500,
                    textSize: 10,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
