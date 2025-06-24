import 'dart:async';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/data/wms/model/wms_identify/identify_product_response.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/core.dart';

class WmsApiRepository {
  WmsApiRepository(this._httpClient);

  static final provider = Provider((ref) {
    return WmsApiRepository(
      ref.watch(HttpClient.wmsApiProvider),
    );
  });

  final HttpClient _httpClient;

  Future<ProductScanApiResponse> searchProduct({
    required String searchQuery,
    int page = 1,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/v1/product-scans',
        queryParameters: {
          'q': searchQuery,
          'page': page,
        },
      );
      // Langsung parse menggunakan model baru yang sudah sesuai
      return ProductScanApiResponse.fromJson(response);
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<IdentifyProductResponse> identifyProduct({
    required String imageUrl,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        path: '/api/v1/identify-product',
        body: {'imageUrl': imageUrl},
      );
      return IdentifyProductResponse.fromJson(response);
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/v1/categories',
      );
      final List<dynamic> data = response['data'] as List<dynamic>;
      return data
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveProductScan({
    required String productName,
    required double productPrice,
    required int quantity,
    required String status,
    String? imageUrl,
    double? fixedPrice,
    List<int>? categoryIds,
  }) async {
    try {
      await _httpClient.post(
        path: '/api/v1/product-scans',
        body: {
          'productName': productName,
          'productPrice': productPrice,
          'quantity': quantity,
          'status': status,
          'imageUrl': imageUrl,
          'fixedPrice': fixedPrice,
          'categoryIds': categoryIds,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  // Fungsi getBundles dan lainnya bisa tetap ada jika masih digunakan
  Future<WmsGetBundleResource> getBundles({
    int page = 1,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/bundle',
        queryParameters: {
          'page': page,
        },
      );
      return WmsGetBundleBasicResponse.fromJson(response).data.resource;
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }
}
