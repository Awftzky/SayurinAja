import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/features/coming_soon/views/coming_soon_page.dart';
import 'package:sayurinaja/App/shared/section/navigation/navigation_bar_section.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:sayurinaja/App/features/home/views/home_page.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    return Scaffold(
      body: PageView(
        controller: navController.pageController,
        onPageChanged: (index) => navController.changeIndex(index),
        children: const [
          HomePage(),
          ComingSoonPage(), // ACTIVITY
          ComingSoonPage(), // CHAT 
          ComingSoonPage() // SETTING
        ],
      ),
      bottomNavigationBar: const NavigationBarSection(),
    );
  }
}
