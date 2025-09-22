enum DeliveryType { delivery, pickup }

class DeliveryModels {
  final String name;
  final String duration;
  final double price;
  final String description;

  DeliveryModels({
    required this.name,
    required this.duration,
    required this.price,
    required this.description,
  });
}
