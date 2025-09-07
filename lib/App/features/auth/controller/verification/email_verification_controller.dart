import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/mixins/otp_controller_mixin.dart';

class EmailVerificationController extends GetxController
    with OtpControllerMixin {
  /// VERIFICATION CONTROLLER
  final forgotVerificationCode = TextEditingController();

  @override
  final otpLength = 4; // Panjang Box controller

  // LIFECYCLE WIDGET
  @override
  void onInit() {
    super.onInit();
    initOtpFields();
  }

  @override
  void onClose() {
    forgotVerificationCode.dispose();
    disposeOtpFields();
  }
}
