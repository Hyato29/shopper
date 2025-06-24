// lib/feature/product_detail/product_detail_params.dart

class ProductDetailParams {
  final String productName;
  final double productPrice;
  final String? imageUrl; // Kita tambahkan imageUrl agar bisa diteruskan

  ProductDetailParams({
    required this.productName,
    required this.productPrice,
    this.imageUrl,
  });
}