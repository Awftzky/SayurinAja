import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin OtpControllerMixin on GetxController {
  // LENGTH
  int get otpLength;

// CONDITION
  late List<TextEditingController> textControllers;
  late List<FocusNode> focusNodes;
  late List<RxBool> isFocused;
  late List<RxBool> isFilled;
  late RxBool hasError;

  void initOtpFields() {
    textControllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    isFocused = List.generate(otpLength, (_) => false.obs);
    isFilled = List.generate(otpLength, (_) => false.obs);
    hasError = false.obs; 

    for (var i = 0; i < otpLength; i++) {
      // listener fokus
      focusNodes[i].addListener(() {
        isFocused[i].value = focusNodes[i].hasFocus;
      });

      // listener isi
      textControllers[i].addListener(() {
        isFilled[i].value = textControllers[i].text.isNotEmpty;
        if (textControllers[i].text.isNotEmpty && hasError.value) {
          hasError.value = false;
        }
      });
    }
  }

  void onInputChanged(int index, String value) {
    isFilled[index].value = value.isNotEmpty;

    // Clear error when user types
    if (value.isNotEmpty && hasError.value) {
      hasError.value = false;
    }

    // auto pindah ke field berikutnya
    if (value.isNotEmpty && index < otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
    // auto balik ke field sebelumnya kalau kosong
    else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  // New method to set error state
  void setErrorState(bool error) {
    hasError.value = error;
  }

  String getOtp() => textControllers.map((c) => c.text).join();

  void clearOtp() {
    for (var c in textControllers) {
      c.clear();
    }
    hasError.value = false; // Clear error when clearing OTP
  }

  void disposeOtpFields() {
    for (var c in textControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
  }
}
