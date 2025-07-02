// lib/feature/product_detail/product_detail_params.dart

class ProductDetailParams {
  final String productName;
  final double productPrice;
  final String? imageUrl;
  final String localImagePath;
  // TAMBAHKAN FIELD INI
  final List<String> listEcomerce; 

  ProductDetailParams({
    required this.productName,
    required this.productPrice,
    this.imageUrl,
    required this.localImagePath,
    // TAMBAHKAN FIELD INI
    this.listEcomerce = const [], 
  });
}