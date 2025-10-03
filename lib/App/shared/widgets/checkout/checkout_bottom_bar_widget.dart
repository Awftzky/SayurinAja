// lib/app/shared/widgets/bar/checkout_bottom_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class CheckoutBottomBarWidget extends GetView<CheckoutController> {
  const CheckoutBottomBarWidget({super.key});

  String _formatPrice(double price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 18.w,
                      height: 18.h,
                      child: Image.asset("assets/images/totalmoney.png")),
                  SizedBox(width: 5.w),
                  Text("Total",
                      style: TextStyle(
                          fontSize: 11,
                          color: AppColors.black,
                          fontWeight: FontWeight.w300)),
                  SizedBox(width: 5.w),
                  Obx(() => Text(
                        _formatPrice(controller.total),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            color: AppColors.primary),
                      )),
                ],
              )),
          const SizedBox(height: 12),
          Obx(
            () => MainButton(
              textSize: 10,
              width: 318,
              height: 36,
              text: controller.buttonText,
              onPressed: controller.processOrder,
            ),
          ),
        ],
      ),
    );
  }
}
