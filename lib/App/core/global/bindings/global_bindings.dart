import 'package:get/get.dart';
import 'package:sayurinaja/App/features/cart/controller/cart_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}
