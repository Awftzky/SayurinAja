import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

class OfferCaterogyBox extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  final String discountText;
  final String titleText;
  final String descriptionText;
  final String imagePath;
  final int totalPages;
  final int currentPage;

  const OfferCaterogyBox({
    super.key,
    this.onTap,
    this.width,
    this.height,
    required this.imagePath,
    required this.discountText,
    required this.titleText,
    required this.descriptionText,
    required this.totalPages,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    final double boxWidth = width ?? 274.w;
    final double boxHeight = height ?? 146.h;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: boxWidth,
        height: boxHeight,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: AppGradients.offerBox,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                /// TEXT KIRI
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(21.w, 20.h, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// TEXT DISCOUNT
                        Text(
                          discountText,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          titleText,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 10.50.h),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 60.w, 0),
                          child: Text(
                            descriptionText,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// IMAGE KANAN
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          imagePath), // INISIALISASI DI HOME CONTROLLER
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),

            // ===== PAGE INDICATOR =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                totalPages,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
