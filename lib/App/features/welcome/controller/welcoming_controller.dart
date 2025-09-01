import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class WelcomingController extends GetxController {
  var currentPageIndex = 0.obs;
  final PageController pageController = PageController();

  final List<String> buttonTexts = [
    'Selanjutnya',
    'Selanjutnya',
    'Selanjutnya',
    'Saya Mau jadi yang pertama!'
  ];

  final List<String> titleText = [
    'Kami Percaya, Makanan Adalah Jembatan',
    'Janji Kami untuk Dapur Anda',
    'Janji Kami untuk Pahlawan Pangan Kita',
    'Jadilah Bagian dari Pertumbuhan Kami'
  ];

  final List<String> subText = [
    'Jembatan antara kerja keras petani dan senyuman di meja makan Anda. Selamat datang di awal dari sebuah rantai pasok yang lebih adil dan lebih segar.',
    'Sebagai pengguna awal, inilah komitmen kami untuk Anda: Kesegaran tanpa kompromi, Kemudahan yang menghemat waktu Anda, dan Kepercayaan penuh dalam setiap transaksi.',
    'Kami membangun platform ini di atas fondasi Keadilan. Kami berjanji untuk memberikan akses pasar langsung dan menciptakan peluang bagi para petani untuk bertumbuh sejahtera bersama kami.',
    'Anda adalah salah satu orang pertama yang kami undang. Setiap pesanan dan masukan dari Anda akan sangat berarti untuk membantu kami membangun ekosistem ini bersama. Siap memulai perjalanan ini!'
  ];

  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < buttonTexts.length - 1) {
      // Increment the page index manually
      currentPageIndex.value++;
      // Also update the PageController for the indicator
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offNamed(Routes.AUTHOPTION);
    }
  }

  // Add method to go to specific page
  void goToPage(int index) {
    if (index >= 0 && index < buttonTexts.length) {
      currentPageIndex.value = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
