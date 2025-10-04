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
  final int? productIndex; // Tambahkan parameter ini

  const MainBottomSheet({
    super.key,
    required this.controller,
    this.buttonText = "Simpan",
    this.hintText = "Contoh: Pagar warna hitam, dekat masjid...",
    this.titleText = "Tambahkan Detail Alamat Kamu",
    this.productIndex, // Tambahkan parameter ini
  });

  @override
  Widget build(BuildContext context) {
    // Tentukan apakah ini untuk catatan produk atau alamat
    final isProductNote = productIndex != null;
    final TextEditingController textController = TextEditingController(
      text: isProductNote &&
              productIndex! >= 0 &&
              productIndex! < controller.cartItems.length
          ? (controller.cartItems[productIndex!].notes ?? '')
          : (isProductNote ? '' : controller.deliveryNotes.value),
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 20.h,
          bottom: 20.h,
        ),
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
          const Divider(thickness: 1),
          SizedBox(height: 16.h),
          TextField(
            controller: textController,
            onChanged: (value) {
              if (isProductNote) {
                controller.productNotes.value = value;
              } else {
                controller.deliveryNotes.value = value;
              }
            },
            maxLines: 4,
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
          const Divider(thickness: 1),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          "Rp ${controller.total.toStringAsFixed(0)}",
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
              SizedBox(
                width: 206.w,
                child: MainButton(
                  text: buttonText,
                  fontWeight: FontWeight.w500,
                  textSize: 10,
                  onPressed: () {
                    if (isProductNote && productIndex != null) {
                      controller.updateProductNotes(
                        productIndex!,
                        textController.text,
                      );
                    } else {
                      Get.back();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
