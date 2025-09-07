import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin OtpControllerMixin on GetxController {
  int get otpLength;

  late List<TextEditingController> textControllers;
  late List<FocusNode> focusNodes;
  late List<RxBool> isFocused;
  late List<RxBool> isFilled;

  void initOtpFields() {
    textControllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    isFocused = List.generate(otpLength, (_) => false.obs);
    isFilled = List.generate(otpLength, (_) => false.obs);

    for (var i = 0; i < otpLength; i++) {
      // listener fokus
      focusNodes[i].addListener(() {
        isFocused[i].value = focusNodes[i].hasFocus;
      });

      // listener isi
      textControllers[i].addListener(() {
        isFilled[i].value = textControllers[i].text.isNotEmpty;
      });
    }
  }

  void onInputChanged(int index, String value) {
    isFilled[index].value = value.isNotEmpty;

    // auto pindah ke field berikutnya
    if (value.isNotEmpty && index < otpLength - 1) {
      focusNodes[index + 1].requestFocus();
    }
    // auto balik ke field sebelumnya kalau kosong
    else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String getOtp() => textControllers.map((c) => c.text).join();

  void clearOtp() {
    for (var c in textControllers) {
      c.clear();
    }
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
