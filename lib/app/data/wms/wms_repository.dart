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
    required File imageFile,
    String? imageUrl,
    double? fixedPrice,
    List<int>? categoryIds,
  }) async {
    try {
      String fileName = imageFile.path.split('/').last;

      FormData formData = FormData.fromMap({
        'product_name': productName,
        'product_price': productPrice,
        'quantity': quantity,
        'status': status,
        if (imageUrl != null) 'image': imageUrl,
        if (fixedPrice != null) 'fixed_price': fixedPrice,
        if (categoryIds != null && categoryIds.isNotEmpty)
          'category_ids': categoryIds,
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

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
}
