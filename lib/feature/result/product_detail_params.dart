class ProductDetailParams {
  final String productName;
  final double productPrice;
  final String? imageUrl;
  final String localImagePath;
  final List<String> listEcomerce;

  ProductDetailParams({
    required this.productName,
    required this.productPrice,
    this.imageUrl,
    required this.localImagePath,
    this.listEcomerce = const [],
  });
}
