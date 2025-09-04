import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Rx untuk password baru
  var newPassword = "".obs;

  // Getter validasi password
  bool get hasMinLength => newPassword.value.length >= 8;
  bool get hasNumberAndLetter =>
      newPassword.value.contains(RegExp(r'[A-Za-z]')) &&
          newPassword.value.contains(RegExp(r'[0-9]'));

  @override
  void onInit() {
    super.onInit();
    newPasswordController.addListener(() {
      newPassword.value = newPasswordController.text;
    });
  }
}
