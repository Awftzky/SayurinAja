import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store_detail/controller/search_store_details_controller.dart';

class SearchStoreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStoreDetailsController>(
        () => SearchStoreDetailsController());
  }
}
