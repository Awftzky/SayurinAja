import 'package:get/get.dart';
import 'package:flutter/material.dart';
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

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void register() async {
    if (emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
          // ERROR MESSAGE
          'Error',
          "Semua field harus diisi",
          icon: Icon(Icons.error_outline),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
          duration: Duration(seconds: 2));
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

      if (response.succeed != null && response.succeed!.isNotEmpty) {
        Get.toNamed(Routes.EMAILVERIFICATION); // NAVIGATE TO EMAIL VERIFICATION
        await LocalStorage().setUsername(usernameController.toString());

      } else {
        Get.snackbar("Gagal", response.error!);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
