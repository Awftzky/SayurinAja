import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';

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

  const HeaderFeature({
    super.key,
    required this.username,
    required this.location,
    required this.imagePath,
    this.onAvatarTap,
    this.showSearchBar = false,
    this.searchBarKey,
    this.searchController,
    this.onSearchSubmit,
    this.usernameKey
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16),
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
                      key:  usernameKey,
                      "Hallo, $username!",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    const Text(
                      "Selamat datang di sayurin aja!",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.red, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(fontSize: 14),
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: searchBarKey,
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Cari sayur, buah, daging...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onSearchSubmit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(14),
                  ),
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
