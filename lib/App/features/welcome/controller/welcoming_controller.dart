import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class WelcomingController extends GetxController {
  var currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  final List<String> buttonTexts = [
    'Mulai',
    'Selanjutnya',
    'Selanjutnya',
    'Selanjutnya',
    'Saya Mau jadi yang pertama!'
  ];

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < buttonTexts.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed(Routes.AUTHOPTION);
      }
    }
  }