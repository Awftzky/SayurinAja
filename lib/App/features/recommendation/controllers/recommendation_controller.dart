import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class RecommendationController extends GetxController {
  var recommendationProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRecommendationProducts();
  }

  void loadRecommendationProducts() {
    recommendationProducts.value = [
      Product(
        name: 'Daging Sapi',
        image: 'assets/images/meat.jpeg',
        price: 27000,
        category: 'Daging',
        store: 'Toko Petani 1',
      ),
      Product(
        name: 'Kentang',
        image: 'assets/images/potato.jpeg',
        price: 7000,
        category: 'Sayur',
        store: 'Toko Petani 2',
      ),
      Product(
        name: 'Sambal kecil',
        image: 'assets/images/chili.jpeg',
        price: 2500,
        category: 'Sayur',
        store: 'Toko Petani 1',
      ),
    ];
  }
}
