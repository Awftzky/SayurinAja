import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/widgets/recommendation/box/recommendation_box.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationScrolledHome extends StatelessWidget {
  final List<Product> products;

  const RecommendationScrolledHome({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = products[index];
          return RecommendationProductBox(
            product: product,
            width: 274.w,
            height: 140.h,
            onTap: () {
              Get.toNamed(Routes.RECOMMENDATION);
            },
          );
        },
      ),
    );
  }
}
