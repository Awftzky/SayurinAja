import 'package:get/get.dart';
import 'package:sayurinaja/App/features/checkout/controller/checkout_controller.dart';
import 'package:sayurinaja/App/features/payment/controllers/payment_controller.dart';

class CheckoutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
