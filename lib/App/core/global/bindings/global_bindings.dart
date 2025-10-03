import 'package:get/get.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';
import 'package:sayurinaja/App/features/location/controller/location_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.lazyPut<LocationController>(() => LocationController(), fenix: true);
  }
}
