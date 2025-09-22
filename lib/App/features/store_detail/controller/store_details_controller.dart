import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';
import 'package:sayurinaja/App/shared/models/store/store_model.dart';

class StoreDetailsController extends GetxController {
  // ambil instance StoreController yang sudah di-put
  final StoreController storeController = Get.find<StoreController>();

  // contoh: ambil store pertama, atau bisa dikasih index/id lewat arguments
  late final StoreModel selectedStore;

  @override
  void onInit() {
    super.onInit();
    // misal ambil index yang dilempar lewat Get.toNamed arguments
    final int index = Get.arguments ?? 0;
    selectedStore = storeController.allStore[index];
  }
}
