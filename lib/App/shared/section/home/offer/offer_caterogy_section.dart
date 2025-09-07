import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/box/offer_store_box.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class OfferCategorySection extends GetView<HomeController> {
  const OfferCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final offerCategories = controller.offerCategories;
      if (offerCategories.isEmpty) return const SizedBox.shrink();

      final pageController = PageController(viewportFraction: 1.0);

      return SizedBox(
        height: 176.h,
        child: PageView.builder(
          itemCount: offerCategories.length,
          controller: pageController,
          onPageChanged: (index) {
            controller.offerCurrentPage.value = index;
          },
          itemBuilder: (context, index) {
            final offer = offerCategories[index];

            return Center(
              child: OfferProductBox(
                product: Product(
                  name: "", // dummy karena hanya perlu image
                  image: offer.imagePath,
                  price: 0,
                  category: "",
                  store: "",
                ),
                width: 352.w,
                height: 176.h,
                discountText: offer.discountText,
                titleText: offer.categoryText,
                descriptionText: offer.descriptionText,
                totalPages: offerCategories.length,
                currentPage: controller.offerCurrentPage.value,
                onTap: () {},
              ),
            );
          },
        ),
      );
    });
  }
}
