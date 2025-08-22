import 'package:get/get.dart';
import 'package:sayurinaja/App/features/auth/controller/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}