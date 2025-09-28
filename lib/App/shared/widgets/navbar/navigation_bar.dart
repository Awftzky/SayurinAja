import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final Color selectedIconColor;
  final Color selectedLabelColor;
  final Color unselectedItemColor;
  final VoidCallback onTap;
  final double indicatorSize;

  const NavbarItem({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.selectedIconColor,
    required this.selectedLabelColor,
    required this.unselectedItemColor,
    required this.onTap,
    required this.indicatorSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🔹 ICON dengan kondisi selected / unselected
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: indicatorSize.w,
            height: indicatorSize.w,
            alignment: Alignment.center,
            child: Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected ? selectedIconColor : unselectedItemColor,
              size: isSelected ? 28.w : 28.w,
            ),
          ),

          SizedBox(height: 4.h),

          // 🔹 LABEL
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: isSelected ? FontWeight.normal : FontWeight.normal,
              color: isSelected ? selectedLabelColor : unselectedItemColor,
            ),
            child: Text(label, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
