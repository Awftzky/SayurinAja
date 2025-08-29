import 'package:get/get.dart';
import 'package:sayurinaja/App/features/navigation/controller/navigation_controller.dart';
import 'package:sayurinaja/App/features/recommendation/controllers/recommendation_controller.dart';
import 'package:sayurinaja/App/features/home/controller/home_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<RecommendationController>(() => RecommendationController());
    Get.lazyPut<HomeController>(() => HomeController());

  }
}
