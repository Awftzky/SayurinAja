import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class ProductController extends GetxController{
  var allProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyProducts();
  }

  void loadDummyProducts() {
    allProducts.value = [
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
      Product(
        name: 'Apel Merah',
        image: 'assets/images/apple.jpeg',
        price: 12000,
        category: 'Buah',
        store: 'Toko Petani 3',
      ),
    ];
  }
}