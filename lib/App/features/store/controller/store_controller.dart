import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';

class StoreController extends GetxController {
  var allStore = <StoreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
   loadStoreData();
  }

  void loadStoreData() {
    allStore.value = [
      StoreModel(
          "",
          "Toko Angga Jaya!",
          "Bandung , Jawa barat",
          "5.0 (1 Review)" /// STAR
      ),

      StoreModel(
          "",
          "Toko Maxim Jaya",
          "Bandung , Jawa barat",
          "5.0 (1 Review)"), /// STAR
    ];
  }
}

