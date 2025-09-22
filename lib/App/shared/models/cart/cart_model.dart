import 'package:sayurinaja/App/shared/models/product/product_model.dart';

class CartModel {
  final Product product;
  int quantity;
  String? notes;

  CartModel({required this.product, this.quantity = 1, this.notes});
}
