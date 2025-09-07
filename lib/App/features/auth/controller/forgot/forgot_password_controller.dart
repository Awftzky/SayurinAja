import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/mixins/otp_controller_mixin.dart';

class ForgotPasswordController extends GetxController with OtpControllerMixin {
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // VERIFICATION CONTROLLER
  final forgotVerificationCode = TextEditingController();

  @override
  final int otpLength = 6; // PANJANG BOX VERFICATION INPUT
  // Rx untuk password baru
  var newPassword = "".obs;

  // Getter validasi password
  bool get hasMinLength => newPassword.value.length >= 8;
  bool get hasNumberAndLetter =>
      newPassword.value.contains(RegExp(r'[A-Za-z]')) &&
      newPassword.value.contains(RegExp(r'[0-9]'));

  /// LIFECYCLE WIDGET
  @override
  void onInit() {
    super.onInit();
    initOtpFields();
    newPasswordController.addListener(() {
      newPassword.value =
          newPasswordController.text; // SINKRONISASI DATA REAL TIME PASSWORD
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    forgotVerificationCode.dispose();
    disposeOtpFields();
    super.onClose();
  }
}
