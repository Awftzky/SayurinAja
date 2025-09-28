import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/shared/widgets/button/add_notes.dart';
import 'package:sayurinaja/App/shared/widgets/button/main_button.dart';

class ProductBox extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDescription;
  final double productPrice;
  final VoidCallback? onButtonPressed;
  final String? storeName;
  final VoidCallback? onNotesTap;
  final double width;
  final double height;

  const ProductBox({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    this.storeName,
    this.onButtonPressed,
    this.onNotesTap,
    this.width = 312,
    this.height = 122,
  });

  // Helper untuk format harga
  String _formatPrice(double price) {
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0); // MATA UANG
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Sisi Kiri: Gambar Produk
          Container(
            width: (width * 0.38).w,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                // Tambahkan error builder untuk handle jika gambar tidak ditemukan
                image: AssetImage(productImage),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  // Handle error, misalnya dengan menampilkan placeholder
                },
              ),
            ),
          ),
          SizedBox(width: 17.w),

          // Sisi Kanan: Informasi & Tombol
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5.h, 15.w, 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris 1: Nama Produk dan Harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          productName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${_formatPrice(productPrice)}/kg",
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),

                  // Baris 2: Deskripsi Produk
                  Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Text(
                      productDescription,
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: AppColors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 11.h),

                  // Baris 3: Widget AddNotes
                  Padding(
                      padding: EdgeInsets.only(right: 100.w),
                      child: AddNotes(
                          onTap: () => onNotesTap)), // TAMBAHKAN CATATAN
                  SizedBox(height: 11.h),

                  // Baris 4: Tombol "Tambahkan"
                  MainButton(
                    text: "Tambahkan",
                    width: double.infinity,
                    height: 24.h,
                    textSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    onPressed: onButtonPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
