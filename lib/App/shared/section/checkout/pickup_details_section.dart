import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';

class PickupDetailsSection extends GetView<CheckoutController> {
  const PickupDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(left: 20.w, top: 20.h, right: 20.w, bottom: 20.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGray,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Lokasi Pesanan antar kamu",
            style: TextStyle(fontSize: 13),
          ),
          SizedBox(height: 13.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on, color: AppColors.primary, size: 28),
              Expanded(
                child: Obx(() => Text(
                      controller.selectedLocation.value,
                      style: TextStyle(fontSize: 13),
                    )),
              ),
            ],
          ),
        ]));
  }
}
