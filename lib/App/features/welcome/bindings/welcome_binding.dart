import 'package:get/get.dart';
import 'package:sayurinaja/App/features/welcome/controller/welcoming_controller.dart';

class WelcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomingController>(() => WelcomingController());
  }
}