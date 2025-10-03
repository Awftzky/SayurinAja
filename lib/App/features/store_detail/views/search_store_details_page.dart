import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/features/store_detail/controller/search_store_details_controller.dart';
import 'package:sayurinaja/App/shared/widgets/bottom_sheet/main_bottom_sheet.dart';
import 'package:sayurinaja/App/shared/widgets/box/product_box.dart'; // Import ProductBox
import 'package:sayurinaja/App/shared/widgets/header/store_details_header.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/widgets/search/no_search_result_widget.dart';
import 'package:sayurinaja/App/shared/widgets/search/search_bar_widget.dart';

class SearchStoreDetailsPage extends GetView<SearchStoreDetailsController> {
  const SearchStoreDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final checkoutController = Get.find<CheckoutController>();

    return BaseScaffold(
      useGradient: false,
      header: StoreDetailsHeader(
        color: AppColors.primary,
        height: 142,
      ),
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Container(
            width: 45.w,
            height: 45.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 26,
              ),
            ),
          ),
        ),
        // Hubungkan search bar di AppBar ke controller
        title: SearchBarWidget(
          hintText: "Cari produk di toko ini...",
          controller: controller.searchController,
          focusNode: controller.searchFocusNode,
          autofocus: true,
          onChanged: controller.performSearch,
          onSubmitted: controller.performSearch,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(35.w, 65.h, 30.w, 30.h),
          child: Column(
            children: [
              Obx(() {
                if (!controller.isSearching.value) {
                  return const SizedBox.shrink(); // KOSONG
                }

                // NO PRODUCT FOUND
                if (controller.searchResults.isEmpty) {
                  return Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 300.h, 0.w, 0.h),
                      child: NoSearchResultWidget(
                          query: controller.searchQuery.value));
                }

                // Jika sedang mencari dan ada hasilnya
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    final product = controller.searchResults[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      // Tampilkan data produk menggunakan ProductBox
                      child: ProductBox(
                        productImage: product.productImage,
                        productName: product.productName,
                        productDescription: product.productDescription,
                        productPrice: product.productPrice,
                        onButtonPressed: () {
                          cartController.addToCart(
                              controller.storeName.value, product.productPrice);
                        },
                        onNotesTap: () => Get.bottomSheet(MainBottomSheet(
                          controller: checkoutController,
                          buttonText: "Simpan dan tambahkan",
                          hintText: "Contoh: berikan cabe yang masih bagus",
                          titleText:
                              "Tambahkan catatan untuk produk yang mau kamu beli",
                        )),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
