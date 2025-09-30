import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/widgets/box/offer_caterogy_box.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';

class OfferCategorySection extends GetView<HomeController> {
  const OfferCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final offerCategories = controller.offerCategories;
      if (offerCategories.isEmpty) return const SizedBox.shrink();

      return SizedBox(
        height: 176.h,
        child: PageView.builder(
          itemCount: offerCategories.length,
          controller: controller.offerPageController,
          onPageChanged: (index) {
            controller.offerCurrentPage.value = index;
          },
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final offer = offerCategories[index];

            return Center(
              child: OfferCaterogyBox(
                width: 352.w,
                height: 176.h,
                imagePath: offer.imagePath,
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
