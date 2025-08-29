import 'package:get/get.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController() , fenix: true);
  }
}