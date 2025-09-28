// lib/app/features/cart/controller/cart_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxInt _totalItems = 0.obs;
  final RxDouble _totalPrice = 0.0.obs;
  final RxString _selectedStoreName = "".obs;
  final RxBool _isCartVisible = false.obs;

  int get totalItems => _totalItems.value;
  double get totalPrice => _totalPrice.value;
  String get selectedStoreName => _selectedStoreName.value;
  bool get isCartVisible => _isCartVisible.value;

  void addToCart(String storeName, double productPrice) {
    if (_totalItems.value == 0 || _selectedStoreName.value == storeName) {
      _selectedStoreName.value = storeName;

      _totalItems.value++;
      _totalPrice.value += productPrice;
      _isCartVisible.value = true;
    } else {
      Get.dialog(
        AlertDialog(
          title: const Text("Ganti Toko"),
          content: Text(
              "Keranjang Anda berisi item dari ${_selectedStoreName.value}. Mengganti toko akan mengosongkan keranjang."),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                clearCart();
                addToCart(storeName, productPrice);
                Get.back();
              },
              child: const Text("Ya, Ganti"),
            ),
          ],
        ),
      );
    }
  }

  /// Mengosongkan keranjang (reset semua angka ke nol)
  void clearCart() {
    _totalItems.value = 0;
    _totalPrice.value = 0.0;
    _isCartVisible.value = false;
    _selectedStoreName.value = "";
  }

  /// Hanya untuk menyembunyikan container tanpa mengosongkan isi
  void hideCart() {
    _isCartVisible.value = false;
  }
}
