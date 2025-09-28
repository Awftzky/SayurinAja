import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/box/farmer_store_box.dart';

class FarmerStoreSection extends GetView<StoreController> {
  const FarmerStoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final stores = controller.allStore;
      if (stores.isEmpty) return const SizedBox.shrink();

      return SizedBox(
        height: 130.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: stores.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (_, index) {
            final store = stores[index];
            return FarmerStoreBox(
              imageUrl: store.imagePath.isNotEmpty
                  ? store.imagePath
                  : "assets/images/default_store.png",
              storeName: store.storeName,
              location: store.storeLocation,
              starReview: store.starReview,
              width: 297.w,
              height: 115.h,
              onButtonPressed: () {
                Get.toNamed(Routes.STOREDETAILS, arguments: store);
              },
            );
          },
        ),
      );
    });
  }
}
