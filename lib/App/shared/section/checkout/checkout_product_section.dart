import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/shared/widgets/bottom_sheet/main_bottom_sheet.dart';
import 'package:sayurinaja/App/shared/widgets/box/checkout_product_box.dart'; // Ganti nama file jika berbeda

class CheckoutProductSection extends GetView<CheckoutController> {
  const CheckoutProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Container luar untuk styling (opsional, tapi bagus untuk shadow & border radius)
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.cartItems.length,
          padding:
              EdgeInsets.zero, // Menghilangkan padding default dari ListView

          // Garis pemisah antar item
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
          ),

          // Membangun setiap item dalam daftar
          itemBuilder: (context, index) {
            // Ambil item dari controller berdasarkan index
            final cartItem = controller.cartItems[index];

            return CheckoutProductBox(
              cartItem: cartItem,
              onAdd: () => controller.updateProductQuantity(
                  index, cartItem.quantity + 1),
              onRemove: () => controller.updateProductQuantity(
                  index, cartItem.quantity - 1),
              onNotesTap: () {
                Get.bottomSheet(MainBottomSheet(
                  controller: controller,
                  buttonText: "Simpan dan tambahkan",
                  hintText: "Contoh: berikan cabe yang masih bagus",
                  titleText:
                      "Tambahkan catatan untuk produk yang mau kamu beli",
                ));
              },
            );
          },
        ),
      ),
    );
  }
}
