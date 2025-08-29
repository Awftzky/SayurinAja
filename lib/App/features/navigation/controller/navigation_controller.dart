import 'package:get/get.dart';
import 'package:flutter/material.dart';
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

  /// daftar item navbar
  final List<NavigationModels> items = [
    NavigationModels(
      label: "Beranda",
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
    NavigationModels(
      label: "Aktivitas",
      icon: Icons.access_time_outlined,
      selectedIcon: Icons.access_time_filled,
    ),
    NavigationModels(
      label: "Pesan",
      icon: Icons.chat_outlined,
      selectedIcon: Icons.chat,
    ),
    NavigationModels(
      label: "Pengaturan",
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
    ),
  ];
}
