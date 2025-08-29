import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: indicatorSize.w,
            height: indicatorSize.w,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.transparent // biar ga ganggu indikator utama
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: isSelected
                ? const SizedBox.shrink() // 🚫 kosong kalau selected
                : Icon(
              icon,
              color: unselectedItemColor,
              size: 28.w,
            ),
          ),
          SizedBox(height: 4.h),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? selectedLabelColor : unselectedItemColor,
            ),
            child: Text(label, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
