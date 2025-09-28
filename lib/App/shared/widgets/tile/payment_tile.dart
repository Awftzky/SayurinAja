// lib/app/shared/widgets/payment/payment_method_tile.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/models/payment/payment_method_model.dart';

class PaymentTile extends StatelessWidget {
  final PaymentMethodModel method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentTile({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile sangat cocok untuk layout seperti ini
    return ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),

        // Ikon di sebelah kiri
        leading: SizedBox(
          width: 40.w,
          height: 40.h,
          child: Image.asset(
            method.iconPath,
            fit: BoxFit.contain,
          ),
        ),
        // Teks Judul
        title: Text(
          method.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: isSelected ? AppColors.black : Colors.black87,
          ),
        ),
        trailing: Icon(FontAwesomeIcons.chevronRight));
  }
}
