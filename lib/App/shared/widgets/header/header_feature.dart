import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class HeaderFeature extends StatelessWidget {
  final String username;
  final String location;
  final String imagePath;
  final VoidCallback? onAvatarTap;

  /// 🔍 Search bar
  final bool showSearchBar;
  final GlobalKey? searchBarKey;
  final TextEditingController? searchController;
  final VoidCallback? onSearchSubmit;

  /// Username
  final GlobalKey? usernameKey;

  const HeaderFeature(
      {super.key,
      required this.username,
      required this.location,
      required this.imagePath,
      this.onAvatarTap,
      this.showSearchBar = false,
      this.searchBarKey,
      this.searchController,
      this.onSearchSubmit,
      this.usernameKey});

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
                      children: [
                        const Icon(Icons.location_on,
                            color: AppColors.white, size: 18),
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
              // optional, supaya search bar di tengah
              child: Container(
                width: 338.w,
                height: 32.h,
                child: TextField(
                  key: searchBarKey,
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, size: 18),
                    hintText: "Cari yang kamu butuhkan di sini ya",
                    hintStyle: TextStyle(
                        color: AppColors.black,
                        fontSize: 8.sp,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
