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

  @override
  void onInit() {
    // ADD LOGIC
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // REGISTER LOGIC - FIXED
  void register() async {
    if (emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
