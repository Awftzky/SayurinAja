import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/models/checkout/delivery_models.dart';
import 'package:sayurinaja/App/shared/section/checkout/checkout_product_section.dart';
import 'package:sayurinaja/App/shared/section/checkout/delivery_details_section.dart';
import 'package:sayurinaja/App/shared/section/checkout/delivery_option_section.dart';
import 'package:sayurinaja/App/shared/section/checkout/order_summarry_section.dart';
import 'package:sayurinaja/App/shared/section/checkout/pickup_details_section.dart';
import 'package:sayurinaja/App/shared/widgets/checkout/checkout_bottom_bar_widget.dart';
import 'package:sayurinaja/App/shared/widgets/checkout/payment_method_widget.dart';
import 'package:sayurinaja/App/shared/widgets/header/checkout_header.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useGradient: false,
      header: CheckoutHeader(),
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 28,
              ),
            ),
          ),
        ),
        title: Text(
          "Keranjang Belanja Kamu",
          style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 140.h, 20.w, 20.h),
                child: Column(
                  children: [
                    DeliveryOptionSection(controller: controller),
                    SizedBox(height: 20.h),
                    _buildDetailsSection(),
                    SizedBox(height: 20.h),
                    const CheckoutProductSection(),
                    SizedBox(height: 20.h),
                    const PaymentMethodWidget(),
                    SizedBox(height: 20.h),
                    const OrderSummarySection(),
                  ],
                ),
              ),
            ),
          ),
          const CheckoutBottomBarWidget(),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Obx(() {
      if (controller.selectedDeliveryType.value == DeliveryType.delivery) {
        return const DeliveryDetailsSection();
      } else {
        return const PickupDetailsSection();
      }
    });
  }
}
