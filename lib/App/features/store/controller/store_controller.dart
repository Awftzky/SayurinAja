import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';
import 'package:flutter/material.dart';

class StoreController extends GetxController {
  var allStore = <StoreModel>[].obs;
  final searchStoreController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadStoreData();
  }

  @override
  void onClose() {
    searchStoreController.dispose();
    super.onClose;
  }

  /// DUMMY DATA STORE
  void loadStoreData() {
    allStore.value = [
      StoreModel("assets/images/anggastore.jpeg", "Toko Angga Jaya!",
          "Bandung , Jawa barat", "5.0 (1 Review)"),
      StoreModel("assets/images/maximstore.jpeg", "Toko Maxim Jaya",
          "Bandung , Jawa barat", "5.0 (1 Review)"),
    ];
  }
}
