import 'package:get/get.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';
import 'package:sayurinaja/App/features/store/controller/search_store_controller.dart';
import 'package:sayurinaja/App/features/store/controller/store_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<SearchStoreController>(() => SearchStoreController());
  }
}
