import 'package:get/get.dart';
import 'package:sayurinaja/App/features/auth/controller/verification/email_verification_controller.dart';

class EmailVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailVerificationController>(
        () => EmailVerificationController());
  }
}
