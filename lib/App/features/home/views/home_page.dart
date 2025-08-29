import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/recommendation/recommendation_scrolled_home.dart';
import 'package:sayurinaja/App/features/recommendation/controllers/recommendation_controller.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/shared/widgets/header/header_feature.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecommendationController recController = Get.find<RecommendationController>();
    final HomeController homeController = Get.find<HomeController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.startTutorial(context);
    });

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TODO : UNDER CONSTRUCTION
              HeaderFeature(
                username: homeController.username.value,
                location: homeController.location.value,
                imagePath: "assets/images/diego.png",
                onAvatarTap: () {}, /// TODO : PROFILE PAGE
                showSearchBar: true,
                searchBarKey: homeController.searchBarKey,
                searchController: homeController.searchController,
                onSearchSubmit: () {}, /// TODO : SECARH PAGE
                usernameKey: homeController.usernameKey,
              ),

              const SizedBox(height: 24),

              // ================= REKOMENDASI =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "#Rekomendasi buat kamu",
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.RECOMMENDATION);
                          },
                          child: Text("Lihat semuanya", style: TextStyle(fontSize: 13.sp)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    RecommendationScrolledHome(
                      products: recController.recommendationProducts,
                    ),

                    const SizedBox(height: 24),

                    // ================= KATEGORI =================
                    Text(
                      "Kategori bahan makanan",
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCategory("assets/veggie.png", "Sayuran", homeController.categoryKey), // ✅ key
                        _buildCategory("assets/fruit.png", "Buah", null),
                        _buildCategory("assets/meat.png", "Daging", null),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ================= TOKO PETANI =================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toko Petani",
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                          key: homeController.tokoPetaniKey, // ✅ key
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Lihat semuanya"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (context, index) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 188,
                            height: 119,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text("Toko ${index + 1}"),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildCategory(String asset, String title, Key? key) {
    return Column(
      children: [
        CircleAvatar(
          key: key, // ✅ bisa null kalau bukan target tutorial
          radius: 32,
          backgroundImage: AssetImage(asset),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }
}
