import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
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

  Future<IdentifyProductResponse> identifyProduct({
    required File imageFile,
  }) async {
    try {
      final String fileName = imageFile.path.split('/').last;
      final FormData formData = FormData.fromMap({
        "image":
            await MultipartFile.fromFile(imageFile.path, filename: fileName),
      });

      final response = await _httpClient.post<Map<String, dynamic>>(
        path: '/api/v1/scan-product',
        body: formData,
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
    double? fixedPrice,
    List<int>? categoryIds,
  }) async {
    try {
      await _httpClient.post(
        path: '/api/v1/product-scans',
        body: {
          'product_name': productName,
          'product_price': productPrice,
          'quantity': quantity,
          'status': status,
          'fixed_price': fixedPrice,
          'category_ids': categoryIds,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
