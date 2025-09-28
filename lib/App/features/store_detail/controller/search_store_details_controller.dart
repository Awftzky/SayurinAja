import 'package:get/get.dart';
import 'package:sayurinaja/App/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class SearchStoreDetailsController extends GetxController {
  final ProductController _productController = Get.find<ProductController>();

  /// SEARCH CONTROLLER
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final searchResults = <Product>[].obs;
  final searchHistory = <String>[].obs;
  final isSearching = false.obs; // Condition
  final searchQuery = ''.obs; // SAVE TEXT

  @override
  void onInit() {
    super.onInit();
  }

  void performSearch(String query) {
    searchQuery.value = query; // Simpan query saat ini

    if (query.isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }

    isSearching.value = true;

    // Filter dari daftar toko utama di StoreController
    final results = _productController.allProducts.where((product) {
      final storeName = product.productName.toLowerCase();
      final searchLower = query.toLowerCase();

      return storeName.contains(searchLower);
    }).toList();

    searchResults.value = results;
  }
}
