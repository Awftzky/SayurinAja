import 'package:sayurinaja/App/features/recommendation/controllers/recommendation_controller.dart';
import 'package:get/get.dart';

class RecommendationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendationController>(() => RecommendationController() , fenix: true);
  }
}