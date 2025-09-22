import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/shared/models/cart/cart_model.dart';
import 'package:sayurinaja/App/shared/widgets_helper/controls/product_quantity_controls.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import ini untuk FontAwesomeIcons

class CheckoutProductBox extends StatelessWidget {
  final CartModel cartItem;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final VoidCallback? onNotesTap;

  const CheckoutProductBox({
    super.key,
    required this.cartItem,
    this.onAdd,
    this.onRemove,
    this.onNotesTap,
  });

  String _formatPrice(double price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    final hasNotes = cartItem.notes != null && cartItem.notes!.isNotEmpty;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align item dari atas
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk & Harga (berjajar tapi berpisah)
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Untuk memisahkan
                  children: [
                    Expanded(
                      child: Text(
                        product.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 10.sp),
                        maxLines: 1, // Agar tidak terlalu panjang
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 6.w), // Jarak antara nama dan harga
                    Text(
                      "${_formatPrice(product.productPrice)}/kg",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 13.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Catatan Aktif (jika ada)
                if (hasNotes)
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(
                      "Catatan: ${cartItem.notes}",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.sp,
                          fontStyle: FontStyle.italic),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                // Tombol "Ubah Catatan"
                // Menggunakan GestureDetector untuk custom button style
                GestureDetector(
                  onTap: onNotesTap, // Terhubung ke callback
                  child: Container(
                    height: 22.h,
                    width: 120.w, // Sesuaikan lebar agar tidak terlalu panjang
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      color: AppColors.shadowGrey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Pusatkan icon dan teks
                      children: [
                        SizedBox(
                          width: 12.w,
                          height: 12.h,
                          child: Image.asset("assets/images/note.png"),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          hasNotes
                              ? "Ubah Catatan"
                              : "Beri Catatan", // Text adaptif
                          style: TextStyle(
                              fontSize: 8.sp, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w), // Jarak antara bagian kiri dan kanan

          // Bagian Kanan: Gambar Produk & Quantity Controls
          Column(
            children: [
              // Gambar
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  width: 70.w, // Ukuran gambar sedikit lebih besar
                  height: 70.h,
                  child: Image.asset(
                    product.productImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.shadowGrey,
                        child: Icon(Icons.image_not_supported,
                            color: Colors.grey[400]),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: 8.h), // Jarak antara gambar dan kontrol kuantitas
              // Quantity Controls
              ProductQuantityControls(
                quantity: cartItem.quantity,
                onAdd: onAdd,
                onRemove: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
