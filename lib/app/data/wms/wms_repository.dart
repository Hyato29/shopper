import 'dart:async';

import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
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

  Future<WmsGetProductResource> searchProduct({
    required String searchQuery,
    int page = 1,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/product_scans',
        queryParameters: {
          'q': searchQuery,
          'page': page,
        },
      );

      return WmsGetProductBasicResponse.fromJson(response).data.resource;
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<WmsGetProductResource> addProduct({
    required String productName,
    required String productPrice,
  }) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        path: '/api/product_scans',
        body: {
          'product_name': productName,
          'product_price': productPrice,
        },
      );

      return WmsGetProductBasicResponse.fromJson(response).data.resource;
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<WmsGetBundleResource> getBundles({
    int page = 1,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/bundle', // Endpoint untuk bundle
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
