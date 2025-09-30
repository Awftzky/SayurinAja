import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/widgets/search/fake_search_bar.dart';
import 'package:get/get.dart';

class HeaderFeature extends StatelessWidget {
  final String username;
  final String location;
  final String imagePath;
  final VoidCallback? onAvatarTap;

  /// 🔍 Search bar
  final bool showSearchBar;
  final TextEditingController? searchController;
  final VoidCallback? onSearchSubmit;
  final GlobalKey? usernameKey;
  final GlobalKey? locationKey;
  final GlobalKey? profilePhotoKey;
  final GlobalKey? searchBarKey;

  const HeaderFeature({
    super.key,
    required this.username,
    required this.location,
    required this.imagePath,
    this.onAvatarTap,
    this.showSearchBar = false,
    this.searchController,
    this.onSearchSubmit,
    this.usernameKey,
    this.locationKey,
    this.profilePhotoKey,
    this.searchBarKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppGradients.onboarding,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r),
        ),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ===== TOP HEADER =====
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key: usernameKey,
                      "Hallo, $username!",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    SizedBox(height: 2.h),
                    const Text(
                      "Selamat datang di sayurin aja!",
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      key: locationKey, // ✅ Tutorial key
                      children: [
                        const Icon(Icons.location_on,
                            color: AppColors.white, size: 30),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                              fontSize: 10.sp, color: AppColors.primary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onAvatarTap,
                key: profilePhotoKey,
                child: SizedBox(
                  height: 70.h,
                  width: 69.w,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
            ],
          ),

          /// ===== SEARCH BAR =====
          if (showSearchBar) ...[
            SizedBox(height: 20.h),
            Center(
              // FAKE SEACH BAR , NAVIGATE KE SEARCH PAGE
              child: FakeSearchBar(
                key: searchBarKey,
                onTap: () => Get.toNamed(Routes.ALLSTORE),
                hintText: "Cari yang kamu butuhkan disini ya",
                height: 40.h,
                width: 347.w,
              ),
            ),
            SizedBox(height: 10.h)
          ],
        ],
      ),
    );
  }
}
