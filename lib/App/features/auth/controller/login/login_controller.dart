// 1. Update LoginController dengan error state
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/models/auth/login_request.dart';
import 'package:sayurinaja/App/core/network/user_service.dart';
import 'package:sayurinaja/App/shared/models/auth/user_response.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final UserService _userService = UserService();

  var isLoading = false.obs;
  var emailError = "".obs;
  var passwordError = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Clear errors when user types
    emailController.addListener(_clearEmailError);
    passwordController.addListener(_clearPasswordError);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _clearEmailError() {
    if (emailError.value.isNotEmpty) {
      emailError.value = "";
    }
  }

  void _clearPasswordError() {
    if (passwordError.value.isNotEmpty) {
      passwordError.value = "";
    }
  }

  void _clearAllErrors() {
    emailError.value = "";
    passwordError.value = "";
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Clear previous errors
    _clearAllErrors();

    // Validation
    if (email.isEmpty || password.isEmpty) {
      if (email.isEmpty) emailError.value = "Email harus diisi";
      if (password.isEmpty) passwordError.value = "Password harus diisi";
      return;
    }

    isLoading.value = true;

    try {
      final request = LoginRequest(email: email, password: password);
      UserResponse response = await _userService.loginAPI(request);

      if (response.isSuccess && response.message != null) {
        Get.offAllNamed(Routes.NAVIGATION); // LOGIN SUCCESS
      } else {
        String errorMsg = response.errorMessage.toLowerCase();

        if (errorMsg.contains("invalid email or password")) {
          emailError.value = "Email yang kamu masukkan tidak terdaftar";
          passwordError.value = "Kata sandi kamu salah";
        } else {
          passwordError.value = "Terjadi kesalahan, coba lagi";
        }
      }
    } catch (e) {
      String errorMsg = e.toString().toLowerCase();

      if (errorMsg.contains("invalid email or password")) {
        emailError.value = "Email yang kamu masukkan tidak terdaftar";
        passwordError.value = "Kata sandi kamu salah";
      } else if (errorMsg.contains("network")) {
        passwordError.value = "Tidak ada koneksi internet";
      } else {
        passwordError.value = "Terjadi kesalahan, coba lagi";
      }
    } finally {
      isLoading.value = false;
    }
  }
}
