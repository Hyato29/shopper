class ProductDetailParams {
  final String productName;
  final double productPrice;
  final String? imageUrl; // Ini akan null, tapi biarkan untuk jaga-jaga
  final String localImagePath; // <-- TAMBAHKAN INI

  ProductDetailParams({
    required this.productName,
    required this.productPrice,
    this.imageUrl,
    required this.localImagePath, // <-- TAMBAHKAN INI
  });
}