import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';
import 'package:sayurinaja/App/shared/widgets/box/farmer_store_box.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';

class ClosestStorePage extends GetView<StoreController> {
  const ClosestStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isExtend: false,
      useGradient: false,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          "Toko terdekat dari kamu",
          style: TextStyle(fontSize: 13.sp, color: AppColors.black),
        ),
      ),
      body: Obx(() {
        if (controller.allStore.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final closestStores = controller.allStore; // nanti bisa difilter

        return ListView.builder(
          padding: EdgeInsets.fromLTRB(37.w, 34.h, 37.w, 0.h),
          itemCount: closestStores.length,
          itemBuilder: (context, index) {
            final store = closestStores[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: FarmerStoreBox(
                imageUrl: store.imagePath, // disesuaikan
                storeName: store.storeName,
                location: store.storeLocation,
                starReview: store.starReview,
                // onButtonPressed: () => Get.toNamed(Routes.STOREDETAILS),
              ),
            );
          },
        );
      }),
    );
  }
}
