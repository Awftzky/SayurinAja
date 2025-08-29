
class Product {
  final String name;
  final String image;
  final double price;
  final String category;
  final String store;

  Product({
    required this.name,
    required this.image,
    this.price = 0,
    this.category = '',
    this.store = '',
  });
}
