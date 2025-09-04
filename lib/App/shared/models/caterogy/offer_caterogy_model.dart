class OfferCategoryModel {
  final String discountText;    // Contoh : "Diskon 5%"
  final String categoryText;    // Contoh : "Daging"
  final String descriptionText; // Contoh : "Buruan di ambil guys!"
  final String imagePath;       // Path image promosi kategori

  OfferCategoryModel({
    required this.discountText,
    required this.categoryText,
    required this.descriptionText,
    required this.imagePath,
  });
}
