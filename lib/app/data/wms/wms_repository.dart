import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/app/data/wms/model/wms_category/wms_category.dart';
import 'package:fskeleton/app/data/wms/model/wms_product/wms_product.dart';
import 'package:fskeleton/core.dart';

class WmsApiRepository {
  WmsApiRepository(this._httpClient);

  static final provider = Provider((ref) {
    return WmsApiRepository(ref.watch(HttpClient.wmsApiProvider));
  });

  final HttpClient _httpClient;

  Future<WmsProductScanResource> searchProduct({
    required String searchQuery,
    int page = 1,
  }) async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/product_scans',
        queryParameters: {
          'q': searchQuery,
          'page': page.toString(),
        },
      );
      final parsedResponse = WmsProductScanResponse.fromJson(response);
      return parsedResponse.data.resource;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveProductScan({
    required String productName,
    required double productPrice,
    required int quantity,
    required String status,
    File? imageFile,
    String? imageUrl,
    double? fixedPrice,
    List<int>? categoryIds,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'product_name': productName,
        'product_price': productPrice,
        'quantity': quantity,
        'status': status,
        if (fixedPrice != null) 'fixed_price': fixedPrice,
        if (categoryIds != null && categoryIds.isNotEmpty)
          'category_ids': categoryIds,
      };

      if (imageFile != null && imageFile.path.isNotEmpty) {
        final String fileName = imageFile.path.split('/').last;
        data['image'] = await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        );
      } else if (imageUrl != null && imageUrl.isNotEmpty) {
        data['image'] = imageUrl;
      }

      final FormData formData = FormData.fromMap(data);

      await _httpClient.post(
        path: '/api/product_scans',
        body: formData,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Category>> getCategories() async {
    try {
      final response = await _httpClient.get<Map<String, dynamic>>(
        path: '/api/categories',
      );
      final parsedResponse = WmsCategoryResponse.fromJson(response);
      return parsedResponse.data.resource;
    } catch (e) {
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
          'page': page.toString(),
        },
      );
      final parsedResponse = WmsGetBundleBasicResponse.fromJson(response);
      return parsedResponse.data.resource;
    } on HttpStatusCodeException catch (_) {
      rethrow;
    }
  }

  Future<void> createBundle({required String name}) async {
    try {
      await _httpClient.post(
        path: '/api/bundle',
        body: {'name_bundle': name},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteBundle({required int bundleId}) async {
    try {
      await _httpClient.delete(
        path: '/api/bundle/$bundleId',
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addProductsToBundle({
    required int bundleId,
    required List<int> productIds,
  }) async {
    try {
      await _httpClient.post(
        path: '/api/bundle/add-product-to-bundle',
        body: {
          'bundle_id': bundleId,
          'product_scan_ids': productIds,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeProductsFromBundle({
    required int bundleId,
    required List<int> productInBundleIds,
  }) async {
    try {
      await _httpClient.delete(
        path: '/api/bundle/remove-products',
        body: {
          'bundle_id': bundleId,
          'product_in_bundle_ids': productInBundleIds,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
