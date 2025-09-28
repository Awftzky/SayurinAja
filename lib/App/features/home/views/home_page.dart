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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// HEADER TETAP
            HeaderFeature(
              username: homeController.username.value,
              location: homeController.location.toString(),
              imagePath: "assets/images/profile.jpeg",
              onAvatarTap: () {},
              showSearchBar: true,
              searchBarKey: homeController.searchBarKey,
              searchController: homeController.searchController,
              onSearchSubmit: () {},
              usernameKey: homeController.usernameKey,
            ),

            /// KONTEN BAWAH BISA SCROLL
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        "Ada Penawaran Spesial Untuk Kamu Nih",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),
                      OfferCategorySection(),
                      SizedBox(height: 27.h),
                      Text("#Perubahanuntuksemuanya",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 150.h,
                        width: 353.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            "assets/images/homepagebanner.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Row(
                        key: homeController.tokoPetaniKey,
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
                          CategoryRounded(
                              assetImage:
                                  "assets/images/caterogyvegetable.jpeg",
                              label: "Sayuran",
                              onTap: () {}),
                          CategoryRounded(
                              assetImage: "assets/images/caterogyfruit.jpeg",
                              label: "Buah",
                              onTap: () {}),
                          CategoryRounded(
                              assetImage: "assets/images/caterogymeet.jpeg",
                              label: "Daging",
                              onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
            FixedCartContainer(
              onTap: () => Get.toNamed(Routes.CHECKOUT),
            ),
          ],
        ),
      ),
    );
  }
}
