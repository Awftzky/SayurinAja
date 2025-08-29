import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/recommendation/controllers/recommendation_controller.dart';
import 'package:sayurinaja/App/shared/widgets/recommendation/box/recommendation_box.dart';

class RecommendationPage extends GetView<RecommendationController> {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Rekomendasi buat kamu",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 46.h),

              Obx(() {
                final products = controller.recommendationProducts;
                return Column(
                  children: List.generate(
                    products.length.clamp(0, 3),
                        (index) => Column(
                      children: [
                        RecommendationProductBox(product: products[index]),
                        SizedBox(height: 46.h),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
