import 'package:get/get.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(() => StoreController());
  }
}
