import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/cart/cart_model.dart';
import 'package:sayurinaja/App/shared/models/checkout/delivery_models.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

/// Checkout Controller - Works independently with dummy data
/// ✅ Compatible with simple CartController (counter-only)
class CheckoutController extends GetxController {
  // ========== DEPENDENCIES ==========
  CartController? cartController;

  // ========== OBSERVABLE VARIABLES ==========
  final RxList<CartModel> cartItems = <CartModel>[].obs;
  final Rx<DeliveryType> selectedDeliveryType = DeliveryType.delivery.obs;
  final RxString selectedLocation = "Bandung, Jawa Barat".obs;
  final RxString deliveryNotes = "".obs;
  final RxString selectedDeliveryOption = "Express".obs;
  final RxString selectedPaymentMethod = "QRIS".obs;

  // ========== LOADING STATES ==========
  final RxBool isProcessingOrder = false.obs;

  // ========== DELIVERY OPTIONS ==========
  final List<DeliveryModels> deliveryOptions = [
    DeliveryModels(
      name: "Express",
      duration: "20 Menit",
      price: 5000,
      description: "Lebih cepat dan terjamin kesegarannya",
    ),
    DeliveryModels(
      name: "Standar",
      duration: "30 Menit",
      price: 2500,
      description: "",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _initializeDependencies();
    _loadCartData();
  }

  // ========== INITIALIZATION ==========

  void _initializeDependencies() {
    try {
      cartController = Get.find<CartController>();
      debugPrint('✅ CartController found');
    } catch (e) {
      debugPrint('⚠️ CartController not found - will use dummy data only: $e');
      cartController = null;
    }
  }

  void _loadCartData() {
    // ✅ Always use dummy data for prototype
    // CartController only tracks count, not actual products
    _loadDummyCartItems();

    debugPrint('📦 Loaded ${cartItems.length} dummy items');
  }

  /// ✅ DUMMY DATA for prototype/demo
  void _loadDummyCartItems() {
    cartItems.value = [
      CartModel(
        product: Product(
          productName: "Cabe Merah",
          productImage: "assets/images/chili.jpeg",
          productDescription:
              "Cabe merah berkualitas tinggi, segar dari petani lokal",
          productPrice: 22000,
        ),
        quantity: 2,
      ),
      CartModel(
        product: Product(
          productName: "Jeruk",
          productImage: "assets/images/orange.jpeg",
          productDescription: "Jeruk segar dan manis langsung dari kebun",
          productPrice: 20000,
        ),
        quantity: 3,
      ),
      CartModel(
        product: Product(
          productName: "Daging Sapi",
          productImage: "assets/images/beef.jpeg",
          productDescription: "Daging sapi segar berkualitas premium",
          productPrice: 52500,
        ),
        quantity: 1,
      ),
    ];
  }

  // ========== GETTERS ==========

  double get subtotal {
    return cartItems.fold(
      0.0,
      (sum, product) => sum + (product.product.productPrice * product.quantity),
    );
  }

  double get deliveryFee {
    if (selectedDeliveryType.value == DeliveryType.pickup) return 0.0;

    try {
      return deliveryOptions
          .firstWhere((option) => option.name == selectedDeliveryOption.value)
          .price
          .toDouble();
    } catch (e) {
      debugPrint('⚠️ Warning: Delivery option not found');
      return deliveryOptions.first.price.toDouble();
    }
  }

  double get total => subtotal + deliveryFee;

  bool get isCartEmpty => cartItems.isEmpty;

  bool get canProcessOrder {
    return !isCartEmpty &&
        !isProcessingOrder.value &&
        selectedPaymentMethod.value.isNotEmpty;
  }

  int get totalItems {
    return cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  // ========== DELIVERY TYPE ==========

  void selectDeliveryType(DeliveryType type) {
    selectedDeliveryType.value = type;

    // Reset delivery option if switching to pickup
    if (type == DeliveryType.pickup) {
      selectedDeliveryOption.value = "";
    } else if (selectedDeliveryOption.value.isEmpty) {
      selectedDeliveryOption.value = deliveryOptions.first.name;
    }
  }

  // ========== DELIVERY OPTIONS ==========

  void selectDeliveryOption(String option) {
    if (deliveryOptions.any((opt) => opt.name == option)) {
      selectedDeliveryOption.value = option;
    } else {
      debugPrint('⚠️ Warning: Invalid delivery option: $option');
    }
  }

  DeliveryModels? get currentDeliveryOption {
    try {
      return deliveryOptions.firstWhere(
        (opt) => opt.name == selectedDeliveryOption.value,
      );
    } catch (e) {
      return null;
    }
  }

  // ========== PAYMENT ==========

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  // ========== CART MANAGEMENT ==========

  void updateProductQuantity(int index, int quantity) {
    if (index < 0 || index >= cartItems.length) {
      debugPrint('⚠️ Warning: Invalid cart index: $index');
      return;
    }

    if (quantity > 0) {
      cartItems[index].quantity = quantity;
      cartItems.refresh();
    } else {
      removeCartItem(index);
    }
  }

  void removeCartItem(int index) {
    if (index >= 0 && index < cartItems.length) {
      final removedItem = cartItems[index];
      cartItems.removeAt(index);

      Get.snackbar(
        'Dihapus',
        '${removedItem.product.productName} dihapus dari keranjang',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );

      // Navigate back if cart becomes empty
      if (isCartEmpty) {
        Get.back();
      }
    }
  }

  void updateProductNotes(int index, String newNotes) {
    if (index >= 0 && index < cartItems.length) {
      final trimmedNotes = newNotes.trim();
      cartItems[index].notes = trimmedNotes.isEmpty ? null : trimmedNotes;

      cartItems.refresh();

      Get.back();
      Get.snackbar(
        "Sukses",
        "Catatan berhasil disimpan!",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    } else {
      debugPrint('⚠️ Warning: Invalid index for notes update: $index');
    }
  }

  // ========== LOCATION ==========

  void changeLocation() {
    // TODO: Implement location picker
    Get.toNamed(Routes.COMINGSOON);
  }

  void updateDeliveryNotes(String notes) {
    deliveryNotes.value = notes.trim();
  }

  // ========== ORDER PROCESSING ==========

  Future<void> processOrder() async {
    // Validate before processing
    final validationError = _validateOrder();
    if (validationError != null) {
      Get.snackbar(
        'Perhatian',
        validationError,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isProcessingOrder.value = true;

      // Simulate API call
      await _submitOrderToApi();

      // Success
      Get.snackbar(
        "Berhasil!",
        "Pesanan berhasil diproses!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // ✅ Update CartController if available
      if (cartController != null) {
        cartController!.hideCart();
        // Optional: Clear the counter too
        // cartController!.clearCart();
      }

      // Clear local cart items
      cartItems.clear();

      // Navigate back
      Get.back();
    } catch (e) {
      debugPrint('❌ Error processing order: $e');

      Get.snackbar(
        "Error",
        "Gagal memproses pesanan. Silakan coba lagi.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isProcessingOrder.value = false;
    }
  }

  /// Validate order before submission
  String? _validateOrder() {
    if (isCartEmpty) {
      return 'Keranjang belanja kosong';
    }

    if (selectedDeliveryType.value == DeliveryType.delivery) {
      if (selectedLocation.value.isEmpty) {
        return 'Silakan pilih lokasi pengiriman';
      }
      if (selectedDeliveryOption.value.isEmpty) {
        return 'Silakan pilih opsi pengiriman';
      }
    }

    if (selectedPaymentMethod.value.isEmpty) {
      return 'Silakan pilih metode pembayaran';
    }

    return null;
  }

  /// Submit order to API (simulated)
  Future<void> _submitOrderToApi() async {
    await Future.delayed(const Duration(seconds: 2));

    final orderData = {
      'items': cartItems
          .map((item) => {
                'product_name': item.product.productName,
                'quantity': item.quantity,
                'price': item.product.productPrice,
                'notes': item.notes,
              })
          .toList(),
      'delivery_type': selectedDeliveryType.value.toString(),
      'delivery_option': selectedDeliveryOption.value,
      'location': selectedLocation.value,
      'delivery_notes': deliveryNotes.value,
      'payment_method': selectedPaymentMethod.value,
      'subtotal': subtotal,
      'delivery_fee': deliveryFee,
      'total': total,
      'timestamp': DateTime.now().toIso8601String(),
    };
    Get.snackbar(
      "Berhasil",
      "Pesanan anda Telah diproses!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.transparent,
      colorText: Colors.white,
    );
  }

  /// Refresh cart data
  Future<void> refreshCart() async {
    _loadCartData();
  }
}
