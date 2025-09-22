import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart'; // Pastikan path import warna benar

class SearchHistoryWidget extends StatelessWidget {
  final List<String> history;
  final void Function(String) onSelect;
  final void Function(String) onRemove;

  const SearchHistoryWidget({
    super.key,
    required this.history,
    required this.onSelect,
    required this.onRemove,
  });
  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Riwayat kamu dibawah ini',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 12.h),
          // CONTAINER MENYESUAIKAN
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: history.map((item) {
              // LOGIC MEMBUAT ITEM MENJADI CONTAINER
              return Container(
                height: 32.h,
                padding: EdgeInsets.only(left: 16.w, right: 8.w),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                // ITEM DALAM CONTAINER
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      // TAPPED TEXT
                      onTap: () => onSelect(item),
                      child: Text(
                        item,
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    IconButton(
                      // DELETE ICON
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      iconSize: 16.sp,
                      icon: Icon(Icons.close, color: AppColors.darkGray),
                      onPressed: () => onRemove(item),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
