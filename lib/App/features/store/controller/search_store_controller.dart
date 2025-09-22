import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';

class SearchStoreController extends GetxController {
  final StoreController _storeController = Get.find<StoreController>();

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  final searchResults = <StoreModel>[].obs;
  final searchHistory = <String>[].obs;
  final isSearching = false.obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSearchHistory();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }

  void updateSearch(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }

    isSearching.value = true;

    final results = _storeController.allStore.where((store) {
      final storeName = store.storeName.toLowerCase();
      final storeLocation = store.storeLocation.toLowerCase();
      final searchLower = query.toLowerCase();
      return storeName.contains(searchLower) ||
          storeLocation.contains(searchLower);
    }).toList();

    searchResults.value = results;
  }

  // --- Logika Pencarian ---
  void performSearch(String query) {
    searchQuery.value = query; // Simpan query saat ini

    if (query.isEmpty) {
      isSearching.value = false;
      searchResults.clear();
      return;
    }

    isSearching.value = true;
    _saveToSearchHistory(query);

    // Filter dari daftar toko utama di StoreController
    final results = _storeController.allStore.where((store) {
      final storeName = store.storeName.toLowerCase();
      final storeLocation = store.storeLocation.toLowerCase(); // SEARCH LOKASI
      final searchLower = query.toLowerCase();

      return storeName.contains(searchLower) ||
          storeLocation.contains(searchLower);
    }).toList();

    searchResults.value = results;
  }

  void clearSearch() {
    searchController.clear();
    searchResults.clear();
    isSearching.value = false;
    searchQuery.value = '';
    searchFocusNode.requestFocus(); // Fokuskan kembali ke search bar
  }

  // --- Logika Riwayat Pencarian ---
  void _loadSearchHistory() {
    // Placeholder: Ganti dengan logika dari SharedPreferences atau GetStorage
    // Contoh: searchHistory.value = storage.read('searchHistory') ?? [];
  }

  void _saveToSearchHistory(String query) {
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      searchHistory.insert(0, query);
      if (searchHistory.length > 10) {
        searchHistory.removeLast();
      }
    }
  }

  void selectFromHistory(String historyItem) {
    searchController.text = historyItem;
    searchController.selection = TextSelection.fromPosition(
        TextPosition(offset: historyItem.length)); // Pindahkan kursor ke akhir
    performSearch(historyItem);
  }

  void removeFromHistory(String item) {
    searchHistory.remove(item);
    // TODO: Update local storage
  }
}
