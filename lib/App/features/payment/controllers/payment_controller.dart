import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/payment/payment_method_model.dart';

class PaymentController extends GetxController {
  // Observable selected payment method
  final Rx<PaymentMethodModel?> selectedPaymentMethod =
      Rx<PaymentMethodModel?>(null);

  // Available payment methods
  final RxList<PaymentMethodModel> digitalPaymentMethod = <PaymentMethodModel>[
    PaymentMethodModel(
      id: 'qris',
      name: 'QRIS',
      iconPath: 'assets/images/qris.png',
    ),
    PaymentMethodModel(
      id: 'paypal',
      name: 'PayPal',
      iconPath: 'assets/images/paypal.png',
    ),
  ].obs;

  final RxList<PaymentMethodModel> othersPaymentMethod = <PaymentMethodModel>[
    PaymentMethodModel(
      id: 'cash_on_delivery',
      name: 'Bayar di Tempat',
      iconPath: 'assets/images/cashondelivery.png',
    ),
  ].obs;

  List<PaymentMethodModel> get allPaymentMethod =>
      [...digitalPaymentMethod, ...othersPaymentMethod];

  @override
  void onInit() {
    super.onInit();
    if (digitalPaymentMethod.isNotEmpty) {
      selectedPaymentMethod.value = digitalPaymentMethod.first;
    }
  }

  void selectPaymentMethod(PaymentMethodModel method) {
    selectedPaymentMethod.value = method;
    Get.back();
  }

  // Getter for selected payment method name
  String get selectedPaymentMethodName {
    return selectedPaymentMethod.value?.name ?? 'Pilih';
  }

  // Method to navigate to payment method page
  void navigateToPaymentMethodPage() {
    Get.toNamed('/payment-method');
  }
}
