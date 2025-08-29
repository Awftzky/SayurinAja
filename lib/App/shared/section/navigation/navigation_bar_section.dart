import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:sayurinaja/App/shared/widgets/navbar/navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationBarSection extends StatelessWidget {
  const NavigationBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    final double navBarHeight = 95.h;
    final double indicatorSize = 48.w;
    const Color navBarBackgroundColor = Colors.white;
    const Color indicatorColor = Colors.green;
    final Color selectedIconColor = Colors.white;
    final Color selectedLabelColor = indicatorColor;
    final Color unselectedItemColor = Colors.grey;

    final screenWidth = MediaQuery.of(context).size.width;
    final itemCount = navController.items.length;
    final itemWidth = screenWidth / itemCount;

    return Obx(() {
      int selectedIndex = navController.selectedIndex.value;

      return Container(
        height: navBarHeight + 16.h,
        color: navBarBackgroundColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeInOut,
              left: (itemWidth * selectedIndex) + (itemWidth - indicatorSize) / 2,
              bottom: 38.h,
              child: Container(
                width: indicatorSize,
                height: indicatorSize,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: indicatorColor.withOpacity(0.18),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    navController.items[selectedIndex].selectedIcon,
                    color: selectedIconColor,
                    size: 26.sp,
                  ),
                ),
              ),
            ),


            // 🔹 item navbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(itemCount, (index) {
                final item = navController.items[index];
                final bool isSelected = selectedIndex == index;

                return Expanded(
                  child: Center(
                    child: NavbarItem(
                      icon: item.icon,
                      selectedIcon: item.selectedIcon,
                      label: item.label,
                      isSelected: isSelected,
                      selectedLabelColor: selectedLabelColor,
                      unselectedItemColor: unselectedItemColor,
                      onTap: () => navController.changePage(index),
                      indicatorSize: indicatorSize,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
