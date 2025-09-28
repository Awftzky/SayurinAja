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
    final Color selectedLabelColor = AppColors.darkGray;
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
                          indicatorSize: 28,
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // ...
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCubic,
                    left: (itemWidth * selectedIndex) + (itemWidth / 2) - 28.w,
                    top: 6.h,
                    child: IgnorePointer(
                      // UNCLICK CONTAINER
                      child: Container(
                        width: 58.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primary.withOpacity(0.20),
                              AppColors.primary.withOpacity(0.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOutCubic,
                    left: (itemWidth * selectedIndex) + (itemWidth / 2) - 28.w,
                    top: 0,
                    child: Container(
                      width: 58.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary,
                            AppColors.primary,
                            spotlightColor.withOpacity(0.0)
                          ],
                          stops: const [0.0, 0.3, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
