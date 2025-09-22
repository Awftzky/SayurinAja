import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';

// Nama class sudah diganti, tidak akan bentrok lagi.
class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool enabled;
  final bool autofocus;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.onTap,
    this.enabled = true,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      enabled: enabled,
      autofocus: autofocus,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      // --- SEMUA DEKORASI DIKEMBALIKAN KE SINI ---
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12.sp, // Saya sarankan pakai .sp untuk font size
          fontWeight: FontWeight.w300,
          color: AppColors.black,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.black,
          size: 20,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        filled: true,
        fillColor: AppColors.shadowGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.darkGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.darkGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.darkGray),
        ),
      ),
    );
  }
}
