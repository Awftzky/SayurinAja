import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/payment/controllers/payment_controller.dart';
import 'package:sayurinaja/App/shared/widgets/tile/payment_tile.dart';

class DigitalPaymentSection extends GetView<PaymentController> {
  const DigitalPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.digitalPaymentMethod.length,
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 25.w),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 24.h, // JARAK ANTAR ITEM 
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                  color: AppColors.black, // Warna divider yang lebih soft
                );
              },
              itemBuilder: (context, index) {
                // Perbaikan variabel
                final method = controller.digitalPaymentMethod[index];
                return PaymentTile(
                  method: method,
                  isSelected:
                      controller.selectedPaymentMethod.value?.id == method.id,
                  onTap: () => controller.selectPaymentMethod(method),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
