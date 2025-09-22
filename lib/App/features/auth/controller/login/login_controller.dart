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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password harus diisi',
        icon: Icon(Icons.error_outline),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    isLoading.value = true;

    try {
      final request = LoginRequest(email: email, password: password);
      UserResponse response = await _userService.loginAPI(request);

      if (response.isSuccess && response.message != null) {
        // SUCCESS CASE - Backend returns {"message": "login successfull"}
        Get.snackbar(
          "Sukses",
          "Login berhasil! Selamat datang",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(Routes.NAVIGATION);
      } else {
        // ERROR CASE - Backend returns {"error": "Invalid email or password"}
        Get.snackbar(
          "Login Gagal",
          response.errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      // Handle network/parsing errors
      String errorMsg = e.toString();
      if (errorMsg.contains("Invalid email or password")) {
        errorMsg = "Email atau password salah";
      } else if (errorMsg.contains("Failed login")) {
        errorMsg = "Gagal login. Coba lagi.";
      }

      Get.snackbar(
        "Error",
        errorMsg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
