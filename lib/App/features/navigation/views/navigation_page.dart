import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/section/navigation/navigation_bar_section.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:sayurinaja/App/features/home/views/home_page.dart';
import 'package:sayurinaja/App/features/chat/views/chat_page.dart';
import 'package:sayurinaja/App/features/setting/views/setting_page.dart';

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
          Center(child: Text("📂 Aktivitas")), /// TODO : ACTIVITY PAGE
          ChatPage(),
          SettingPage()
        ],
      ),
      bottomNavigationBar: const NavigationBarSection(),
    );
  }
}
