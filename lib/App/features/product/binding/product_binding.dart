import 'package:get/get.dart';
import 'package:sayurinaja/App/features/product/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
