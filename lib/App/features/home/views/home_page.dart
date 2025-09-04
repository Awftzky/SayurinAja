import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

/// SABAR
import 'package:sayurinaja/App/shared/section/home/offer/offer_caterogy_section.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/shared/widgets/header/header_feature.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/section/home/store/farmer_store_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.startTutorial(context);
    });

    return BaseScaffold(
      useGradient: false,
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
                onAvatarTap: () {},

                /// TODO : PROFILE PAGE
                showSearchBar: true,
                searchBarKey: homeController.searchBarKey,
                searchController: homeController.searchController,
                onSearchSubmit: () {},

                /// TODO : SEARCH PAGE
                usernameKey: homeController.usernameKey,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    /// OFFER SECTIONN!!
                    Text(
                      "Ada Penawaran Spesial Untuk Kamu Nih",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),

                    SizedBox(height: 8.h),

                    OfferCategorySection(),

                    /// SECTION CATEROGY OFFER

                    SizedBox(height: 27.h),

                    /// ARTICLE SECTION!

                    Text("#Perubahanuntuksemuanya",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500)),
                    SizedBox(height: 2.h),

                    /// TODO : ARTICLE SAMBUNGAN
                    SizedBox(
                      height: 150.h,
                    ),

                    /// SEMENTARA

                    SizedBox(height: 25.h),

                    /// FARMER STORE SECTION

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Toko Petani",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Lihat semuanya",
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),

                    FarmerStoreSection(),

                    SizedBox(height: 43.h),

                    /// CATEROGY SECTION
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Kategori bahan makanan",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildCategory("assets/veggie.png", "Sayuran",
                            homeController.categoryKey), // ✅ key
                        _buildCategory("assets/fruit.png", "Buah", null),
                        _buildCategory("assets/meat.png", "Daging", null),
                      ],
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
