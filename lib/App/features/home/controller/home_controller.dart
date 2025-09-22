import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sayurinaja/App/core/network/location_service.dart';
import 'package:sayurinaja/App/core/storage/local_storage.dart';
import 'package:sayurinaja/App/shared/animation/tutorial/tutorial_service.dart';
import 'package:sayurinaja/App/shared/models/caterogy/offer_caterogy_model.dart';

class HomeController extends GetxController {
  /// HEADER STATE VARIABEL
  var username = LocalStorage().getUsername().obs;
  var location = LocationService().getCurrentLocation().obs;
  var shops = <String>["Toko A", "Toko B", "Toko C"].obs;

  /// OFFER CATEROGIES STATE VARIABEL
  var offerCategories = <OfferCategoryModel>[].obs;
  var offerCurrentPage = 0.obs;

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
    LoadOfferCaterogy();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // DATA OFFERED CATEROGY
  void LoadOfferCaterogy() {
    offerCategories.value = [
      OfferCategoryModel(
          discountText: "Diskon 5%",
          categoryText: "Daging di semua toko lagi ada Diskon nih",
          descriptionText:
              "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
          imagePath: "assets/images/discountmeat.png"),
      OfferCategoryModel(
          discountText: "Diskon 3%",
          categoryText: "Buah di semua toko lagi ada Diskon nih",
          descriptionText:
              "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
          imagePath: "assets/images/discountfruit.png"),
      OfferCategoryModel(
          discountText: "Diskon 2.5%",
          categoryText: "Sayuran di semua toko lagi ada Diskon nih",
          descriptionText:
              "Buruan di ambil guys sebelum waktunya habis ya, WAJIB!!",
          imagePath: "assets/images/discountvegetable.png"),
    ];
  }

  void startTutorial(BuildContext context) {
    tutorialService.clearTargets();

    /// TODO : TAMBAHKAN DISINI UNTUK TUTORIAL
    tutorialService.addTarget(
      key: usernameKey,
      description:
          "Ini adalah Nama kamu di halaman utama dan bisa kamu ubah kok namanya melalui pengaturan ya tapi",
    );

    tutorialService.addTarget(
      key: searchBarKey,
      description: "Cari sayuran segar di sini",
    );
    // tutorialService.addTarget(
    //   key: categoryKey,
    //   description:
    //       "Kolom ini terdapat 3 kategori bahan makanan, kamu bisa memilih yang kamu inginkan dengan mengkliknya saja",
    // );
    // tutorialService.addTarget(
    //   key: tokoPetaniKey,
    //   description:
    //       "Ini adalah kolom toko petani, dimana kamu bisa melihat dan mencari toko yang terbaik menurut . kamu",
    // );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tutorialService.showIntro(context);
    });
  }
}
