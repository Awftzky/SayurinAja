import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/store/controller/search_store_controller.dart'; // Import controller baru
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/box/farmer_store_box.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/widgets/search/no_search_result_widget.dart';
import 'package:sayurinaja/App/shared/widgets/search/search_bar_widget.dart';
import 'package:sayurinaja/App/shared/widgets/search/search_history_widget.dart';

class SearchStorePage extends GetView<SearchStoreController> {
  const SearchStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isExtend: false,
      useGradient: false,
      appBar: AppBar(
        title: Text(
          "Selamat mencari toko yang kamu tuju ya",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 23.w),
          child: Container(
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
                color: AppColors.black,
                size: 28,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.transparent,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Search Bar ---
                SearchBarWidget(
                  hintText: "Cari yang kamu butuhkan disini ya",
                  controller: controller.searchController,
                  focusNode: controller.searchFocusNode,
                  autofocus: true,
                  onChanged: controller.updateSearch,
                  onSubmitted: controller.performSearch,
                ),

                SizedBox(height: 16.h),

                // --- Search History ---
                if (!controller.isSearching.value &&
                    controller.searchHistory.isNotEmpty)
                  SearchHistoryWidget(
                    history: controller.searchHistory,
                    onSelect: controller.selectFromHistory,
                    onRemove: controller.removeFromHistory,
                  ),

                SizedBox(height: 16.h),

                // --- Search Result ---
                if (controller.isSearching.value)
                  controller.searchResults.isEmpty
                      ? Center(
                          child: NoSearchResultWidget(
                              query: controller.searchQuery.value))
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            final store = controller.searchResults[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: FarmerStoreBox(
                                imageUrl: store.imagePath,
                                storeName: store.storeName,
                                location: store.storeLocation,
                                starReview: store.starReview,
                                onButtonPressed: () => Get.toNamed(
                                    Routes.STOREDETAILS,
                                    arguments: store),
                              ),
                            );
                          },
                        ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
