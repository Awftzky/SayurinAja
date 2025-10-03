import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/mixins/otp_controller_mixin.dart';
import 'package:sayurinaja/App/core/network/user_service.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';
import 'package:sayurinaja/App/core/theme/colors.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/auth/user_response.dart';

class EmailVerificationController extends GetxController
    with OtpControllerMixin {
  final forgotVerificationCode = TextEditingController();
  var otp = "".obs;
  var userEmail = "".obs;
  var username = LocalStorage().getUsername().obs;
  var isLoading = false.obs;

  @override
  final otpLength = 4;

  final UserService _userService = UserService();

  @override
  void onInit() {
    super.onInit();
    // Get OTP and email from arguments
    final arguments = Get.arguments as Map<String, dynamic>?;
    otp.value = arguments?["kode"] ?? "";
    userEmail.value = arguments?["email"] ?? "";
    initOtpFields();
  }

  @override
  void onClose() {
    forgotVerificationCode.dispose();
    disposeOtpFields();
  }

  Future<void> verifyOTP(String inputOtp) async {
    if (inputOtp.length != 4) {
      Get.snackbar("Error", "Kode OTP harus 4 digit");
      return;
    }

    isLoading.value = true;

    try {
      UserResponse response = await _userService.verifyOTP(inputOtp);

      if (response.isSuccess && response.succeed != null) {
        // SUCCESS - Account created
        Get.snackbar(
          "Berhasil",
          "Akun berhasil dibuat! Silakan login",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primary,
          colorText: Colors.white,
        );

        // Navigate to login page
        Get.offAllNamed(Routes.EMAILVERIFICATIONSUCCESS);
      } else {
        // ERROR - Invalid OTP or expired
        String errorMessage = response.errorMessage;
        if (errorMessage.contains("invalid code")) {
          errorMessage = "Kode OTP tidak valid";
        } else if (errorMessage.contains("expired")) {
          errorMessage = "Kode OTP sudah expired";
        }
        setErrorState(true);
      }
    } catch (e) {
      // Set error state on exception
      setErrorState(true);

      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Method untuk dipanggil dari UI ketika user input OTP lengkap
  void onOTPComplete(String completedOTP) {
    verifyOTP(completedOTP);
  }
}
