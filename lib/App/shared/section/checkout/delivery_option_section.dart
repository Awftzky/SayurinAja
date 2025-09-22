import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // <-- Jangan lupa import
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/widgets/button/selection_button.dart';
import 'package:sayurinaja/App/shared/models/checkout/delivery_models.dart';

class DeliveryOptionSection extends StatelessWidget {
  final CheckoutController controller;

  const DeliveryOptionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 10.h,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: Image.asset("assets/images/checkoutdelivery.png"),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Pesan antar",
                  style: TextStyle(
                      fontSize: 12.sp, // Ukuran font dibuat responsif
                      fontWeight: FontWeight.w500,
                      color: AppColors.black),
                ),
                SizedBox(height: 8.h),
                Obx(() => SelectionButton(
                      text: "Pilih",
                      isSelected: controller.selectedDeliveryType.value ==
                          DeliveryType.delivery,
                      onTap: () =>
                          controller.selectDeliveryType(DeliveryType.delivery),
                    )),
              ],
            ),
          ),
          Container(
            height: 73.h,
            width: 1,
            color: AppColors.black,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: Image.asset("assets/images/checkoutpickup.png"),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Ambil di toko",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8.h),
                Obx(() => SelectionButton(
                      text: "Pilih",
                      isSelected: controller.selectedDeliveryType.value ==
                          DeliveryType.pickup,
                      onTap: () =>
                          controller.selectDeliveryType(DeliveryType.pickup),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
