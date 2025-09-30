import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class StoreDetailsController extends GetxController {
  // ========== DEPENDENCIES ==========
  // CartController akan di-inject via binding

  // ========== STATE ==========
  final Rx<StoreModel?> currentStore = Rx<StoreModel?>(null);
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;

  // Product categories
  final vegetableProducts = <Product>[].obs;
  final fruitProducts = <Product>[].obs;
  final meatProducts = <Product>[].obs;

  // Search
  final searchQuery = ''.obs;
  final filteredProducts = <Product>[].obs;

  // ========== CONTROLLERS ==========
  late final TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    _loadStoreData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // ========== INITIALIZATION ==========
  void _initializeControllers() {
    searchController = TextEditingController();
  }

  void _loadStoreData() {
    // Get store from arguments
    final store = Get.arguments as StoreModel?;
    if (store != null) {
      currentStore.value = store;
      _loadProducts(store.storeName);
    } else {
      hasError.value = true;
      errorMessage.value = 'Store data not found';
    }
  }

  // ========== PRODUCT LOADING ==========
  Future<void> _loadProducts(String storeName) async {
    try {
      isLoading.value = true;
      hasError.value = false;

      // TODO: Replace with actual API call
      await Future.delayed(const Duration(milliseconds: 500));

      // Load products by category
      vegetableProducts.value = _getVegetableProducts(storeName);
      fruitProducts.value = _getFruitProducts(storeName);
      meatProducts.value = _getMeatProducts(storeName);
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'Failed to load products: $e';
      debugPrint('Error loading products: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // ========== DUMMY DATA (Replace with API) ==========
  List<Product> _getVegetableProducts(String storeName) {
    return [
      Product(
        productName: "Cabe Merah",
        productImage: "assets/images/chili.jpeg",
        productDescription: "Cabe merah berkualitas dari $storeName",
        productPrice: 22000,
        storeName: storeName,
      ),
      Product(
        productName: "Tomat",
        productImage: "assets/images/tomato.jpeg",
        productDescription: "Tomat segar dari $storeName",
        productPrice: 15000,
        storeName: storeName,
      ),
    ];
  }

  List<Product> _getFruitProducts(String storeName) {
    return [
      Product(
        productName: "Jeruk",
        productImage: "assets/images/orange.jpeg",
        productDescription: "Jeruk segar dan manis dari $storeName",
        productPrice: 20000,
        storeName: storeName,
      ),
    ];
  }

  List<Product> _getMeatProducts(String storeName) {
    return [
      Product(
        productName: "Daging Sapi",
        productImage: "assets/images/beef.jpeg",
        productDescription: "Daging sapi segar dari $storeName",
        productPrice: 52500,
        storeName: storeName,
      ),
    ];
  }

  // ========== SEARCH ==========
  void onSearchChanged(String query) {
    searchQuery.value = query;
    _filterProducts();
  }

  void _filterProducts() {
    if (searchQuery.value.isEmpty) {
      filteredProducts.clear();
      return;
    }

    final allProducts = [
      ...vegetableProducts,
      ...fruitProducts,
      ...meatProducts,
    ];

    filteredProducts.value = allProducts.where((product) {
      return product.productName
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  // ========== REFRESH ==========
  Future<void> refreshStore() async {
    if (currentStore.value != null) {
      await _loadProducts(currentStore.value!.storeName);
    }
  }

  // ========== GETTERS ==========
  bool get hasProducts {
    return vegetableProducts.isNotEmpty ||
        fruitProducts.isNotEmpty ||
        meatProducts.isNotEmpty;
  }

  int get totalProducts {
    return vegetableProducts.length +
        fruitProducts.length +
        meatProducts.length;
  }
}
