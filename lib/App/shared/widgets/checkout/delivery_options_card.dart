// lib/app/shared/widgets/checkout/delivery_option_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/models/checkout/delivery_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DeliveryOptionCard extends StatelessWidget {
  final DeliveryModels option;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  // Helper untuk format harga
  String _formatPrice(double price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 12.h, bottom: 10.h, right: 42),
        decoration: BoxDecoration(
          color: AppColors.transparent,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected
                  ? FontAwesomeIcons.solidCircle
                  : FontAwesomeIcons.circle,
              color: AppColors.primary,
              size: 16.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // REQUIREMENT 1: Nama, Durasi (dalam lingkaran), dan Harga dipisah dalam satu Row
                  Row(
                    children: [
                      Text(
                        option.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10.sp),
                      ),
                      SizedBox(width: 7.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          option.duration,
                          style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                        ),
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        _formatPrice(option.price),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  // REQUIREMENT 2: Deskripsi berada di bawah Row tersebut
                  if (option.description.isNotEmpty)
                    Text(
                      option.description,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w300),
                    ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // REQUIREMENT 3: Ikon di ujung kanan menggantikan harga
            Icon(
              option.name == "Express"
                  ? FontAwesomeIcons.truckFast // truk cepat
                  : FontAwesomeIcons.motorcycle,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
