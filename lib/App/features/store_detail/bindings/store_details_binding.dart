import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store_detail/controller/store_details_controller.dart';

class StoreDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreDetailsController>(() => StoreDetailsController());
  }
}
