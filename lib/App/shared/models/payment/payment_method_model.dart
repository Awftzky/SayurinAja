class PaymentMethodModel {
  final String id;
  final String name;
  final String iconPath;
  final bool isEnabled;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.iconPath,
    this.isEnabled = true,
  });
}
