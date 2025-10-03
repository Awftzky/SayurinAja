import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Simple Cart Controller - Counter Only (For Dummy/Prototype)
/// ⚠️ NOTE: This version only tracks count, not actual products
class CartController extends GetxController {
  // ========== STATE ==========
  final RxInt _totalItems = 0.obs;
  final RxDouble _totalPrice = 0.0.obs;
  final RxString _selectedStoreName = "".obs;
  final RxBool _isCartVisible = false.obs;

  // ========== GETTERS ==========
  int get totalItems => _totalItems.value;
  double get totalPrice => _totalPrice.value;
  String get selectedStoreName => _selectedStoreName.value;
  bool get isCartVisible => _isCartVisible.value;
  bool get isEmpty => _totalItems.value == 0;
  bool get isNotEmpty => _totalItems.value > 0;

  // ========== ADD TO CART ==========

  /// Add item to cart with store validation
  void addToCart(String storeName, double productPrice, {String? productName}) {
    // First item or same store
    if (_totalItems.value == 0 || _selectedStoreName.value == storeName) {
      _addItem(storeName, productPrice, productName);
    } else {
      // Different store - show confirmation dialog
      _showStoreChangeDialog(storeName, productPrice, productName);
    }
  }

  /// Internal add item method
  void _addItem(String storeName, double productPrice, String? productName) {
    _selectedStoreName.value = storeName;
    _totalItems.value++;
    _totalPrice.value += productPrice;
    _isCartVisible.value = true;

    // Optional feedback
    if (productName != null) {
      Get.snackbar(
        "Ditambahkan",
        "$productName ditambahkan ke keranjang",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(10),
        backgroundColor: Colors.green.shade100,
      );
    }
  }

  // ========== REMOVE FROM CART ==========

  void removeItem(double productPrice) {
    if (_totalItems.value > 0) {
      _totalItems.value--;
      _totalPrice.value -= productPrice;

      // Hide cart if empty
      if (_totalItems.value == 0) {
        hideCart();
        _selectedStoreName.value = "";
      }
    }
  }

  // ========== CLEAR CART ==========

  /// Clear all items from cart
  void clearCart() {
    _totalItems.value = 0;
    _totalPrice.value = 0.0;
    _isCartVisible.value = false;
    _selectedStoreName.value = "";
  }

  // ========== VISIBILITY ==========

  /// Hide cart UI (without clearing)
  void hideCart() {
    _isCartVisible.value = false;
  }

  /// Show cart UI
  void showCart() {
    if (_totalItems.value > 0) {
      _isCartVisible.value = true;
    }
  }

  // ========== DIALOG ==========

  /// Show confirmation dialog when switching stores
  void _showStoreChangeDialog(
      String newStoreName, double productPrice, String? productName) {
    Get.dialog(
      AlertDialog(
        title: const Text("Ganti Toko"),
        content: Text(
          "Keranjang Anda berisi $_totalItems item dari $_selectedStoreName. "
          "Mengganti toko akan mengosongkan keranjang.",
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              clearCart();
              _addItem(newStoreName, productPrice, productName);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text("Ya, Ganti"),
          ),
        ],
      ),
    );
  }

  // ========== UTILITY ==========

  /// Update total price (useful for manual adjustments)
  void updateTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  /// Update total items (useful for manual adjustments)
  void updateTotalItems(int newCount) {
    _totalItems.value = newCount;

    if (newCount == 0) {
      hideCart();
      _selectedStoreName.value = "";
    }
  }

  // ========== DEBUG ==========

  /// Print cart info for debugging
  void printCartInfo() {
    debugPrint('🛒 Cart Info:');
    debugPrint('  Store: $_selectedStoreName');
    debugPrint('  Items: $_totalItems');
    debugPrint('  Total Price: Rp ${_totalPrice.value.toStringAsFixed(0)}');
    debugPrint('  Visible: $_isCartVisible');
  }
}
