import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';

class FixedCartContainer extends GetView<CartController> {
  final VoidCallback onTap;
  const FixedCartContainer({super.key, required this.onTap});

  String _formatPrice(double price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isCartVisible) {
        return const SizedBox
            .shrink(); // <-- Jika isCartVisible == false, widget ini hilang.
      }
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: InkWell(
            onTap: onTap,
            child: Container(
              width: 314.w,
              height: 43.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowGrey,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    // Widget 1: Item count dan store info
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.totalItems} item",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Pengiriman dari ${controller.selectedStoreName}",
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    // Widget 2: Total harga
                    Row(
                      children: [
                        Expanded(
                          flex: 0,
                          child: Text(
                            _formatPrice(controller.totalPrice),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: SizedBox(
                            width: 26.w,
                            height: 30.h,
                            child: Image.asset("assets/images/cart.png"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
