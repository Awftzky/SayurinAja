import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart'; // Sesuaikan path jika perlu

class ProductQuantityControls extends StatelessWidget {
  final int quantity;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  const ProductQuantityControls({
    super.key,
    required this.quantity,
    this.onAdd,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onRemove,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            width: 15.w,
            height: 15.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(31.r),
            ),
            child: Icon(Icons.remove, size: 10.sp, color: AppColors.primary),
          ),
        ),

        // Teks Kuantitas
        SizedBox(
          width: 40.w,
          child: Text(
            "$quantity",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10.sp),
          ),
        ),

        // Tombol Tambah (+)
        InkWell(
          onTap: onAdd,
          borderRadius: BorderRadius.circular(8.r),
          child: Container(
            width: 15.w,
            height: 15.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31.r),
              border: Border.all(color: AppColors.primary),
            ),
            child: Icon(Icons.add, size: 10.sp, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
