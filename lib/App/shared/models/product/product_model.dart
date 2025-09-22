class Product {
  final String productName;
  final String productImage;
  final String productDescription;
  final double productPrice;
  final String? productCaterogy;

  Product({
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
    this.productCaterogy = "",
  });
}
