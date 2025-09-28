import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/payment/controllers/payment_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class PaymentMethodWidget extends GetView<PaymentController> {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Get.toNamed(Routes.PAYMENT),
        leading: SizedBox(
          width: 30.w,
          height: 30.h,
          child: Image.asset("assets/images/paymentmethod.png"),
        ),
        title: Text(
          'Metode Pembayaran',
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  controller.selectedPaymentMethodName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}
