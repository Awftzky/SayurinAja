import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/auth/register_request.dart';
import 'package:sayurinaja/App/core/network/user_service.dart';
import 'package:sayurinaja/App/shared/models/auth/user_response.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final UserService _userService = UserService();

  var isLoading = false.obs;
  var otpCode = "".obs;

  var usernameError = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Clear errors when user types
    usernameController.addListener(_clearUsernameError);
    emailController.addListener(_clearEmailError);
    passwordController.addListener(_clearPasswordError);
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _clearUsernameError() {
    if (usernameError.value.isNotEmpty) {
      usernameError.value = "";
    }
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
    usernameError.value = "";
    emailError.value = "";
    passwordError.value = "";
  }

  // REGISTER LOGIC - FIXED
  void register() async {
    // Clear previous errors
    _clearAllErrors();

    // Validation
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      if (usernameController.text.isEmpty) usernameError.value = "Nama Pengguna harus diisi";
      if (emailController.text.isEmpty) emailError.value = "Email harus diisi";
      if (passwordController.text.isEmpty)passwordError.value = "Kata sandi harus diisi";
      return;
    }

    isLoading.value = true;

    try {
      final request = RegisterRequest(
        email: emailController.text.trim(),
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      UserResponse response = await _userService.registerAPI(request);

      if (response.kode != null && response.kode!.isNotEmpty) {
        otpCode.value = response.kode!;

        await LocalStorage().setUsername(usernameController.text.trim());

        Get.toNamed(
          Routes.EMAILVERIFICATION,
          arguments: {
            "kode": response.kode, // PASS OTP TO VERIFICATION PAGE
            "email": emailController.text.trim(),
          },
        );

        Get.snackbar(
          "Kode OTP Terkirim",
          "Kode verifikasi telah dikirim",
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
        );
      } else if (response.error != null) {
        Get.snackbar("Gagal", response.error!);
      } else {
        Get.snackbar("Gagal", "Terjadi kesalahan tidak diketahui");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
