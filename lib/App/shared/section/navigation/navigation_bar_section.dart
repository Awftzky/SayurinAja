import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/shared/widgets/navbar/navigation_bar.dart';

class NavigationBarSection extends StatelessWidget {
  const NavigationBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    final double navBarHeight = 50.h;
    const Color navBarBackgroundColor = AppColors.white;
    const Color spotlightColor = Color(0xFF4CAF50);
    final Color selectedIconColor = AppColors.primary;
    final Color selectedLabelColor = spotlightColor;
    final Color unselectedItemColor = AppColors.darkGray;

    final screenWidth = MediaQuery.of(context).size.width;
    final itemCount = navController.items.length;
    final itemWidth = screenWidth / itemCount;

    return SafeArea(
      top: false,
      child: Obx(() {
        int selectedIndex = navController.selectedIndex.value;

        return Container(
          height: navBarHeight + 16.h,
          decoration: BoxDecoration(
            color: navBarBackgroundColor,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // 🔦 SPOTLIGHT EFFECT
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                left: (itemWidth * selectedIndex) + (itemWidth / 2) - 40.w,
                top: -20.h,
                child: Container(
                  width: 80.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1.5,
                      colors: [
                        spotlightColor.withOpacity(0.4),
                        spotlightColor.withOpacity(0.2),
                        spotlightColor.withOpacity(0.05),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ),

              // 🌟 GLOW EFFECT
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                left: (itemWidth * selectedIndex) + (itemWidth / 2) - 30.w,
                top: 20.h,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: spotlightColor.withOpacity(0.3),
                        blurRadius: 20.r,
                        spreadRadius: 5.r,
                      ),
                      BoxShadow(
                        color: spotlightColor.withOpacity(0.2),
                        blurRadius: 30.r,
                        spreadRadius: 10.r,
                      ),
                    ],
                  ),
                ),
              ),

              // 🏠 NAVIGATION ITEMS pakai NavbarItem
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: navBarHeight,
                  child: Row(
                    children: List.generate(itemCount, (index) {
                      final item = navController.items[index];
                      final bool isSelected = selectedIndex == index;

                      return Expanded(
                        child: NavbarItem(
                          icon: item.icon,
                          selectedIcon: item.selectedIcon,
                          label: item.label,
                          isSelected: isSelected,
                          selectedIconColor: selectedIconColor,
                          selectedLabelColor: selectedLabelColor,
                          unselectedItemColor: unselectedItemColor,
                          onTap: () => navController.changePage(index),
                          indicatorSize: 28, // bisa fleksibel
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // ✨ LIGHT BEAM EFFECT
              // ✨ LIGHT BEAM EFFECT (sinkron dengan spotlight)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOutCubic,
                left: (itemWidth * selectedIndex) +
                    (itemWidth / 2) -
                    25.w, // tengahin beam
                top: 0,
                child: Container(
                  width: 50.w,
                  height: 40.h, // lebih tinggi biar nyatu ke bawah
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        spotlightColor.withOpacity(0.6), // terang di atas
                        spotlightColor.withOpacity(0.25),
                        Colors.transparent, // memudar ke bawah
                      ],
                      stops: const [0.0, 0.3, 1.0],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
