import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/core/mixins/otp_controller_mixin.dart';
import 'package:sayurinaja/App/core/network/user_service.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';
import 'package:sayurinaja/App/shared/models/auth/forgot_pw_request.dart';
import 'package:sayurinaja/App/shared/widgets/dialog/setup_dialog.dart';

class ForgotPasswordController extends GetxController with OtpControllerMixin {
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final forgotVerificationCode = TextEditingController();

  // Service instance - menggunakan UserService yang sudah ada
  final _userService = UserService();

  @override
  final int otpLength = 6;
  // Observable variables
  var isLoading = false.obs;
  var newPassword = "".obs;
  var currentStep = 0.obs;
  var userEmail = "".obs;
  var otpCode = "".obs;

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

  /// STEP 1: FORGOT PASSWORD - INSERT EMAIL
  Future<void> sendForgotPasswordRequest() async {
    String email = emailController.text.trim();

    // Validasi input
    if (email.isEmpty || !_isValidEmail(email)) {
      Get.snackbar(
        'Error',
        'Format email tidak valid',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    try {
      final request = ForgotPwRequest(email: email);
      final response = await _userService.forgotPwInsertEmail(request);

      if (response.kode != null) {
        userEmail.value = email;

        otpCode.value = response.kode!;

        currentStep.value = 1;
        Get.snackbar(
          'Berhasil',
          response.message ?? 'OTP berhasil dikirim ke email Anda',
          backgroundColor: Colors.green[100],
          colorText: Colors.green[800],
          snackPosition: SnackPosition.TOP,
        );
        Get.toNamed(Routes.FORGOTPASSWORDVERIFICATION,
            arguments: {"kode": response.kode});
      } else {
        String errorMessage =
            _translateError(response.message ?? 'Gagal mengirim OTP');
        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red[100],
          colorText: Colors.red[800],
          snackPosition: SnackPosition.TOP,
        );
      }
    } on SocketException {
      Get.snackbar(
        'Error',
        'Tidak ada koneksi internet',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

// VERIFY CODE
  Future<void> verifyOtpCode() async {
    String inputOtp = getOtp(); // From OTP mixin

    if (inputOtp.length != 6) {
      Get.snackbar(
        'Error',
        'Masukkan kode OTP lengkap (6 digit)',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    try {
      final request = VerifyOtpRequest(code: inputOtp);
      final response = await _userService.verifyForgotPW(request);

      if (response.message != null) {
        setErrorState(false);
        currentStep.value = 2; // Move to new password step

        Get.snackbar(
          'Berhasil',
          _translateMessage(response.message ?? 'Verifikasi berhasil'),
          backgroundColor: Colors.green[100],
          colorText: Colors.green[800],
          snackPosition: SnackPosition.TOP,
        );
        Get.offNamed(Routes.FORGOTPASSWORDSETUP);
      } else {
        setErrorState(true);
      }
    } on SocketException {
      setErrorState(true);

      Get.snackbar(
        'Error',
        'Tidak ada koneksi internet',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      setErrorState(true);

      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// STEP 3: SET NEW PASSWORD
  /// Menggunakan UserService.newPW()
  Future<void> setNewPassword() async {
    String password = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Client-side validation
    if (password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar(
        'Error',
        'Password tidak boleh kosong',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Konfirmasi password tidak sama',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (!hasMinLength) {
      Get.snackbar(
        'Error',
        'Password minimal 8 karakter',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (!hasNumberAndLetter) {
      Get.snackbar(
        'Error',
        'Password harus mengandung huruf dan angka',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;

    try {
      final request = NewPasswordRequest(
        password: password,
        confirmedPassword: confirmPassword,
      );
      final response = await _userService.newPW(request);

      if (response.message != null) {
        Get.snackbar(
          'Berhasil',
          _translateMessage(response.message ?? 'Password berhasil diubah'),
          backgroundColor: Colors.green[100],
          colorText: Colors.green[800],
          snackPosition: SnackPosition.TOP,
        );
        showCustomDialog();
      } else {
        setErrorState(true);
        String errorMessage =
            _translateError(response.message ?? 'Gagal mengubah password');
        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red[100],
          colorText: Colors.red[800],
          snackPosition: SnackPosition.TOP,
        );
      }
    } on SocketException {
      Get.snackbar(
        'Error',
        'Tidak ada koneksi internet',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      setErrorState(true);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
        snackPosition: SnackPosition.TOP,
      );
      setErrorState(true);
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    currentStep.value = 0;
    userEmail.value = "";
    otpCode.value = "";
    emailController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    forgotVerificationCode.clear();
    clearOtp();
  }

  void goBackToEmailStep() {
    currentStep.value = 0;
    clearOtp();
  }

  void goBackToOtpStep() {
    currentStep.value = 1;
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  String _translateError(String error) {
    switch (error.toLowerCase()) {
      case 'failed to load body':
        return 'Data yang dikirim tidak valid';
      case 'invalid email':
        return 'Email tidak terdaftar';
      case 'invalid code':
        return 'Kode OTP tidak valid';
      case 'code already expired':
        return 'Kode OTP sudah kedaluwarsa';
      case 'confirm password must be the same as your new password':
        return 'Konfirmasi password harus sama';
      case 'failed to hash password':
      case 'failed to change password':
        return 'Gagal mengubah password';
      default:
        return error;
    }
  }

  String _translateMessage(String message) {
    switch (message.toLowerCase()) {
      case 'verify success':
        return 'Verifikasi berhasil';
      case 'your password already changed':
        return 'Password berhasil diubah';
      default:
        return message;
    }
  }
}
