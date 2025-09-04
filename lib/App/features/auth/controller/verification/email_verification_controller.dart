import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  // list controller & focus per box
  final List<TextEditingController> textControllers = [];
  final List<FocusNode> focusNodes = [];

  // state warna tiap box
  final RxList<bool> isFocused = <bool>[].obs;
  final RxList<bool> isFilled = <bool>[].obs;

  void initFields(int length) {
    textControllers.clear();
    focusNodes.clear();
    isFocused.clear();
    isFilled.clear();

    for (int i = 0; i < length; i++) {
      textControllers.add(TextEditingController());
      focusNodes.add(FocusNode());

      isFocused.add(false);
      isFilled.add(false);

      // listener focus
      focusNodes[i].addListener(() {
        isFocused[i] = focusNodes[i].hasFocus;
      });

      // listener isi
      textControllers[i].addListener(() {
        isFilled[i] = textControllers[i].text.isNotEmpty;
      });
    }
  }

  @override
  void onClose() {
    for (var c in textControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }
}
