import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/section/home/offer/offer_caterogy_section.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/shared/widgets/fixed/fixed_cart_widget.dart';
import 'package:sayurinaja/App/shared/widgets/header/header_feature.dart';
import 'package:sayurinaja/App/shared/widgets/scaffold/base_scaffold.dart';
import 'package:sayurinaja/App/shared/section/home/store/farmer_store_section.dart';
import 'package:sayurinaja/App/shared/widgets/rounded/caterogy_rounded.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger tutorial after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.isTutorialShown.value) {
        controller.startTutorial(context);
      }
    });

    return BaseScaffold(
      useGradient: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ========== HEADER SECTION ==========
            _buildHeader(),

            // ========== SCROLLABLE CONTENT ==========
            Expanded(
              child: RefreshIndicator(
                onRefresh: controller.refreshData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        _buildOfferSection(),
                        SizedBox(height: 27.h),
                        _buildBannerSection(),
                        SizedBox(height: 25.h),
                        _buildFarmerStoreSection(),
                        SizedBox(height: 43.h),
                        _buildCategorySection(),
                        SizedBox(height: 80.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ========== FIXED CART ==========
            FixedCartContainer(
              onTap: () => Get.toNamed(Routes.CHECKOUT),
            ),
          ],
        ),
      ),
    );
  }

  // ========== HEADER ==========
  Widget _buildHeader() {
    return Obx(() => HeaderFeature(
          username: controller.username.value,
          location: controller.locationName.value,
          imagePath: "assets/images/profile.jpeg",
          onAvatarTap: () => Get.toNamed(Routes.COMINGSOON),
          showSearchBar: true,
          searchBarKey: controller.searchBarKey,
          searchController: controller.searchController,
          usernameKey: controller.usernameKey,
          locationKey: controller.locationKey,
          profilePhotoKey: controller.profilePhotoKey,
        ));
  }

  // ========== OFFER SECTION ==========
  Widget _buildOfferSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ada Penawaran Spesial Untuk Kamu Nih",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        const OfferCategorySection(),
      ],
    );
  }

  // ========== BANNER SECTION ==========
  Widget _buildBannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#Perubahanuntuksemuanya",
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            "assets/images/homepagebanner.png",
            height: 150.h,
            width: double.infinity,
            fit: BoxFit.cover,
            // Add error handling
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 150.h,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.error_outline, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ========== FARMER STORE SECTION ==========
  Widget _buildFarmerStoreSection() {
    return Column(
      children: [
        Row(
          key: controller.tokoPetaniKey,
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
              onPressed: () => Get.toNamed(Routes.ALLSTORE),
              child: Text(
                "Lihat semuanya",
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h),
        const FarmerStoreSection(),
      ],
    );
  }

  // ========== CATEGORY SECTION ==========
  Widget _buildCategorySection() {
    return Column(
      children: [
        Text(
          "Kategori bahan makanan",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 30.h),
        Row(
          key: controller.categoryKey,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryRounded(
              assetImage: "assets/images/caterogyvegetable.jpeg",
              label: "Sayuran",
              onTap: () => _onCategoryTap('Sayuran'),
            ),
            CategoryRounded(
              assetImage: "assets/images/caterogyfruit.jpeg",
              label: "Buah",
              onTap: () => _onCategoryTap('Buah'),
            ),
            CategoryRounded(
              assetImage: "assets/images/caterogymeet.jpeg",
              label: "Daging",
              onTap: () => _onCategoryTap('Daging'),
            ),
          ],
        ),
      ],
    );
  }

  void _onCategoryTap(String category) {
    // TODO: Navigate to category page
    debugPrint('Category tapped: $category');
  }
}
