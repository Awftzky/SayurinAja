import 'package:get/get.dart';
import 'package:sayurinaja/App/features/loading/controller/loading_controller.dart';

class LoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
