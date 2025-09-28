import 'package:get/get.dart';
import 'package:flutter/material.dart';
// 1. Tambahkan import untuk Font Awesome
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sayurinaja/App/shared/models/navigation/navigation_models.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final PageController pageController = PageController();

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// daftar item navbar dengan ikon Font Awesome
  final List<NavigationModels> items = [
    NavigationModels(
      label: "Beranda",
      icon: FontAwesomeIcons.house,
      selectedIcon: FontAwesomeIcons.house,
    ),
    NavigationModels(
      label: "Aktivitas",
      icon: Icons.access_time_outlined,
      selectedIcon: Icons.access_time_outlined,
    ),
    NavigationModels(
      label: "Pesan",
      icon: Icons.chat_outlined,
      selectedIcon: Icons.chat_outlined,
    ),
    NavigationModels(
      label: "Pengaturan",
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_outlined,
    ),
  ];
}
