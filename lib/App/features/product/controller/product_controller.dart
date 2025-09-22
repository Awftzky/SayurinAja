import 'package:get/get.dart';
import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class ProductController extends GetxController {
  var allVegetableProducts = <Product>[].obs;
  var allFruitProducts = <Product>[].obs;
  var allMeatProducts = <Product>[].obs;
  var allProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyVegetableProducts();
    loadDummyFruitProducts();
    loadDummyMeatProducts();

    /// ALL PRODUCT
    combineAllProducts();
  }

  void combineAllProducts() {
    allProducts.clear();

    allProducts.addAll([
      // MENGGABUNG SEMUA PRODUCT
      ...allVegetableProducts,
      ...allFruitProducts,
      ...allMeatProducts,
    ]);
  }

  void loadDummyVegetableProducts() {
    allVegetableProducts.value = [
      Product(
          productName: "Cabe Merah",
          productImage: "assets/images/chili.jpeg",
          productDescription:
              "Cabe merah berkualitas yang segar langsung dari petani sayur",
          productPrice: 22000),
      Product(
          productName: "Wortel",
          productImage: "assets/images/carrot.jpeg",
          productDescription:
              "Wortel berkualitas yang segar langsung dari petani sayur",
          productPrice: 18000),
    ];
  }

  void loadDummyFruitProducts() {
    allFruitProducts.value = [
      Product(
          productName: "Jeruk",
          productImage: "assets/images/orange.jpeg",
          productDescription:
              "Jeruk berkualitas yang segar langsung dari petani buah",
          productPrice: 20000),
      Product(
          productName: "Pisang",
          productImage: "assets/images/banana.jpeg",
          productDescription:
              "Pisang berkualitas yang segar langsung dari petani buah",
          productPrice: 19000),
    ];
  }

  void loadDummyMeatProducts() {
    allMeatProducts.value = [
      Product(
          productName: "Daging Sapi",
          productImage: "assets/images/beef.jpeg",
          productDescription:
              "Daging Sapi berkualitas yang segar langsung dari peternak hewan",
          productPrice: 52500),
      Product(
          productName: "Daging Ayam",
          productImage: "assets/images/chicken.jpeg",
          productDescription:
              "Daging Ayam berkualitas yang segar langsung dari peternak hewan",
          productPrice: 45900),
    ];
  }
}
