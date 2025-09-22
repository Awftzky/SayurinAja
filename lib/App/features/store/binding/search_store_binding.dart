import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store/controller/search_store_controller.dart';

class SearchStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStoreController>(() => SearchStoreController());
  }
}
