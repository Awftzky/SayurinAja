import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart'; // pastikan ada AppColors

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  Widget _circleButton({
    required String assetPath,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onPressed,
      child: Container(
        width: 53.w,
        height: 53.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.shadowGrey),
          boxShadow: [
            BoxShadow(
              color: AppColors.black20,
              blurRadius: 2.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circleButton(
          assetPath: "assets/images/google.png",
          onPressed: () {
            Get.toNamed(Routes.COMINGSOON);
          },
        ),
        const SizedBox(width: 21),
        _circleButton(
          assetPath: "assets/images/apple.png",
          onPressed: () {
            Get.toNamed(Routes.COMINGSOON);
          },
        ),
      ],
    );
  }
}
