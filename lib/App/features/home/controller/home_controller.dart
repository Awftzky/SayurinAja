import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/shared/animation/tutorial/tutorial_service.dart';

class HomeController extends GetxController {
  var username = "Aufa".obs;
  var location = "Bandung , Jawa Barat".obs;
  var shops = <String>["Toko A", "Toko B", "Toko C"].obs;
  final searchController = TextEditingController();

  final GlobalKey usernameKey = GlobalKey();
  final GlobalKey searchBarKey = GlobalKey();
  final GlobalKey categoryKey = GlobalKey();
  final GlobalKey tokoPetaniKey = GlobalKey();

  late TutorialService tutorialService;

  @override
  void onInit() {
    super.onInit();
    tutorialService = TutorialService();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void startTutorial(BuildContext context) {
    tutorialService.clearTargets();

    /// TODO : TAMBAHKAN DISINI UNTUK TUTORIAL
    tutorialService.addTarget(
          key: usernameKey,
          description: "Nama Kamu akan terpampang di Halaman Utama",
        );

    tutorialService.addTarget(
      key: searchBarKey,
      description: "Cari sayuran segar di sini",
    );
    tutorialService.addTarget(
      key: categoryKey,
      description: "Pilih kategori favoritmu",
    );
    tutorialService.addTarget(
      key: tokoPetaniKey,
      description: "Belanja langsung dari petani",
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tutorialService.showIntro(context);
    });
  }
}
