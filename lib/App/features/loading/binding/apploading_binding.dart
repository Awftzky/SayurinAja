import 'package:get/get.dart';
import 'package:sayurinaja/App/features/loading/controller/apploading_controller.dart';

class AppLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppLoadingController>(() => AppLoadingController());
  }
}
