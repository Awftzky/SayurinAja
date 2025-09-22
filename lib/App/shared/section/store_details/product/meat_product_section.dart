import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/product/controller/product_controller.dart';
import 'package:sayurinaja/App/shared/widgets/box/product_box.dart';

class MeatProductSection extends GetView<ProductController> {
  const MeatProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.allMeatProducts;
      if (product.isEmpty) return const SizedBox.shrink();

      return SizedBox(
        height: 115.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (_, index) {
            final products = product[index];
            return ProductBox(
                productImage: products.productImage,
                productName: products.productName,
                productDescription: products.productDescription,
                productPrice: products.productPrice);
          },
        ),
      );
    });
  }
}
