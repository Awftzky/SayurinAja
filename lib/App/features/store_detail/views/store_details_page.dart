import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';
import 'package:sayurinaja/App/features/store_detail/controller/store_details_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';
import 'package:sayurinaja/App/shared/section/store_details/product/fruit_product_section.dart';
import 'package:sayurinaja/App/shared/section/store_details/product/meat_product_section.dart';
import 'package:sayurinaja/App/shared/section/store_details/product/vegetable_product_section.dart';
import 'package:sayurinaja/App/shared/widgets/box/farmer_store_details_box.dart';
import 'package:sayurinaja/App/shared/widgets/fixed/fixed_cart_widget.dart';
import 'package:sayurinaja/App/shared/widgets/header/store_details_header.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/widgets/search/fake_search_bar.dart';

class StoreDetailsPage extends GetView<StoreDetailsController> {
  const StoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Get.arguments as StoreModel;
    // Ambil instance CartController sekali saja di sini
    final CartController cartController = Get.find<CartController>();

    return BaseScaffold(
      isFixed: false,
      useGradient: false,
      header: StoreDetailsHeader(
        color: AppColors.primary,
        height: 142,
      ),
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
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
          child: FakeSearchBar(
            height: 40.h,
            onTap: () => Get.toNamed(Routes.SEARCHSTOREDETAILS),
            hintText: "Cari yang kamu butuhkan disini ya",
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(35.w, 130.h, 30.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmerStoreDetailsBox(
                  imageUrl: store.imagePath,
                  storeName: store.storeName,
                  location: store.storeLocation,
                  starReview: store.starReview,
                  description: "DESKRIPSI COMING SOON",
                ),
                SizedBox(height: 52.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.only(bottom: 80.h), // Extra space for cart
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// VEGETABLE SECTION
                        Text(
                          "Sayuran",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15.h),
                        VegetableProductSection(
                          storeName: store.storeName,
                          cartController: cartController, // Kirim controller
                        ),
                        SizedBox(height: 15.h),
                        const Divider(),
                        SizedBox(height: 15.h),

                        /// FRUIT SECTION
                        Text(
                          "Buah Buahan",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15.h),
                        FruitProductsection(
                          storeName: store.storeName,
                          cartController: cartController, // Kirim controller
                        ),
                        SizedBox(height: 15.h),
                        const Divider(),
                        SizedBox(height: 15.h),

                        /// MEAT SECTION
                        Text(
                          "Daging",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 15.h),
                        MeatProductSection(
                          storeName: store.storeName,
                          cartController: cartController, // Kirim controller
                        ),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FixedCartContainer(
            onTap: () => Get.toNamed(Routes.CHECKOUT),
          ),
        ],
      ),
    );
  }
}
