import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/widgets/bottom_sheet/main_bottom_sheet.dart';
import 'package:sayurinaja/App/shared/widgets/button/change_location_button.dart';
import 'package:sayurinaja/App/shared/widgets/checkout/delivery_options_card.dart';

class DeliveryDetailsSection extends GetView<CheckoutController> {
  const DeliveryDetailsSection({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              const SizedBox(width: 8),
              ChangeLocationButton(
                onTap: controller.changeLocation,
              )
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Get.bottomSheet(
              MainBottomSheet(
                controller: controller,
                buttonText: "Simpan dan tambahkan",
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: AppColors.black20,
              isDismissible: true,
              enableDrag: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),

            /// ADD ADRESS DETAILS
            child: Container(
              height: 22.h,
              width: 150.w,
              padding: EdgeInsets.only(left: 10.w),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray),
                  color: AppColors.shadowGrey,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(children: [
                SizedBox(
                  width: 18.w,
                  height: 18.h,
                  child: Image.asset("assets/images/note.png"),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Tambahkan detail alamat",
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w300),
                ),
              ]),
            ),
          ),
          SizedBox(height: 16.h),

          /// PRODUCT NOTES
          GestureDetector(
            onTap: () => Get.bottomSheet(
              MainBottomSheet(
                controller: controller,
                buttonText: "Simpan dan tambahkan",
              ),
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: AppColors.black20,
              isDismissible: true,
              enableDrag: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10.w),
              alignment: Alignment.centerLeft,
              width: 286.w,
              height: 24.h,
              decoration: BoxDecoration(
                  color: AppColors.shadowGrey,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Text(
                "Catatan",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "Info Pesanan antar kamu",
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13.sp),
          ),
          Text(
            "Estimasi perjualan tiba pesanan kamu 30 menit",
            style: TextStyle(
                color: AppColors.black,
                fontSize: 10.sp,
                fontWeight: FontWeight.w300),
          ),
          Obx(() => Column(
                children: [
                  for (var i = 0;
                      i < controller.deliveryOptions.length;
                      i++) ...[
                    DeliveryOptionCard(
                      option: controller.deliveryOptions[i],
                      isSelected: controller.selectedDeliveryOption.value ==
                          controller.deliveryOptions[i].name,
                      onTap: () => controller.selectDeliveryOption(
                          controller.deliveryOptions[i].name),
                    ),
                    if (i != controller.deliveryOptions.length - 1)
                      Padding(
                        padding: EdgeInsets.only(right: 25.w),
                        child: Divider(
                          thickness: 1,
                          color: AppColors.gray,
                          height: 16,
                        ),
                      )
                  ]
                ],
              ))
        ],
      ),
    );
  }
}
