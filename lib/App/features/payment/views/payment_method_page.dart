import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/section/payment/others_payment_section.dart';
import 'package:sayurinaja/App/shared/section/payment/digital_payment_section.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            color: AppColors.transparent,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primary,
              size: 28,
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          "Metode Pembayaran",
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            top: 120.h,
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "PEMBAYARAN DIGITAL",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
              SizedBox(height: 12.h),
              DigitalPaymentSection(),
              SizedBox(height: 24.h),
              Text(
                "Lainnya",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              ),
              SizedBox(height: 12.h),
              OthersPaymentSection()
            ],
          )),
    );
  }
}
