import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';

class OrderSummarySection extends GetView<CheckoutController> {
  const OrderSummarySection({super.key});

  String _formatPrice(double price) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() => Column(
            children: [
              // --- HEADER TABEL DENGAN STRUKTUR KOLOM BARU ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4, // Alokasi ruang untuk "Barang"
                      child: Text(
                        "Barang",
                        // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Qty",
                        textAlign: TextAlign.center,
                        // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ),
                    Expanded(
                      flex: 3, // Alokasi ruang untuk "Harga"
                      child: Text(
                        "Harga",
                        textAlign: TextAlign.right,
                        // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),

              // --- DAFTAR PRODUK DENGAN STRUKTUR KOLOM BARU ---
              ...controller.cartItems.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "${item.product.productName} (kg)",
                            // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "(${item.quantity})",
                            textAlign: TextAlign.center,
                            // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            _formatPrice(
                                item.product.productPrice * item.quantity),
                            textAlign: TextAlign.right,
                            // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  )),
              const Divider(height: 16),
              // Biaya Pengiriman
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Biaya Pengiriman",
                      // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.w300)),
                  Text(
                    _formatPrice(controller.deliveryFee),
                    // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(height: 16),
              // Jumlah Pembayaran
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jumlah Pembayaran",
                      // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 10.sp)),
                  Text(
                    _formatPrice(controller.total),
                    // STYLE FONT TETAP SAMA SEPERTI ASLINYA
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: AppColors.black),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
