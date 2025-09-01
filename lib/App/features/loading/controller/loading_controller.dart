import 'package:get/get.dart';
import 'package:sayurinaja/App/routes/app_pages.dart';

class LoadingController extends GetxController {
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // ANIMASI 
    Future.delayed(const Duration(milliseconds: 500), () {
      opacity.value = 1.0;
    });

    /// AUTO NAVIGATION
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(Routes.WELCOME);
    });
  }
}
