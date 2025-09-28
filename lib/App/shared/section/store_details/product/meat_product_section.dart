import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';
import 'package:sayurinaja/App/features/product/controller/product_controller.dart';
import 'package:sayurinaja/App/shared/widgets/box/product_box.dart';

class MeatProductSection extends GetView<ProductController> {
  final String storeName;
  final CartController cartController; // Terima controller dari atas

  const MeatProductSection({
    super.key,
    required this.storeName,
    required this.cartController, // Tambahkan di constructor
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final products = controller.allMeatProducts;
      if (products.isEmpty) return const SizedBox.shrink();

      return SizedBox(
        height: 120.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (_, index) {
            final product = products[index];
            return ProductBox(
                productImage: product.productImage,
                productName: product.productName,
                productDescription: product.productDescription,
                productPrice: product.productPrice,
                storeName: storeName,
                onButtonPressed: () =>
                    cartController.addToCart(storeName, product.productPrice));
          },
        ),
      );
    });
  }
}
