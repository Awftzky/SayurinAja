import 'package:get/get.dart';
import 'package:sayurinaja/App/features/auth/controller/forgot/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}