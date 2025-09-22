import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/cart/cart_model.dart';
import 'package:sayurinaja/App/shared/models/checkout/delivery_models.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';
import 'package:flutter/material.dart';

class CheckoutController extends GetxController {
  // Observable variables
  final RxList<CartModel> cartItems = <CartModel>[].obs;
  final Rx<DeliveryType> selectedDeliveryType = DeliveryType.delivery.obs;
  final RxString selectedLocation = "Bandung, Jawa Barat".obs;
  final RxString deliveryNotes = "".obs;
  final RxString selectedDeliveryOption = "Express".obs;
  final RxString selectedPaymentMethod = "QRIS".obs;

// NOTES PRODUCT

  final notesController = TextEditingController();

  // Delivery options
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
    _loadDummyCartItems();
  }

  /// EXAMPLE CART
  void _loadDummyCartItems() {
    cartItems.addAll([
      CartModel(
        product: Product(
          productName: "Cabe Merah",
          productImage: "assets/images/chili.jpeg",
          productDescription: "Cabe merah berkualitas...",
          productPrice: 22000,
        ),
        quantity: 2,
      ),
      CartModel(
        product: Product(
          productName: "Jeruk",
          productImage: "assets/images/orange.jpeg",
          productDescription: "Jeruk segar dan manis",
          productPrice: 20000,
        ),
        quantity: 3,
      ),
      CartModel(
        product: Product(
          productName: "Daging",
          productImage: "assets/images/beef.jpeg",
          productDescription: "Daging segar berkualitas",
          productPrice: 52500,
        ),
        quantity: 1,
      ),
    ]);
  }

  // Getters
  double get subtotal {
    return cartItems.fold(
        0,
        (sum, product) =>
            sum + (product.product.productPrice * product.quantity));
  }

  double get deliveryFee {
    if (selectedDeliveryType.value == DeliveryType.pickup) return 0;
    return deliveryOptions
        .firstWhere((option) => option.name == selectedDeliveryOption.value)
        .price;
  }

  double get total => subtotal + deliveryFee;

  // Methods
  void selectDeliveryType(DeliveryType type) {
    selectedDeliveryType.value = type;
  }

  void selectDeliveryOption(String option) {
    selectedDeliveryOption.value = option;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  /// METHOD FOR UPDATING PRODUCT QUANTITY IN CART
  void updateProductQuantity(int index, int quantity) {
    if (quantity > 0) {
      cartItems[index].quantity = quantity;
      cartItems.refresh();
    }
  }

  void changeLocation() {
    /// COMING SOON
    Get.toNamed(Routes.COMINGSOON);
  }

  void processOrder() {
    // Logic for processing order
    Get.snackbar("Success", "Pesanan berhasil diproses!");
  }

  void updateProductNotes(int index, String newNotes) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].notes = newNotes.trim().isEmpty ? null : newNotes.trim();

      cartItems.refresh();

      // Tutup dialog/bottom sheet setelah menyimpan
      Get.back();
      Get.snackbar("Sukses", "Catatan berhasil disimpan!");
    }
  }
}
